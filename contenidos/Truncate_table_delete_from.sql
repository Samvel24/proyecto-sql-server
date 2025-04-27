/*
Truncate elimina todas las filas de una tabla o de particiones específicas de una tabla, sin 
registrar las eliminaciones de filas individuales. TRUNCATE TABLE es similar a la instrucción 
DELETE sin cláusula WHERE; sin embargo, TRUNCATE TABLE es más rápida y utiliza menos 
recursos del sistema y del registro de transacciones.

Fuente: https://learn.microsoft.com/en-us/sql/t-sql/statements/truncate-table-transact-sql?view=sql-server-ver16
*/
truncate table NombreTabla; -- Borra todos los registros de la tabla con el nombre proporcionado

/* 
La siguiente instrucción borra el empleado cuyo id es 7, se recomienda usar el id en la 
clausula where para evitar borrar registros que cumplan con un criterio que pueda aplicar 
a varios empleados.
*/
delete from Empleados where idEmpleado = 7;

delete from NombreTabla; -- Esta instrucción borra todos los registros de la tabla con el nombre proporcionado

