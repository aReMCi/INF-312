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
    Nombre Varchar(50) Not Null
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

Create table Grupo
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
Select * From Grupo;
Select * From Pertenece;


/*--------------------- INSERCION DE DATOS ---------------*/

/* Insercion de datos para la tabla docente */

Insert Into Docente Values(123,'Josue Veizaga');
Insert Into Docente Values(345,'Alberto Mollo');
Insert Into Docente Values(545,'Jose Gabriel Sanchez');
Insert Into Docente Values(789,'Juan Carlos Contreras'); 

/* Insercion de datos para la tabla materia */
Insert Into Materia Values('INF552','Arquitectura de Software');
Insert Into Materia Values('INF312', 'Base de datos 1');
Insert Into Materia Values('INF120', 'Programacion 1');
Insert Into Materia Values('MAT419', 'Investigacion Operativa');
Insert Into Materia Values('INF110', 'Introduccion a la informatica');

/* Insercion de datos para la tabla Horario */
Insert Into Horario Values(1,'Lunes','7:00','8:30');
Insert Into Horario Values(2,'Lunes','8:30','10:00');
Insert Into Horario Values(3,'Lunes','10:00','11:30');
Insert Into Horario Values(4,'Martes','7:00', '9:15');
Insert Into Horario Values(5,'Martes','9:15','11:30');
Insert Into Horario Values(6,'Miercoles','7:00','8:30');
Insert Into Horario Values(7,'Miercoles','8:30','10:00');
Insert Into Horario Values(8,'Miercoles','10:00','11:30');
Insert Into Horario Values(9,'Jueves','7:00', '9:15');
Insert Into Horario Values(10,'Jueves','9:15','11:30');
Insert Into Horario Values(11,'Viernes','7:00','8:30');
Insert Into Horario Values(12,'Viernes','8:30','10:00');
Insert Into Horario Values(13,'Viernes','10:00','11:30');

/* Insercion de datos para la tabla Modalidad */
Insert Into Modalidad Values(0,'Presencial');
Insert Into Modalidad Values(1,'Virtual'); 

/* Insercion de datos para la tabla Grupo */
Insert Into Grupo Values(1,'SA',100,123,'INF552',0);
Insert Into Grupo Values(2,'SA',100,123,'INF312',0);
Insert Into Grupo Values(3,'SC',100,123, 'INF312',0);
Insert Into Grupo Values(4,'SI',100,345,'INF120',0);
Insert Into Grupo Values(5,'SC',100,545,'MAT419',0);
Insert Into Grupo Values(6,'SZ',100,789,'INF110',0);
Insert Into Grupo Values(7,'SI',100,123,'INF110',0);

/* Insercion de datos para la tabla pertenece */
Insert Into Pertenece Values(1,1);
Insert Into Pertenece Values(1,6);
Insert Into Pertenece Values(1,11);
Insert Into Pertenece Values(2,2);
Insert Into Pertenece Values(2,7);
Insert Into Pertenece Values(2,12);
Insert Into Pertenece Values(3,4);
Insert Into Pertenece Values(3,9);
Insert Into Pertenece Values(4,1);
Insert Into Pertenece Values(4,6);
Insert Into Pertenece Values(4,11);
Insert Into Pertenece Values(5,3);
Insert Into Pertenece Values(5,8);
Insert Into Pertenece Values(5,13);
Insert Into Pertenece Values(6,1);
Insert Into Pertenece Values(6,6);
Insert Into Pertenece Values(6,11);
Insert Into Pertenece Values(7,5);
Insert Into Pertenece Values(7,10);
