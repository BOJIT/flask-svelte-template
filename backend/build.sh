#!/bin/sh

# Copy over python scripts
cp -a ./src/. ./dist/

# Delete unused files
rm ./dist/build.sh
rm ./dist/Dockerfile

# Create installer file
touch ./dist/install.sh
chmod +x ./dist/install.sh
