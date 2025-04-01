output "control_plane_vm" {
  value = virtualbox_vm.control_plane.name
}

output "worker_nodes" {
  value = [for w in virtualbox_vm.workers : w.name]
}
