#!/bin/bash

# Update system
apt-get update
apt-get upgrade -y

# Install common packages
apt-get install -y \
    curl \
    wget \
    git \
    vim \
    net-tools \
    openssh-server \
    python3 \
    python3-pip \
    apt-transport-https \
    ca-certificates \
    software-properties-common
