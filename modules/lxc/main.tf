terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

resource "proxmox_lxc" "atlas" {
  target_node  = "odin"
  hostname     = "atlas"
  ostype       = "ubuntu"
  arch         = "amd64"
  unprivileged = false
  onboot       = true
  vmid         = 101
  cores        = 1
  memory       = 1024
  swap         = 1024

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm-data-hdd"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "dhcp"
    hwaddr = "A6:AF:E0:27:B0:35"
  }
}

resource "proxmox_lxc" "sonarr" {
  target_node  = "thor"
  hostname     = "sonarr"
  unprivileged = false
  onboot       = true
  startup      = "order=11,up=60"
  ostype       = "ubuntu"
  arch         = "amd64"
  vmid         = 102
  cores        = 2
  memory       = 2048
  swap         = 2048

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm-data-hdd"
    size    = "8G"
  }

  mountpoint {
    key     = "0"
    slot    = 0
    storage = "local-lvm-data-hdd"
    size    = "250G"
    mp      = "/mnt/dagr/sonarr"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "dhcp"
    hwaddr = "C2:A2:5F:DD:27:86"
  }
}

resource "proxmox_lxc" "apt-repo" {
  target_node  = "bragr"
  hostname     = "apt-repo"
  unprivileged = false
  onboot       = true
  ostype       = "ubuntu"
  arch         = "amd64"
  vmid         = 103
  cores        = 2
  memory       = 1024
  swap         = 1024

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm-data-hdd"
    size    = "600G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "dhcp"
    hwaddr = "5E:C2:E3:A3:27:4C"
  }
}
