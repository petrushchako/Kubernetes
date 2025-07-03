# Helm Deep Dive V3
Take a deep dive into Helm, a package management solution for Kubernetes.

<br>

### Table of Contents
1. **Introduction**
    - Course Introduction
    - Prerequisites and About the Training Architect
2. **What Is Helm and Why Do I Need It?**
    - What is Helm?
    - Deploying to Kubernetes without Helm
    - Deploying to Kubernetes Using Helm
3. **Getting Familiar with Helm**
    - Installing Helm
    - Working with Chart Repositories
    - Updating Releases in Helm
    - Installing Helm (Hands-on)
4. **Helm Charts**
    - Getting into Helm Charts
    - Modifying Charts
    - Understanding the Language of Charts
    - Speaking the Language of Charts
    - Working with Subcharts
    - Modifying Helm Charts (Hands-on)
    - Creating Helm Charts
5. **More Advanced Charts**
    - Implementing Pre- and Post- Actions with Hooks
    - Testing Charts
    - Creating and Using Libraries
    - Validating Charts
    - Advanced Helm (Hands-on)
6. **Administration and Plugins**
    - Adding Role Based Access Control
    - Troubleshooting Helm
    - Working with Plugins
    - Exploring the Storage Backend
    - Troubleshooting Helm (Hands-on)


<br><br><br>

# What Is Helm and Why Do I Need It?

## What is Helm?
Helm is a package manager specifically designed for Kubernetes. It simplifies the deployment process by enabling users to install complex Kubernetes applications with a single command, much like traditional package managers:

* macOS: `brew install`
* Windows: `choco install`
* Debian: `apt install`
* Red Hat: `yum install`

These package managers resolve dependencies, simplify upgrades, and eliminate the need for deep software knowledge.

<br>

### The Problem with Unmanaged Software
**Without a package manager, installing software can result in**:
* Dependency issues (a "dependency nightmare")
* Lack of meaningful error messages
* Manual configuration
* Fragmented update processes requiring deep application knowledge

**Package managers solve these problems by**:
* Reading metadata<br>Packaged applications have accompanying data that indicates how it is installed (e.g. dependencies)
* Resolve dependencies<br>Not only do we know what the application stack depends on, we also know where to get it and how to install it.
* Installation<br>The pieces of tha package are installed in order. This prevents failures by ensuring that requirements are met.
* Configuration<br>The installed components of a package may require post installation steps (e.g. linking databases).

<br>

### Applying Package Management Concepts to Kubernetes
Deploying applications on Kubernetes involves multiple resources like services, pods, and DNS configurations. Helm abstracts this complexity by introducing **charts**, which are complete definitions of Kubernetes applications. This is how Helm manages packages:
- **Helm Chart**<br>This is the defenition of K8s application. helm uses this information along with a config to instantiate a released object.
- **Least Invasive Change**<br>In the event that there is a change to a release, Helm will only change what has been updated since last release.
- **Running vs Desired State**<br>If a Helm chart has been released, Helm can determine what the current state of the environment is cs the desired state and make changes as needed.
- **Release Tracking**<br>Helm versions releases. This means that if something goes wrong, the release can be rolled back to previous version.

<br>

### Helm’s Functionality
Helm provides a set of powerful features:
* **Single-command installation**: `helm install` deploys entire applications
* **Upgrade support**: `helm upgrade` changes only what’s necessary (least invasive changes)
* **Rollback support**: `helm rollback` restores to the previous known good state
* **Release tracking**: Helm tracks what's currently running versus what should be running
* **Status reporting**: `helm status` reports the current state of a release
* **Consistent environments**: Charts ensure that test and production deployments remain identical
* **Clean uninstalls**: `helm uninstall` removes the application and its resources cleanly

<br>

### Summary
Helm encapsulates best practices and deployment knowledge into reusable charts. This allows users to:
* Deploy applications without deep architectural knowledge
* Perform upgrades and rollbacks easily
* Maintain consistency across environments
* Reduce time spent on manual Kubernetes resource management


<br><br><br>



## Deploying Kubernetes Resources Without Helm
This lesson demonstrates the manual process of deploying applications in Kubernetes **without using Helm**. The purpose is to expose the complexity of the process to highlight the advantages Helm provides.

### The Five-Step Deployment Process (Without Helm)
1. **Scope the Deployment**
   * Determine infrastructure needs:
     * Persistent volumes
     * Services
     * Storage classes
     * Component interconnectivity
2. **Define Dependencies**
   * Identify backend requirements:
     * Databases
     * Flat files
     * Data persistence strategies
3. **Create Manifest Files**
   * Write YAML manifests for each component:
     * Pods (e.g., database pods)
     * Services to expose those pods
     * Persistent volume claims
     * Application configurations

4. **Apply the Manifests**
   * Use `kubectl apply -f` for each YAML file individually
   * Order matters: deploy dependencies (e.g., database) first

5. **Perform Post-Deployment Configuration**
   * Validate services are reachable
   * Apply any manual configurations (e.g., environment variables, secret injection, health checks)

<br>

### Demonstration Setup
* A **three-node Kubernetes cluster** is used
* Already configured:
  * A storage class
  * Persistent volumes

A [GitHub repository](https://github.com/linuxacademy/content-helm-deep-dive-v3) containing:
  * `mysql.yml`: Deploys a MySQL pod with service and PVC
  * `wp.yml`: Deploys a WordPress pod that connects to MySQL

<br>

### Deployment Walkthrough
1. Apply MySQL manifest:
   ```bash
   kubectl apply -f mysql.yml
   ```

   * Deploys:
     * MySQL pod
     * MySQL service
     * Persistent volume claim

2. Apply WordPress manifest:
   ```bash
   kubectl apply -f wp.yml
   ```

   * Interacts with the MySQL service
   * Based on Kubernetes official tutorial examples

3. Validation:
   ```bash
   kubectl get pods
   kubectl get services
   ```

4. Cleanup:
   ```bash
   kubectl delete -f mysql.yml
   kubectl delete -f wp.yml
   ```

   * Each manifest must be deleted manually
   * Requires tracking which files were used during deployment

<br><br><br>


## Deploying to Kubernetes Using Helm
### Overview
Helm simplifies deploying applications to Kubernetes by packaging Kubernetes resources into reusable, versioned bundles called **charts**. This process is easier to manage than traditional YAML-based deployments.

<br>

### Deployment Steps
1. **Locate a Chart**
   Find a Helm chart from a repository (e.g., `stable/wordpress`). Charts are pre-configured collections of Kubernetes resources created by others for reuse.
2. **Install the Chart**
   Use the `helm install` command with a unique release name to deploy the chart:
   ```bash
   helm install demowp stable/wordpress
   ```
3. **Configure the Release**
   After installation, Helm provides instructions or output detailing how to perform post-deployment configuration (e.g., credentials, URLs).

<br>

### Example Scenario
* The cluster already has a storage class and persistent volumes.
* When deploying WordPress via Helm, the chart requests persistent volumes. If the volumes are already in use by another release, new pods may fail to start due to unbound PVCs.
* Multiple instances of the same chart can be deployed using different release names:

  ```bash
  helm install anotherwp stable/wordpress
  ```

<br>

### Managing Releases
* **List Releases**:
  ```bash
  helm ls
  ```

* **Delete a Release**:
  ```bash
  helm delete demowp
  ```

* Deleting a release will remove all Kubernetes resources (pods, services, PVCs) created by that release, simplifying cleanup.

<br>

### Key Benefits of Helm
* Reusability: Deploy multiple instances of the same chart.
* Easy Cleanup: `helm delete` handles cleanup automatically.
* Simplicity: Abstracts away complex Kubernetes manifests.
* Configurability: Allows post-install configuration through chart values.


<br><br><br>


## Getting Familiar with Helm<br>

## Helm Installation
### Prerequisites
* Ensure a Kubernetes cluster is up and running.
* Ensure `kubectl` is installed **on your local machine** (not inside the cluster).
* Verify `kubectl` can access the cluster using:

  ```bash
  kubectl get nodes
  ```

<br>

### Helm Installation Methods
There are **three main ways** to install Helm:

#### 1. **Using a Package Manager** (Recommended)
* Suitable for Windows, macOS, and Linux.
* Simplifies future updates and maintenance.
* Example (macOS with Homebrew):
  ```bash
  brew install helm
  ```

#### 2. **Using the Provided Script**
* Official Helm script: `get_helm.sh`
* Process:
  ```bash
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  chmod 700 get_helm.sh
  ./get_helm.sh
  ```
* Script logic:
  * Determines OS
  * Downloads the correct binary
  * Verifies the file
  * Installs Helm

#### 3. **Manual Installation**
* Download the appropriate `.tar.gz` archive for your OS.
* Example (Linux):
  ```bash
  wget https://get.helm.sh/helm-v3.14.0-linux-amd64.tar.gz
  tar -zxvf helm-v3.14.0-linux-amd64.tar.gz
  sudo mv linux-amd64/helm /usr/local/bin/helm
  helm version
  ```

<br>

### Post-Installation Steps
Once Helm is installed, it has **no repositories configured** by default.
1. **Add a Repository** (e.g., the deprecated stable repo):
   ```bash
   helm repo add stable https://charts.helm.sh/stable
   ```

2. **Update Repository Cache**:
   ```bash
   helm repo update
   ```

3. **Search for a Chart**:
   ```bash
   helm search repo wordpress
   ```

4. **Install a Demo Chart**:
   ```bash
   helm install my-wordpress stable/wordpress
   ```

5. **Verify Installation**:
   ```bash
   kubectl get pods
   helm ls
   ```

6. **Delete the Release (Cleanup)**:
   ```bash
   helm delete my-wordpress
   ```

<br><br><br>

## Working with Chart Repositories
### What Is a Chart Repository?
- A chart repository is an HTTP server that is capable of serving an index.yaml file. This file contains the manifests of packaged charts and where they are located.
- The index file for the repository can be created by using the helm repo index command and providing the directory which contains the packaged charts.
- A packaged chart is a Helm chart that has been processed into a tar archive by Helm, typically using the helm package command and providing the chart name. These archives have a .tgz extension.

### Sample chart (`index. yaml`)
```yaml
apiVersion: v1
entries:
  alpine:
    - created: 2239-10-06T36:23:20.4998+06:00
      description: Deploy a basic Alpine Linux pod
      digest: 1234567890987654321abcdefghlmnop
      name: alpine
      sources:
      - https://github.com/helm/helm
      urls:
      - https://acg.github.io/example/cusalp-0.2.0.tgz
      version: 0.2.0
```
<br>

### Creating an Index
* Use the `helm repo index` command to create an `index.yaml`:
  ```
  helm repo index <directory>
  ```
* Helm scans the specified directory for packaged charts (`.tgz`) and builds an index.

<br>

### Example Setup
1. **Set repo** for charts:
   ```
   helm repo add stable https://charts.helm.sh/stable
   ```

2. **Fetch example charts** using `helm fetch`:
   ```
   mkdir example && cd example
   helm fetch stable/jenkins
   helm fetch stable/spark
   ```

3. Charts are downloaded as `.tgz` files:
   ```sh
   ls -lt
   -rw-r--r--  1 alex  staff  53303 Jul  2 22:48 jenkins-2.5.4.tgz
   -rw-r--r--  1 alex  staff   5872 Jul  2 22:51 spark-1.0.5.tgz
   ```

4. **Generate the index**:
   ```
   cd ..
   helm repo index example
   ```

5. The `example/` folder now contains:
   * `index.yaml`
   * Two `.tgz` chart files

6. This folder can be hosted via GitHub Pages or another HTTP server to serve as a custom chart repository.

<br>

### Repository Management Commands
| Command                      | Description            |
| ---------------------------- | ---------------------- |
| `helm repo add <name> <url>` | Adds a new repo        |
| `helm repo list`             | Lists configured repos |
| `helm repo update`           | Updates repo data      |
| `helm repo remove <name>`    | Removes a repo         |

> You must provide a name when using `helm repo add`, or the command will fail.

<br>

### Custom Repository Workflow
* Add custom repo hosted on GitHub Pages:
  ```sh
  helm repo add custom https://username.github.io/repo-name
  ```

* Remove default repo to avoid confusion:
  ```sh
  helm repo remove stable
  ```

* Update repo:
  ```sh
  helm repo update
  ```

* Search in custom repo:
  ```sh
  helm search repo spark
  ```

* The result will show: `custom/spark`

<br>

### Modifying Charts
* Charts are `.tar.gz` files and can be **unpacked**, modified, and **repackaged**.
* Updated charts can be committed and redeployed to the custom repo.


<br><br><br>


## Updating Releases in Helm
### Chart + Values = Release
A **Helm release** is created by combining:
* A **Helm chart** (which defines the Kubernetes resources)
* A **`values.yaml`** file (which provides configurable parameters)

These are merged into a final Kubernetes **manifest**, which is what gets deployed to the cluster.

<br>

### Example Scenario
If a chart specifies `alpine` and `mysql` containers, and the `values.yaml` provides versions like `1.0.6` and `3.0.6`, the resulting release will reflect these versions.<br>The release version is defined in `Chart.yaml` and should be incremented **manually** if the chart is physically modified (e.g., after using `helm fetch` and making local edits).

<br>

### Updating a Running Release
To update a **running release** without modifying the actual chart files:

```bash
helm upgrade <release-name> <chart-name> --set <key>=<value>
```

Example:
```bash
helm upgrade example ngin --set image.tag=alpine
```

This upgrades only the running configuration without changing the chart on disk. Helm creates a new **revision** of the release, e.g., from **revision 1** to **revision 2**.

<br>

### How Helm Upgrade Works
* Helm identifies what has changed and only updates the affected resources.
* For example, a new Pod is created with the updated image (`nginx:alpine`), and the old Pod is terminated.
* The **Service** remains untouched if it hasn’t changed.
* This allows targeted updates without redeploying the entire chart.

<br>

### Persistent vs. Temporary Changes
* Temporary override: Done using `--set` or custom `values.yaml`
* Permanent change: Modify `Chart.yaml` or `values.yaml` in the chart directory and redeploy

<br><br><br>


