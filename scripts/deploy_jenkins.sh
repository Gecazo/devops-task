#!/bin/bash

# Install Helm if not already installed
if ! command -v helm &> /dev/null
then
    echo "Helm not found. Installing Helm..."
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
fi

# Add Jenkins Helm chart repository
helm repo add jenkinsci https://charts.jenkins.io

# Update Helm chart repository
helm repo update

# Configuring and deploying a Jenkins instance in a Kubernetes cluster 
kubectl -n jenkins create namespace jenkins
kubectl -n jenkins create -f scripts/jenkins.yaml 
kubectl -n jenkins create -f scripts/jenkins-volume.yaml 
kubectl -n jenkins create -f scripts/jenkins-service.yaml 

kubectl -n jenkins apply -f scripts/jenkins-volume.yaml
kubectl -n jenkins apply -f scripts/jenkins-service.yaml
 
# Deploy Jenkins chart
chart=jenkinsci/jenkins
helm install jenkins -n jenkins -f scripts/jenkins-values.yaml $chart

# Wait for Jenkins pod to be ready
kubectl wait --for=condition=Ready pod -l app.kubernetes.io/component=jenkins-master

kubectl get pods jenkins

# Retrieve Jenkins admin password
printf "Jenkins admin password: "
kubectl exec -n jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/chart-admin-password && echo