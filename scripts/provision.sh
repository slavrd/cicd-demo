#!/usr/bin/env bash

# install nginx
which nginx || {
    sudo apt-get update
    sudo apt-get install -y nginx
}

# deploy website
sudo rm /var/www/html/*
sudo cp index.html /var/www/html/.
