# Apply the deployment.yaml file to the cluster
kubectl apply -f deployment.yaml

# Apply the service.yaml file to the cluster
kubectl apply -f service.yaml

# Delete the deployment from the cluster
kubectl delete -f=deployment.yaml,service.yaml



# Apply the multi-config.yaml file to the cluster
kubectl apply -f=multi-config.yaml 


# Apply the deployment and service files to the cluster
kubectl apply -f=deployment.yaml,service.yaml 

# Delete all resources with the label group=example
kubectl delete deployment,service -l group=example 