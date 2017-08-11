https://raw.githubusercontent.com/kubernetes/examples/master/mysql-wordpress-pd/mysql-deployment.yaml

scripts/mysql.sql

login to mysql cntainer
execute this
CREATE DATABASE IF NOT EXISTS gogs CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

# there is no need to use ssh...http password prompt is only once

10.32.0.14:3306
wordpress-mysql:3306

the user accounts and repo names are stored mysql..
but the git files itself is stored in /data 