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


### Convert the Service Manifest into a Service Template in a New Helm Chart

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