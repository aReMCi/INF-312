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
Insert Into Alumno Values (222,456,'Satrunino Mamani', 'smamani@gmail.com','2000/02/15', 'M', 'C', 'Calle Landivar 300', 'ORH+');
Insert Into Alumno Values (333,345, 'Fabiola Mendez', 'fmendez@gmail.com', '2000/03/30', 'F', 'S', 'Calle Junin 200', 'A+');
Insert Into Alumno Values (444,567, 'Carlos Camacho', 'ccamacho@gmail.com', '2001/12/20', 'M', 'S', 'Calle Landivar 400', 'ORH+');
Insert Into Alumno Values (555,388, 'Carla Aguilera', 'caguilar@gmail.com', '2005/06/12', 'F', 'C', 'Calle Junin 300', 'ORH+');

update alumno set correo=null where registro=444;
update alumno set direccion=null where registro=222;

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
Select *
From Alumno 
Where Correo is null;

/* Mostrar todos los alumnos que tienen correo electronico */
Select *
From Alumno
Where Correo is Not Null;

/* Mostrar todos los alumnos que su nombre comiencen con c */
Select *
From Alumno
Where NombreCompleto Like 'C%'; 

/* Mostrar todos los alumnos que tienen apellido Aguilera */
Select*
From Alumno
Where NombreCompleto Like '%Aguilera%';

/* Mostrar la cantidad de alumnos */
Select Count(*)
From Alumno; 

/* Mostrar la cantidad de alumnos que tienen correo */
Select Count(Correo)
From Alumno;

/* Mostrar todos los alumnos que tienen correo electronico */
Select Count(*)
From Alumno
Where Correo is Not Null;

/* Mostrar la cantidad de alumnos que no tienen correo */
Select Count(*)
From Alumno
Where Correo Is Null;

/* Mostrar la cantidad ed alumnos varones */
Select Count(*)
From Alumno
Where Sexo='M';

/* Mostrar en orden ascendente por nombre completo */
Select *
From Alumno
Order By NombreCompleto asc;

/* Mostrar en orden descendente por nombre completo */
Select *
From Alumno
Order By NombreCompleto Desc;

/* Mostrar por cada Sexo cuantos alumnos hay, ordenando */
Select Sexo,count(*) AS Cantidad
From Alumno
Group By Sexo
Order By Cantidad desc;

/* Mostrar la cantidad de alumnos que hay por cada grupo de sangre */
Select TipoSangre as 'Tipo de sangre', Count(*) as Cantidad
From Alumno
Group By TipoSangre;

/* Borrar al alumno Carlos Camacho */
Delete From Alumno Where Registro=444;

/* Cambiar el apellido de Joaquin Chumacero por chumager */
Update Alumno Set NombreCompleto='Joaquin Chumager' Where Registro=111;

/* Borrar la tabla alumno */
Drop table Alumno;

/* Borrar la base de datos Universidad2026 */
Drop Database Universidad2026;