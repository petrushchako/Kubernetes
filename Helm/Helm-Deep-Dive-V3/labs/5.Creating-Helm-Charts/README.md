# Creating Helm Charts

### Lab Overview
There are some instances in which a chart for your application might not exist and one must be created; in other cases, you might have a Kubernetes deployment that you want to convert into a Helm chart. In this hands-on lab, we will take an existing deployment and convert it into a Helm chart.

### Learning Objectives
- Convert the Service Manifest into a Service Template in a New Helm Chart
- Convert the Application Manifest into a Deployment Template in a New Helm Chart
- Ensure the Manifests Render Correctly and Deploy the Application as a NodePort Application

<br><br>

## Solution
Log in to the Kubernetes primary server using the credentials provided for the lab. Then, open a second terminal and log in to the server again using the same credentials. Arrange the two consoles as a split screen so you can refer to file contents in one console while working in the other console's editor.

```sh
ssh cloud_user@<PUBLIC_IP_ADDRESS>
```


## Convert the Service Manifest into a Service Template in a New Helm Chart
1. Create lab file structure:

    ```sh
    mkdir blog
    cd blog
    touch Chart.yaml
    touch values.yaml
    mkdir templates
    ```
2. Create the Chart.yaml file.<br>
Add the apiVersion, name, and version to the file (this is the minimum data required for Chart.yaml):

    ```yaml
    apiVersion: v1
    name: blog
    version: 0.1.0
    ```

3. Create the values.yaml file:

    `vim values.yaml`

4. On the second console, view the home directory, which contains a kubernetes directory:

    `ls`

5. Run the cd and ls commands to open and view the kubernetes directory. The directory contains an application.yaml file and a service.yaml file:
    ```sh
    cd kubernetes/
    ls
    ```
6. View service.yaml:

    `vim service.yaml`

7. On the first console, use the data from service.yaml to add data to values.yaml. Update nodePort to 30080:
```yaml
service:
  name: blog
  type: NodePort
  port: 80
  targetPort: 2368
  nodePort: 30080
```
8. On the first console, save values.yaml.
9. On the second console, exit out of service.yaml.
10. On the second console, run the cd command to open the blog folder and run the vim command to view the values.yaml file:
    ```sh
    cd ../blog
    vim ./values.yaml
    ```
11. On the first console, open the templates directory:
    ```sh
    cd templates/
    ```
12. Copy the service.yaml file into the blog folder's templates directory:
    ```sh
    cp ~/kubernetes/service.yaml ./
    ```
13. Run the ls and vim commands to view service.yaml.
    ```sh
    ls service.yaml
    vim service.yaml
    ```
14. Use the values.yaml data on the second console to make service.yaml a template on the first console. To do this, update the service.yaml file values as follows:
    ```yaml
    apiVersion: v1
    kind: Service
    metadata:
        name: {{ .Values.service.name }}
    spec:
        type: {{ .Values.service.type }}
        selector:
            app: {{ .Values.service.name }}
        ports:
        -   protocol: TCP
            port: {{ .Values.service.port }}
            targetPort: {{ .Values.service.targetPort }}
            nodePort: {{ .Values.service.nodePort }}
    ```
15. On the first console, save the template to return to the templates directory.
16. On the second console, exit out of values.yaml to return to the blog folder.
17. On the first console, run the cd and helm show values commands to view the blog details. At this point, we have a full Helm chart:
    ```sh
    cd ~/
    helm show values blog
    ```
18. Verify the manifest's syntax is correct:
    
    `helm install demo blog --dry-run`

19. On the second console, run the cd and cat commands so you can compare the two service.yaml files.
    ```sh
    cd ../
    cat ./kubernetes/service.yaml
    ```
20. Confirm the service.yaml data matches on the first and second consoles, with the exception of the nodePort value.
21. After reviewing the service.yaml data, clear both consoles.

    `clear`

<br><br><br>

## Convert the Manifest for the Application into a Deployment Template in a New Helm Chart
1. On the second console, view the application.yaml file:
    ```sh
    vim ./kubernetes/application.yaml
    ```
2. On the first console, view the blog folder's values.yaml file:
    ```sh
    vim ./blog/values.yaml
    ```
3. Below the existing file data, create a new blog section by inserting the following values. You can copy these values from the second console:
    ```yaml
    blog:
    name: blog
    replicas: 1
    image: ghost:2.6-alpine
    imagePullPolicy: Always
    containerPort: 2368
    ```
4. On the second console, exit out of the chart.
5. On the first console, save the values file.
6. On the second console, view the blog folder's values.yaml file:

    `vim ./blog/values.yaml`

7. On the first console, copy the kubernetes folder's application.yaml file into the blog folder's templates directory:

    `cp ./kubernetes/application.yaml ./blog/templates/`

8. View the application.yaml file in the blog folder's templates directory:

    `vim ./blog/templates/application.yaml`

9. Make application.yaml a template by updating the file values as follows:
    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
    name: {{ .Values.blog.name }}
    labels:
        app: {{ .Values.blog.name}}
    spec:
    replicas: {{ .Values.blog.replicas }}
    selector:
        matchLabels:
        app: {{ .Values.blog.name }}
    template:
        metadata:
        labels:
            app: {{ .Values.blog.name }}
        spec:
        containers:
        - name: {{ .Values.blog.name }}
            image: {{ .Values.blog.image }}
            imagePullPolicy: {{ .Values.blog.imagePullPolicy }}
            ports:
            - containerPort: {{ .Values.blog.containerPort }}
    ```
10. After updating the file values, save the template and clear the console:

    `clear`

11. On the second console, exit out of the values.yaml file.


<br><br><br>

## Ensure the Manifests Render Correctly and Deploy the Application as a NodePort Application
1. On the first console, run the helm show values command to view the blog folder's details:

    `helm show values blog`

2. Run the helm install command with the --dry-run directive. The manifest should display with the service set to run as a NodePort on port 30080 (in the lab video, this step produced an error message because there was a typo in the application.yaml file):

    `helm install demo blog --dry-run`

3. Install and deploy Helm:

    `helm install demo blog`

4. View the pod details (note that the pod's status is ContainerCreating):

    `kubectl get po`

5. While the container is being created, view the service details (note that the blog service is running on the correct NodePort of 30080):

    `kubectl get svc`

6. Verify the pod's status is now Running:

    `kubectl get po`

7. On the second console, exit out of session so you can view the public IP address for the Kubernetes primary server:

    `exit`

8. Copy the public IP address of the Kubernetes primary server and paste it into a new browser tab along with the port number: <PUBLIC_IP_ADDRESS>:30080. The ghost blog should load.