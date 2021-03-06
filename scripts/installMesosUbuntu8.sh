#!/bin/bash

echo "install java 8 ----------------------------------------"
sudo apt -y install openjdk-8-jre-headless
echo "install docker -------------------------------------"
sudo apt -y install docker.io
echo "enable service"
sudo systemctl enable docker
echo "addng key -------------------------------------------------------"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)
echo "add repo ----------------------------------------------"
echo "deb http://repos.mesosphere.com/${DISTRO} ${CODENAME} main" | 
  sudo tee /etc/apt/sources.list.d/mesosphere.list
echo "apt update -------------------------------------------"
sudo apt-get -y update
echo "install packages -----------------------------------------"
sudo apt-get -y install mesos marathon chronos
echo "contanerizers -----------------------------------------"
sudo bash -c "echo docker,mesos >> /etc/mesos-slave/containerizers"
echo "starting services --------------------------------"
sudo service zookeeper restart
sudo service mesos-master restart
sudo service mesos-slave restart
sudo service marathon restart
