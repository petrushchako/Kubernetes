resource "virtualbox_vm" "control_plane" {
  name   = var.control_plane_name
  cpus   = var.vm_cpus
  memory = var.vm_memory

  network_adapter {
    type           = "bridged"
    host_interface = var.bridge_interface
  }

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }

  disk {
    size = 20000
  }

  iso {
    path = var.ubuntu_iso_path
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'auto eth1' >> /etc/network/interfaces",
      "echo 'iface eth1 inet static' >> /etc/network/interfaces",
      "echo 'address 192.168.1.100' >> /etc/network/interfaces",
      "echo 'netmask 255.255.255.0' >> /etc/network/interfaces",
      "echo 'gateway 192.168.1.1' >> /etc/network/interfaces",
      "systemctl restart networking"
    ]
  }
}

resource "virtualbox_vm" "workers" {
  count  = var.vm_count
  name   = "${var.worker_prefix}${count.index + 1}"
  cpus   = var.vm_cpus
  memory = var.vm_memory

  network_adapter {
    type           = "bridged"
    host_interface = var.bridge_interface
  }

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }

  disk {
    size = 20000
  }

  iso {
    path = var.ubuntu_iso_path
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'auto eth1' >> /etc/network/interfaces",
      "echo 'iface eth1 inet static' >> /etc/network/interfaces",
      "echo 'address 192.168.1.${101 + count.index}' >> /etc/network/interfaces",
      "echo 'netmask 255.255.255.0' >> /etc/network/interfaces",
      "echo 'gateway 192.168.1.1' >> /etc/network/interfaces",
      "systemctl restart networking"
    ]
  }
}
