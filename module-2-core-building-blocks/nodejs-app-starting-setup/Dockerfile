
# Setting up the image

#pull an image
FROM node 

# Change the working directory since we are 
# copying the project files to /app
WORKDIR /app

# Optimization
# to avoid re-executing npm install everytime some other file changes
COPY package.json /app


RUN npm install

# which files should go into the image (source and dest)
COPY . /app

# the containers are isolated from the system
# It will not expose port 80 to listen to
# It doesn't do anything, just for documentation
EXPOSE 80


# Do not execute files, We are building an image not running them
# The container runs the files


# This is incorrect, This will create multiple servers
# RUN node server.js 

# Instead do this
# This will be executed when a container is started, 
# not when an image is created
CMD ["node", "server.js"]

