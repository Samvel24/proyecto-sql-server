select * from sys.tables; -- Con esta instrucción vamos a poder  obtener la descripción de las tablas que tenemos en las bases de datos, sys es un administrador de las bases de datos

select nombre, apellido from empleados; -- Se muestran las columnas con nombre y apellido de la tabla Empleados. Se separan por comas los nombres o campos de las columnas que queremos obtener

select nombre, apellido, salario from empleados; -- Se muestran las columnas con nombre, apellido y salario de la tabla Empleados

exec sp_rename 'NombreBaseDeDatos', 'NuevoNombreBaseDeDatos'; -- Instrucción para cambiarle el nombre a una base de datos
/*
sp_rename:
Cambia el nombre de un objeto creado por el usuario en la base de datos actual. Este objeto 
puede ser una tabla, un índice, una columna, un tipo de datos de alias o un objeto de 
Microsoft.
Fuente: https://learn.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-rename-transact-sql?view=sql-server-ver16

Cuando se cambie el nombre de una tabla, SQL Server nos va a dar una advertencia y nos va a 
describir que hacer un cambio podría ocasionar problemas con los objetos o scripts de la 
base de datos que usen el nombre antiguo de la tabla. Este es un punto a tomar en cuenta.
*/

drop table nombreTabla; -- Comando para borrar una tabla de la base de datos

use nombreTabla; -- Con use, se cambia el contexto de la base de datos a la base de datos especificada por el nombre dado