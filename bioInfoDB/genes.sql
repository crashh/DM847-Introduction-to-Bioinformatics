
-- DDL:
-------
CREATE DATABASE bioInfo; -- create new database
USE bioInfo; -- use that new database
CREATE TABLE GENE_NAME (id INT PRIMARY KEY, name CHAR(32) NOT NULL); -- gene name tables
CREATE TABLE GENE (sequence CHAR(32) NOT NULL, id INT PRIMARY KEY);
CREATE TABLE TRANSSCRIPTION_FACTOR (name CHAR(32) NOT NULL, id INT PRIMARY KEY);
CREATE TABLE BINDING_SITE (id INT PRIMARY KEY, bstart CHAR(32) NOT NULL, blength CHAR(32) NOT NULL); 


-- ALTERNATIVE SOLUTION:
------------------------

-- Create and set database:
CREATE DATABASE dm847_ex1_gene;
USE dm847_ex1_gene;

-- Create tables:
CREATE TABLE gene_name (
id INT PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(20) NOT NULL
);

CREATE TABLE gene (
id INT PRIMARY KEY AUTO_INCREMENT, 
sequence VARCHAR(50) NOT NULL
);

CREATE TABLE transcription_factor (
id INT PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(50) NOT NULL
);

CREATE TABLE binding_site (
id INT PRIMARY KEY AUTO_INCREMENT, 
start VARCHAR(50) NOT NULL,
length INT NOT NULL
);

SHOW TABLES;
DESCRIBE gene_name;

-- Populate with data:
INSERT INTO `gene_name` (`name`) 
VALUES ("g1");

INSERT INTO `gene` (`sequence`) 
VALUES ("ABCDEFG");

INSERT INTO `transcription_factor` (`name`) 
VALUES ("tf1");

INSERT INTO `binding_site` (`start`, `length`) 
VALUES ("A", 1);

