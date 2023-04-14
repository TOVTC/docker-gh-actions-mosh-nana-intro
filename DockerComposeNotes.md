# Docker Compose
## Workspace
*	Docker Compose already comes installed with Docker for Windows
    *   docker-compose –version
*	docker images – lists images on device
*	docker ps – displays running containers
*	docker image rm 123 456 – removes the images with the specified id’s
    *   docker image ls -q – returns the ids of all the images on the device and can be passed as a parameter
    *   docker image rm $(docker image ls -q) – this might generate an error because some images might be in running containers, so remove containers first
*	docker container rm -f $(docker container ls -a -q)
    *   -a brings stopped containers also
    *   -f will remove running containers too
*	You can clear containers and images from the Docker desktop application also
    *   Go to preferences and then click the debug icon (the literal bug icon)
    *   Clean/purge data will remove everything in docker including images, containers, volumes, etc.
    *   But this will restart Docker, so you won’t be able to immediately execute commands
## Sample Web Application (Vidly)
*	The provided application is a Node and React application that can be run using Docker
    *   So the same procedure to run this app apply: have mongo installed, have that running in the background, have your client-side served from one port, have your data served from another, make sure all your dependences are installed, etc.
*	With docker, just run the following command at the root-level to download everything the app needs using the yml file
    *   docker-compose up
## Building Images
*	Docker compose is built on top of the docker engine, so everything done with the docker engine is available on docker compose
    *   The only difference is the commands being run will apply to our application as a whole, so most of these commands will impact multiple services or multiple containers in our application
*	Helpful docker-compose build flags:
    *   --no-cache – prevent caching when building the image to avoid issues
    *   --pull – always pull a newer version fo the image
*	docker-compose build – builds our web and api services
    *   images that are built will be prefixed with the name of the application (comes from the name of the directory the docker-compose file is in)
    *   --no-cache – will force docker to fully rebuild an application
## Starting and Stopping the Application
*	docker-compose up – will start the application
    *   If the images are ready, docker-compose will just run them inside containers, otherwise it will build the images automatically
*	Helpful flags:
    *   --build – forces a rebuild every time you want to start the app
    *   -d – detached mode, which starts the container in the background
*	docker ps vs docker-compose ps
    *   docker ps – shows the running containers across all applications
    *   docker-compose ps – all the containers relevant to this application
*	You can start multiple containers from the same image
    *   Used for availability and scalability
    *   Can see what commands tarted each container
    *   See port and state
*	docker-compose down – stops and removes containers, but the images are still there, so the next start up will be quick
## Docker Networking
*	When we run our application with docker-compose, docker-compose will automatically create a network and add our containers to that network so that these containers can talk to each other
*	docker-compose up -d – to start the app in the background
*	docker network ls – shows all of the networks on the current machine
    *   Every docker installation has three networks: bridge, host, none
*	The network for your application will also show up with “default” in the name – the default driver will be bridge on Linux
    *   For vidly, there are three hosts/containers on this network (web, api, db, as we specified in our YAML file)
    *   These three containers can talk to each other using their name
*	Start a shell session in the web container and ping the api container
    *   docker exec -it 123 sh – with 123 being the first three digits of the container id, to execute the session in interactive mode
    *   ping api – to ping the api from the web shell
    *   The app user might not have ping permission, so use the -u root flag to change login (docker exec -it -u root 123 sh)
*	Docker comes with an embedded DNS server that contains the name and IP address of the containers
    *   Within each container is a component called a DNS resolver
    *   The DNS resolver talks to the DNS server to find the IP address of the target container
    *   So, when the web container pings the API container, the DNS resolver asks the DNS server what the IP address of the API container is
    *   The DNS server returns the IP address of the API container and the web container is then able to directly talk to the API container 	using its ip address
*	Each container has an IP address and is part of a network
*	Ifconfig – to see the address of the current container
    *   The network can have multiple adaptors (e.g. eth0 or “ethernet zero” and the IP is the inet addr value)
*	If you want to directly access the db container, you need port mappings (this can be connected to through mongodb compass, not localhost, because these containers exist solely within a docker network)
