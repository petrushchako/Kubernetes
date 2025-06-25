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
Without a package manager, installing software can result in:
* Dependency issues (a "dependency nightmare")
* Lack of meaningful error messages
* Manual configuration
* Fragmented update processes requiring deep application knowledge

Package managers solve these problems by:
* Reading metadata
* Resolving and downloading dependencies
* Installing components in proper sequence
* Applying post-install configuration as needed

<br>

### Applying Package Management Concepts to Kubernetes
Deploying applications on Kubernetes involves multiple resources like services, pods, and DNS configurations. Helm abstracts this complexity by introducing **charts**, which are complete definitions of Kubernetes applications. These charts:
* Contain configuration (via templates and values)
* Are installed via `helm install` with a single command
* Bundle all required components and logic for proper deployment
