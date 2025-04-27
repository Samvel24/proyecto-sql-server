update Empleados set activo = 'No' where id  < 3; -- Actualiza la tabLa Empleados y establece el campo activo con el valor de 'No' para aquellos registros cuyo id es menor a 3

update Empleados set activo = 'Si'; -- Actualiza todos los registros de la tabla Empleados con el campo activo con un valor de 'Si'

update Empleados set activo = 'No' where id in(1, 3, 5, 7, 9); -- Actualiza la tabla Empleados y establece el campo activo con el valor de 'No' para aquellos registros cuyo id es 1, 3, 5, 7 y 9

select * from Empleados where edad in(25, 31, 34); -- Devuelve todos los campos de la tabla Empleados cuya edad es 25, 31 y 34

delete from Empleados where id in(3, 8, 15); -- Borra todos los registros de la tabla Empleados cuya id es 3, 8 y 15

/*
Fuentes de información para esta clase:
https://learn.microsoft.com/en-us/sql/t-sql/language-elements/in-transact-sql?view=sql-server-ver16
https://learn.microsoft.com/en-us/sql/t-sql/queries/update-transact-sql?view=sql-server-ver16
*/