# Task for DevOps Intern
 
* Create vagrant files to deploy 2 VMs by using any type of virtualization available for user VirtualBox.
* The startup scripts should include deployment of kubernetes with Kubeadm.
1st VM is kubernetes master
2nd VM is kubernetes Worker
* Deploy jenkins instance on top of Kubernetes. Using helm chart is a plus
* Create jenkins job that will build Docker image that prints Hello World. (Using groovy script)

# Describing the process

* First, I defined the two virtual machines by giving them names, and specified which operating system image (box) they would use. I also specified the IP addresses that were assigned to each VM.

* I then configured the network settings for the VMs, such as port forwarding and private networking, so that they could communicate with each other and with the host machine.

* Next, I specified the provisioning script for the Kubernetes master VM. This script included the necessary commands to install and configure Kubeadm, which was a tool that allowed me to easily deploy Kubernetes on the VM.

* Similarly, I specified the provisioning script for the Kubernetes worker VM. This script also included the necessary commands to install and configure Kubeadm, but this time to join the Kubernetes cluster as a worker node.

* I attempted to deploy Jenkins on top of the cluster using the Helm chart for Jenkins, but I encountered issues with Jenkins resetting itself. Despite my efforts to troubleshoot and fix the issue, I was unable to resolve the problem, so I was not able to fully deploy Jenkins. :skull:

* As a result, I was unable to create a Jenkins job that built a Docker image that printed Hello World using a Groovy script.

# Basic commands to try out running the code
## To start the cluster

```
vagrant up
```

## To log into the vagrant master
```
vagrant ssh master
```

## To forward traffic from port 8080 on the local machine to port 8080
```
kubectl --namespace jenkins port-forward  service/jenkins-service 8080:8080 --address='0.0.0.0' 
```

## To log into the running container instance and get the Jenkins password 
```
kubectl --namespace jenkins exec -it deployment/jenkins bash
cat /var/jenkins_home/secrets/initialAdminPassword
```
