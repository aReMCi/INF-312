Create Database MallaCurricularInformatica;
Use MallaCurricularInformatica;

/*----------------------------- CREACION DE TABLAS -------------------------------- */ 

Create Table Materia
(
	Sigla Varchar(6) Not Null Primary Key,
    Nombre Varchar(50) Not Null,
    Semestre tinyint Not Null
);

Create Table Prerrequisito
(
	SiglaMat Varchar(6) Not Null,
    SiglaPre Varchar(6) Not Null,
    Primary key(SiglaMat,SiglaPre),
    Foreign Key (SiglaMat) references Materia(Sigla),
    Foreign Key (SiglaPre) References Materia(Sigla)
);

Select * From Materia Order By Semestre;
Select * From Prerrequisito;

/*-------------------------------- INSERCION DE DATOS ---------------------------------------*/

/* Insercion de datos para la tabla Materia */
INSERT INTO Materia VALUES('MAT101', 'Calculo l', 1);
INSERT INTO Materia VALUES('INF119', 'Estructuras discretas', 1);
INSERT INTO Materia VALUES('INF110', 'Introduccion a la informatica', 1);
INSERT INTO Materia VALUES('FIS100', 'Fisica l', 1);
INSERT INTO Materia VALUES('LIN100', 'Ingles Tecnico l', 1);

INSERT INTO Materia VALUES('MAT102', 'Calculo ll', 2);
INSERT INTO Materia VALUES('MAT103', 'Algebra Lineal', 2);
INSERT INTO Materia VALUES('INF120', 'Programacion 1', 2);
INSERT INTO Materia VALUES('FIS102', 'Fisica ll', 2);
INSERT INTO Materia VALUES('LIN101', 'Ingles Tecnico ll', 2);

INSERT INTO Materia VALUES('MAT207', 'Ecucaciones Diferenciales', 3);
INSERT INTO Materia VALUES('INF210', 'Programacion ll', 3);
INSERT INTO Materia VALUES('INF211', 'Arquitectura de computadoras', 3);
INSERT INTO Materia VALUES('FIS200', 'Fisica lll', 3);
INSERT INTO Materia VALUES('ADM100', 'Administracion', 3);

INSERT INTO Materia VALUES('MAT202', 'Probabilidades y Estadistica l', 4);
INSERT INTO Materia VALUES('MAT205', 'Metodos Numericos', 4);
INSERT INTO Materia VALUES('INF220', 'Estructura de datos l', 4);
INSERT INTO Materia VALUES('INF221', 'Programacion Ensamblador', 4);
INSERT INTO Materia VALUES('ADM200', 'Contabilidad', 4);

INSERT INTO Materia VALUES('MAT302', 'Probabilidades y Estadistica ll', 5);
INSERT INTO Materia VALUES('INF318', 'Programacion Logica y Funcional', 5);
INSERT INTO Materia VALUES('INF310', 'Estructura de Datos ll', 5);
INSERT INTO Materia VALUES('INF312', 'Base de Datos l', 5);
INSERT INTO Materia VALUES('INF319', 'Lenguajes Formales', 5);

INSERT INTO Materia VALUES('MAT329', 'Investigacion operativa', 6);
INSERT INTO Materia VALUES('INF342', 'Sistemas de Informacion l', 6);
INSERT INTO Materia VALUES('INF323', 'Sistemas Operativos l', 6);
INSERT INTO Materia VALUES('INF322', 'Base de datos ll', 6);
INSERT INTO Materia VALUES('INF329', 'Compiladores', 6);

INSERT INTO Materia VALUES('MAT419', 'Investigacion Operativa ll', 7);
INSERT INTO Materia VALUES('INF418', 'Inteligencia Artificial', 7);
INSERT INTO Materia VALUES('INF413', 'Sistemas Operativos ll', 7);
INSERT INTO Materia VALUES('INF433', 'Redes l', 7);
INSERT INTO Materia VALUES('INF412', 'Sistemas de Informacion ll', 7);

INSERT INTO Materia VALUES('ECO449', 'Preparacion y evaluacion de proyectos', 8);
INSERT INTO Materia VALUES('INF428', 'Sistemas Expertos', 8);
INSERT INTO Materia VALUES('INF442', 'Sistemas de informacion Geografica', 8);
INSERT INTO Materia VALUES('INF423', 'Redes ll', 8);
INSERT INTO Materia VALUES('INF422', 'Ingenieria de Software l', 8);

INSERT INTO Materia VALUES('INF511', 'Taller de grado l', 9);
INSERT INTO Materia VALUES('INF512', 'Ingenieria de Software ll', 9);
INSERT INTO Materia VALUES('INF513', 'Tecnologia Web', 9);
INSERT INTO Materia VALUES('INF552', 'Arquitectura de Software', 9);

INSERT INTO Materia VALUES('GRL001', 'Modalidad de Titulacion Licenciatura', 10);

/* Insercion de datos para la tabla Prerrequisitos */

INSERT INTO Prerrequisito VALUES('MAT102', 'MAT101');

INSERT INTO Prerrequisito VALUES('MAT103', 'INF119');

INSERT INTO Prerrequisito VALUES('INF120', 'INF110');

INSERT INTO Prerrequisito VALUES('FIS102', 'FIS100');

INSERT INTO Prerrequisito VALUES('LIN101', 'LIN100');

INSERT INTO Prerrequisito VALUES('MAT207', 'MAT102');

INSERT INTO Prerrequisito VALUES('INF210', 'INF120');
INSERT INTO Prerrequisito VALUES('INF210', 'MAT103');

INSERT INTO Prerrequisito VALUES('INF211', 'INF120');
INSERT INTO Prerrequisito VALUES('INF211', 'FIS102');

INSERT INTO Prerrequisito VALUES('FIS200', 'FIS102');

INSERT INTO Prerrequisito VALUES('ADM200', 'ADM100');

INSERT INTO Prerrequisito VALUES('MAT202', 'MAT102');

INSERT INTO Prerrequisito VALUES('MAT205', 'MAT207');

INSERT INTO Prerrequisito VALUES('INF220', 'INF210');

INSERT INTO Prerrequisito VALUES('INF221', 'INF220');

INSERT INTO Prerrequisito VALUES('INF312', 'INF220');

INSERT INTO Prerrequisito VALUES('MAT302', 'MAT202');

INSERT INTO Prerrequisito VALUES('INF318', 'INF220');

INSERT INTO Prerrequisito VALUES('INF310', 'INF312');

INSERT INTO Prerrequisito VALUES('INF319', 'INF312');

INSERT INTO Prerrequisito VALUES('MAT329', 'INF319');

INSERT INTO Prerrequisito VALUES('INF342', 'INF310');

INSERT INTO Prerrequisito VALUES('INF323', 'INF220');

INSERT INTO Prerrequisito VALUES('INF322', 'INF318');

INSERT INTO Prerrequisito VALUES('INF329', 'INF310');

INSERT INTO Prerrequisito VALUES('MAT419', 'MAT329');

INSERT INTO Prerrequisito VALUES('INF418', 'INF323');

INSERT INTO Prerrequisito VALUES('INF413', 'INF342');

INSERT INTO Prerrequisito VALUES('INF433', 'INF322');

INSERT INTO Prerrequisito VALUES('INF412', 'INF342');

INSERT INTO Prerrequisito VALUES('ECO449', 'MAT419');

INSERT INTO Prerrequisito VALUES('INF428', 'INF418');
INSERT INTO Prerrequisito VALUES('INF428', 'INF412');

INSERT INTO Prerrequisito VALUES('INF442', 'INF412');

INSERT INTO Prerrequisito VALUES('INF423', 'INF433');

INSERT INTO Prerrequisito VALUES('INF422', 'INF412');

INSERT INTO Prerrequisito VALUES('INF511', 'ECO449');

INSERT INTO Prerrequisito VALUES('INF512', 'INF428');
INSERT INTO Prerrequisito VALUES('INF512', 'INF442');
INSERT INTO Prerrequisito VALUES('INF512', 'INF423');
INSERT INTO Prerrequisito VALUES('INF512', 'INF422');

INSERT INTO Prerrequisito VALUES('INF513', 'INF428');
INSERT INTO Prerrequisito VALUES('INF513', 'INF442');
INSERT INTO Prerrequisito VALUES('INF513', 'INF423');
INSERT INTO Prerrequisito VALUES('INF513', 'INF422');

INSERT INTO Prerrequisito VALUES('INF552', 'INF428');
INSERT INTO Prerrequisito VALUES('INF552', 'INF442');
INSERT INTO Prerrequisito VALUES('INF552', 'INF423');
INSERT INTO Prerrequisito VALUES('INF552', 'INF422');

INSERT INTO Prerrequisito VALUES('GRL001', 'INF511');
INSERT INTO Prerrequisito VALUES('GRL001', 'INF512');
INSERT INTO Prerrequisito VALUES('GRL001', 'INF513');
INSERT INTO Prerrequisito VALUES('GRL001', 'INF552');

/*------------------------------ Consultas ---------------------------------*/