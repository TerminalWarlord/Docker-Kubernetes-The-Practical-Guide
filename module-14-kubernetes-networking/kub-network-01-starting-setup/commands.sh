# Check the status of the Minikube cluster
minikube status

# Start the Minikube cluster
minikube start 

# Show all deployments in the cluster
kubectl get deployments

# Show all services in the cluster
kubectl get services

# Build a Docker image for the users-api service and tag it
docker build -t terminalwarlord/kub-demo-user ./users-api

# Push the Docker image to the Docker Hub repository
docker push terminalwarlord/kub-demo-user

# Apply the Kubernetes configuration for the user deployment
kubectl apply -f kubernetes/user-deployment.yaml

# Get the list of all running pods in the cluster
kubectl get pods

# Apply the Kubernetes configuration for the user service
kubectl apply -f kubernetes/user-service.yaml

# Show all services again to confirm the user service is running
kubectl get services

# Build a Docker image for the auth service and tag it
docker build -t terminalwarlord/kub-demo-auth .

# Apply the Kubernetes configurations for the auth service and auth deployment
kubectl apply -f=auth-service.yaml,auth-deployment.yaml  

# Apply the Kubernetes configurations for the user service and user deployment
kubectl apply -f=users-service.yaml,users-deployment.yaml

# Execute a command inside the users pod to view environment variables
kubectl exec users-595c9d8db4-nvhmj -- printenv 

# List all namespaces in the Kubernetes cluster
kubectl get namespaces

# View logs for the specified pod (tasks-776cbcdd7-fhlms)
kubectl logs tasks-776cbcdd7-fhlms

# Run the frontend container locally, mapping port 80 of the container to port 80 on the host
docker run -p 80:80 --rm -d terminalwarlord/kub-demo-frontend