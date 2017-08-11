#!/bin/bash
echo "Installing docker for Cent os"
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
echo "Adding repo..."
sudo yum-config-manager --add-repo \
https://download.docker.com/linux/centos/docker-ce.repo
echo "Make fast...."
sudo yum makecache fast
echo "Staring actual docker install"
sudo yum -y install docker-ce
echo "Enable docker on reboot"
sudo systemctl start docker
echo "Running sample hello world..."
sudo docker run hello-world