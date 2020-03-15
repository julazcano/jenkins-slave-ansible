# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
FROM evarga/jenkins-slave
MAINTAINER Juan Lazcano <julazcano@dnetlabs.net>

# Set ENV to prevent prompt to restart services
ENV DEBIAN_FRONTEND noninteractive

# Download Python
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

# Download Ansible
RUN pip3 install ansible

# Download Git
RUN apt-get install -y git

# Cleanup
RUN apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin
