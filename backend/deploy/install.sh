#!/bin/sh

apt update -y && apt upgrade -y

# Install nginx if it hasn't already been setup
apt install nginx -y

# Install pip and pipenv
apt install python3-pip -y
pip3 install pipenv
pipenv install --deploy

echo "Installing App on System: this only needs to be done once!"

# Link static files to web directory
rm -rf /var/www/html
ln -s /home/pi/app/static /var/www/html

# Install and enable Gunicorn backend service
cp app.service /etc/systemd/system/

# Edit nginx config
pipenv run python nginx_config.py
pipenv run crossplane build nginx_config.json -f

# Restart services
systemctl enable app
systemctl restart app
systemctl restart nginx
