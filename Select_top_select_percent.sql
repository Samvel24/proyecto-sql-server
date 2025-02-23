select top 5 * from Empleados; -- Devuvelve todos los campos de los 5 empleados en la parte superior de la tabla

select top 8 * from Empleados; -- Devuvelve todos los campos de los 8 empleados en la parte superior de la tabla

select top 50 percent * from Empleados; -- Devuvelve todos los campos del 50 por ciento de los empleados en la parte superior de la tabla

select top 3 * from Empleados -- Devuvelve todos los campos de los 3 empleados en la parte superior de la tabla
where activo = 'NO'; -- cuyo campo activo tenga un valor de No

/*
TOP limita las filas devueltas en un conjunto de resultados de consulta a una cantidad 
específica de filas o un porcentaje de filas en SQL Server.

PERCENT Indica que la consulta devuelve solo el primer porcentaje de filas de la expresión 
del conjunto de resultados. Si el número calculado de filas es una fracción, se redondea 
al siguiente número entero.

Fuentes: 
* https://learn.microsoft.com/en-us/sql/t-sql/queries/top-transact-sql?view=sql-server-ver16
* https://learn.microsoft.com/en-us/sql/t-sql/queries/top-transact-sql?view=sql-server-ver16#percent
*/