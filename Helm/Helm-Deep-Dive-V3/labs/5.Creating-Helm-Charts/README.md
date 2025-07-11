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

