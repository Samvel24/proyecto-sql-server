-- Primer forma de configurar un campo con restricción check en una tabla
create table Personas(
idPersona int not null,
nombre varchar(10) not null,
edad int not null,
check(edad >= 18) -- El campo edad solo tiene la posibilidad de admitir datos mayores o iguales a 18
);

-- Segunda forma de configurar un campo con restricción check en una tabla
create table Personas(
idPersona int not null,
nombre varchar(10) not null,
edad int not null check(edad >= 18) -- La restricción se coloca después de la definición del campo
);

-- Tercer forma de configurar un campo con restricción check en una tabla
create table Personas(
idPersona int not null,
nombre varchar(10) not null,
edad int,
constraint CK_edad check(edad >= 18) -- La restricción se coloca dándole un nombre a la misma y usando la palabra clave constraint
);

-- Cuarta forma de configurar un campo con restricción check en una tabla
create table Personas( -- Primero se crea la tabla con sus columnas respectivas
idPersona int not null,
nombre varchar(10) not null,
edad int
);
alter table Personas -- Después modificamos la tabla definiendo el campo edad con restricción check
add constraint CK_edad check (edad >= 18);

alter table Personas drop constraint CK_edad; -- Instrucción para eliminar la restricción check a partir del nombre proporcionado