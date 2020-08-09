#!/bin/bash

# Update repository
sudo apt-get update

# Install necessary 1 thing. SSL support
sudo apt-get install apt-transport-https  -y

# Download and install the GPG KEY. Add the repository for elasticsearch version 7. Update and install kibana
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install kibana -y

# Configure ES daemon
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service
sudo systemctl start kibana.service