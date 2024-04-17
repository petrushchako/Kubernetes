# Kubernetes Deep Dive

### Instructor<br>**Nigel Poulton**

<br>

### Course Outline

### Kubernetes Big Picture
- Section Overview
- Kubernetes Primer
- The Kubernetes API
- Kubernetes Objects
- Quick ways to get your own cluster

### Application Architecture
- Section Overview
- Theory
- Look at the sample app
- Section Recap

### Kubernetes Networking
- Section Overview
- Common Networking Requirements
- Sample App Requirements
- Kubernetes Networking Basics
- Kubernetes Service Fundamentals
- Service Types
- The Service Network
- Demo
- Section Recap

### Kubernetes Storage
- Section Intro
- Kubernetes Storage Big Picture
- The Container Storage Interface
- Persistent Volumes and Persistent Volume Claims
- Storage Classes
- Demo
- Section Recap

### From Code to Kubernetes
- Section Intro
- Big Picture
- Demo
- Section Recap

### Kubernetes Deployments
- Section Intro
- Theory of Deployments
- Demo
- Recap

### Scaling Applications Automatically
- Section Intro
- Big Picture
- Horizontal Pod Autoscaler Theory
- Horizontal Pod Autoscaler Demo
- Cluster Autoscaler Theory
- Cluster Autoscaler Demo
- Section Recap

### RBAC and Admission Control
- Section Intro
- Big Picture
- Authentication
- Authorization
- Admission Control
- Demo
- Recap

### Other Kubernetes Stuff
- Other Kubernetes Stuff

<br><br>

## Installation
### Private PC
- Minicube
- Docker for Desktop

### Cloud providers
- AKS (hosted)
- GKS (hosted)
- EKS (hosted)
- Kops

### On-prem
- Kubeadm

### Web practice 
- Play With Kubernetes (PWK)
  - http://play-with-k8s.com
  - 4 hours playground
  

# Notes

## Kubernetes Big Picture
- Section Overview


- Kubernetes Primer


- The Kubernetes API


- Kubernetes Objects


- Quick ways to get your own cluster




## Application Architecture
- Section Overview


- Theory


- Look at the sample app


- Section Recap




## Kubernetes Networking
- Section Overview


- Common Networking Requirements


- Sample App Requirements


- Kubernetes Networking Basics

  Core Rules:
  - All Nodes can talk
  - All Pods can talk (No NAT) with the use of `CNI plugin`
  - Every Pod gets its own IP

  **How it works:**

  Nodes get allocated a IP range to operate with (i.e Node1: 10.0.1.0/24, Node2: 10.0.2.0/24)
  Whenever the deployment is triggered,, K8s will allocate pods to a Node, and an IP address from the range tha belongs to the Node will be allocated to the Pod (i.e Node1-Pod1: 10.0.1.1, Node2-Pod2: 10.0.2.19)

  The Ip allocate to the node is available to all other Nodes and Pods for communication. Pod is also selfaware of its own IP address. 

- Kubernetes Service Fundamentals

  Services are stable abstraction point for pods. We create service and logically put it in front of the pods. So all other services instead of communication with Pods (whos IP regularlly change due to Pods crashin, scaling up/down, etc).

  **How it works:**

  Frontend:

  - Every service gets a name (i.e. `search-api`) and IP (i.e. `172.11.240.5`). Those two values are stable, and remain reserved for the service. The name and IP get registered with cluster's native DNS. Every pod knows how to use the core DNS and resolve the name to the address (Note: you might have to enable DNS).

  Backend:
  - On the backend (communication service to pods) it reolves the traffic destination by **lables**. 
  ![](img/services-1.png)

  - When you create a service for the lable selector, K8s also creates another object on the cluster called `Endpoint Object`. It contains the list of Pod IPs and ports that match the service lable selector. 
  The Endpoint Object always has the same name as the service object it is associated with. And it maintains the list of all pods service can send requests to.
  ![](img/services-2.png)

- Service Types

  There are several types of services in Kubernetes:

  - **ClusterIP (default)** 
  
    This is the default type of service. It exposes the Service on a cluster-internal IP. This means the service is only reachable from within the cluster.

    - Gets own IP
    - Only accessible from within cluster

  - **NodePort**
  
    This type of service exposes the Service on each Node's IP at a static port. A client can connect to the NodePort service from outside the cluster by using the Node's IP address and the static port number.

    - Gets cluster-wide port
    - Also accessible from outside of cluster
    - Default range for port selection 30000-32767. You can change this range with `--service-node-port-range` or hadcode desired port number in service description. 
    - Can be of TCP (default) or UDP
  
    ```yaml
    apiVersion: v1
      kind: Service
      metadata:
        name: wordpress
        labels:
          app: wordpress
      spec:
        type: NodePort
        ports:
          - port: 80 # Port that the Pods are listening on
            nodePort: 30080 # Cluster-wide port that the service listens on
        selector:
          app: wordpress
    ```

    ![](img/service-types-1.png)
    To access this service you would use combination of node IP (i.e. `192.168.50.1`) and port number (i.e. NodePort `3126`) : `192.168.50.1:3126`

  - **LoadBalancer**
  
    This service type automatically creates an external load balancer in a cloud environment (like AWS, GCP, Azure) and assigns a unique external IP to the service. It is suitable for scenarios where you want to expose your service to the internet.

    Extrnal load balancer is used as proxy to forward traffic to your K8s cluster, usually via NodePort, but K8s configured this automatically. 
    

  - **ExternalName**
  
    This type of service is used to give an external name (DNS name) to a service, rather than exposing it internally within the cluster. It redirects requests to the external name to a CNAME record.

- The Service Network


- Demo


- Section Recap




## Kubernetes Storage
- Section Intro


- Kubernetes Storage Big Picture


- The Container Storage Interface


- Persistent Volumes and Persistent Volume Claims


- Storage Classes


- Demo


- Section Recap




## From Code to Kubernetes
- Section Intro


- Big Picture


- Demo


- Section Recap




## Kubernetes Deployments
- Section Intro


- Theory of Deployments


- Demo


- Recap




## Scaling Applications Automatically
- Section Intro


- Big Picture


- Horizontal Pod Autoscaler Theory


- Horizontal Pod Autoscaler Demo


- Cluster Autoscaler Theory


- Cluster Autoscaler Demo


- Section Recap




## RBAC and Admission Control
- Section Intro


- Big Picture


- Authentication


- Authorization


- Admission Control


- Demo


- Recap




## Other Kubernetes Stuff
- Other Kubernetes Stuff

