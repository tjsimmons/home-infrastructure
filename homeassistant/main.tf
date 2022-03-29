terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">=2.9.6"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://odin:8006/api2/json"
}

resource "proxmox_vm_qemu" "homeassistant" {
  agent       = 1
  boot        = "order=net0;ide0;scsi0"
  name        = "homeassistant"
  target_node = "thor"
  onboot      = true
  pxe         = true
  memory      = 8192
  balloon     = 1
  sockets     = 1
  cores       = 4
  scsihw      = "virtio-scsi-pci"

  network {
    model    = "virtio"
    macaddr  = "ee:70:ae:d2:00:a1"
    bridge   = "vmbr2"
    firewall = false
  }

  disk {
    type    = "scsi"
    storage = "local-lvm-data-hdd"
    backup  = 1
    size    = "40G"
  }

  usb {
    host = "0658:0200"
  }
}