create table Clientes(
idCliente int not null, -- No se permiten valores nulos en el campo id
nombre varchar(10) not null, -- No se permiten valores nulos en el campo nombre
direccion varchar(100) null, -- Si se permiten valores nulos en el campo direccion
telefono numeric(10) not null, -- No se permiten valores nulos en el campo telefono
email varchar(50) null -- Si se permiten valores nulos en el campo email
);

-- Ejemplos de inserción de valores nulos en campos que lo permiten
insert into Clientes values(1, 'Juan', null, 1234567890, 'email@email.com');
insert into Clientes values(2, 'Samuel', 'Calle 1', 9873451092, null);