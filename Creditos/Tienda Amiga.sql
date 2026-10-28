Create Database TiendaAmiga;
Use TiendaAmiga;

Create table Categoria
(
	ID smallint Not Null Primary Key,
    Nombre Varchar(50) Not Null,
    IDCategoria smallint,
    Foreign Key (IDCategoria) references Categoria(ID) On Update Cascade On Delete No action
);

Create table Marca
(
	ID SmallInt Not Null Primary Key,
    Nombre Varchar(50) Not null
);

Create table Producto
(
	Codigo Varchar(4) Not Null Primary Key,
    Nombre Varchar(80) Not Null,
    Precio Float Not Null,
    IDCategoria Smallint Not Null,
    IDMarca SmallInt Not Null,
    Foreign Key (IDCategoria) References Categoria(ID) On Update Cascade On delete cascade,
    Foreign key (IDMarca) References Marca(ID) On Update Cascade On delete cascade
);

Create Table NotaVenta
(
	Nro Int Not Null Primary Key,
    Fecha Date Not Null,
    MontoTotal Float Not Null,
    Plazo TinyInt Not Null,
    CICliente Int Not Null,
    CIEncargado Int Not Null,
    IDTipoPago TinyInt Not Null,
    Foreign Key (CICliente) references Persona(CI) On update cascade,
    Foreign Key (CIEncargado) References Persona(CI) On Update Cascade,
    Foreign Key (IDTipoPago) References TipoPago(ID) On Update Cascade
);

Create Table DetalleVenta
(
	NroVenta Int Not Null,
    ID SmallInt Not Null,
    Primary Key(NroVenta,ID),
    Cantidad tinyInt Not Null,
    CodigoProducto Varchar(4) Not Null,
    Foreign Key (CodigoProducto) references Producto(Codigo) On Update Cascade
);

Create Table TipoPago
(
	ID Tinyint Not Null Primary Key,
    Nombre Varchar(15) Not Null
);

Create Table Cuota
(
	NroNotaVenta Int Not Null,
    NroCu TinyInt Not Null,
    Primary Key (NroNotaVenta,NroCu),
    Fecha Date Not Null,
    Monto Float Not Null,
    NroFactura Int Not Null,
    Foreign key (NroFactura) References Factura(Nro)
); 

Create Table Factura
(
	Nro Int Not Null Primary Key,
    Fecha Date Not Null,
    Monto Float Not Null,
    Nit Int Not Null,
    Nombre Varchar(50) Not Null	
);


Create table Persona
(
	CI Int Not Null Primary Key,
    Nombre Varchar(50) Not Null,
    Telefono Int Not Null,
    Cargo Varchar(20),
    Direccion Varchar(70),
    Correo Varchar(50),
    TipoE Char Not Null,
    TipoC Char Not null
);

Select * from Categoria;
Select * From Persona;
Select * from Categoria;

/* ---------- INSERCION DE DATOS ----------------------- */

/* Insercion de datos para la tabla persona */ 
Insert Into Persona Values (111,'Joaquin Chumacero',7102030,'Vendedor',Null,Null,'V','F');
Insert Into Persona Values (222, 'Saturnino Mamani',7292922,null,'Urb. Olivios','smamani@gmail.com','F','V');
Insert Into Persona Values (333,'Fabiola Mendez',3567333,'Vendedor','Calle Junin','fmendez@gmail.com','V','V');
Insert Into Persona Values (444,'Carlos Camacho',7211111,null,'Landivar 100','ccamacho@gmail.com','F','V');

/* Insercion de datos para la tabla Tipo Pago */
Insert Into TipoPago Values (1,'Contado');
Insert Into TipoPago Values (2,'Credito');

/* Insercion de datos para la tabla Categoria */
Insert Into Categoria Values (1,'Linea blanca',null);
Insert Into Categoria Values (2,'Aspirado Limpieza',1);
Insert Into Categoria Values (3,'Aspiradora',2);
Insert Into Categoria Values (4,'Hidrolavadoras',2);
Insert Into Categoria Values (5,'Computo',null);
Insert Into Categoria values (6,'Computadora',5);
Insert Into Categoria Values (7,'Impresoras',5);


/* Insercion de datos para la tabla Marca */
Insert Into Marca Values (1,'Electrolux');
Insert Into Marca Values(2,'Karcher');
Insert Into Marca Values (3,'Lenovo');
Insert Into Marca Values (4,'Asus');
Insert Into Marca Values (5,'Epson');

/* Insercion de datos para la tabla Producto */
INSERT INTO Producto VALUES ('P001','ASPIRADORA DE AGUA Y POLVO ELECTROLUX 18 LUX',1149,3,1);
INSERT INTO Producto VALUES ('P002','ASPIRADORA KARCHER, WD3 ASP 3 EN 1',1799,3,2);
INSERT INTO Producto VALUES ('P003','HIDROLAVADORA KARCHER K3 BLACK EDITION',2399,4,2);
INSERT INTO Producto VALUES ('P004','NOTEBOOK LENOVO IDEPAD  SLIM 3L',8398,6,3);
INSERT INTO Producto VALUES ('P005','NOTEBOOK ASUS VIVOBOOK GO I5',7399,6,4);
INSERT INTO Producto VALUES ('P006','IMPRESORA MULTIFUNCION EPSON L33Q',2669,7,5);
INSERT INTO Producto VALUES ('P007','IMPRESORA EPSON L4260 MULTIFUNCION',4199,7,5);

/* Insercion de datos para la tabla NotaVenta */
INSERT INTO NotaVenta VALUES (100,'2026/3/15',2339,1,111,222,1);
INSERT INTO NotaVenta VALUES (101,'2026/3/15',10098,5,444,333,2);
INSERT INTO NotaVenta VALUES (102,'2026/3/20',1799,3,222,111,2);

/* Insercion de datos para la tabla DetalleVenta */

INSERT INTO DetalleVenta VALUES (100,1,1,2339,'P003');
INSERT INTO DetalleVenta VALUES (101,1,1,2669,'P006');
INSERT INTO DetalleVenta VALUES (101,2,1,7399,'P005');
INSERT INTO DetalleVenta VALUES (102,1,1,1799,'P002'); 


/*  --------------------- CONSULTAS --------------------------- */

/* Mostrar todos los productos que pertenecen a la categoria Aspirado Limpieza */