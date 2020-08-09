#!/bin/bash

# Update repository
sudo apt-get update

# Install necessary things. Like SSL support and JDK
sudo apt-get install apt-transport-https openjdk-8-jdk -y

# Download and install the GPG KEY. Add the repository for elasticsearch version 7. Update and install logstash
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install logstash -y

# Configure ES daemon
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable logstash.service
sudo systemctl start logstash.service

# Permissions
sudo chown -R logstash.logstash /usr/share/logstash
sudo chmod 777 /usr/share/logstash/data

# Run this to confirm it's working. It may take a minute or more to start: 
# /usr/share/logstash/bin/logstash -e "input { stdin { } } output { stdout {} }"