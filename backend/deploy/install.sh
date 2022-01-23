#!/bin/sh

apt update -y && apt upgrade -y

# Install nginx if it hasn't already been setup
apt install nginx

# Install pip and pipenv
apt install python3-pip
pip3 install pipenv
pipenv install --deploy

# Link static files to web directory
ln -s /var/www/html /home/pi/app/static

# Install and enable Gunicorn backend service
cp app.service /etc/systemd/system/

# Edit nginx config
pipenv run python nginx_config.py
pipenv run crossplane build nginx_config.json -f

# Restart services
systemctl enable app
systemctl restart app
systemctl restart nginx
