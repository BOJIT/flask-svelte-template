FROM node:14-alpine as base

WORKDIR /home/app/

# Setup env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

# Install Python and relevant packages
RUN apk update
RUN apk add --no-cache python3-dev py3-pip build-base

# Install dependencies
COPY Pipfile ./
RUN pip3 install pipenv && pipenv install --deploy

# Install NPM dependencies first (cached layer)
COPY package.json ./
RUN npm install

# Copy across all other files
COPY . ./

ENTRYPOINT ["npm", "run", "build"]