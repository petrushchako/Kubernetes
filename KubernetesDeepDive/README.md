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

  How it works:
  Nodes get allocated a IP range to operate with (i.e Node1: 10.0.1.0/24, Node2: 10.0.2.0/24)
  Whenever the deployment is triggered,, K8s will allocate pods to a Node, and an IP address from the range tha belongs to the Node will be allocated to the Pod (i.e Node1-Pod1: 10.0.1.1, Node2-Pod2: 10.0.2.19)

  The Ip allocate to the node is available to all other Nodes and Pods for communication. Pod is also selfaware of its own IP address. 

- Kubernetes Service Fundamentals


- Service Types


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

