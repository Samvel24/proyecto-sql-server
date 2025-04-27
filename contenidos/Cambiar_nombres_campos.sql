exec sp_rename 'NombreTabla.NombreCampo', 'NuevoNombreCampo'; -- sintáxis general

exec sp_rename 'Empleados.idEmpleado', 'id'; -- Cambia el nombre del campo idEmpleados por id

exec sp_rename 'Empleados.fecha_nacimiento', 'fechaNacimiento'; -- Cambia el nombre del campo fecha_nacimiento por fechaNacimiento