## Helm and Minikube Setup Guide on macOS

### Install Minikube

Minikube lets you run a local Kubernetes cluster on your machine.
```bash
brew install minikube
```

Start Minikube with default resources:
```bash
minikube start
```

Optionally, allocate specific CPU and memory resources:
```bash
minikube start --cpus=2 --memory=4096
```

<br>

### Install kubectl
```bash
brew install kubectl
```

Verify the installation:
```bash
kubectl version --client
```

<br>

### Install Helm
```bash
brew install helm
```

Verify the installation:
```bash
helm version
```

<br>

### Verify Setup

Ensure Minikube is running:

```bash
minikube status
```

Check the Kubernetes cluster:

```bash
kubectl get nodes
```

Confirm Helm is available:

```bash
helm help
```

<br>

### Deploy a Test Chart

Add a Helm repository:
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

Install a test chart (e.g., WordPress):
```bash
helm install my-wp bitnami/wordpress
```

Check deployment:
```bash
helm list
kubectl get all
```

<br>

### Access the Deployed Application
Use Minikube’s service tunnel to access the application in a browser:

```bash
minikube service my-wp
```

<br>

### Cleanup
To uninstall the chart:
```bash
helm uninstall my-wp
```

To stop the cluster:
```bash
minikube stop
```

To delete the cluster completely:
```bash
minikube delete
```
