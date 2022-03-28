terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url    = "https://odin:8006/api2/json"
}

variable "ssh_keys" {
  default = <<-EOT
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC61eyQGJnQdj5rIbQbWmpuUAh8QgWqD/DrZyXi6a5xIMFcVKSSg9EDSXaIz0zpJA+1CMkea/S2csJBf6OalWaBTUDD7W0xtRnX2tSahbhwQ4Xvxg6tsGnoZXVmVyCSq3UPPUlb3ours/Dx4LgIzoKCVM6hH6VhtayO6UHDSp66nJa1LSPQ/53XlvDumWZ5x6FfWcp9VSxYCJFUyaF0XrebIynSRzT6RmtllXWtRrvxBdftKN8Jiv4G85dSSZAoyRPKO30HFqfI8VQ38b/d2wtg3t3NGNQ5lsohtdwXlZDhlPqFPc+a2LfubMYViI6T6j2ug0jIUv3gA8q2IyP4oITMGXPqyqTLfsOQJ0WuKKtGgSM7yZgEIobsZSt9c1AwMCJydAvSMOqnlp9Lr5/SFWOPAhS1y1x6yVpNrB8jJU1vtb8q5bOrFL2SWyLQ0Td5pCtAyMWEbr9gz9DmQV+2Nu+FacW1b9xsjspsASaDE+wkr0OA2feZyoCYlg1WBxl5Z4ogwMkXs9nPwMYl7xwrdcRTnl9Hffdtb0yQjJ/ZL3QUVtPOPFbVBrY6L3GaHndPg1YSCTDpJmeaV4DWdD/gaDtNhHeQA+xCiFBYEeFi0gKsFnZ/vrDiQr0BaHo/SBXoTWZipy6klAUZg5L8/usZD5VTk+1T+4Aq80g8Q3RQcssMdQ== cardno:000611462783
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvbU/ngCDIZrfqIVpZ0NFnqYxQb2Sd/J8sZyXQs8ItifRjUZFUA72aPfWG/DlJd7Tu7ksF5FNMySRhVXOiiibpIgqjreBox/C6RFd973e5V7LxKGSDv3L3qsQEkZIeASuxAPDnNt7+IIqqfwFe0ppFY+W2oloj8FUSCdAaxV1JMrz+3raUZd28Tkaib7RPX8sXdH536cgs3nr/x69AzB3q/McRzE3PoAvFka0fziGnj8olfDSXD8Qkm/dGtrAbDTV8LZG5L4CEVo3ZKmtAVC8l6j/NKn2ItoSJBfeqyj37h7TR8mU8py64ULsMZqW4h3DHQzeDz0bcIkeNIVISwtVVU484e9DnezSK74G+0tk1Ove7xA6D1cAK6RzHrzgHvpYm5Gf+TGMA+h7er81S/HqLpFazpGMgOvpwu+2M56F9mf1Ch1dDfPf3l0fTN3ibTwi4MWR21UdL2jt7cbT0YcFEU5oWS7Nq3ax1wr/ptkjL+QEExnaZW27lqMBuOhkkMH6chQ9LXkzZgNMRdH1sjYaNoIddC4e6y104HFzmsxegqjbIeL/t/yzoJRQurHVp3zXP3EZtKG77jNir3x5uKayVPv3Qrqe7Q8aL0A4w6VXOUX4OVzPY4/XKhqFZD1gV4MtwvgkmD0VW1YlXdqCJXFJ+4Jyd8FZQceNhcci+RDG/rw== cardno:000607548702
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYk8aBQ3uAOJXK1xuRmHNlsACvfOWeBpgqh0YntrHgjU57HJHu3/7OBqbaZyLnCy/PDybXNHK9g5CwuODQ9/yMOzDyaDp9dlJQCc21mbWTzzLgRFDCuRvcGOiypJlQQJoMmxEJgOOhQlK/DLxekk3v+uOXwbXnHGmRXfnlAMjMNv55gz0RwlrDgIlcSWWInNh+9yM48rLOOmS07bfa5VmAjC0oZXOE0GY1avOH7PWRro0/Z8QnoagHrQMQvePbbAGnGdq82HvMLzWxrS2rSFJzPnbmTUV/cagQeISwQrIrbAuWBrlFYt6tnoZAsD9fCOfME/1UY+DC04Kc7kPySdIf7AYm+I6T8aFe1p97l8WTsb8hsaHXYjp9U9dPYs2tKeVeKHd3yH/OMDWEORaqIP6NeBo7IVylh6EwtILZkDlArNPyVxZLoCKAEvbVOyl5wbh1aOKkGc1YH/cP+B1kmzy3e08HUVXB8qzx1W9Nl64w3uSvYdAyfXwx24eeRCxxvw0joEZSpTOFFTYEtDoW7uo/oWJ4OaRtx8amNdUVPyeH3qOvUOjZc39v9HE5tGoAkuqkAuTwgr1irDeT8cFarWxgV703U9px19uzRqFGJthWaC0SG/TfMCe2bPX2VWf+rORHWodARUyyyPciROD/o8lH6jyG7alisY0vGVDq8b9hhw== cardno:000607122588
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMYdhSc1CvccAIrtnS/+X9ZED/bO49r9o1d729L9EuErHvu1Ivv9YO6t7ZC51iwW2ZgsG2wHYiJB7kiK1ab4+634soOK2T0k+6DEyCYj0N7ir2A3jOS8kMkWSZyToFOiJvwJVCs6n5dCbd9NiFyJk/qEAhWDLl9Mcmx/cNn4GauWZ5eLNPrBDfKrGLwZyXCWn5PLJQmhUGHHdiKwIkuwB0R2weVyUoxMjLT5rwZZ0MEHN5nOxXF5crYBboPp8ttwuTlAvHX8TBAxV0tQ9tyPmWutBqfhQFwrMr32Gzv8K7WJpSzM3t2oSlxHR1FIoad+dYvhPH2iLEhoe9C/Cxjh9W1UKfs11TX8jdUH5nL6GvrEs7INooUhAQruNuOpC8jGihiIYyynecDIJAh3HtiV3jdUGi1LwfoHzTiFqJS2g1QELAweGZyZUC8mNbpvG4IbVjymJiswP9PdA0Wg9+OEKp6SHg+KM0tiZvGRwmenfv0xZyfIMIyRB7FRp/WTvpq7tadCLJbwGnn17joENTeZ6wibEq31KDdDuLlFFZGJfQQBbbWuwKWeQcUEeSWB9tfEk4c5jSqrq4kfKbM09HyKYOq47kb0xItW16XkOjVnQLWRwr68DUmEA0wzjUjqhEWQtb8ZxVTyiiNK5mMjHxy/xn/FsBV23IgCo1WXkC9baVqw== cardno:000607057621
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDXUIzLabfNAiiSxPucR/QznuEeue68/KwNISJJ8KXiwv0rQkaaqfFYIiWU84VM4fGzRLeK1QqhNwux3/iYP6QdX+FIjPlMGRBLK+g70gVEtCyxbAHhH1rJUS4cxdVPB3hTT9ncE3rGlSeGXmlYDNWf+PFJ9/dXH2TcSSyJWX+5gKbfSibrYJXlviYIp8K9g6w5TDo/2DMTZdGjwg1bEL4PdqxnqHcwADA2XwgonBbzXWb+pj6c2j3y/xiweuCCu3esw+c+6LQTPMrovOuMl/+bRl3E282IHA6CCjrv0vIgii/aXi3PKn31mpx0If+870+gXh1Q+NluDFsE0IlDgci6i8tukeEoNnhu9vzJxtUTHk3XBrU0Msqo5f5HRJ4cLEQ0rc6szEmukfLy3jcIY8gal8Vmn3jwBTj5gFFqqVI5B/6E3RXuqSE7Exemi7BpTWcYAiemk2CrGlwcns7lBu2eGQkwjXZlsorzd30O7EkJ3tc2ZCSIodfAcOdqJfgXnhm6e6ttzw5ZPy+h4r33BHjDM44dxFC3vBjdo3rFpyRvbyclTaZ60fD1y9yhCfDmB3NrIRANyWHEB0qloOqQhPDRx4AMjXdMEDft9ppm2QrVOp7Czn7OPLoDCRIclzkl+lL0e4hcQ4kk2NbH42iZ9N/AWdppRUR5XBXCYwp8OsDX4Q== primary_yubikey
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5BIfLmVix8XBy6G8S0sI2dU9fyInQnPNDJw2SCQJwMA8/kq4EUjY2vkX9LYqNWJW2r2MykCgyJBdyFTujuhVDQ8ODoKy6je4dX+jKDUdz20eZgJ1FQMg4smWsqc/e/+xJyg5u+SSCK5nDGx/0TOwncgkffhU0VR25SlhO6b1a+vDnmkFfd+Fdi+2pK7/n74iqgKknh8jFCgWwqcVZnnyJ7MRDT2Tc3leFTyAUjHL7xMKHbI4XExTTaFwkCUlhZqjBoa6NZDnaglbyjkuO6W4JdZBS2YIEcSPxUrv7RqpDD2frblhWC3p8M0G5lrvZFddcZZWasjVGMz8oqUm1eXwd gylfaginning
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCwiU8EUvVmB87B8CsZlBU1o3inVKpwP1eiOGdYJ8yqEEiLEA2jZcS6YLF/CFHZ8k+SZ7M2OlK4fc2WtS8+jchN0p1n7n71lMDHdURseRQuGpziIr4PrVImecBv5gCfFt/vaINbOtoBKSxonfo3DdJ7o3/apB6vZ6C5FTwdhBw/iG2nBQ1JWteoS+ah3R5TSP0vet2riCDoTa0PzxSUsg3CNFldMqIBAjFY0uguss0u7d0zy3GhLfQGnMVR+KcUneIsINqJopOmfBCeQyt8gDMIgPLgZKdsRttVHwOGHRAYw7NvH0i8yM0UgKR/vpO7sxk5/xMLQ1dv5mu7ZUlTOF0B68Dw7Dd5Ilfqge0ojrhyEIuSrmowiqHWLSQJ2brKTRvz/4qhXhpAq6Rqu42W/lygvRsW6SLLtP4AiW7plBWcoGPP/+PhjFVia4UfezhULlgamsyFxyidiwb8M/ZeM7Qwy1hy+kd9Wbk2LuFB+yNp7OyIp8VnUGBn2NMKz0kPgYgBqdPI2JhrAtObqBGCCJKiVYg+1YtTdvSsyib6e9FsEiD3QNGouOrOMf3KtWLx4tmx8qceLcRk0eVwEkPsjjBg9zgutych90VhbhG5cuYl5DiD4utye5K5CC82I86S8S3Hpd3ZAzuANnFd6qb/A3kLIbwPwgA87FAd4BgxvYHSlw== backup_yubikey
  EOT
}

resource "proxmox_lxc" "maas" {
  target_node     = "odin"
  hostname        = "maas"
  unprivileged    = false
  onboot          = true
  ostype          = "ubuntu"
  ostemplate      = "dagr-nfs-proxmox:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
  arch            = "amd64"
  cores           = 2
  memory          = 4096
  swap            = 4096
  ssh_public_keys = var.ssh_keys
  start = true

  rootfs {
    storage = "local-lvm-data-hdd"
    size    = "40G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "dhcp"
    hwaddr = "E6:28:AD:4F:0D:90"
  }
}
