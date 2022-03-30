terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "untangle" {
  full_clone  = false
  agent       = 1
  boot        = "order=scsi0;net0"
  name        = "untangle"
  target_node = "bragr"
  onboot      = true
  cpu         = "kvm64"
  memory      = 8192
  balloon     = 0
  sockets     = 1
  cores       = 4
  scsihw      = "virtio-scsi-pci"

  network {
    model    = "virtio"
    macaddr  = "16:55:1D:BD:4B:0D"
    bridge   = "vmbr1"
    firewall = false
  }

  network {
    model    = "virtio"
    macaddr  = "72:9E:29:6C:6A:EF"
    bridge   = "vmbr2"
    firewall = false
  }

  disk {
    type    = "scsi"
    storage = "local-lvm-data-hdd"
    backup  = 1
    size    = "120G"
  }
}
