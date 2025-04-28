create view mayores_30 -- Puede ser de utilidad crear una vista para instrucciones que se ejecutan con frecuencia
as
select nombre, apellido, telefono, edad -- Por ejemplo si deseamos consultar algunos campos de los clientes con más de 30 años los podemos definir en una vista
from clientes where edad > 30;

alter view mayores_30 -- Para modificar una vista se usa la palabra clave alter  y se modifica lo que deseemos
as
select nombre, apellido, telefono, edad, fecha_nacimiento -- En este caso la mdoficación es agregar la fecha de nacimiento a la consulta de la vista
from clientes where edad > 30;

-- Nota: Cada vista se corre con el botón Ejecutar de SQL Server, esto ve permitir que después pueda ser usada por una consulta

select * from mayores_30; -- Ejecución de la consulta llamada mayores_30

select apellido from mayores_30; -- Solo muestra el campo apellido de la vista mayores_30

drop view mayores_30; -- Instrucción para borrar la vista creada previamente.