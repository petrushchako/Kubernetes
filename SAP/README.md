# SAP Kubernetes Tools
<br><br><br>



## Crossplane configuration guide
### Install All Tools in One Command
Core CLIs & Local Cluster Engine
Run this single command to install kubectl, minikube, helm, kustomize, crossplane-cli, and flux:
`brew install kubectl minikube helm kustomize crossplane fluxcd/tap/flux`


### Install Docker Desktop

Minikube requires a container driver backend to run on macOS:
`brew install --cask docker`


> **Verification:**
>
> Launch the Docker app from your Applications folder so the engine is running in the background.


### Verify All Tool Versions

```bash
for tool in kubectl minikube helm kustomize crossplane flux; do
  echo -n "$tool: " && $tool version --short 2>/dev/null || $tool version 2>/dev/null || echo "OK"
done
```


### Start Minikube Cluster

Allocate 4 CPUs and 4GB of RAM so your cluster has enough room for Crossplane controllers:

`minikube start --cpus=4 --memory=4096 --driver=docker`

> Verify isntallation of Minikube by running below:
>
> `minikube status`


### Add & Update Crossplane Helm chart repository
Register the official Crossplane Helm chart repository

```bash
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
```

> Verification: Run `helm repo list` to ensure crossplane-stable is listed.


### Deploy Crossplane via Helm
Install Crossplane into its own dedicated system namespace:

```sh
helm install crossplane crossplane-stable/crossplane \
  --namespace crossplane-system \
  --create-namespace
```

> Verification: Run `kubectl get pods -n crossplane-system`. Both crossplane and crossplane-rbac-manager pods should reach 1/1 Running.



### Verify Kubernetes API Extensions Custom Resource Definitions (CRDs)

`kubectl get crd | grep crossplane`

> Verification: You should see core CRDs printed, including compositeresourcedefinitions.apiextensions.crossplane.io and providers.pkg.crossplane.io.