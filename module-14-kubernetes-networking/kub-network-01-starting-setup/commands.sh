minikube status

minikube start # starts the cluster

kubectl get deployments # shows all deployments

kubectl get services  # shows all services

docker build -t terminalwarlord/kub-demo-user ./users-api

docker push terminalwarlord/kub-demo-user

kubectl apply -f kubernetes/user-deployment.yaml

kubectl get pods

kubectl apply -f kubernetes/user-service.yaml

kubectl get services


docker build -t terminalwarlord/kub-demo-auth .