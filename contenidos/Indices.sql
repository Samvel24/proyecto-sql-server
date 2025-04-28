create clustered  index I_id_empleado -- Creamos un índice de tipo clustered para el campo id de la tabla Empleados
on Empleados(idEmpleado);

create nonclustered  index I_edad_empleado -- Creamos un índice de tipo nonclustered para el campo edad de la tabla Empleados
on Empleados(edad);

exec sp_rename 'Empleados.I_id_empleado', 'I_id', 'INDEX'; -- Instrucción para renombrar un índice, en este caso para el índice asociado al id de la tabla empleados

drop index I_id on Empleados; -- Instrucción para borrar un índice

create clustered  index I_id_salario -- Se puede crear un índice para dos campos de una tabla,
on Empleados(idEmpleado, salario); -- en este caso se crea uno para los campos id y salario de la tabla

-- Se recomienda no tener demasiados índices en una tabla porque esto de cierto modo puede ralentizar las consultas.