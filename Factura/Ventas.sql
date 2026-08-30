Create Database Ventas2026;
Use Ventas2026;

/* -------------------------------------------------------------- CREACION DE TABLAS ---------------------------------------------------------------------------*/

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
        MontoTotal float Not Null,
        CiCliente Int Not Null,
        foreign key (CiCliente) References Cliente(CI)
        On Update Cascade
        On Delete Cascade
    );
    
Create Table Vende
	(
		NroF Int Not Null,
        CodigoP Int Not Null,
        Precio float Not Null,
        Cantidad Int Not Null,
        Primary Key (NroF, CodigoP),
        foreign key (NroF) References Factura(Nro) On Update Cascade On Delete Cascade,
        foreign key (CodigoP) References Producto(Codigo) On Update Cascade On delete Cascade
    );
    
Select * From Producto;
Select * From Cliente;
Select * From Factura;
Select * From Vende;

/*--------------------------------------------------------------------------- INSERCION DE DATOS ----------------------------------------------------------------------------- */

update Producto set IDCategoria=3 Where Codigo=105; 
Update Categoria Set ID=1 Where ID=8;

/* INSERCION DE DATOS PARA LA TABLA CATEGORIA */

Insert Into Categoria Values (1, 'Bebidas no Alcoholicas');
Insert Into Categoria Values (2, 'Bebidas alcoholicas');
Insert Into Categoria Values (3, 'Limpieza');
Insert Into Categoria Values (4, 'Lacteos');
Insert Into Categoria Values (5, 'Carnes');

/* INSERCION DE DATOS PARA LA TABLA PRODUCTOS */

Insert Into Producto Values (100, 'Carne de res', 55, 5);
Insert Into Producto Values (101, 'Coca Cola 2L', 20,1);
Insert Into Producto Values (102, 'Leche pil', 10,4);
Insert Into Producto Values (103, 'Vino Kolghbergm',50,2);
Insert Into Producto Values (104, 'Coca Cola Peque', 5,1);
Insert Into Producto Values (105, 'LavaVajillas', 15,1);
Insert Into Producto Values (106, 'Coca Cola Zero 2L', 20,1);
Insert Into Producto Values (107, 'Carne de chancho', 40,5);

/* INSERCION DE DATOS PARA LA TABLA CLIENTE */

Insert Into Cliente Values (1111,'Joaquin Chumacero','7102030','jchuma@gmail.com');
Insert Into Cliente Values (3333, 'Carla Garcia', '7892222', 'cgarcia@gmail.com');

/* INSERCION DE DATOS PARA LA TABLA FACTURA */

Insert Into Factura Values (1001,'2026/01/10', 1111, 'Joaquin Chumacero',220,1111);
Insert Into Factura Values (1002,'2026/01/15', 2222, 'Saturnino Mamani',90,3333);
Insert Into Factura Values (1003, '2026/01/15', 1111, 'Joaquin Chumacero', 80, 1111);

/* INSERCION DE DATOS PARA LA TABLA VENDE */

Insert Into Vende Values (1001, 100, 55,2);
Insert Into Vende Values (1001,101,20,3);
Insert Into Vende Values (1001,103,50,1);
Insert Into Vende Values (1002,101,18,5);
Insert Into Vende Values (1003,101,20,2);
Insert Into Vende Values (1003,107,40,1);

/* --------------------------------------------------------------------- CONSULTAS ------------------------------------------------------------------------------------- */

/* Mostrar todos los productos de la categoria bebidas no alcoholicas */
Select Codigo, Producto.Nombre From Categoria,Producto Where ID = IDCategoria and Categoria.Nombre='Bebidas no Alcoholicas';

/* Mostrar todos los productos de la categoria bebidas no alcoholicas, mediantes consultas anidadas */
Select * From Producto Where IDCategoria in (Select ID From Categoria Where Nombre='Bebidas no Alcoholicas');

/* Mostrar todos los productos de la categoria bebidas no alcoholicas y carnes  2 versiones*/
Select Codigo, Producto.Nombre From Categoria,Producto Where ID = IDCategoria and (Categoria.Nombre='Bebidas no Alcoholicas' Or Categoria.Nombre='Carnes');
Select * from Producto Where IDCategoria in (Select ID From Categoria Where Nombre='Bebidas no Alcoholicas' or Nombre='Carnes');

/* Mostrar las facturas del cliente Joaquin Chumacero */
Select Factura.* from Factura,Cliente Where CICliente = CI and (Cliente.Nombre='Joaquin Chumacero');
Select * from Factura Where CICliente in (Select CI From Cliente Where Nombre = 'Joaquin Chumacero');

/* Mostrar la cantidad de factura del cliente Joaquin Chumacero */
Select Count(*) as Cantidad from Factura Where CICliente in (Select CI From Cliente Where Nombre = 'Joaquin Chumacero');
Select Count(*) as Cantidad from Factura,Cliente Where CICliente = CI and (Cliente.Nombre='Joaquin Chumacero');

/* SUM, MIN, MAX, COUNT, AVG */

Select Count(*) As Cantidad_facturas From Factura;

Select Sum(MontoTotal) As Sumatoria From Factura;

Select Min(MontoTotal) As Monto_Minimo From Factura;

Select Max(MontoTotal) As Monto_Maximo From Factura;

Select AVG(MontoTotal) As Monto_Promedio_Facturado From Factura;

/* Mostrar el monto total facturado por el cliente Joaquin Chumacero */

Select Sum(MontoTotal) As Monto_Total_Facturado From Factura Where CiCliente in (Select CI From Cliente Where Nombre='Joaquin Chumacero');
Select Sum(MontoTotal) As Monto_Total_Facturado From Factura,Cliente Where CiCliente = CI and (Cliente.Nombre='Joaquin Chumacero');

/* Mostrar cuantas veces se ha vendido el producto coca cola 2L*/
Select Count(*) as 'Cantidad de ventas', Producto.Nombre From Vende,Producto Where CodigoP = Codigo and (Producto.Nombre = 'Coca Cola 2L');

/* Mostrar la cantidad total vendida del producto coca cola 2L */
Select Sum(Cantidad) As 'Cantidad Total Vendido', Producto.Nombre From Vende,Producto Where CodigoP=Codigo and (Producto.Nombre = 'Coca Cola 2L');

/* Mostrar el monto total ingresado por la venta de coca cola 2L */
Select Sum((Vende.Precio)*(Vende.Cantidad)) As 'Cantidad Total Ingresado en Bs.', Producto.Nombre From Vende,Producto Where CodigoP=Codigo And (Producto.Nombre = 'Coca Cola 2L');

/* Mostrar todos los productos que se han vendido */
Select * from Producto Where Codigo in (Select CodigoP from Vende);

/* Mostrar todos los productos que NO se han vendido*/
Select * from producto Where Codigo  Not In (Select CodigoP From Vende);

/* Mostrar Los clientes que han comprado carne de chancho*/

Select Ci,Cliente.Nombre 
from Producto, Vende, Factura, Cliente 
Where Codigo = CodigoP and NroF=Nro And CiCliente=Ci and Producto.Nombre= 'Carne de Chancho'; 

Select Factura.Nombre, CICliente From Factura Where Nro in (Select NroF From Vende Where CodigoP in (Select Codigo From Producto Where Nombre='Carne de Chancho'));

/* Mostrar la cantidad  de Facturas realizadas por la categoria bebidas no alcoholicas*/ 
Select Count(*) As 'Cantidad de facturas'
From Producto,vende,Factura,Categoria
Where CodigoP=Codigo and NroF=Nro and IDCategoria=ID and Categoria.Nombre = 'Bebidas no Alcoholicas';

Select Count(*) AS 'Cantidad de Facturas' from Factura Where Nro in 
	(Select NroF From Vende Where CodigoP in 
		(Select Producto.Codigo From Producto Where IDCategoria In 
			(Select ID From Categoria Where Nombre='Bebidas No Alcoholicas')));
            
/* Mostrar la cantidad de productos por cada categoria */
Select IDCategoria,Categoria.Nombre,Count(*) 
from Producto,Categoria Where IDCategoria=ID
Group By ID;

/* Mostrar el monto total facturado por cliente */
Select Cliente.Nombre,CiCliente,sum(Factura.MontoTotal) As 'Monto Total'
From Factura,Cliente Where CiCliente=CI
Group By CiCliente;

 /* Mostrar por cada producto cuantas veces se ha vendido */
 Select Count(*) As 'Cantidad de ventas', Producto.Nombre
 From Vende,Producto Where CodigoP=Codigo
 Group By CodigoP;