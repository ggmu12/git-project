# git-project

This is an exercise to Create a docker image of a github build agent


---> On DockerFile below LABELS need to be changed according to your organization.

LABEL Author=""
LABEL Email=""
LABEL GitHub=""
LABEL BaseImage=""

---> On start up script below values need to be changed according to your Git Hub organization.

GH_OWNER=
GH_REPOSITORY=
GH_TOKEN=

----> I'm also in process of creating a curl command or any similar command to retrieve the Token ID of runners from our Git hub account to mask it's value in the script for security purpose.

****Below Steps can be used to  Create a docker image of a github build agent.****

1. Login to the ubuntu.
2. Got to your preferred your location where you want to clone the github repo and run below command.

 git clone https://github.com/ggmu12/git-project.git --branch master --single-branch
 
3. Then build docker image using below command from the path where Dockerfile is located.
 
 docker build . -f Dockerfile -t gitrunner:1.0

 4. Then run below comamnd to spin up the container.
 
  docker run gitrunner:1.0
  
  
