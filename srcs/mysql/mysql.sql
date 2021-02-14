CREATE DATABASE wordpress;
CREATE USER 'aheister'@'localhost';
SET PASSWORD FOR 'aheister'@'localhost' = PASSWORD('test1234');
GRANT ALL PRIVILEGES ON *.* TO 'aheister'@'localhost' IDENTIFIED BY 'test1234';
FLUSH PRIVILEGES;