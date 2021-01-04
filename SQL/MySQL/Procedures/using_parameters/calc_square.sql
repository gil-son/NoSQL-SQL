CREATE DATABASE IF NOT EXISTS test;
USE test;

DELIMITER $$

# Procedure with the input and output configuration in the same parameter (INOUT). 
CREATE PROCEDURE pro_square (INOUT num INT)
BEGIN
	set num = num * num;
END $$


DELIMITER ; 


SET @val = 5;								
CALL pro_square(@val);
SELECT @val;


DROP DATABASE test;
