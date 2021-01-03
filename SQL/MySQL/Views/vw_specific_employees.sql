CREATE DATABASE Company;
USE Company;

CREATE TABLE employee
(
    id_employee INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(50)
);

INSERT INTO employee(employee_name) VALUES ('AAA'), ('BBB'), ('CCC'), ('DDD'), ('EEE');

CREATE VIEW vw_specific_employees AS 
SELECT count(id_employee) AS `Total A + B` FROM employee WHERE employee_name LIKE '%A%' OR employee_name LIKE '%B%'; 
			  
SELECT * FROM vw_specific_employees;

