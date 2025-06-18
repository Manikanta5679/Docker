# Base image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update && apt-get install -y \
    tzdata \
    python3 \
    python3-distutils \
    python3-dev \
    python3-pip \
    libmysqlclient-dev \
    default-libmysqlclient-dev \
    build-essential \
    git \
    pkg-config \
    libssl-dev \
    libffi-dev \
    && ln -fs /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 2

WORKDIR /chatapp

RUN git clone https://github.com/Manikanta5679/chatapp_deploy.git

WORKDIR /chatapp/chatapp_deploy

COPY .env /.env

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r requirements.txt
RUN python3 -m pip install mysqlclient python-dotenv

CMD bash -c "cd fundoo && python3 manage.py migrate && gunicorn --workers 3 --bind 0.0.0.0:8000 fundoo.wsgi:application"
