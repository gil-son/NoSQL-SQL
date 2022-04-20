CREATE DATABASE subquery;

use subquery;


CREATE TABLE IF NOT EXISTS soldier(
    id_soldier INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    source ENUM('Brazil','EUA') NOT NULL,
    status ENUM('Approve','Disapproved') NOT NULL
);

INSERT INTO soldier(first_name, last_name, source, status) VALUES('Carlos Souza','M', 'Brazil','Approve'); 
INSERT INTO soldier(first_name, last_name, source, status) VALUES('Maria Cristina', 'F', 'Brazil','Approve');
INSERT INTO soldier(first_name, last_name, source, status) VALUES('Cloud Colen','M', 'EUA', 'Approve');


CREATE TABLE IF NOT EXISTS address(
    id_address INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_soldier_f INT NOT NULL,
    country ENUM('Brazil','EUA') NOT NULL,
    FOREIGN KEY(id_soldier_f) REFERENCES soldier(id_soldier)
);

INSERT INTO address(id_soldier_f, country) VALUES(1,'Brazil'); 
INSERT INTO address(id_soldier_f, country) VALUES(2, 'Brazil');
INSERT INTO address(id_soldier_f, country) VALUES(3,'EUA');

SELECT * FROM soldier;
SELECT * FROM address;
SELECT country from address WHERE country = 'EUA';

SELECT first_name FROM soldier WHERE source IN (SELECT country from address WHERE country = 'Brazil');


-- drop database subquery;