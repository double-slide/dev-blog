-- Create role
CREATE ROLE dev_blog WITH CREATEDB LOGIN PASSWORD 'dev_blog';

-- Create database
CREATE DATABASE dev_blog OWNER dev_blog;

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE dev_blog TO dev_blog;

