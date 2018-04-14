#!/bin/bash

# set -x
# set -e
# 
# # THIS FILE IS INTENDED TO BE USED ON UBUNTU 16.04
# 
# # when updating service, stop before updating
# # when first run - there is no service => fail
# systemctl stop test_app || true
# 
# SRC_DIR=$(dirname $(realpath $0))
# 
# 
# test -d /var/www || mkdir /var/www
# 
# for i in src mvnw .mvn pom.xml _config.yml; do
#     rm -rf "/var/www/${i}"
#     cp -r "${SRC_DIR}/${i}" /var/www
# done
# 
# chown -R www-data:www-data /var/www
# 
# # Get AZ name from special URL in AWS
# AZ=$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone)
# 
# sed "s/suchname=.*/suchname=${AZ}/" "${SRC_DIR}/src/main/resources/application.properties" > /tmp/application.properties
# 
# cp "${SRC_DIR}/test_app.service" /etc/systemd/system/test_app.service
# systemctl daemon-reload
# systemctl enable test_app
# systemctl start test_app
