create table Empleados( -- Instrucción para crear una tabla para empleados
idEmpleado int, -- Identificador para cada empleado
nombre varchar(20), -- Campo nombre de tipo varchar, este tipo es para valores alfanuméricos, este campo solo acepta 20 caracteres
apellido varchar(30), -- Campo apellido que acepta 30 caracteres
edad numeric(2), -- Campo edad de tipo numérico que acepta 2 dígitos solamente
telefono numeric(10), -- Campo telefono que no va permitir que se ingresen más de 10 números
direccion varchar(100), -- Las direcciones tienen textos más largos, por eso establecen 100 caracteres para el campo
fecha_nacimiento date, -- Campo fecha_nacimiento que acepta datos de tipo date(fecha)
salario decimal(18, 2), -- Campo salario de tipo decimal que va almacenar 18 dígitos enteros y 2 decimales
activo char(2) -- Campo activo de tipo char que acepta 2 caracteres (si/no)
);