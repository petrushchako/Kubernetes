# Modifying Helm Charts

### Lab Overview
Helm provides solutions for customizing charts on the fly. In this hands-on lab, we will modify a chart to allow us to access our application on a node port in our cluster. Being able to access the chart values and knowing how to reference those values at install time can be invaluable in making sure the application works as expected in our environment.

### Learning Objectives
- Create a Release of the Ghost Blog Chart from the cloud_users Home Directory
- Verify the Blog Is Available at the Node Port on the Cluster

<br><br><br>

## Solution
1. Log into the Kubernetes primary instance using the credentials provided for the lab.
    ```sh
    ssh cloud_user@<PUBLIC_IP_ADDRESS>
    ```

### Create a Release of the Ghost Blog Chart from the cloud_users Home Directory
1. Run the `ls ./ghost/` command to view the directory's details. You can see the directory is a Helm chart containing `Chart.yaml`, `templates`, and `values.yaml`.

    ```sh
    ls ./ghost/
    ```
2. Run the helm show values command to view the values the ghost chart exposes. The ghost chart is using a LoadBalancer service and a Blog application.

    ```sh
    helm show values ghost
    ```

3. Run the helm install command with the --set and --dry-run directives to install Helm, set the service type value, and view the manifest.

    ```sh
    helm install demo ghost --set Service.type=NodePort --dry-run
    ```
4. Review the manifest to ensure the service type is NodePort and the nodePort is set to 30080.
5. Run the helm install command again without the --dry-rundirective. The instance is installed and deployed.

    ```sh
    helm install demo ghost --set Service.type=NodePort
    ```
5. Run the kubectl get po command to view the container details.
    ```sh
    kubectl get po
    ```
6. Run the kubectl get svc command to view the service details. The blog service is using NodePort and port 30080.
    ```sh
    kubectl get svc
    ```
7. Exit out of the Kubernetes service.
    ```sh
    exit
    ```
