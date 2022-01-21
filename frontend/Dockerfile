FROM node:16-alpine as base

WORKDIR /home/app/

RUN apk update

# Install Git
RUN apk add git

# Install NPM dependencies first (cached layer)
COPY package.json ./
RUN npm install

# Copy across all other files
COPY . ./

ENTRYPOINT ["npm", "run", "build"]
