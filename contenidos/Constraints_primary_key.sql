-- Primer forma de configurar una clave primaria en una tabla
create table Personas(
idPersona int primary key,
nombre varchar(10) not null,
edad int not null,
);

-- Segunda forma de configurar una clave primaria en una tabla
create table Personas(
idPersona int,
nombre varchar(10) not null,
edad int not null,
primary key (idPersona)
);

-- Tercer forma de configurar una clave primaria en una tabla
create table Personas(
idPersona int,
nombre varchar(10) not null,
edad int not null,
constraint PK_enlace_persona primary key (idPersona)
);

-- Cuarta forma de configurar una clave primaria en una tabla
create table Personas( -- Primero se crea la tabla con sus columnas respectivas
idPersona int not null,
nombre varchar(10) not null,
edad int not null,
);
alter table Personas -- Después modificamos la tabla definiendo el campo idPersona como clave primaria
add constraint PK_enlace primary key (idPersona);
/*
Es importante mencionar que en esta última forma de configurar una clave primaria es necesario
definir como not null el campo que vamos a establecer como clave primaria porque de otra manera
SQL Server no va a permitir realizar la configuración de tal clave
*/

/*La cuarta forma de configurar una clave primaria es útil cuando deseamos eliminar la configuración
de la misma porque solo tenemos que usar el nombre que hemos asignado a la llave para poder
eliminar la configuración propiamente dicha
*/
alter table Personas drop constraint PK_enlace; -- Instrucción para eliminar la configuración de llave primaria a partir del nombre proporcionado

insert into Personas values(1, 'Jose', 50);

insert into Personas values(1, 'Jose', 50); -- Una tabla con clave primaria no permite que se repitan los valores de la columna configurada como clave primaria

insert into Personas values(null, 'Jose', 50); -- Una tabla con clave primaria no permite que se coloquen valores nulos en la columna configurada como clave primaria