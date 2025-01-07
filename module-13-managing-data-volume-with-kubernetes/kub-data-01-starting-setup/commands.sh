docker build -t terminalwarlord/story-app-kube . # Build the image

docker push terminalwarlord/story-app-kube # Push the image to Docker Hub

kubectl apply -f=deployment.yaml,service.yaml # Apply the deployment and service


minikube service story-app-servicev # Open the service in the browser (Run as administator)

kubectl apply -f=host-pv.yaml,host-pvc.yaml


kubectl get pv # Get the persistent volumes


kubectl get pvc # Get the persistent volume claims


kubectl get configmap # Get the configmap

