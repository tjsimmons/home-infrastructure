terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">=2.9.6"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">=3.4.0"
    }
  }
}

variable "vault_username" {}
variable "vault_password" {}

provider "vault" {
  auth_login {
    path = "auth/userpass/login/${var.vault_username}"

    parameters = {
      password = var.vault_password
    }
  }
}

data "vault_generic_secret" "proxmox" {
  path = "kv/proxmox"
}

provider "proxmox" {
  pm_api_url = data.vault_generic_secret.proxmox.data["url"]
}

resource "proxmox_vm_qemu" "homeassistant" {
  agent       = 0
  bios = "ovmf"
  boot        = "order=scsi0"
  name        = "homeassistant"
  target_node = "thor"
  onboot      = true
  memory      = 4096
  balloon     = 1
  sockets     = 1
  cores       = 2
  scsihw      = "virtio-scsi-pci"
  oncreate    = false
  full_clone = false

  network {
    model    = "virtio"
    macaddr  = "ee:70:ae:d2:00:a1"
    bridge   = "vmbr2"
    firewall = true
  }

  disk {
    type    = "scsi"
    storage = "local-lvm-data-hdd"
    backup  = 1
    size    = "32G"
    volume = "local-lvm-data-hdd:vm-105-disk-0"
  }

  usb {
    host = "0658:0200"
  }
}