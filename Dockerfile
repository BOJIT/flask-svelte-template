FROM node:16-alpine as base

WORKDIR /home/app/

RUN apk update

# Install Git
RUN apk add git

# Setup python env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

# Install Python and relevant packages
RUN apk add --no-cache python3-dev py3-pip build-base

# Install Pip dependencies
COPY ./backend/Pipfile ./backend/
RUN pip3 install pipenv && cd ./backend && pipenv install --deploy --python /usr/bin/python3 && cd ../

# Install NPM dependencies first (cached layer)
COPY package.json ./
RUN npm install

# Copy across all other files
COPY . ./

ENTRYPOINT ["npm", "run", "build"]
