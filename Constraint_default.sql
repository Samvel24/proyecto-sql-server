-- Primer forma de configurar un campo con restricción default en una tabla
create table Personas(
idPersona int not null,
nombre varchar(10) not null,
edad int not null,
ciudad varchar(50) default 'No especificada'
);

-- Segunda forma de configurar un campo con restricción default en una tabla
create table Personas( -- Primero se crea la tabla con sus columnas respectivas
idPersona int not null,
nombre varchar(10) not null,
edad int not null,
ciudad varchar(50)
);
alter table Personas -- Después modificamos la tabla definiendo el campo ciudad con restricción default y se coloca el valor por defecto
add constraint DFLT_ciudad default 'No especificada' for ciudad;

alter table Personas drop constraint DFLT_ciudad; -- Instrucción para eliminar la restricción default a partir del nombre proporcionado

/*
-- Ejemplo de inserción de una registro usando la palabra clave default, si ya se definió un 
valor por defecto, se inserta ese valor, si no se ha definido entonces se va insertar un null
*/
insert into Personas values(1, 'Pedro', 30, default)