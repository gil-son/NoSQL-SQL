# SQL - MySQL - Function


`CREATE PROCEDURE sp_name ([parameter[,...]])
[characteristic ...] routine_body

CREATE FUNCTION sp_name ([parameter[,...]])
[RETURNS type]
[characteristic ...] routine_body

parameter:
 [ IN | OUT | INOUT ] param_name type

type:
 Any valid MySQL data type

characteristic:
 LANGUAGE SQL
 | [NOT] DETERMINISTIC
 | SQL SECURITY {DEFINER | INVOKER}
 | COMMENT string
`

routine_body:
 Valid SQL procedure statement(s)


The RETURNS clause can only be for a FUNCTION only. It is used to indicate the return type of the function, 
and the function body must contain a RETURN statement.


The list of parameters in parentheses must always be present. If there are no parameters, 
an empty parameter list of () should be used. Each parameter is an IN parameter by default. 
To specify another type of parameter, use the keyword OUT or INOUT before the parameter name. 
Specifying IN, OUT or INOUT is only valid for a PROCEDURE.


The CREATE FUNCTION statement is used in new versions of MySQL to support UDFs (User Defined Functions).
UDFs continue to be supported, even with the existence of stored functions. A UDF can be considered as an external stored function. 
However, note that stored functions share their namespace with UDFs.


## DETERMINISTIC

A routine is considered “deterministic” if it always produces the same result for the same input parameters and NOT DETERMINISTIC otherwise.
This is mostly used with string or math processing, but not limited to that.


## NOT DETERMINISTIC

Opposite of "DETERMINISTIC". "If neither DETERMINISTIC nor NOT DETERMINISTIC is given in the routine definition, the default is NOT DETERMINISTIC.
To declare that a function is deterministic, you must specify DETERMINISTIC explicitly.". So it seems that if no statement is made, 
MySQl will treat the function as "NOT DETERMINISTIC". This statement from manual is in contradiction with other statement from another area of manual
which tells that: " When you create a stored function, you must declare either that it is deterministic or that it does not modify data. 
Otherwise, it may be unsafe for data recovery or replication. By default, for a CREATE FUNCTION statement to be accepted, at least one of DETERMINISTIC,
NO SQL, or READS SQL DATA must be specified explicitly. Otherwise an error occurs"


### ATTETION
The SQL SECURITY feature can be used to specify whether the routine should be run using the permissions of the user who created the routine, 
or the user who called it.The default value is DEFINER. This feature is new in SQL: 2003.

TO ABILITY PERMISSIONS
SET GLOBAL log_bin_trust_function_creators = 1;


#### SOURCES:

	https://www.devmedia.com.br/procedures-e-funcoes-no-mysql/2550
	https://stackoverflow.com/questions/26015160/deterministic-no-sql-or-reads-sql-data-in-its-declaration-and-binary-logging-i

	



