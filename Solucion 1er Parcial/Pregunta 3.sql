Create Database Cine;
Use Cine;

Create Table Estudio
(
	ID SmallInt Not Null Primary Key,
    Nombre Varchar(50) Not Null
);

Create Table Nacionalidad 
(
	ID SmallInt Not Null Primary Key,
    Nombre Varchar(40) Not Null
);

Create Table Pelicula
(
	COD SmallInt Not Null Primary Key,
    Titulo Varchar(50) Not Null,
    Año Int Not Null,
    Duracion TinyInt Not Null,
    IDEstudio smallint Not Null,
    Foreign Key (IDEstudio) References Estudio(ID)
    On Update Cascade On Delete Cascade
);

Create Table Estrella
(
	Cod Varchar(5) Not Null Primary Key,
    Nombre Varchar(50) Not Null,
    Sexo Char Not Null,
    IDNacionalidad SmallINt Not Null,
    Foreign Key (IDNacionalidad) References Nacionalidad(ID) On Update Cascade On delete Cascade
);

Create table Protagoniza
(
	CODPelicula SmallInt Not Null,
    CODEstrella Varchar(5) Not Null,
    Primary Key(CodPelicula, CODEstrella),
    Foreign Key (CodPelicula) references Pelicula(COD) On Update Cascade On Delete Cascade,
    Foreign Key (CODEstrella) References Estrella(Cod) On Update Cascade ON delete Cascade
);

Select* From Estudio;
Select * From Nacionalidad;
Select * From Pelicula;
Select * From Estrella;
Select * From Protagoniza;

Insert Into Estudio Values(1,'Columbia Pictures');

