exec sp_help Empleados;
/*
exec ejecuta una cadena de comandos o una cadena de caracteres dentro de un lote Transact-SQL,
sp_help informa sobre un objeto de base de datos, un tipo de datos definido por el usuario 
o un tipo de datos.
Por tanto, esta instrucción ejecuta el comando sp_help que nos informa sobre un objeto de 
base de datos llamado Empleados, en este caso la tabla Empleados.
*/
insert into Empleados values( -- Insertar datos en una fila de la tabla Empleados, para el idEmpleado=1
1, 'Mario', 'Ramírez', 27, 1234567890, 'Calle 23, No. 9', 
'1980-05-25', 8500, 'SI');

insert into Empleados values( -- Insertar datos en una fila de la tabla Empleados, para el idEmpleado=2
2, 'Rodrigo', 'Morales', 35, 1234337890, 'Calle 30, No. 1', 
'1990-05-31', 9500, 'NO');

select * from Empleados; -- Mostrar todos los registros de la tabla Empleados