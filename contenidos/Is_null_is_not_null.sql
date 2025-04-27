select * from Clientes where nombre is null; -- Devuelve todos los campos de la tabla clientes cuyo nombre es null

select * from Clientes where direccion is not null; -- Devuelve todos los campos de la tabla clientes cuya direccion no es null

select * from NombreTabla where NombreCampo is null; -- Devuelve todos los campos de la tabla con el nombre proporcionado cuyo nombre de campo dado es null

select * from NombreTabla where NombreCampo is not null; -- Devuelve todos los campos de la tabla con el nombre proporcionado cuyo nombre de campo dado no es null

update Clientes set direccion = 'No tiene' -- Actualiza el campo direccion de todos los registros de la tabla Clientes con el valor No tiene
where direccion is null; -- cuando el campo direccion tiene un valor null

delete from Clientes where nombre is null; -- Borra todos los registros de la tabla Clientes cuyo campo nombre es null