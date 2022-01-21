FROM python:alpine3.8

WORKDIR /home/app/

RUN apk update

# Install Git
RUN apk add git

# Setup python env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

# Install Pip dependencies
COPY Pipfile ./
RUN pip3 install pipenv && pipenv install --deploy

# Copy across all other files
COPY ./ ./

ENV FLASK_APP=server.py
ENV FLASK_ENV=development
ENV FLASK_HOST='0.0.0.0'
ENV FLASK_PORT=8080

ENTRYPOINT [ "pipenv", "run", "python", "-m", "flask", "run" ]
