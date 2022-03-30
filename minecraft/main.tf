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
    maas = {
      source  = "dan-sullivan/maas"
      version = "1.0.0-ds"
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

data "vault_generic_secret" "maas" {
  path = "kv/maas"
}

data "vault_generic_secret" "proxmox" {
  path = "kv/proxmox"
}

data "http" "nextid" {
  url = "${data.vault_generic_secret.proxmox.data.url}/cluster/nextid"

  request_headers = {
    Accept        = "application/json",
    Authorization = "PVEAPIToken=${data.vault_generic_secret.proxmox.data.token_id}=${data.vault_generic_secret.proxmox.data.token_secret}"
  }
}

provider "proxmox" {
  pm_api_url = data.vault_generic_secret.proxmox.data["url"]
}

provider "maas" {
  api_version = "2.0"
  api_key     = data.vault_generic_secret.maas.data["api_key"]
  api_url     = data.vault_generic_secret.maas.data["url"]
}

resource "proxmox_vm_qemu" "minecraft" {
  agent       = 1
  boot        = "order=net0;scsi0"
  name        = "minecraft"
  target_node = "odin"
  onboot      = true
  pxe         = true
  memory      = 8192
  balloon     = 1
  sockets     = 1
  cores       = 4
  scsihw      = "virtio-scsi-pci"
  vmid        = jsondecode(data.http.nextid.body).data
  oncreate    = false

  network {
    model    = "virtio"
    macaddr  = "ae:cc:c5:c4:bc:f3"
    bridge   = "vmbr2"
    firewall = false
  }

  disk {
    type    = "scsi"
    storage = "local-lvm-data-hdd"
    backup  = 1
    size    = "40G"
  }
}

resource "maas_machine" "minecraft-maas" {
  power_type = "proxmox"
  hostname   = resource.proxmox_vm_qemu.minecraft.name
  power_parameters = {
    power_address = data.vault_generic_secret.proxmox.data["url"]
    power_user    = data.vault_generic_secret.proxmox.data["username"]
    power_pass    = data.vault_generic_secret.proxmox.data["password"]
    power_vm_name = resource.proxmox_vm_qemu.minecraft.vmid
  }

  pxe_mac_address = resource.proxmox_vm_qemu.minecraft.network[0].macaddr
}

resource "maas_network_interface_link" "minecraft-maas-eth0-link" {
  machine           = maas_machine.minecraft-maas.id
  network_interface = proxmox_vm_qemu.minecraft.network[0].macaddr
  subnet            = "10.0.1.0/24"
  mode              = "DHCP"
}