# Learn Kubernetes By Doing

### Course Outline

<br>

**Kubernetes Cluster Basics**
- Building a Kubernetes 1.27 Cluster with kubeadm
- Deploying a Simple Service to Kubernetes
- Deploying a Microservice Application to Kubernetes
- Creating a Kubernetes Cluster

<br>

**Working with Kubernetes Clusters**
- Deploying a Pod to a Node with a Label in Kubernetes
- Installing and Testing the Components of a Kubernetes Cluster

<br>

**Service Discovery, Scheduling and Lifecycle Management**
- Creating a Service and Discovering DNS Names in Kubernetes
- Scheduling Pods with Taints and Tolerations in Kubernetes
- Performing a Rolling Update of an Application in Kubernetes

<br>

**Storage and Security**
- Creating Persistent Storage for Pods in Kubernetes
- Creating a ClusterRole to Access a PV in Kubernetes

<br>

**Testing Your Cluster**
- Smoke Testing a Kubernetes Cluster
- Upgrading the Kubernetes Cluster Using kubeadm
- Logging and Monitoring
- Monitor and Output Logs to a File in Kubernetes
- Configuring Prometheus to Use Service Discovery
- Creating Alerting Rules

<br>

**Troubleshooting and Repairing Your Cluster**
- Repairing Failed Pods in Kubernetes

<br>

**Doing Things "The Hard Way"**
- Creating a Certificate Authority and TLS Certificates for Kubernetes
- Generating Kubeconfigs for a New Kubernetes Cluster
- Generating a Data Encryption Config for Kubernetes
- Bootstrapping Kubernetes Worker Nodes
- Bootstrapping a Kubernetes Control Plane
- Bootstrapping an etcd Cluster for Kubernetes
- Setting Up Kubernetes Networking with Weave Net



<br><br><br>

## Building a Kubernetes 1.27 Cluster with kubeadm

#### ABOUT THIS LAB
This lab will allow you to practice the process of building a new Kubernetes cluster. You will be given a set of Linux servers, and you will have the opportunity to turn these servers into a functioning Kubernetes cluster. This will help you build the skills necessary to create your own Kubernetes clusters in the real world.

<br>

![](img/lab1.1.png)

#### Solution

### Install Packages

- Log in to the control plane node.

    > Note: The following steps must be performed on all three nodes.

- Create the configuration file for containerd:
    ```bash
    cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
    overlay
    br_netfilter
    EOF
    ```
- Load the modules:
    ```bash
    sudo modprobe overlay
    sudo modprobe br_netfilter
    ```
- Set the system configurations for Kubernetes networking:
    ```bash
    cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
    net.bridge.bridge-nf-call-iptables = 1
    net.ipv4.ip_forward = 1
    net.bridge.bridge-nf-call-ip6tables = 1
    EOF
    ```
- Apply the new settings:
- 
    `sudo sysctl --system`

- Install containerd:

    `sudo apt-get update && sudo apt-get install -y containerd.io`

- Create the default configuration file for containerd:

    `sudo mkdir -p /etc/containerd`

- Generate the default containerd configuration, and save it to the newly created default file:

    `sudo containerd config default | sudo tee /etc/containerd/config.toml`

- Restart containerd to ensure the new configuration file is used:

    `sudo systemctl restart containerd`

- Verify that containerd is running:

    `sudo systemctl status containerd`

- Disable swap:

    `sudo swapoff -a`

- Install the dependency packages:

    `sudo apt-get update && sudo apt-get install -y apt-transport-https curl`

- Download and add the GPG key:

    `curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.27/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg`

- Add Kubernetes to the repository list:
    ```bash
    cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
    deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.27/deb/ /
    EOF
    ```
- Update the package listings:

    `sudo apt-get update`

- Install Kubernetes packages:

    > Note: If you get a dpkg lock message, just wait a minute or two before trying the command again.

    sudo apt-get install -y kubelet kubeadm kubectl

- Turn off automatic updates:

    `sudo apt-mark hold kubelet kubeadm kubectl`

- Log in to both worker nodes to perform the previous steps.

<br>

#### Initialize the Cluster

- Initialize the Kubernetes cluster on the control plane node using kubeadm:

    `sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.27.11`

- Set kubectl access:
    ```bash
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
    ```

- Test access to the cluster:

    `kubectl get nodes`

<br>

#### Install the Calico Network Add-On

- On the control plane node, install Calico Networking:

    `kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml`

- Check the status of the control plane node:

    `kubectl get nodes`

<br>

#### Join the Worker Nodes to the Cluster

- In the control plane node, create the token and copy the kubeadm join command:

    `kubeadm token create --print-join-command`

    > Note: This output will be used as the next command for the worker nodes.

- Copy the full output from the previous command used in the control plane node. This command starts with kubeadm join.

- In both worker nodes, paste the full `kubeadm join` command to join the cluster. Use `sudo` to run it as root:

    `sudo kubeadm join...`

- In the control plane node, view the cluster status:

    `kubectl get nodes`

    > Note: You may have to wait a few moments to allow all nodes to become ready.

<br><br><br>

## Deploying a Simple Service to Kubernetes

### ABOUT THIS LAB

Deployments and services are at the core of what makes Kubernetes a great way to manage complex application infrastructures. In this hands-on lab, you will have an opportunity to get hands-on with a Kubernetes cluster and build a simple deployment, coupled with a service providing access to it. You will create a deployment and a service which can be accessed by other pods in the cluster.

#### Create a deployment for the store-products service with four replicas

- Log in to the Kube master node.

- Create the deployment with four replicas:

    ```yaml
    cat << EOF | kubectl apply -f -
    apiVersion: apps/v1
    kind: Deployment
    metadata:
    name: store-products
    labels:
        app: store-products
    spec:
    replicas: 4
    selector:
        matchLabels:
        app: store-products
    template:
        metadata:
        labels:
            app: store-products
        spec:
        containers:
        - name: store-products
            image: linuxacademycontent/store-products:1.0.0
            ports:
            - containerPort: 80
    EOF
    ```