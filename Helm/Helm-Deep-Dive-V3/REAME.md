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
