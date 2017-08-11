#!/bin/bash
echo "install java 8 ----------------------------------------"
sudo apt -y install openjdk-8-jre-headless
echo "install docker -------------------------------------"
curl -sSL https://raw.githubusercontent.com/codiechanel/launchpad/master/scripts/installDockerCent.sh | bash -s
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
sudo cat <<EOF >> /etc/mesos-slave/containerizers
docker,mesos
EOF
echo "starting services --------------------------------"
sudo service zookeeper restart
sudo service mesos-master restart
sudo service mesos-slave restart
sudo service marathon restart
