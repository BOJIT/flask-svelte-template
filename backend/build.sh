#!/bin/sh

# Copy over python scripts
cp -a ./src/. ./dist/

# Generate requirements.txt for deployment
pipenv lock -r > ./dist/requirements.txt

# Move deploy files to root directory
mv ./dist/deploy/* ./dist/

# Delete unused files
rm ./dist/build.sh
rm ./dist/Dockerfile
rm ./dist/Pipfile
rmdir ./dist/deploy
