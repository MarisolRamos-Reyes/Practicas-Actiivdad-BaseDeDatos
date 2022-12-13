USE master;
go
If DB_ID (N'ConcencionarioDeAutos') IS NOT NULL
Drop database ConcencionarioDeAutos;
go
Create database ConcencionarioDeAutos
on
(
	Name = ConcencionarioDeAutos_dat,
	FileName = 'C:\BaseDatos\ConcencionarioDeAutos.mdf',
	Size = 10,
	MaxSize = 50,
	FileGrowth = 5
)
Log on
(
	Name = ConcencionarioDeAutos_log,
	FileName = 'C:\BaseDatos\ConcencionarioDeAutos.ldf',
	Size = 5MB,
	MaxSize = 25MB,
	FileGrowth = 5MB
);
GO
USE ConcencionarioDeAutos;
go
Create Table CLIENTE 
(
	IdCliente int not null,
	Nombre varchar not null,
	ApellidoPaterno varchar not null,
	ApellidoMaterno varchar not null,
	RFC varchar not null,
	Calle varchar not null,
	NumeroDomicilio int not null,
	Colonia int not null,
	Telefono int not null,
	Estatus bit default 1 not null
);
Create Table OPCION
(
	IdOpciones int not null,
	Nombre varchar not null,
	Descripcion varchar not null,
	Estatus bit default 1 not null
);
Create Table USADO 
(
	IdUsado int not null,
	Marca varchar not null,
	Modelo varchar not null,
	Matricula varchar not null,
	Precio int not null,
	Estatus bit default 1 not null,
);
Create Table VEHICULO
(
	IdVehiculo int not null,
	Marca varchar not null,
	Modelo varchar not null,
	Cilindros int not null,
	Precio int not null,
	Estatus bit default 1 not null
);
Create Table VENDEDOR 
(
	IdVendedor int not null,
	Nombre varchar not null,
	ApellidoPaterno varchar not null,
	ApellidoMaterno varchar not null,
	RFC varchar not null,
	Calle varchar not null,
	NumeroDomicilio int not null,
	Colonia varchar not null,
	Telefono varchar not null,
	Estatus bit default 1 not null
);
Create Table VENTA
(
	IdVenta int not null,
	IdVendedor int not null,
	IdVehiculo int not null,
	IdCliente int not null,
	Matricula varchar not null,
	Fecha datetime not null,
	Estatus bit default 1 not null
);
Create Table OPCIONVENTA 
(
	IdOpcionVenta int not null,
	IdVehiculo int not null,
	IdOpción int not null,
	Precio int not null,
	Estatus bit default 1 not null
);
Create Table OPCIONVEHICULO
(
	IdOpcionVehiculo int not null,
	IdVehiculo int not null,
	IdOpcion int not null,
	Precio int not null, 
	Estatus bit default 1 not null
);
--Llaves primarias
Alter Table CLIENTE add constraint PK_Cliente primary key (IdCliente)
Alter Table OPCION add constraint PK_Opcion primary key (IdOpciones)
Alter Table USADO add constraint PK_Usado primary key (IdUsado)
Alter Table VEHICULO add constraint PK_Vehiculo primary key (IdVehiculo)
Alter Table VENDEDOR add constraint PK_Vendedor primary key (IdVendedor)
Alter Table VENTA add constraint PK_Venta primary key (IdVenta)
Alter Table OPCIONVENTA add constraint PK_OpcionVenta primary key (IdOpcionVenta)
Alter Table OPCIONVEHICULO add constraint PK_OpcionVehiculo primary key (IdOpcionVehiculo)

--Llaves foraneas 
Alter Table VENTA add constraint FK_VentaVendedor foreign key (IdVenta) References
VENDEDOR (IdVendedor)
Alter Table VENTA add constraint FK_VentaVehiculo foreign key (IdVenta)References
VEHICULO(IdVehiculo)
Alter Table VENTA add constraint FK_VentaCliente foreign key (IdCliente)References
CLIENTE (IdCliente)
Alter Table OPCIONVEHICULO add constraint FK_OpcionVehiculoVehiculo foreign key (IdOpcionVehiculo)References
VEHICULO (IdVehiculo)
Alter Table OPCIONVEHICULO add constraint FK_OpcionVehiculoOpcion foreign key (IdOpcionVehiculo)References
OPCION (IdOpciones)
Alter Table OPCIONVENTA add constraint FK_OpcionVentaOpcion foreign key (IdOpcionVenta)References
OPCION(IdOpciones)
Alter Table OPCIONVENTA add constraint FK_OpcionVentaVenta foreign key (IdOpcionVenta)References 
VENTA(IdVenta)

--Indice 
Create Index IX_Cliente on CLIENTE (IdCliente)
Create Index IX_Opcion on  OPCION (IdOpciones)
Create Index IX_Usado on USADO (IdUsado)
Create Index IX_Vehiculo on VEHICULO (IdVehiculo)
Create Index IX_Vendedor on VENDEDOR (IdVendedor)
Create Index IX_Venta on VENTA (IdVenta)
Create Index IX_OpcionVenta on OPCIONVENTA (IdOpcionVenta)
Create Index IX_OpcionVehiculo on OPCIONVEHICULO (IdOpcionVehiculo)

