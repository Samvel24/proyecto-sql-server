insert into salarios(nombre, apellido, salario) -- Inserta en los campos nombre, apellido y salario en la tabla salarios,
select nombre, apellido, salario from Empleados; -- el nombre apellido y salario de todos los registros de la tabla Empleados

insert into salarios(nombre, apellido, salario) -- Inserta en los campos nombre, apellido y salario en la tabla salarios,
select nombre, apellido, salario from Empleados -- el nombre apellido y salario de 
where salario > 2500; -- aquellos registros de la tabla Empleados cuyo salario es mayor a 2500