# Base image
FROM ubuntu:22.04

# Environment variables for non-interactive apt
ENV DEBIAN_FRONTEND=noninteractive

# Install MySQL Server
RUN apt-get update && \
    apt-get install -y mysql-server && \
    apt-get clean

# Copy initialization SQL
COPY init.sql /init.sql

# Allow remote connections
RUN sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf


# Start MySQL and initialize using init.sql
CMD bash -c "service mysql start && \
             sleep 5 && \
             mysql -u root < /init.sql && \
             tail -f /dev/null"
