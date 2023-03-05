## To shutdown the cluster,

```shell
vagrant halt
```

## To restart the cluster,

```shell
vagrant up
```

## To destroy the cluster,

```shell
vagrant destroy -f
```

## To forward traffic from port 8080 on the local machine to port 8080

kubectl --namespace jenkins port-forward  service/jenkins-service 8080:8080 --address='0.0.0.0' 


## To log into the running container instance and get the Jenkins password 
kubectl --namespace jenkins exec -it deployment/jenkins bash
cat /var/jenkins_home/secrets/initialAdminPassword
