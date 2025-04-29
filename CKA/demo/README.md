# Demos from Certified Kubernetes Administrator (CKA) course

### Contents
 
- **CHAPTER 3**<br>**Installing and Configuring Kubernetes**<br><br>
  - `Demo 1.1`: Installing and configuring containerd
  - `Demo 1.2`: Installing and configuring Kubernetes Packages
  - `Demo 1.3`: Bootstrapping Cluster with kubeadm
  - `Demo 1.4`: Creating Cluster: Deploy Pod Network
  - `Demo 1.5`: Creating Cluster: Examining systemd Units and Static Pod Manifest
  - `Demo 1.6`: Bootstrapping Cluster with kubeadm Worker Nodes
  - `Demo 1.7`: Creating Cluster: Install Kubernetes Packages on Worker Node
  - `Demo 1.8`: Creating Cluster: Joining Worker Node to Cluster
  - `Demo 1.9`: Deploy Basic Workload

<br>
 
- **CHAPTER 4**<br>**Working with Your Kubernetes Cluster**<br><br>
  - `Demo`: using kubectl Nodes, Pods, API Resources and bash Auto-Completion
  - `Demo 2.2`: Imperative Deployments and Working with Resources in Your Cluster
  - `Demo`: Exporting and Accessing Services in Your Cluster
  - `Demo`: Declarative Deployments and Accessing a Modifying Existing Resources in Your Cluster

<br>
 
- **CHAPTER 6**<br>**Using the Kubernetes API**<br><br>
  - `Demo`: API Server Discovery, Listing Resources, using kubectl explain and Creating Objects
  - `Demo`: Working with kubectl dry-run
  - `Demo`: Working with kubectl diff
  - `Demo`: API Object Discovery - API groups and Versions
  - `Demo`: Anatomy of an API Request
  - `Demo`: Special API Requests - Watch, Exec and Log
  - `Demo`: Authentication Failures and Missing Resources

<br>
 
- **CHAPTER 7**<br>**Managing Objects with Labels, Annotations, and Namespaces**<br><br>
  - `Demo`: Working with Namespaces and Objects in Namespaces
  - `Demo`: Performing Operations on Objects in Namespaces
  - `Demo`: Working with Labels - Creating, Querying and Editing
  - `Demo`: Dployments, ReplicaSets, Labels and Selectors
  - `Demo`: Services, labels, Selectors and Scheduling Pods to Nodes

<br>
 
- **CHAPTER 8**<br>**Running and Managing Pods**<br><br>
  - `Demo`: Running Bare Pods and Pods in Controllers
  - `Demo`: Running Pods and Using kubectl port-forward to access a Pods Application
  - `Demo`: Working with Static Pods
  - `Demo`: Working with Init Containers
  - `Demo`: Pod Lifecycle and Container Restart Policy
  - `Demo`: Implementing Container Probes - livenessProbes and readinessProbes
  - `Demo`: Implementing Container Probes - startupProbes

<br>
 
- **CHAPTER 10**<br>**Using Controllers to Deploy Applications and Deployment Basics**<br><br>
  - `Demo`: Examining System Pods and Their Controllers
  - `Demo`: Creating a Basic Deploment Imperatively and Declaratively
  - `Demo`: Creating a deployment and replicaSet Controller Operations
  - `Demo`: replicaSet Controller Operations Working with Labels and Selectors
  - `Demo`: ReplicaSet Controller Operations - node Failures

<br>
 
- **CHAPTER 11**<br>**Maintaining Applications with Deployments**<br><br>
  - `Demo`: Understanding a Deployment and Checking Deployment Rollout Status
  - `Demo`: Rolling Back a Deployment and Controlling the Rate of a Rollout with UpdateStrategy
  - `Demo`: Using UpdateStrategy and Readiness Probes to Control a Rollout
  - `Demo`: Restarting a Deployment
  - `Demo`: Scaling a Deployment

<br>
 
- **CHAPTER 12**<br>**Deploying and Maintaining Applications with DaemonSets and Jobs**<br><br>
  - `Demo`: Creating and DaemonSets Controller Operations
  - `Demo`: Creating DeamonSets with NodeSelectos and Updating DeamonSets
  - `Demo`: Executing Tasks with Jobs
  - `Demo`: Dealing with Job Failuers and restartPolicy
  - `Demo`: Working with Parallel Jobs and Scheduling Tasks with CronJobs

<br>
 
- **CHAPTER 14**<br>**Configuring and Managing Storage in Kubernetes**<br><br>
  - `Demo`: Storage Server Overview
  - `Demo`: Static Provisioning Persistent Volumes
  - `Demo`: Using a Persistent Volume in a Pod
  - `Demo`: Controlling Persistent Volume Access with Access Modes and Reclaim Policy
  - `Demo`: Dynamic Provisioning Volumes
  - `Demo`: Defining a Custom StorageClass

<br>
 
- **CHAPTER 15**<br>**Configuration as Data - Environment Variables, Secrets, and ConfigMaps**<br><br>
  - `Demo`: Passing Configuration into Containers with Environment Variables
  - `Demo`: Creating and Using Secrets
  - `Demo`: Accessing Secrets in Pods
  - `Demo`: Pulling a Container Image Using a Secret
  - `Demo`: Creating and Using ConfigMaps

<br>
 
- **CHAPTER 16**<br>**Managing and Controlling the Kubernetes Scheduler**<br><br>
  - `Demo`: Scheduling in Action and Scheduling Pods with Requests
  - `Demo`: Controlling Pod Placement with Affinity
  - `Demo`: Controlling Pod Placement with Taints and Tolerations
  - `Demo`: Node Cordoning and Manually Scheduling a Pod

<br>
 
- **CHAPTER 18**<br>**Kubernetes Networking Fundamentals**<br><br>
  - `Demo`: Investigating Kubernetes Networking - CNI Network Overview
  - `Demo`: Investigating Kubernetes Networking - CNI Overlay Network Routing
  - `Demo`: Investigating Kubernetes Networking - Kubenet Network Overview
  - `Demo`: Investigating Kubernetes Networking - Accessing an AKS Node with SSH
  - `Demo`: Investigating Kubernetes Networking - Kubenet Network Routing and Bridging
  - `Demo`: Investigating Cluster DNS
  - `Demo`: Configuring CoreDNS to Use Custom Forwarders and Custom Pod DNS Configuration
  - `Demo`: Examining Cluster DNS Records for Pods and Services
  - `Demo`: Additional Cluster DNS Demos

<br>
 
- **CHAPTER 19**<br>**Configuring and Managing Application Access with Services**<br><br>
  - `Demo`: Exposing and Accessing applications with Services - ClusterIP
  - `Demo`: Exposing and Accessing applications with Services - NodePort
  - `Demo`: Exposing and Accessing applications with Services - LoadBalancer
  - `Demo`: Service Discovery with DNS
  - `Demo`: Service Discovery - Environment Variables

<br>
 
- **CHAPTER 20**<br>**Configuring and Managing Application Access with Ingress**<br><br>
  - `Demo`: Deploying the NGINX Ingress Controller
  - `Demo`: Exposing a Single Service with Ingress
  - `Demo`: Exposing a Multiple Services with Ingress Using Path Based Routing
  - `Demo`: Using Name Based Virtual Hosts with Ingress
  - `Demo`: Using TLS Certificates with Ingress

<br>
 
- **CHAPTER 22**<br>**Maintaining Kubernetes Clusters**<br><br>
  - `Demo`: Investigating etcd Configuration
  - `Demo`: Backing up etcd with etcdctl
  - `Demo`: Restoring etcd to the Same Data Directory
  - `Demo`: Restoring etcd to a New Data Directory
  - `Demo`: Upgrading a Control Plane Node
  - `Demo`: Upgrading a Worker Node

<br>
 
- **CHAPTER 23**<br>**Logging and Monitoring in Kubernetes Clusters**<br><br>
  - `Demo`: Kubernetes Logging Architecture - Pods
  - `Demo`: Kubernetes Logging Architecture - Nodes
  - `Demo`: Kubernetes Logging Architecture - Control Plane Pods
  - `Demo`: Working with Kubernetes Events
  - `Demo`: Accessing Object Data with JSONPath
  - `Demo`: Filtering and Sorting Object Data with JSONPath
  - `Demo`: Deploying the Kubernetes Metrics Server
  - `Demo`: Using kubect| top to Analyze Resource Consumption on Pods and Nodes

<br>
 
- **CHAPTER 24**<br>**Troubleshooting Kubernetes Clusters**<br><br>
  - `Demo`: Troubleshooting Nodes - Stopped kubelet
  - `Demo`: Troubleshooting Nodes - Inaccessible kubelet config.yaml
  - `Demo`: Troubleshooting Nodes - Misconfigured systemd Unit File
  - `Demo`: Troubleshooting Control Plane - Inaccessible Static Pod Manifests
  - `Demo`: Troubleshooting Control Plane - Misconfigured Static Pod Manifests

<br>
 
- **CHAPTER 26**<br>**Kubernetes Security Fundamentals**<br><br>
  - `Demo`: Investigating Certificate Based Authentication
  - `Demo`: Working with Service Accounts
  - `Demo`: Accessing the API Server Inside a Pod
  - `Demo`: Testing API Access with kubectl can-i with Impersonation
  - `Demo`: Managing Authorization for Service Accounts

<br>
 
- **CHAPTER 27**<br>**Managing Certificates and kubeconfig Files**<br><br>
  - `Demo`: Investigating PKI Setup on a Control Plane Node
  - `Demo`: Investigating a Control Plane Pod kubeconfig Configuration
  - `Demo`: Creating a Certificate Signing Request for a New User in openssl
  - `Demo`: Creating a CertificateSigningRequest Object, Approving a CertificateSigningRequest a...
  - `Demo`: Working with kubeconfig Files and Contexts
  - `Demo`: Creating a kubeconfig File for a New User
  - `Demo`: Using a new kubeconfig File with a New User
  - `Demo`: Creating a new Linux User and Configuring Cluster Access

<br>
 
- **CHAPTER 28**<br>**Managing Role Based Access Controls**<br><br>
  - `Demo`: Creating a Role and RoleBinding
  - `Demo`: Testing API Access with kubecti can-i and Impersonation
