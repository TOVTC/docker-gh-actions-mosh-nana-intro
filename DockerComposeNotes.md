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
