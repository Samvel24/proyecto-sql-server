-- Primer forma de configurar un campo con propiedad identity en una tabla
create table Libros(
codigo int identity,
titulo varchar(60) not null,
autor varchar(60) not null
);

-- Segunda forma de configurar un campo con propiedad identity en una tabla
create table Libros(
codigo int identity(10, 5), -- Se establece un valor de 10 (seed) para comenzar en ese número la secuencia de registros y un valor de 5 (incremento) para incrementar en ese valor los siguientes registros
titulo varchar(60) not null,
autor varchar(60) not null
);

/*
Cuando se utiliza identity en una tabla los valores del campo se van incrementando de manera
automática, no es necesario que el usuario hago esto por su cuenta, en caso de que se borre
un registro de la secuencia y despúes se inserte un nuevo registro, este tomará el lugar del
registro previo que se borro pero con el siguiente id o código que siga en la secuencia que
se ha estado siguiendo en las inserciones.
*/
insert into Libros values('1984', 'George Orwell');
insert into Libros values('Harry Potter', 'J Rowling');
insert into Libros values('100 anios de soledad', 'Gabriel Garcia Marquez');
insert into Libros values('Titulo libro', 'Nombre autor');

select ident_seed('Libros'); -- Muestra el valor con el que se va iniciar la secuencia de registros

select ident_incr('Libros'); -- Muestra el valor con el que se aumentan los diferentes registros

set identity_insert Libros on; -- Desactiva la propiedad identity que se configuró en la tabla Libros

set identity_insert Libros off; -- Activa la propiedad identity que se configuró en la tabla Libros

/*
Al desactivar la propiedad identity de una tabla entonces se puede insertar cualquier campo 
código que no esté en la secuencia configurada para esta propiedad de manera inicial pero 
para tal inserción es necesario modificar el código de la instrucción insert, es decir, se 
tiene que hacer uso del nombre de los campos de la tabla antes de los valores que se van a 
insertar
*/
insert into Libros (codigo, titulo, autor) values(38, 'Orgullo y prejucio', 'Jane Austen');