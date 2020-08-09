#!/bin/bash

# Update repository
sudo apt-get update

# Install necessary things. Like SSL support and JDK
sudo apt-get install apt-transport-https default-jdk -y

# Download and install the GPG KEY. Add the repository for elasticsearch version 7. Update and install elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install elasticsearch -y

# Configure ES daemon
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service

# Wait 15 seconds or so and then run this to confirm it's working: 
# curl -XGET localhost:9200/?pretty