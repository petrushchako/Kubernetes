variable "vm_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 3
}

variable "control_plane_name" {
  description = "Control Plane VM Name"
  type        = string
  default     = "c1-cp1"
}

variable "worker_prefix" {
  description = "Worker Node Name Prefix"
  type        = string
  default     = "c1-node"
}

variable "vm_cpus" {
  description = "Number of CPUs per VM"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Memory per VM in MB"
  type        = number
  default     = 2048
}

variable "ubuntu_iso_path" {
  description = "Path to the Ubuntu ISO file"
  type        = string
  default     = "/path/to/ubuntu.iso"
}

variable "bridge_interface" {
  description = "Your host machine's network interface used for bridging"
  type        = string
  default     = "enp0"  # Change this to match your network interface
}
