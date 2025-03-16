-- Primer forma de configurar un campo con restricción unique en una tabla
create table Personas(
idPersona int not null unique,
nombre varchar(10) not null,
edad int not null,
);

-- Segunda forma de configurar un campo con restricción unique en una tabla
create table Personas(
idPersona int not null,
nombre varchar(10) not null,
edad int not null,
constraint UQ_idPersona unique (idPersona)
);

-- Ejemplo en el que se agregan 2 restricciones unique a una tabla
create table Personas(
idPersona int not null,
clave varchar(10),
nombre varchar(10) not null,
edad int not null,
constraint UQ_idPersona unique (idPersona),
constraint UQ_clave unique (clave)
);

-- Primer registro a insertar en la tabla
insert into Personas values(1, 'clave1', 'Jose', 50);

/*
La siguiente instrucción no se va a ejecutar porque a pesar de que el primer valor 
unique está bien, el segundo no lo está, por tanto SQL Server va a notificar un error
*/
insert into Personas values(2, 'clave1', 'Mario', 50); 

/*
La siguiente instrucción no se va a ejecutar porque a pesar de que el segundo valor 
unique está bien, el primero no lo está, por tanto SQL Server va a notificar un error
*/
insert into Personas values(1, 'clave2', 'Mario', 50);

/*
La siguiente instrucción si se va a ejecutar correctamente porque ambos valores unique
son correctos respecto al orden de registros que tiene la tabla ya insertados.
*/
insert into Personas values(2, 'clave2', 'Mario', 50);

-- Tercer forma de configurar un campo con restricción unique en una tabla
create table Personas( -- Primero se crea la tabla con sus columnas respectivas
idPersona int,
nombre varchar(10) not null,
edad int not null
);
alter table Personas -- Después modificamos la tabla definiendo el campo idPersona con restricción unique
add constraint UQ_idPersona unique (idPersona);

alter table Personas drop constraint UQ_idPersona; -- Instrucción para eliminar la configuración de una restricción unique a partir del nombre proporcionado