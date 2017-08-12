https://raw.githubusercontent.com/kubernetes/examples/master/mysql-wordpress-pd/mysql-deployment.yaml

scripts/mysql.sql

login to mysql cntainer
mysql -u root -p
execute this
CREATE DATABASE IF NOT EXISTS gogs CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

# there is no need to use ssh...http password prompt is only once

10.32.0.14:3306
wordpress-mysql:3306

the user accounts and repo names are stored mysql..
but the git files itself is stored in /data 

# something to do with selinux

On systems supporting selinux it is preferred to leave it enabled/enforcing. However, docker containers mount the host path with the “svirt_sandbox_file_t” label type, which is incompatible with the default label type for /tmp (“tmp_t”), resulting in a permissions error when the mysql container attempts to chown /var/lib/mysql.

## on every node:
mkdir -p /tmp/data
chmod a+rwt /tmp/data  # match /tmp permissions
chcon -Rt svirt_sandbox_file_t /tmp/data

# cleanup
kubectl delete deployment,service -l app=wordpress
kubectl delete secret mysql-pass

# check selinux sttus
getenforce
sestatus
selinuxenabled && echo enabled || echo disabled

$# turn off
echo 0 > /selinux/enforce
it reverts on  reboot
echo 1 > /selinux/enforce

3 UBUNTU USES APPARMOR
 sudo service apparmor statusL

 kubectl create -f