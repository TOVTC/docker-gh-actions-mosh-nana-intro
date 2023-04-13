# Docker
## What is Docker?
*	Docker is a platform for nuilding, running, and shipping applications in a consistent manner across machines
    *	Inconsistencies can happen because of missing files, software version mismatches, different config settings
*	Docker allows you to package up your application and run it on any machine
*	Doesn’t require setting up machines to accommodate application builds
    *	Automatically downloads and installs dependencies in an isolated environment called a container
*	Containers allow different applications to use different versions of software side by side
*	Applications and dependencies can be removed all at once easily (because isolated)
## Virtual Machines vs Containers
*	Container: an isolated environment for running an application
*	Virtual machine: an abstraction of a machine (physical hardware)
*	Hypervisor: software used to create and manage virtual machines
    *	VirtualBox
    *	VMware
    *	Hyper-V (Windows only)
*	Virtual machines allow us to run applications in isolation
    *	On the same physical machine, we can have two virtual machines running two different applications, with the same dependencies, at different versions
    *	Some problems with this set up: each VM needs a full-blown OS, slow to start, resource intensive
*	Containers give us the same kind of isolation
    *	Allows us to run multiple applications, are lightweight, use the OS of the host, start quickly, and requires less hardware resources
## Docker Architecture
*	Docker uses a client-server architecture
    *	Uses a RESful API to allow the client component to communicate with the server component
    *	The server-side is called the docker engine, sits in the background and takes care of building and running Docker containers
*	Containers are technically just processes
*	All containers share the kernel of the host OS
    *	A kernel is the core of an operating system and manages applications and hardware resources like memory and CPU
    *	Each OS has its own kernel or engine, which have their own API’s (which is why not all applications run on all operating systems)
    *	You can only run Linux containers on Linux OS, Linux and Windows on Windows OS (because Windows 10 now ships with a custom Linux kernel), Mac OS does not  have native support for Docker containers so Docker on Mac uses a Linux VM to run Linux containers
## Development Workflow
*	Take an application and “docker-ize” it by adding a dockerfile
    *	A dockerfile is a plaintext file that contains instructions that docker uses to package up an application in an image
    *	An image contains everything our application needs to run: a cut-down OS, a runtime environment (e.g. Node), application files, third-party libraries, environment variables
*	Once we have an image, we tell Docker to start a container using the image
    *	A container is a special process because it has its own file system provided by the image
    *	Our application gets loaded inside a container
    *	We don’t directly launch and run, we tell docker to run it inside a container
*	Once we have the image, we can push it to a docker registry like dockerhub
    *	Once our app image is on docker hub, we can put it on any machine running docker
    *	We no longer need long release documents that have to be precisely followed
