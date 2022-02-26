terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "minecraft" {
  full_clone  = false
  agent       = 1
  boot        = "order=scsi0;ide2;net0"
  name        = "minecraft"
  target_node = "odin"
  onboot      = true
  memory      = 8192
  balloon     = 1
  sockets     = 2
  cores       = 8
  scsihw      = "virtio-scsi-pci"

  network {
    model    = "virtio"
    macaddr  = "AE:CC:C5:C4:BC:F3"
    bridge   = "vmbr2"
    firewall = true
  }

  disk {
    type    = "scsi"
    storage = "local-lvm-data-hdd"
    backup  = 1
    size    = "32G"
  }
}
