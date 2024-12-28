docker build -t node-util .

# create package.json without installing node on the host machine
docker run -it -v C:\Udemy\Docker\module-7-utility-container:/app node-util init

# ENTRYPOINT works similar to CMD, but as a prefix
# the command after the image name are appended to the ENTRYPOINT
docker run -it -v C:\Udemy\Docker\module-7-utility-container:/app node-util install express


# Create a docker-compose.yml and run
docker compose run node-util init

# Remove the container after the execution finishes
docker compose run --rm node-util init