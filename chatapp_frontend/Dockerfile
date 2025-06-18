FROM ubuntu:20.04


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*


COPY frontend /etc/nginx/sites-available/frontend


RUN rm /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/frontend /etc/nginx/sites-enabled/


EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]
