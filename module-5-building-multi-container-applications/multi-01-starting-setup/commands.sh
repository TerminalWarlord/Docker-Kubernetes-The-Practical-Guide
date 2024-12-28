# Create a new network
docker network create goals-net


# Run mongodb container pass credentials as environment variables, assign the network
docker run -v data:/data/db -d --name mongodb --network goals-net -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=joy -e MONGO_INITDB_ROOT_PASSWORD=secret --rm mongo

# Build the image for backend
docker build -t backend .


# Add bind mounts, anonymous volume, environment variables
docker run --name backend-app -v "C:\Udemy\Docker\module-5-building-multi-container-applications\multi-01-starting-setup\backend:/app" -v logs:/app/logs -v /app/node_modules -e MONGODB_USERNAME=joy -e MONGODB_PASSWORD=secret --network goals-net -p 80:80 --rm -d backend

# Build the image for frontend
docker build -t frontend .

# Must create with -it flag since it is a development server
docker run --name frontend-app -it -v "C:\Udemy\Docker\module-5-building-multi-container-applications\multi-01-starting-setup\frontend\src:/app/src" --rm -p 3000:3000 frontend