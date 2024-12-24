# Goal make feedback directory percistent

docker build -t nodeapp:latest .
docker run -p 3000:80 -d --name feedback-app --rm nodeapp:latest 
docker ps
docker stop feedback-app
docker build -t nodeapp:volumes .
docker run -d -p 3000:80 --rm --name feedback-app nodeapp:volumes
docker stop feedback-app
docker run -d -p 3000:80 --rm --name feedback-app nodeapp:volumes #still fails
docker volume ls
docker run -d -p 3000:80 -v feedback:/app/feedback --rm --name feedback-app nodeapp:volumes #named volume
docker run -d -p 3000:80 -v feedback:/app/feedback -v "C:\Udemy\Docker\module-3-managing-data-and-working-with-volumes\nodeapp":/app --rm --name feedback-app nodeapp:volumes #bind mounts

docker run -d -p 3000:80 -v feedback:/app/feedback -v "C:\Udemy\Docker\module-3-managing-data-and-working-with-volumes\nodeapp":/app -v /app/node_modules --rm --name feedback-app nodeapp:volumes