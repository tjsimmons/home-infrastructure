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
  ostype       = "ubuntu"
  arch         = "amd64"
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

resource "proxmox_lxc" "pihole" {
  target_node  = "bragr"
  hostname     = "pihole"
  unprivileged = false
  onboot       = true
  startup      = "order=0,up=60"
  ostype       = "ubuntu"
  arch         = "amd64"
  cores        = 4
  memory       = 4096
  swap         = 4096
  rootfs {
    storage = "local-lvm-data-hdd"
    size    = "10G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "10.0.1.50/24"
    gw     = "10.0.1.1"
    hwaddr = "BA:7E:67:C4:49:DA"
  }
}

resource "proxmox_lxc" "nextcloud" {
  target_node  = "odin"
  hostname     = "nextcloud"
  unprivileged = false
  onboot       = true
  ostype       = "ubuntu"
  arch         = "amd64"
  cores        = 4
  memory       = 2048
  swap         = 2048
  rootfs {
    storage = "local-lvm-data-hdd"
    size    = "20G"
  }

  mountpoint {
    mp      = "/var/www/nextcloud/data"
    size    = "500G"
    storage = "local-lvm-data-hdd"
    slot    = "0"
    key     = 0
    // Without 'volume' defined, Proxmox will try to create a volume with
    // the value of 'storage' + : + 'size' (without the trailing G) - e.g.
    // "/srv/host/bind-mount-point:256".
    // This behaviour looks to be caused by a bug in the provider.
    volume = "local-lvm-data-hdd:vm-106-disk-1"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "dhcp"
    hwaddr = "7A:C6:16:0C:39:C7"
  }
}

resource "proxmox_lxc" "plex" {
  target_node  = "odin"
  hostname     = "plex"
  unprivileged = true
  onboot       = true
  ostype       = "ubuntu"
  arch         = "amd64"
  cores        = 4
  memory       = 8192
  swap         = 8192
  rootfs {
    storage = "local-lvm-data-ssd"
    size    = "20G"
  }

  mountpoint {
    mp      = "/usr/media"
    size    = "5000G"
    storage = "local-lvm-data-hdd"
    slot    = "0"
    key     = 0
    // Without 'volume' defined, Proxmox will try to create a volume with
    // the value of 'storage' + : + 'size' (without the trailing G) - e.g.
    // "/srv/host/bind-mount-point:256".
    // This behaviour looks to be caused by a bug in the provider.
    volume = "local-lvm-data-hdd:vm-109-disk-0"
  }

  mountpoint {
    mp      = "/usr/media/dagr"
    size    = "1000G"
    storage = "dagr-nfs-proxmox"
    slot    = "1"
    key     = 1
    // Without 'volume' defined, Proxmox will try to create a volume with
    // the value of 'storage' + : + 'size' (without the trailing G) - e.g.
    // "/srv/host/bind-mount-point:256".
    // This behaviour looks to be caused by a bug in the provider.
    volume = "dagr-nfs-proxmox:109/vm-109-disk-0.raw"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "dhcp"
    hwaddr = "C6:0C:17:3C:C9:F5"
  }
}
