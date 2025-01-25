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


kubectl apply -f=auth-service.yaml,auth-deployment.yaml  

ubectl apply -f=users-service.yaml,users-deployment.yaml


kubectl exec users-595c9d8db4-nvhmj -- printenv # shows the env variables



kubectl get namespaces

kubectl logs tasks-776cbcdd7-fhlms


docker run -p 80:80 --rm -d terminalwarlord/kub-demo-frontend 