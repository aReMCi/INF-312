Create Database MaestroOferta2026;
Use MaestroOferta2026;

/*----------------------------------- CREACION DE TABLAS -------------------------------------*/

Create Table Docente 
(
	Codigo smallint Not Null Primary Key,
    Nombre VarChar(50) Not Null
);

Create Table Materia
(
	Sigla VarChar(6) Not Null Primary Key,
    Nombre Varchar(20) Not Null
);

Create table Horario
(
	ID smallint Not Null primary key,
    Dia Varchar(11) Not Null,
    HoraInicio Time Not Null,
    HoraFin Time Not Null
);

Create Table Modalidad
(
	ID smallint Not Null Primary Key,
    Descripcion VarChar(50)
);

Create Table Grupo
(
	ID Int Not Null Primary Key,
    Nombre VarChar(25) Not Null,
    Cupos TinyInt Unsigned Not Null,
    CodigoDocente smallint Not Null,
    SiglaMateria VarChar(6) Not Null,
    IDModalidad smallint Not Null,
    foreign key (CodigoDocente) references Docente(Codigo) On Delete Cascade On Update Cascade,
    foreign key (SiglaMateria) references Materia(Sigla) On Delete Cascade On Update Cascade,
    Foreign Key (IDModalidad) References Modalidad(ID) on delete Cascade On Update Cascade
);

Create Table Pertenece
(
	IDGrupo Int Not Null,
    IDHorario smallint Not Null,
    Primary Key(IDGrupo,IDHorario),
    Foreign Key (IDGrupo) references Grupo(ID),
    Foreign Key (IDHorario) References Horario(ID)    
);

Select * From Docente;
Select * From Materia;
Select * From Horario;
Select * From Modalidad;
Select * From Grupo;
Select * From Pertenece;

