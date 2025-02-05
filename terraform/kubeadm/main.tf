resource "proxmox_vm_qemu" "control_plane" {
  for_each = var.control_plane

  name        = each.value.name
  vmid        = each.value.vmid
  target_node = each.value.target_node

  onboot   = false
  memory   = 6144
  sockets  = 1
  cores    = 1
  cpu_type = "host"
  vm_state = "stopped"
  scsihw   = "virtio-scsi-single"

  network {
    id       = 0
    model    = "virtio"
    macaddr  = each.value.macaddr
    bridge   = "vmbr0"
    firewall = false
    tag      = 3
  }

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "prox_iso:iso/Rocky-9.5-x86_64-minimal.iso"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = "64G"
          cache   = "writethrough"
        }
      }
    }
  }

}

resource "proxmox_vm_qemu" "worker" {
  for_each = var.worker

  name        = each.value.name
  vmid        = each.value.vmid
  target_node = each.value.target_node

  onboot   = false
  memory   = 6144
  sockets  = 1
  cores    = 1
  cpu_type = "host"
  vm_state = "stopped"
  scsihw   = "virtio-scsi-single"

  network {
    id       = 0
    model    = "virtio"
    macaddr  = each.value.macaddr
    bridge   = "vmbr0"
    firewall = false
    tag      = 3
  }

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "prox_iso:iso/Rocky-9.5-x86_64-minimal.iso"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = "64G"
          cache   = "writethrough"
        }
      }
    }
  }

}
