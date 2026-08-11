Create database UNIVERSIDAD2026;
use UNIVERSIDAD2026;

Create Table Alumno 
(
 Registro Int Not Null Primary Key,
 CI Int Not Null,
 NombreCompleto Varchar(50) Not Null,
 Correo Varchar(40),
 FechaNacimiento Date Not Null,
 Sexo Char Not Null,
 EstadoCivil Char Not Null,
 Direccion Varchar(50),
 TipoSangre Varchar(4)
);

Select * From Alumno;

Insert Into Alumno Values (111,321,'Joaquin Chumacero', 'jchuma@gmail.com','2025/01/10', 'M', 'S', 'Urbanización los claveles', 'ORH+');
Insert Into Alumno Values (222,456,'Satrunino Mamani', 'smamani@gmail.com','2000/02/15', 'M', 'c', 'Calle Landivar 300', 'ORH+');
Insert Into Alumno Values (333,345, 'Fabiola Mendez', 'fmendez@gmail.com', '2000/03/30', 'F', 'S', 'Calle Junin 200', 'A+');
Insert Into Alumno Values (444,567, 'Carlos Camacho', 'ccamacho@gmail.com', '2001/12/20', 'M', 'S', 'Calle Landivar 400', 'ORH+');
Insert Into Alumno Values (555,388, 'Carla Aguilera', 'caguilar@gmail.com', '2005/06/12', 'F', 'C', 'Calle Junin 300', 'ORH+');

update alumno set correo=null where registro=444;
update alumno set direccion=null where registro=222;
update alumno set EstadoCivil='C' where registro=222;

/* Mostrar todos los alumnos varones */

Select *
From Alumno 
Where Sexo='M';

/* Mostrar el registro y nombre completo de todos los variones */
Select Registro, NombreCompleto
From Alumno
Where Sexo='M';

/* Mostrar todos los alumnos varones solteros */
Select *
From Alumno
Where Sexo = 'M' and EstadoCivil = 'S';

/* Mostrar todos los alumnos que no tienen correo electronico */

/* Mostrar todos los alumnos que su nombre comiencen con c */