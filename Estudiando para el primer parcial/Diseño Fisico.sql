Create Database Biblioteca;
Use Biblioteca;

/* Creacion de tablas */

Create Table Lector 
(
	CI Int Not Null Primary Key, 
	Nombre Varchar(50) Not Null,
    Sexo Char Not Null
);

Create Table Libro
(
	Codigo Varchar(5) Not Null Primary Key,
    Nombre Varchar(40) Not Null
);

Create Table FichaAlquiler
(
	Nro Smallint Not Null Primary Key,
    Fecha Date Not Null,
    Plazo TinyInt Not Null,
    Monto TinyInt Not Null,
    CiCliente Int Not Null,
    CodEquipo Varchar(5) Not Null,
	foreign key (CiCliente) references Lector(CI),
    foreign key (CodEquipo) references Libro(Codigo)
);

Select * From FichaAlquiler;
/* Insercion de datos */

Insert Into Lector Values (111, 'Joaquin Chumacero', 'M');
Insert Into Lector Values (222,'Saturnino Mamani','M');
Insert Into Lector Values (333,'Paola Mendez', 'F');

Insert Into Libro Values ('L1001', 'Base de datos 1');
Insert Into Libro Values ('L1002', 'Programacion 2');
Insert Into Libro Values ('L1003', 'Calculo 1');

Insert INto FichaAlquiler Values(100,'2026/01/10',2,10,222,'L1002');
Insert Into FichaAlquiler Values (101,'2026/01/10',3,15,111,'L1001');
Insert Into FichaAlquiler Values(102,'2026/01/15',1,5,333,'L1002');
Insert Into FichaAlquiler Values(103,'2026/01/16',2,10,222,'L1003');
Insert Into FichaAlquiler Values(104,'2026/01/20',1,5,111,'L1003');

/* Consultas */

Select Lector.Nombre
From Lector,FichaAlquiler,Libro
Where (CI=CiCliente) and (Codequipo = Codigo) and (Libro.Nombre='Programacion 2') and (Plazo>1);

Select Count(*), Libro.Nombre
From Libro, FichaAlquiler
Where (Codigo = CodEquipo) group by Codigo;

Select Sum(Monto), Lector.Nombre
From Lector,FichaAlquiler
Where (CI=CiCliente) and (Lector.Nombre='Joaquin Chumacero');