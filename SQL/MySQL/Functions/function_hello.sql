CREATE DATABASE Company;
USE Company;

CREATE TABLE users
(
	id_user INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50)
);

INSERT INTO users(user_name) VALUES ('AAA'), ('BBB'), ('CCC'), ('DDD'), ('EEE');

# https://stackoverflow.com/questions/26015160/deterministic-no-sql-or-reads-sql-data-in-its-declaration-and-binary-logging-i
# SET GLOBAL log_bin_trust_function_creators = 1;

CREATE FUNCTION hello(a VARCHAR(50)) RETURNS VARCHAR(60) RETURN CONCAT('Hello, ', a, '!');

SELECT hello(user_name) as `Welcome` FROM users;







