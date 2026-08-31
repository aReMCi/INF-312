Create Database Gabinete2026;
Use Gabinete2026;

/*------------------------------------------------------------------- Creacion de tablas ---------------------------------------------------------------- */

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