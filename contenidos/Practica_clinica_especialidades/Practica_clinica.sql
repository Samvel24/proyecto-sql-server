CREATE DATABASE ClinicaDental;

CREATE TABLE Medicos(
idMedico int not null,
nombre varchar(40) not null,
apellidoPaterno varchar(40) not null,
especialidad varchar(40) not null,
constraint PK_enlace_medico primary key (idMedico) -- Se configura la llave primaria
);

USE ClinicaDental -- Mostrar todas las tablas de una base de datos
GO 
SELECT *
FROM sys.Tables
GO

SELECT column_name -- Mostrar todas las columnas de una tabla                  
FROM information_schema.columns     
WHERE table_name = 'Medicos';

CREATE TABLE Pacientes( -- Creamos la tabla de pacientes
idPaciente int,
nombre varchar(40) not null,
apellidoPaterno varchar(40) not null,
apellidoMaterno varchar(40) not null,
sexo varchar(20) not null,
numeroDeExpediente int,
calleYNumero varchar(40) not null,
colonia varchar(40) not null,
codigoPostal varchar(5) not null,
entidadFederativa varchar(40) default 'CDMX' not null,
telefono varchar(20),
correoElectronico varchar(40)
);
ALTER TABLE dbo.Pacientes ALTER COLUMN idPaciente int NOT NULL; -- Establecemos el campo idPaciente para que no acepte valores nulos, esto con el objetivo de que SQL Server nos permita configurar una llave primaria para el id de pacientes
ALTER TABLE Pacientes ADD CONSTRAINT PK_enlace_pacientes primary key (idPaciente); -- Establecemos el campo idPaciente como llave primaria de la tabla Pacientes

CREATE TABLE Citas( -- Creamos la tabla de citas
idCita int not null,
idMedico int not null,
idPaciente int not null,
fechaCita date not null,
horaCita varchar(10) not null,
costoCita decimal(10, 2) not null,
observaciones varchar(80)
);

EXEC sp_help nombreTabla; -- Informa sobre un objeto de base de datos, en este caso informa las características de la tabla que se le indique

ALTER TABLE dbo.Citas ALTER COLUMN observaciones varchar(80) NOT NULL; -- Modificamos el campo de observaciones para que no acepte valores nulos

-- Estableciendo relaciones, configurando las llaves foraneas 
ALTER TABLE Citas ADD CONSTRAINT FK_citas_medicos FOREIGN KEY (idMedico) -- este idMedico es el id de la tabla de citas
REFERENCES Medicos(idMedico) -- este idMedico es el id de la tabla de Medicos
ON DELETE CASCADE -- se eliminan las filas de la tabla secundaria (Citas) cuando se eliminan las filas asociadas de la tabla principal (Medicos)
ON UPDATE CASCADE; -- se actualizan las filas de la tabla secundaria (Citas) cuando se actualizan las filas asociadas de la tabla principal (Medicos)

ALTER TABLE Citas ADD CONSTRAINT FK_citas_pacientes FOREIGN KEY (idPaciente) 
REFERENCES Pacientes(idPaciente)
ON DELETE CASCADE
ON UPDATE CASCADE;

---------------------------------------------------------------------------------------------------------------------
-- Inserción de datos en la tabla de Medicos
INSERT INTO Medicos VALUES(1, 'Julio', 'Rodriguez', 'Cardiología');
INSERT INTO Medicos VALUES(2, 'Pedro', 'Estrada', 'Neurología');
INSERT INTO Medicos VALUES(3, 'Mariana', 'Hurtado', 'Dermatología');
INSERT INTO Medicos VALUES(4, 'Luis', 'Fernández', 'Oncología');
INSERT INTO Medicos VALUES(5, 'Sonia', 'Martínez', 'Radiología');


-- Inserción de datos en la tabla de Pacientes
INSERT INTO Pacientes VALUES(1, 'Alberto', 'Ramírez', 'Camarena', 'Masculino', 10, 'Calle 3, No 9', 'Valle de Bravo', '99502', 'CDMX', '0987640123', 'alberto@micorreo.com');
INSERT INTO Pacientes VALUES(2, 'Maria', 'Juarez', 'López', 'Femenino', 30, 'Calle 9, No 8', 'Valle de Anáhuac', '88412', 'Estado de México', '8904321456', 'maria@micorreo.com');
INSERT INTO Pacientes VALUES(3, 'Adriana', 'Domínguez', 'Antulio', 'Femenino', 36, 'Calle 13, No 90', 'Héreoes', '89022', 'CDMX', '5589098901', 'adriana@micorreo.com');
INSERT INTO Pacientes VALUES(4, 'Fernando', 'Jiménez', 'Fernández', 'Masculino', 45, 'Calle 23, No 4', 'Laureles', '09789', 'CDMX', '550000000021', 'fernando@micorreo.com');
INSERT INTO Pacientes VALUES(5, 'Kevin', 'Perales', 'Ochoa', 'Masculino', 48, 'Calle 33, No 2', 'Cedros', '09034', 'Estado de México', '0923567891', 'kevin@micorreo.com');

SELECT * FROM Medicos;

SELECT * FROM Pacientes;

-- Inserción de datos en la tabla de Citas
INSERT INTO Citas VALUES(1, 1, 1, '2025-05-25', '10:00', 70, 'Ninguna');
INSERT INTO Citas VALUES(2, 2, 1, '2025-06-25', '13:00', 70, 'Ninguna');
INSERT INTO Citas VALUES(3, 1, 2, '2025-01-25', '16:00', 80, 'Ninguna');
INSERT INTO Citas VALUES(4, 2, 2, '2025-02-25', '09:00', 80, 'Ninguna');
INSERT INTO Citas VALUES(5, 1, 3, '2025-03-25', '14:00', 90, 'Ninguna');
INSERT INTO Citas VALUES(6, 2, 3, '2025-04-25', '15:00', 90, 'Ninguna');
INSERT INTO Citas VALUES(7, 1, 4, '2025-11-25', '16:00', 100, 'Ninguna');
INSERT INTO Citas VALUES(8, 2, 4, '2025-12-25', '15:00', 100, 'Ninguna');
INSERT INTO Citas VALUES(9, 1, 5, '2025-10-25', '15:00', 50, 'Ninguna');
INSERT INTO Citas VALUES(10, 2, 5, '2025-11-25', '17:00', 50, 'Ninguna');

SELECT * FROM Citas;

---------------------------------------------------------------------------------------------------------------------
-- Creación de consulta multitabla usando la instrucción JOIN

-- Se hace una consulta para devolver los resultados de 3 tablas diferentes por medio de INNER JOIN
SELECT Citas.fechaCita, Citas.horaCita, Citas.costoCita, Pacientes.nombre, Pacientes.entidadFederativa, Medicos.nombre
FROM Citas -- Citas es una tabla secundaria (tiene las llaves foráneas)
INNER JOIN Pacientes ON Citas.idPaciente = Pacientes.idPaciente -- Pacientes es una tabla principal (tiene una llave primaria)
INNER JOIN Medicos ON Citas.idMedico = Medicos.idMedico; -- Medicos es una tabla principal (tiene una llave primaria)

SELECT Citas.fechaCita, Citas.horaCita, Medicos.nombre, Medicos.idMedico -- Consulta para mostrar la fecha, hora, nombre e id de cita pertencientes a un médico...
FROM Citas
INNER JOIN Medicos ON Citas.idMedico =  Medicos.idMedico
WHERE Medicos.idMedico = 1; --... a partir del id de un médico

-- Comprobando el funcionamiento de ON UPDATE CASCADE, se agrega un nuevo registro a cada tabla
INSERT INTO Medicos VALUES(6, 'Raul', 'Peña', 'Médico general');
INSERT INTO Pacientes VALUES(6, 'Julia', 'Orozco', 'Figueroa', 'Femenino', 51, 'Calle 3, No 21', 'Alta Villa', '33210', 'Estado de México', '5534120943', 'julia@micorreo.com');
INSERT INTO Citas VALUES(11, 6, 6, '2025-09-25', '11:00', 50, 'Ninguna');

UPDATE Medicos SET idMedico = 7 WHERE idMedico = 6; --Se actualiza el id del nuevo registro de médicos
SELECT * FROM Medicos; -- Se verifica que el cambio de id se realizó en la tabla de Médicos
SELECT * FROM Citas; -- Se verifica que el cambio de id se realizó en la tabla de Citas por medio de la activación de la opción ON UPDATE CASCADE

UPDATE Pacientes SET idPaciente = 7 WHERE idPaciente = 6;
SELECT * FROM Pacientes;
SELECT * FROM Citas;

-- Comprobando el funcionamiento de ON DELETE CASCADE
DELETE FROM Medicos WHERE idMedico = 7;
SELECT * FROM Citas; -- Corroboramos que la cita asociada al Médico de id con valor de 7 se ha borrado