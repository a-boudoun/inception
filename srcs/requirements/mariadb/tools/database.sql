CREATE DATABASE IF NOT EXISTS wpdb;

--Creates a user named root with the password 123456789 and grants them access from any host
CREATE USER 'root'@'%' IDENTIFIED BY '123456789';

--Creates a user named wpuser with the password 123456789 and grants them access from any host
CREATE USER 'wpuser'@'%' IDENTIFIED BY 'wp123456789';

--Grants all privileges on the wpdb database to the wpuser use
GRANT ALL ON wpdb.* TO 'wpuser'@'%';

--Grants all privileges on all databases to the root user.
GRANT ALL ON *.* TO 'root'@'%';

--reloads the privileges from the grant tables in the MySQL database
FLUSH PRIVILEGES;
