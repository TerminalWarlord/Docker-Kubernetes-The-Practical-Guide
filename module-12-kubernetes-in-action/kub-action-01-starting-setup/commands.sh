# Build the Docker image from the Dockerfile in the current directory
docker build -t kube-image .

# Tag the Docker image with the repository name
docker tag kube-image terminalwarlord/kube-app

# Log in to Docker Hub
docker login

# Push the Docker image to Docker Hub
docker push terminalwarlord/kube-app

# Create a Kubernetes deployment using the pushed Docker image
kubectl create deployment first-app --image=terminalwarlord/kube-app

# List all Kubernetes deployments
kubectl get deployments

# List all Kubernetes pods
kubectl get pods

# Open the Minikube dashboard in the default web browser
minikube dashboard

# Expose the Kubernetes deployment to the internet
kubectl expose deployment first-app --type=LoadBalancer --port=8001

# List all Kubernetes services
kubectl get services

# to get the IP address of the service (not required on AWS/Azure/GCP, only on Minikube)
minikube service first-app


# Scale the Kubernetes deployment to 3 replicas
kubectl scale deployment/first-app --replicas=3



# UPDATE THE DEPLOYMENT (This wont work as the tag is not updated)
# STEP 1: Update the Docker image in the Kubernetes deployment
docker build -t terminalwarlord/kube-app:1 .

# STEP 2: Push the updated Docker image to Docker Hub
docker push terminalwarlord/kube-app

# STEP 3: Check the deployment status
kubectl get deployments

# STEP 4: Update the Kubernetes deployment with the new Docker image
kubectl set image deployment/first-app kube-app=terminalwarlord/kube-app


# THIS WILL WORK
# STEP 1: Update the Docker image in the Kubernetes deployment
docker build -t terminalwarlord/kube-app:1 .

# STEP 2: Push the updated Docker image to Docker Hub
docker push terminalwarlord/kube-app:1

# STEP 3: Check the deployment status
kubectl get deployments

# STEP 4: Update the Kubernetes deployment with the new Docker image
kubectl set image deployment/first-app kube-app=terminalwarlord/kube-app:1

# Check the deployment status
kubectl rollout status deployment/first-app


# Update the Kubernetes deployment with a new Docker image version 2 but it does not exist
kubectl set image deployment/first-app kube-app=terminalwarlord/kube-app:2


# Undo the last deployment update
kubectl rollout undo deployment/first-app


# Check the deployment history
kubectl rollout history deployment/first-app


# Check the deployment history with a specific revision
kubectl rollout history deployment/first-app --revision=3


# Undo the deployment to a specific revision
kubectl rollout undo deployment/first-app --to-revision=1


# Delete the Kubernetes service and deployment
kubectl delete service first-app
kubectl delete deployment first-app

# Apply the Kubernetes deployment configuration
kubectl apply -f deployment.yaml