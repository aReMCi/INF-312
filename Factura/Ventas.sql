Create Database Ventas2026;
Use Ventas2026;

Create Table Categoria 
	(
		ID Smallint Not Null Primary Key,
        Nombre Varchar(40) not null
	);

Select * From Categoria;

Create Table Producto
	(
		Codigo Int Not Null Primary Key,
        Nombre Varchar(50) Not Null,
        Precio Float Not Null,
        IDCategoria Smallint Not Null,
        foreign key (IDCategoria) References Categoria(ID)
			On Update Cascade
            On Delete Cascade
    );
    
Create Table Cliente
	(
		CI Int Not Null Primary Key,
        Nombre Varchar(50) Not Null,
        Telefono Int,
        Correo Varchar(40)
    );
    
Create Table Factura
	(
		Nro Int Not Null Primary Key,
        Fecha Date Not Null,
        Nit SmallInt Not Null,
        Nombre Varchar(50) Not Null,
        MontoTotal Int Not Null,
        CiCliente Int Not Null,
        foreign key (CiCliente) References Cliente(CI)
        On Update Cascade
        On Delete Cascade
    );
    
Select * From Producto;

Insert Into Categoria Values (1, 'Bebidas no Alcoholicas');
Insert Into Categoria Values (2, 'Bebidas alcoholicas');
Insert Into Categoria Values (3, 'Limpieza');
Insert Into Categoria Values (4, 'Lacteos');
Insert Into Categoria Values (5, 'Carnes');

Insert Into Producto Values (100, 'Carne de res', 55, 5);
Insert Into Producto Values (101, 'Coca Cola 2L', 20,1);
Insert Into Producto Values (102, 'Leche pil', 10,4);
Insert Into Producto Values (103, 'Vino Kolghbergm',50,2);
Insert Into Producto Values (104, 'Coca Cola Peque', 5,1);
Insert Into Producto Values (105, 'LavaVajillas', 15,1);
Insert Into Producto Values (106, 'Coca Cola Zero 2L', 20,1);
Insert Into Producto Values (107, 'Carne de chancho', 40,5);

Select * From Cliente;
Select * From Factura;

Insert Into Cliente Values (1111,'Joaquin Chumacero','7102030','jchuma@gmail.com');
Insert Into Cliente Values (3333, 'Carla Garcia', '7892222', 'cgarcia@gmail.com');

Insert Into Factura Values (1001,'2026/01/10', 1111, 'Joaquin Chumacero',220,1111);
Insert Into Factura Values (1002,'2026/01/15', 2222, 'Saturnino Mamani',90,3333);






