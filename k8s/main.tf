terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">=2.9.6"
    }
  }
}

provider "proxmox" {
  pm_api_url    = "https://odin:8006/api2/json"
  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_debug      = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

variable "odin_controller_count" {
  default = "1"
}

variable "odin_worker_count" {
  default = "2"
}

variable "thor_controller_count" {
  default = "1"
}

variable "thor_worker_count" {
  default = "2"
}

resource "proxmox_lxc" "k8s-controller-odin" {
  count        = var.odin_controller_count
  target_node  = "odin"
  hostname     = "k8s-controller-odin-${count.index}"
  unprivileged = false
  onboot       = true
  ostype       = "ubuntu"
  ostemplate   = "dagr-nfs-proxmox:vztmpl/ubuntu-21.04-standard_21.04-1_amd64.tar.gz"
  arch         = "amd64"
  cores        = 4
  memory       = 4096
  swap         = 4096
  pool         = "k8s"
  rootfs {
    storage = "local-lvm-data-hdd"
    size    = "10G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "dhcp"
    tag    = 4
  }
}

resource "proxmox_lxc" "k8s-worker-odin" {
  count        = var.odin_worker_count
  target_node  = "odin"
  hostname     = "k8s-worker-odin-${count.index}"
  unprivileged = false
  onboot       = true
  ostype       = "ubuntu"
  ostemplate   = "dagr-nfs-proxmox:vztmpl/ubuntu-21.04-standard_21.04-1_amd64.tar.gz"
  arch         = "amd64"
  cores        = 4
  memory       = 4096
  swap         = 4096
  pool         = "k8s"
  rootfs {
    storage = "local-lvm-data-hdd"
    size    = "10G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "dhcp"
    tag    = 4
  }
}

resource "proxmox_lxc" "k8s-controller-thor" {
  count        = var.thor_controller_count
  target_node  = "thor"
  hostname     = "k8s-controller-thor-${count.index}"
  unprivileged = false
  onboot       = true
  ostype       = "ubuntu"
  ostemplate   = "dagr-nfs-proxmox:vztmpl/ubuntu-21.04-standard_21.04-1_amd64.tar.gz"
  arch         = "amd64"
  cores        = 4
  memory       = 4096
  swap         = 4096
  pool         = "k8s"
  rootfs {
    storage = "local-lvm-data-hdd"
    size    = "10G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "dhcp"
    tag    = 4
  }
}

resource "proxmox_lxc" "k8s-worker-thor" {
  count        = var.thor_worker_count
  target_node  = "thor"
  hostname     = "k8s-worker-thor-${count.index}"
  unprivileged = false
  onboot       = true
  ostype       = "ubuntu"
  ostemplate   = "dagr-nfs-proxmox:vztmpl/ubuntu-21.04-standard_21.04-1_amd64.tar.gz"
  arch         = "amd64"
  cores        = 4
  memory       = 4096
  swap         = 4096
  pool         = "k8s"
  rootfs {
    storage = "local-lvm-data-hdd"
    size    = "10G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "dhcp"
    tag    = 4
  }
}
