resource "proxmox_vm_qemu" "control_plane_nodes" {
  for_each = var.control_plane_nodes

  name        = each.value.name
  desc        = "Talos Control Plane Node"
  vmid        = each.value.vmid
  target_node = each.value.target_node

  onboot   = false
  memory   = 8192
  sockets  = 1
  cores    = 2
  cpu_type = "host"
  vm_state = "stopped"
  scsihw   = "virtio-scsi-single"

  network {
    id       = 0
    model    = "virtio"
    macaddr  = each.value.macaddr
    bridge   = "vmbr0"
    firewall = false
    tag      = 4
  }

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "prox_iso:iso/metal-amd64.iso"
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

  lifecycle {
    ignore_changes = [
      network,
      disk,
      vm_state
    ]
  }
}

resource "proxmox_vm_qemu" "longhorn_worker_nodes" {
  for_each = var.worker_nodes

  name        = each.value.name
  desc        = "Talos Worker Node"
  vmid        = each.value.vmid
  target_node = each.value.target_node

  onboot   = false
  memory   = each.value.memory
  sockets  = 1
  cores    = each.value.cores
  cpu_type = "host"
  vm_state = "stopped"
  scsihw   = "virtio-scsi-single"

  network {
    id       = 0
    model    = "virtio"
    macaddr  = each.value.macaddr
    bridge   = "vmbr0"
    firewall = false
    tag      = 4
  }

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "prox_iso:iso/metal-amd64.iso"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = each.value.storage
          size    = "625G"
          cache   = "writethrough"
        }
      }
    }
  }

  lifecycle {
    ignore_changes = [
      network,
      disk,
      vm_state
    ]
  }
}