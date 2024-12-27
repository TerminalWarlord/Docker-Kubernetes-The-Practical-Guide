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
docker run -d -p 3000:80 -v feedback:/app/feedback -v "C:\Udemy\Docker\module-3-managing-data-and-working-with-volumes\nodeapp:/app" --rm --name feedback-app nodeapp:volumes #bind mounts

docker run -d -p 3000:80 -v feedback:/app/feedback -v "C:\Udemy\Docker\module-3-managing-data-and-working-with-volumes\nodeapp:/app" -v /app/node_modules --rm --name feedback-app nodeapp:volumes

# Making the bind mount Read-Only, but feedback and temp folders should had read-write access
docker run -d -p 3000:80 -v feedback:/app/feedback -v "C:\Udemy\Docker\module-3-managing-data-and-working-with-volumes\nodeapp:/app:ro" -v /app/temp -v /app/node_modules --rm --name feedback-app nodeapp:volumes


# Check all volumes
docker volume ls

# Create a new volume
docker volume create feedback-files

# Inspect a volume
docker volumes inspect feedback-files

# Remove a volume
docker volume rm feedback-files

docker build -t nodeapp:env . 

# Using env to set PORT
docker run -d -p 3000:8000 --env PORT=8000 --name feedback-app -v feedback:/app/feedback -v "C:\Udemy\Docker\module-3-managing-data-and-working-with-volumes\nodeapp:/app:ro" -v /app/temp -v /app/node_modules --rm nodeapp:env 


# Using .env file to set PORT
docker run -d -p 3000:8000 --env-file .env --name feedback-app -v feedback:/app/feedback -v "C:\Udemy\Docker\module-3-managing-data-and-working-with-volumes\nodeapp:/app:ro" -v /app/temp -v /app/node_modules --rm nodeapp:env

# Using build arguments
docker build -t nodeapp:dev --build-arg DEFAULT_PORT=3000 .