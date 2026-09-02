Create Database Gabinete2026;
Use Gabinete2026;

/*------------------------------------- Creacion de tablas ---------------------------------------------- */

Create Table Clientes
(
	CI Int Not Null Primary Key,
    Nombre varchar(50) Not Null,
    Direccion Varchar(50)
);

Create Table Asuntos
(
	Nro Int Not Null Primary Key,
    Motivo VarChar(30) Not Null,
    FechaInicio Date Not Null,
    FechaArchivo Date,
    Estado Varchar(15) Not Null,
    CiCliente Int Not Null,
    foreign key (CiCliente) References Clientes(CI)
    On Update Cascade
    On Delete Cascade
);

Create Table Abogado
(
	CI Int Not Null Primary Key,
    Nombre VarChar(50),
    Celular Int Not Null
);

Create Table Lleva

(
	NroExpediente Int Not Null,
    CIAbogado Int Not Null,
    FechaAsignacion Date Not Null,
    Primary Key (NroExpediente,CIAbogado),
    foreign key (NroExpediente) References Asuntos(Nro),
    foreign key (CIAbogado) References Abogado(CI)
);

Select * from Clientes;
Select * from Asuntos;
Select * From Abogado;
Select * From Lleva;

/*-------------------------------INSERCION DE DATOS-------------------------------- */

/* Insercion de datos para la tabla clientes */
Insert Into Clientes Values(111,'Joaquin Chumacero','Calle Junin 200');
Insert Into Clientes Values(222,'Saturnino Mamani', 'Calle Landivar');

/* Insercion de datos para la tabla Asuntos*/
Insert Into Asuntos Values(100, 'Asistencia Familiar','2026-04-10','2026-04-18','Finalizado',111);
Insert Into Asuntos Values(101,'Tentativa de robo','2026-04-15',null,'Tramite',222);
Insert Into Asuntos Values(102,'Divorcio','2026-04-20',null,'Tramite',111);

/* Insercion de datos para la tabla Abogado */
Insert Into Abogado Values(333,'Fabiola Mendez',7102030);
Insert Into Abogado Values(444,'Carlos Camacho',7271171);
Insert Into Abogado Values(555,'Patricia Aguilera',6433333);
Insert Into Abogado Values(777,'Pedro Canaviri',6848484);

/* Insercion de datos para la tabla Lleva */
Insert Into Lleva Values(100,555,'2026-04-10');
Insert Into Lleva Values(101,444,'2026-04-15');
Insert Into Lleva Values(101,777,'2026-04-20');
Insert Into Lleva Values(102,333,'2026-05-20');
