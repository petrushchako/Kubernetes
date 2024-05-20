# Deploying to a Google Kubernetes Engine Cluster

### Description
The strength and flexibility of Kubernetes is built around the concept of containerized applications, which are deployed differently from non-containerized apps. In this hands-on lab, you’ll complete all the steps from creating a Kubernetes cluster to confirming the deployed application, including creating the Docker image of your application, pushing that image to Container Registry, deploying the workload, and then configuring a load balancer to expose it.


### Objectives
Successfully complete this lab by achieving the following learning objectives:

- **Create the Kubernetes Engine cluster**
  - From the Kubernetes Engine Clusters page, click Create cluster.
  - Configure the new cluster:
    - Name the cluster
    - Change the number of nodes to 4
    - Under Nodes, Machine Configuration, General-Purpose, change the Series to "N1" and the Machine type to "n1-standard-1".
    - Leave all other settings at their default
  - Click Create.

- **Get the files**
  - Clone the GitHub repository: 
    - `git clone https://github.com/linuxacademy/content-gcpro-developer`
  - Change directory with the following command: 
    - `cd content-gcpro-developer/kubernetes-engine-lab`

- **Configure the `config.yaml` file**
  - In the Cloud Shell Editor, open the config.yaml file.
  - On line 32, replace [PROJECT_ID] with your project ID.
  - Choose the file and then select Save.

- **Build the containerized Docker image**
  - In the Cloud Shell, execute the following command:
    `docker build -t la-container-image .`

- **Push the containerized app into the Container Registry**
  - In the Cloud Shell, configure Docker to use the gcloud command: 
    - `gcloud auth configure-docker`
  - Tag the image with the registry name: 
    - `docker tag la-container-image gcr.io/[PROJECT_ID]/la-container-image:v1`
  - Push the image to the Container Registry: 
    - `docker push gcr.io/[PROJECT_ID]/la-container-image:v1`

- **Confirm the operation**
  - Navigate to Container Registry Images.
  - Confirm the existence of la-container-image.

- **Deploy the workload**
  - Navigate to Kubernetes Engine > Workloads.
  - Click Deploy.
  - Choose the existing container image.
  - Click Deploy.

- **Increase the number of pods**
  - Navigate to the YAML tab.
  - Click Edit.
  - Change the number of replicas to 4.
  - Click Save.
  - Confirm the operation.

- **Expose the deployment**
  - From the Deployment Details page, click Expose.
  - Set the Service type to Load balancer.
  - Click Expose.
  - Confirm by clicking the External IP link.