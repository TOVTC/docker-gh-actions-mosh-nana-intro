# here, we add instructions for docker to package our application

# start from a base image, has a bunch of files, which we will add on top of
# you can start with linux and add node on top or start from node which is already built on top of linux
# the list of images are available on dockerhub (a registry for docker images)
# there are multiple node images and are built on different distributions of linux, so specify which dist you want to use with a tag
# here we use :apline which is for very small applications
FROM node:alpine
# now, copy all our program files from the current directory into the app directory in that image
# we will be creating a directory called app in our image
COPY . /app

# we are going to execute a command to run our app.js file, located in the app directory
# CMD node /app/app.js

# alternatively, we can set the work directory so we do not nee dto specify the location of our file in our path
# when we use this instruction, all the following instructions assume that you are inside the specified  directory
WORKDIR /app
CMD node app.js

# now we can tell docker to package our application in the terminal
# -t is a tag to identify our image, so we named it hello-docker
# then we need to specify where docker can find a docker file
# here, our docker file is in the root directory, so we use .
#   docker build -t hello-docker .

# an image is not a single file, and after building, it is not stored in the project file
# to list all the images store on a machine, use the command
#   docker image ls
# each image has a repository name, tag (for versioning), id, date created, and size

# images can be run on any machine running docker, so use the following command to run our hello-docker app
#   docker run hello-docker

# you can publish your image to dockerhub so it can be downloaded to any machine
# you can also use the labs.play-with-docker.com site to generate new instances of virutal machines to test apps (linux and docker)
# use the followign command to download images
#   docker pull dockerhub-username/app-name
#   docker run codewithmosh/hello-docker