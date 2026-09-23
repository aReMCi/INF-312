Create Database ArbolG;
Use ArbolG;

/* Creacion de tablas */

Create table Persona 
(
	ID SmallInt Not Null Primary Key,
    Nombre Varchar(50) Not Null,
    Sexo Char Not Null,
	IDPadre SmallInt, 
    IDMadre SmallInt, 
    Foreign Key (IDPadre) references Persona(ID) On Update Cascade On delete No Action,
    Foreign Key (IDMadre) References Persona(ID) On update Cascade On delete no Action
);

Select * From Persona;
/* Insercion de datos */

Insert Into Persona Values(1, 'Joaquin Chumacero Canaviri', 'M',Null,Null);
Insert Into Persona Values(2, 'Fabiola Aguilera', 'F',Null,Null);
Insert into Persona Values(3, 'Pedro Chumacero Aguilera', 'M', 1,2);
Insert Into Persona Values(4, 'Carmen Yupanqui', 'F',Null,Null);
Insert Into Persona Values(5,'Joaquin Chumacero Yupanqui', 'M',3,4);
Insert Into Persona Values(6,'Carla Mendez','F',Null,Null);
Insert Into Persona Values(7,'Joaquin Jr. Chumacero Mendez','M',5,6);
Insert Into Persona Values(8,'Fabiola Chumacero Mendez','F',5,6);
Insert Into Persona Values(9,'Maria Fernadez','F',Null,Null);
Insert Into Persona Values(10,'Juan Chumacero Fernandez','M',5,9);

/* CONSULTAS */

/* Mostrar el nombre de Joaquin Chumacero Yupanqui */

Select Padre.ID, Padre.Nombre
From Persona Hijo,Persona Padre 
Where Hijo.IDPadre=Padre.ID and Hijo.Nombre='Joaquin Chumacero Yupanqui';  

Select *
From Persona
Where ID In (Select IDPadre From Persona Where Nombre='Joaquin Chumacero Yupanqui');

/* Mostrar el nombre del abuelo paterno de Joaquin Chumacero Yupanqui */

Select	Abuelo.Nombre
From	Persona Hijo, Persona Padre, Persona Abuelo
Where	Hijo.IDPadre= Padre.ID and Padre.IdPadre=Abuelo.ID and Hijo.Nombre='Joaquin Chumacero Yupanqui'; 

/* Mostrar los hijos de Joaquin Chumacero Yupanqui */
Select 	Hijo.Nombre
From	Persona Hijo, Persona Padre
Where	(Hijo.IDPadre = Padre.ID) and Nombre='Joaquin Chumacero Yupanqui';

/* Mostrar el nombre de las madres de los hijos de Joaqui Chumacero Yupanqui */
/* Mostrar el nombre de los nietos de Joaquin Chumacero Canaviri */