# Kubernetes Cluster with VirtualBox

### Virtual Machines Created

| Node | Role |
|------|------|
| `c1-cp1` | Control Plane |
| `c1-node1` | Worker Node |
| `c1-node2` | Worker Node |
| `c1-node3` | Worker Node |

<br>

### Configuring Static IPs and Hostnames on Ubuntu 22.04 VMs

| VM Name   | IP Address       |
|-----------|-----------------|
| c1-cp1    | 192.178.1.100   |
| c1-node1  | 192.178.1.101   |
| c1-node2  | 192.178.1.102   |
| c1-node3  | 192.178.1.103   |

### Prerequisites
- Ubuntu 22.04 installed on each VM
- VirtualBox network set to **Bridged Adapter** or **Host-Only Network**
- Access to each VM via terminal (either directly or via SSH)

<br><br>

## Step 1: Identify Network Interface
- Run the following command to find your primary network interface:
  ```bash
  ip a
  ```
  Look for an interface name (e.g., `enp0s3` or `eth0`). This will be used in the next step.

<br><br>

## Step 2: Disable cloud-init network configuration
- **Create the `99-disable-network-config.cfg` file**
  This tells cloud-init to stop interfering with network settings:

  ```bash
  echo "network: {config: disabled}" | sudo tee /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
  ```
- **Clean cloud-init****
  This clears existing cloud-init configuration so it doesn't reuse old settings:

  ```bash
  sudo cloud-init clean
  ```

<br><br>

## Step 3: Configure Static IP
- Edit the Netplan configuration file:
  ```bash
  sudo nano /etc/netplan/00-installer-config.yaml
  ```
- Modify the file with the appropriate IP configuration, replacing `<interface>` with your actual interface name (e.g., `enp0s3`):
  
  ```yaml
  network:
    version: 2
    renderer: networkd
    ethernets:
      enp0s3:
        dhcp4: no
        addresses: [192.168.1.100/24]  # Change IP per VM
        gateway4: 192.168.1.1  # Adjust as needed
        nameservers:
          addresses: [192.168.1.1, 8.8.8.8]
  ```
  Save the file (`Ctrl + X`, then `Y`, then `Enter`).

- Apply the changes:
  ```bash
  sudo netplan generate
  sudo netplan apply
  ```

- Reboot and verify:
  ```bash
  sudo reboot
  ```

- Verify:
  ```bash
  ip a | grep inet
  ```

<br><br>

## Step 4: Change Hostname
- Set the hostname to match the VM name:
  ```bash
  sudo hostnamectl set-hostname c1-cp1  # Change accordingly
  ```
- Update `/etc/hosts`:
  ```bash
  sudo nano /etc/hosts
  ```
- Add or modify the following line:
  ```
  192.178.1.100  c1-cp1
  ```
  Repeat these steps on each VM, adjusting the IP and hostname accordingly.

<br><br>

## Step 5: Reboot & Verify
- Reboot the VM:
  ```bash
  sudo reboot
  ```
- After reboot, verify the changes:
  ```bash
  hostname
  ip a | grep inet
  ```
