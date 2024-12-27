# Build the image based on the Dockerfile
docker build -t nodeapp . 

# Run mongodb container
docker run -d --name mongodb mongo 

# Inspect the mongodb container and get the IP address
docker container inspect mongodb


docker run -p 3000:3000 --name film_app -d  --rm nodeapp 

# Create a network
docker network create first-net 

# Update the mongodb connection string and rebuild the image
docker build -t nodeapp . 

# Run both the mongodb and film_app container with first-net network
docker run -d --name mongodb --network first-net mongo 
docker run -p 3000:3000 --network first-net --name film_app -d  --rm nodeapp 