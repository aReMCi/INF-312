Create Database Modulos;
Use Modulos;

Create Table MOdulo
(
	NROM SmallInt Not Null Primary Key,
    Ubicacion Varchar(30) Not Null
);

Create Table Aula
(
	NROM SmallInt Not Null,
    NROA TinyInt Not Null,
    Capacidad TinyInt Not Null,
    Tipo Char Not Null,
    Primary key(NROM, ROA),
    foreign key (NROM) references Modulo(NROM) On Update Cascade On Delete Cascade
);