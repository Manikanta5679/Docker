CREATE DATABASE IF NOT EXISTS chatapp;
DROP USER IF EXISTS 'chatappadmin'@'%';
CREATE USER 'chatappadmin'@'%' IDENTIFIED BY 'Manikanta@1234';
GRANT ALL PRIVILEGES ON chatapp.* TO 'chatappadmin'@'%';
FLUSH PRIVILEGES;

