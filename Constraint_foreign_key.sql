create table Clientes( -- Creamos una tabla de Clientes, esta será la tabla principal, contiene la llava primaria
id_cliente int,
nombre varchar(20) not null,
apellido varchar(30) not null,
edad int not null,
constraint PK_clientes primary key (id_cliente)
);

create table Ordenes( -- La tabla de ordenes será la tabla secundaria, esta contiene la llave foránea
id_orden int not null,
articulo varchar(50) not null,
id_cliente int
/*
Esta instrucción nos dice que se va crear una restricción llamada FK_ordenes_clientes de tipo 
foreign key que se va enlazar (o hace referencia) al campo id_cliente de la tabla Clientes
Esta restricción obliga a que todo lo que se inserte en el campo id_cliente de la tabla
Clientes sea el mismo tipo que se inserte en el campo id_cliente de la tabla Ordenes
*/
constraint FK_ordenes_clientes foreign key references Clientes(id_cliente), 
);

insert into Clientes values(1, 'Juan', 'Perez', 30); -- Se inserta un ejemplo de Cliente

/*
El id de cliente de la tabla Ordenes tiene que tener un mismo valor de id que esté en la 
tabla Clientes, esto va permitir la coherencia de la relación entre ambas tablas.
*/
insert  into Ordenes values(1, 'Martillo', 1);

/*
Con los dos registros insertados previamente en las tablas, no es posible borrar un registro
en la tabla principal porque ambos registros están enlazados, la única manera de borrar un
registro en la tabla principal seria borrando el(los) registro(s) con el(los) que está(n) 
relacionado en la tabla secundaria y luego borrar el registro en la tabla principal.

Otro aspecto importante en esta situación y que podría no ser tan evidente es que en la tabla
secundaria si se pueden borrar todos los registros que se deseen, en esta tabla no hay ningún
problema para borrar registros que estén relacionados a la tabla principal.
*/
delete from Clientes where id_cliente = 1;

/*
Si se quisiera actualizar el id del cliente en la tabla de Clientes entonces SQL Server nos
mandaría un error porque debido a que el registro ya está enlazado entonces se rompería la
coherencia que hay entre las tablas lo cual no es permitido por el motor de base de datos.
*/
update Clientes set id_cliente = 5
where id_cliente = 1;

/*
Si se quisiera actualizar el id del cliente en la tabla de Ordenes tampoco sería posible por
la misma razón que se acaba de explicar previamente.
*/
update Ordenes set id_cliente = 5
where id_orden = 1;

/*
Otro aspecto en las relaciones de tablas se puede observar en el borrado de la tabla principal,
si intentamos borrarla el motor de base de datos va mandar un error que indica que hay una
relación establecida entre las tablas, por tanto no es posible eliminarla, la tabla que si
puede ser borrada es la tabla secundaria, en ese caso no habrá ningún mensaje de error.
*/
drop table Clientes;

/*
Si borramos la tabla de Ordenes y la volvemos a crear con la configuración denominada 
on delete cascade y después intentamos borrar un registro en la tabla principal, entonces
SQL Server si va permitir el borrado del registro pero tabmiénn va borrar todos los registros
asociados de la tabla secundaria.
*/
create table Ordenes(
id_orden int not null,
articulo varchar(50) not null,
id_cliente int
constraint FK_ordenes_clientes foreign key references Clientes(id_cliente)
/*
ON DELETE CASCADE permite especificar si desea que se eliminen las filas de una tabla secundaria 
cuando se eliminen las filas correspondientes de la tabla principal. Si no especifica 
eliminaciones en cascada, el servidor de bases de datos no podrá eliminar datos de una 
tabla si otras tablas la referencian.
*/
on delete cascade
);
delete from Clientes where id_cliente = 1;

alter table Ordenes -- Modificamos la tabla Ordenes
drop constraint FK_ordenes_clientes; -- y borramos la restricción de llave foránea que se configuró previamente
/* 
Al eliminar la llave foránea ya es posible agregar registros a la tabla de ordenes con 
cualquier tipo de id del cliente, es decir, no tiene que ser un id que ya esté en la tabla 
principal
*/

/*
Fuentes de información para esta clase:
https://support.microsoft.com/es-es/topic/cl%C3%A1usula-constraint-e5241593-139a-4eb7-ad30-61026873191e
*/