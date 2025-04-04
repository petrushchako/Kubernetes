# Certified Kubernetes Administrator (CKA)
#### Anthony E. Nocention
##### Enterprise Architect @ Centino Systems<br> @nocentino<br>www.centinosystems.com

### Contents 
<br>
 
- **CHAPTER 1**<br>Kubernetes Installation and Configuration Fundamentals 
  - Course Overview

<br>
 
- **CHAPTER 2**<br>Exploring the Kubernetes Architecture
  - Course Overview
  - Introduction, Course and Module Overview
  - What is Kubernetes? Kubernetes Benefits and Operating Principles
  - Introducing the Kubernetes API - Objects and API Server
  - Understanding API Objects - Pods
  - Understanding API Objects - Controllers
  - Understanding API Objects - Services
  - Understanding API Objects - Storage
  - Kubernetes Cluster Components Overview and Control Plane
  - Nodes
  - Cluster Add-on Pods
  - Pod Operations
  - Service Operations
  - Kubernetes Networking Dundamentals
  - Module summary and what is next

<br>
 
- **CHAPTER 3**<br>Installing and Configuring Kubernetes
  - Module Overview
  - Installation Considerations
  - Installation Methods
  - Installation Requirements
  - Understanding Cluster Networking Ports
  - Getting Kubernetes
  - Building your Own Cluster
  - Installing Kubernetes on VMs
  - Lab Environment Overview
  - `Demo`: Installing and configuring containerd
  - `Demo`: Installing and configuring Kubernetes Packages
  - Bootstrapping a Cluster with kubeadm
  - Understanding the Certificate Authority Role in your Cluster
  - kubeadm Created kubeconfig Files and Static Pod Manifests
  - Pod Networking Fundamentals
  - Creating a Cluster Control Plane Node and Adding a Node
  - `Demo`: Creating a Cluster Control Plane Node
  - `Demo`: Adding a Node to Your Cluster
  - managed Cloud Deployment Scenarious: AKS, EKS, and GKE
  - `Demo`: Creating a Cluster in the Cloud with Azure Kubernetes Service
  - Module Summary and what is next

<br>
 
- **CHAPTER 4**<br>Working with Your Kubernetes Cluster
  - Module Overview
  - Introducing and using kubectl
  - A Closer Look at kubectl
  - `Demo`: using kubectl" Nodes, Pods, API Resources and bash Auto-Completion
  - Application and Pod Deployment in Kubernetes and Working with YAML manifests
  - `Demo`: Imperative Deployments and Working with Resources in Your Cluster
  - `Demo`: Exporting and Accessing Services in Your Cluster
  - `Demo`: Declarative Deployments and Accessing a Modifying Existing Resources in Your Cluster
  - Module Summary and Thank You

<br>
 
- **CHAPTER 5**<br>Managing the Kubernetes API Server and Pods - Course Overview
  - Course Overview

<br>
 
- **CHAPTER 6**<br>Using the Kubernetes API
  - Introduction, Course and Module Overview
  - The Kubernetes API and API Server
  - The Control Plane and API Objects
  - Defining a Basic Pod Manifest
  - Using kubectl dry-run
  - Using with kubectl diff
  - Lab environment overview
  - `Demo`: API Server Discovery, Listing Resources, using kubectl explain and Creating Objects
  - `Demo`: Working with kubectl dry-run
  - `Demo`: Working with kubectl diff
  - API Group and API Versioning
  - `Demo`: API Object Discovery - API groups and Versions
  - Anatomy of an API Request: API Verbs and Special API Requests
  - API Resource Location (API Paths) and API Response Codes
  - Anatomy od an API Request - A Closer Look
  - `Demo`: Anatomy of an API Request
  - `Demo`: Special API Requests - Watch, Exec and Log
  - `Demo`: Authentication Failures and Missing Resources
  - Module Summary and What's Next

<br>
 
- **CHAPTER 7**<br>Managing Objects with Labels, Annotations, and Namespaces
  - Introduction, Course and Module Overview
  - Organizing Objects in Kubernetes
  - Introducing and Working with Namespaces
  - Creating Namespaces and Creating Objects in Namespaces
  - `Demo`: Working with Namespaces and Objects in Namespaces
  - `Demo`: Performing Operations on Objects in Namespaces
  - Introducing and Working with Labels for Services and How Kubernetes Uses Labels
  - Using Labels for Services, Deployments, and Scheduling
  - `Demo`: Working with Labels - Creating, Querying and Editing
  - `Demo`: Dployments, ReplicaSets, Labels and Selectors
  - `Demo`: Services, labels, Selectors and Scheduling Pods to Nodes
  - Introducing and Working with Annotations
  - Module Summary and What's Next

<br>
 
- **CHAPTER 8**<br>Running and Managing Pods
  - Introducing, Course and Module Overview
  - Understanding Pods
  - How Pods Manage Containers
  - Introducing and Working with Single Container Pods and Contrillers
  - Intrducing and Working Static Pods
  - Working with Pods - kubectl exec, logs, and port-forward
  - `Demo`: Running Bare Pods and Pods in Controllers
  - `Demo`: Running Pods and Using kubectl port-forward to access a Pods Application
  - `Demo`: Working with Static Pods
  - Introducing and Working with Multi-container Pods
  - Demo: Running multi-container Pods and Sharing Data Between Containers in a Pod
  - Introducing and Working with Init Containers
  - `Demo`: Working with Init Containers
  - Pod Lifecyce, Stopping/terminating Pods, and Persistency of Pods
  - Introducing and Working with container restart Policy
  - `Demo`: Pod Lifecycle and Container Restart Policy
  - Defining Pod Health: livenessProbes, readinessProbes and startupProbes
  - Configuring and Defining Container Probes
  - `Demo`: Implementing Container Probes - livenessProbes and readinessProbes
  - `Demo`: Implementing Container Probes - startupProbes
  - Module Summary and Thank You

<br>
 
- **CHAPTER 9**<br>Managing Kubernetes Controllers and Deployments - Course Overview
  - Course Overview

<br>
 
- **CHAPTER 10**<br>Using Controllers to Deploy Applications and Deployment Basics
  - Introduction, Course and Module Overview
  - Kubernetes Principal, the Controller Manager and Introduction to Controllers
  - Lab Environmnet Review
  - `Demo`: Examining System Pods and Their Controllers
  - Introducing the Deployment Controller and Deployment basics
  - `Demo`: Creating a Basic Deploment Imperatively and Declaratively
  - Understanding ReplicaSet Controller Operations
  - `Demo`: Creating a deployment and replicaSet Controller Operations
  - `Demo`: replicaSet Controller Operations Working with Labels and Selectors
  - `Demo`: ReplicaSet Controller Operations - node Failures
  - Module Review and What's Next

<br>
 
- **CHAPTER 11**<br>Maintaining Applications with Deployments
  - Introduction, Course and Module Overview
  - Updating a Deployment and Checking Deployment Rollout Status
  - `Demo`: Understanding a Deployment and Checking Deployment Rollout Status
  - Using Deployment to change State and Controlling Updates with UpdateStrategy
  - Successfully Controlling Deployment Rollout and Defining an UpdateStrategy
  - Pausing and Rolling Back Deployments
  - `Demo`: Rolling Back a Deployment and Controlling the Rate of a Rollout with UpdateStrategy
  - `Demo`: Using UpdateStrategy and Readiness Probes to Control a Rollout
  - `Demo`: Restarting a Deployment
  - Scaling Deployments
  - `Demo`: Scaling a Deployment
  - Successful Deployment Tips, Module Review and What's Next

<br>
 
- **CHAPTER 12**<br>Deploying and Maintaining Applications with DaemonSets and Jobs
  - Introduction, Course and Module Overview
  - Controllers in Kubernetes and understanding DaemonSets
  - Updating DaemonSets
  - `Demo`: Creating and DaemonSets Controller Operations
  - `Demo`: Creating DeamonSets with NodeSelectos and Updating DeamonSets
  - Introducing and Working with Jobs
  - Introducing and Working with CronJobs
  - `Demo`: Executing Tasks with Jobs
  - `Demo`: Dealing with Job Failuers and restartPolicy
  - `Demo`: Working with Parallel Jobs and Scheduling Tasks with CronJobs
  - Introducing StatefulSets
  - Module Reivew and Thank You

<br>
 
- **CHAPTER 13**<br>Configuring and Managing Kubernetes Storage and Scheduling - Course Overview
  - Course Overview

<br>
 
- **CHAPTER 14**<br>Configuring and Managing Storage in Kubernetes
  - Introduction, Course and Module Overview
  - Persistent Storage in Containers and Kubernetes
  - Volumes, Persistent Volumes, and Persistent Volume Claims
  - Controlling Persistent Volume Access with Access Modes
  - Static Provisioning and Storage Lifecycle
  - Defining a Persistent Volume
  - Defining a Persistent Volume Claim
  - Lab Environment Overview
  - `Demo`: Storage Server Overview
  - `Demo`: Static Provisioning Persistent Volumes
  - `Demo`: Using a Persistent Volume in a Pod
  - `Demo`: Controlling Persistent Volume Access with Access Modes and Reclaim Policy
  - Storage Classes and Dynamic Provisioning Workflow
  - `Demo`: Dynamic Provisioning Volumes
  - `Demo`: Defining a Custom StorageClass
  - Module Review and What's Next!

<br>
 
- **CHAPTER 15**<br>Configuration as Data - Environment Variables, Secrets, and ConfigMaps
  - Introduction, Course and Module Overview
  - Why Do We Need Configuration as Data?
  - Configuring Applications in Pods and Environment Variables
  - `Demo`: Passing Configuration into Containers with Environment Variables
  - Creating and Using Secrets
  - `Demo`: Creating and Using Secrets
  - `Demo`: Accessing Secrets in Pods
  - Accessing a Private Container Registry
  - `Demo`: Pulling a Container Image Using a Secret
  - Creating and Using ConfigMaps
  - `Demo`: Creating and Using ConfigMaps
  - Module Review and What's Next!

<br>
 
- **CHAPTER 16**<br>Managing and Controlling the Kubernetes Scheduler
  - Introduction, Course and Module Overview
  - Understanding Scheduling in Kubernetes
  - `Demo`: Scheduling in Action and Scheduling Pods with Requests
  - Controlling Scheduling with Node Selectors
  - Controlling Scheduling with Affinity
  - Controlling Scheduling with Taints and Tolerations
  - `Demo`: Controlling Pod Placement with Affinity
  - `Demo`: Controlling Pod Placement with Taints and Tolerations
  - Node Cordoning, Manual Scheduling, and Configuring Multiple Schedulers
  - `Demo`: Node Cordoning and Manually Scheduling a Pod
  - Module Review and Thank You!

<br>
 
- **CHAPTER 17**<br>Configuring and Managing Kubernetes Networking, Services, and Ingress - Course Overview
  - Course Overview

<br>
 
- **CHAPTER 18**<br>Kubernetes Networking Fundamentals
  - Course Overview
  - Introduction, Course and Module Overview
  - Introducing the Kubernetes Network Model and Cluster Network Topology
  - Pod Networking Communication Patterns and Internals
  - Container Network Interface - CNI
  - Lab Environment Review
  - `Demo`: Investigating Kubernetes Networking - CNI Network Overview
  - `Demo`: Investigating Kubernetes Networking - CNI Overlay Network Routing
  - `Demo`: Investigating Kubernetes Networking - Kubenet Network Overview
  - `Demo`: Investigating Kubernetes Networking - Accessing an AKS Node with SSH
  - `Demo`: Investigating Kubernetes Networking - Kubenet Network Routing and Bridging
  - Cluster DNS and Custom DNS Server and DNS Client Configurations
  - `Demo`: Investigating Cluster DNS
  - `Demo`: Configuring CoreDNS to Use Custom Forwarders and Custom Pod DNS Configuration
  - `Demo`: Examining Cluster DNS Records for Pods and Services
  - `Demo`: Additional Cluster DNS Demos
  - Module Review and What's Next!

<br>
 
- **CHAPTER 19**<br>Configuring and Managing Application Access with Services
  - Introduction, Course and Module Overview
  - Understanding Services in Kubernetes
  - Introducing Service Types and Understanding ClusterIP Internals
  - Understanding NodePort Internals
  - Understanding LoadBalancer Internals
  - Defining Deployments and Services
  - `Demo`: Exposing and Accessing applications with Services - ClusterIP
  - `Demo`: Exposing and Accessing applications with Services - NodePort
  - `Demo`: Exposing and Accessing applications with Services - LoadBalancer
  - Service Discovery with DNS and Environment Variables and Other Types of Services
  - `Demo`: Service Discovery with DNS
  - `Demo`: Service Discovery - Environment Variables
  - Module Review and What's Next!

<br>
 
- **CHAPTER 20**<br>Configuring and Managing Application Access with Ingress
  - Introduction, Course and Module Overview
  - Ingress Architecture and Overview
  - Understanding the Ingress Controller and Why Use Ingress Rather Than Load Balancers
  - Exposing a Single Service with Ingress
  - Exposing a Multiple Services with Ingress Using Path Based Routing
  - Using Name Based Virtual Hosts with Ingress
  - Using TLS Certificates with Ingress
  - `Demo`: Deploying the NGINX Ingress Controller
  - `Demo`: Exposing a Single Service with Ingress
  - `Demo`: Exposing a Multiple Services with Ingress Using Path Based Routing
  - `Demo`: Using Name Based Virtual Hosts with Ingress
  - `Demo`: Using TLS Certificates with Ingress
  - Module Review and Thank You!

<br>
 
- **CHAPTER 21**<br>Maintaining, Monitoring and Troubleshooting Kubernetes - Course Overview
  - Course Overview

<br>
 
- **CHAPTER 22**<br>Maintaining Kubernetes Clusters
  - Introduction, Course and Module Overview
  - Introducing etcd and etcd Backup Concepts
  - Getting etcdctl and Backing up etcd with etcdctl
  - Restoring etcd with etcdctl
  - `Demo`: Investigating etcd Configuration
  - `Demo`: Backing up etcd with etcdctl
  - `Demo`: Restoring etcd to the Same Data Directory
  - `Demo`: Restoring etcd to a New Data Directory
  - Cluster Upgrade Process - Overview
  - Cluster Upgrade Process - Control Plane
  - Cluster Upgrade Process - Worker Nodes
  - `Demo`: Upgrading a Control Plane Node
  - `Demo`: Upgrading a Worker Node
  - Worker Node Maintenance
  - High Availability Cluster Overview and High Availability Cluster Topology - Stacked etc
  - High Availability Cluster Topology - External etcd
  - Module Review and What's Next!

<br>
 
- **CHAPTER 23**<br>Logging and Monitoring in Kubernetes Clusters
  - Introduction, Course and Module Overview
  - Kubernetes Logging Architecture and Logging in Pods and Containers
  - Logging Architecture - Nodes
  - Logging Architecture - Control Plane
  - Understanding and Accessing Cluster Events
  - `Demo`: Kubernetes Logging Architecture - Pods
  - `Demo`: Kubernetes Logging Architecture - Nodes
  - `Demo`: Kubernetes Logging Architecture - Control Plane Pods
  - `Demo`: Working with Kubernetes Events
  - Accessing Object Data with JSONPath
  - Filtering Objects with JSONPath
  - `Demo`: Accessing Object Data with JSONPath
  - `Demo`: Filtering and Sorting Object Data with JSONPath
  - Monitoring in Kubernetes and the Kubernetes Metrics Server
  - `Demo`: Deploying the Kubernetes Metrics Server
  - `Demo`: Using kubect| top to Analyze Resource Consumption on Pods and Nodes
  - Module Review and What's Next!

<br>
 
- **CHAPTER 24**<br>Troubleshooting Kubernetes Clusters
  - Introduction, Course and Module Overview
  - Troubleshooting Tools and Troubleshooting Nodes
  - Managing the kubelet with systemd
  - `Demo`: Troubleshooting Nodes - Stopped kubelet
  - `Demo`: Troubleshooting Nodes - Inaccessible kubelet config.yaml
  - `Demo`: Troubleshooting Nodes - Misconfigured systemd Unit File
  - Troubleshooting - Control Plane
  - `Demo`: Troubleshooting Control Plane - Inaccessible Static Pod Manifests
  - `Demo`: Troubleshooting Control Plane - Misconfigured Static Pod Manifests
  - Troubleshooting Workloads
  - Module Review and Thank You!

<br>
 
- **CHAPTER 25**<br>Configuring and Managing Kubernetes Security - Course Overview
  - Course Overview

<br>
 
- **CHAPTER 26**<br>Kubernetes Security Fundamentals
  - Introduction, Course, and Module Overview
  - Securing the API Server and Authentication Plugins
  - Users in Kubernetes
  - Service Accounts and Service Account Credentials
  - Creating a Service Account and Defining a ServiceAccount in a Pod Spec
  - `Demo`: Investigating Certificate Based Authentication
  - `Demo`: Working with Service Accounts
  - `Demo`: Accessing the API Server Inside a Pod
  - `Demo`: Testing API Access with kubectl can-i with Impersonation
  - Authorization Plugins
  - `Demo`: Managing Authorization for Service Accounts
  - Module Review and What's Next!

<br>
 
- **CHAPTER 27**<br>Managing Certificates and kubeconfig Files
  - Introduction, Course, and Module Overview
  - Certificates and PKI in Kubernetes
  - kubeconfig Files and Certificate-based Authentication
  - How Certificates Are Used in Kubernetes Clusters
  - `Demo`: Investigating PKI Setup on a Control Plane Node
  - `Demo`: Investigating a Control Plane Pod kubeconfig Configuration
  - Creating Certificates with the Certificate API
  - Creating a Certificate Signing Request in openssl
  - Creating a CertificateSigningRequest Object
  - Approving a CertificateSigningRequest and Retrieving a Certificate
  - `Demo`: Creating a Certificate Signing Request for a New User in openssl
  - `Demo`: Creating a CertificateSigningRequest Object, Approving a CertificateSigningRequest a...
  - kubeconfig File Overview and Components
  - kubeconfig File - admin.conf
  - Creating a kubeconfig File Manually
  - `Demo`: Working with kubeconfig Files and Contexts
  - `Demo`: Creating a kubeconfig File for a New User
  - `Demo`: Using a new kubeconfig File with a New User
  - `Demo`: Creating a new Linux User and Configuring Cluster Access
  - Module Review and What's Next!

<br>
 
- **CHAPTER 28**<br>Managing Role Based Access Controls
  - Introduction, Course, and Module Overview
  - Role Based Access Controls and API Objects for RBAC
  - Introducing Roles and ClusterRoles
  - Introducing RoleBinding and ClusterRoleBinding
  - What to Use When?
  - Using RBAC in Your Cluster
  - Default ClusterRoles
  - Defining Role, RoleBinding, ClusterRole, and ClusterRoleBinding
  - Creating a Role and a RoleBinding
  - `Demo`: Creating a Role and RoleBinding
  - `Demo`: Testing API Access with kubecti can-i and Impersonation
