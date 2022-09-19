# base image
FROM ubuntu:20.04

# To input GitHub runner version argument
ARG RUNNER_VERSION
ENV DEBIAN_FRONTEND=noninteractive

LABEL Author="Arakala"
LABEL Email="arjunreddii@gmail.com"
LABEL GitHub="https://github.com/ggmu12"
LABEL BaseImage="ubuntu:20.04"


# update the base packages + add a non-sudo user
RUN apt-get update -y && apt-get upgrade -y && useradd -m gitdocker

# install the packages and dependencies
RUN apt-get install -y --no-install-recommends \
    curl nodejs wget unzip vim git azure-cli jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip

# cd into the user directory, download and unzip the github actions runner
RUN cd /home/gitdocker && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v2.296.0/actions-runner-linux-x64-2.296.0.tar.gz \
    && tar xzf ./actions-runner-linux-x64-2.296.0.tar.gz

# install some additional dependencies
RUN chown -R gitdocker ~gitdocker && /home/gitdocker/actions-runner/bin/installdependencies.sh

# add over the start.sh script
ADD start.sh start.sh

# make the script executable
RUN chmod +x start.sh

# set the user to "gitdocker" so all subsequent commands are run as the gitdocker user
USER gitdocker

# set the entrypoint to the start.sh script
ENTRYPOINT ["./start.sh"]
