#!/bin/sh

# Clean out build directory
find ./dist/ -type f -not -name 'static' -delete

# Copy over python scripts
cp -a ./src/. ./dist/

# Move deploy files to root directory
mv ./dist/deploy/* ./dist/

# Delete unused files
rm ./dist/build.sh
rm ./dist/Dockerfile
rmdir ./dist/deploy

