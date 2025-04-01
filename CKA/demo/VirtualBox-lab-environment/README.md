# Kubernetes Cluster with Terraform & VirtualBox

This project automates the creation of a **Kubernetes cluster** with **VirtualBox VMs** using **Terraform**.

## Prerequisites

Ensure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant (optional)](https://developer.hashicorp.com/vagrant/downloads)

## Configurable Variables

Modify `variables.tf` before running Terraform:

| Variable | Description | Default Value |
|----------|-------------|---------------|
| `bridge_interface` | Network interface for bridging | `"en0"` |
| `vm_memory` | Memory for each VM | `"2048"` |
| `vm_cpus` | CPU count per VM | `"2"` |
| `iso_path` | Path to Ubuntu ISO | **Must be set via CLI** |

## Usage

### **Initialize Terraform**
```sh
terraform init
```

### **Apply Configuration**
Set the **Ubuntu ISO path** dynamically when applying:
```sh
terraform apply -var="iso_path=/path/to/ubuntu.iso" -auto-approve
```

### 3️**Destroy Cluster (Optional)**
```sh
terraform destroy -auto-approve
```

## Virtual Machines Created

| Node | Role | IP Address |
|------|------|-----------|
| `c1-cp1` | Control Plane | `192.168.1.100` |
| `c1-node1` | Worker Node | `192.168.1.101` |
| `c1-node2` | Worker Node | `192.168.1.102` |
| `c1-node3` | Worker Node | `192.168.1.103` |

## Notes

- The **Ubuntu ISO path** **must be specified via CLI** when applying Terraform.
- Ensure **VirtualBox network settings** allow **Bridged Adapter** on `en0`.
- Post-installation, consider using **Ansible** to configure Kubernetes.
