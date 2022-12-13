--SQL
Create DATABASE AgenciaDeViajes
Use master;
go 
If DB_ID(N'AgenciaDeViajes') is not null
Drop Database AgenciaDeViajes;
GO 
Create Database AgenciaDeViajes
on
(
	Name = AgenciaDeViajes_dat,
	Filename= 'C:\BaseDatos\AgenciaDeViajes.mdf',
	Size = 10,
	MaxSize = 50,
	Filegrowth = 5
)
Log on
(
	Name = AgenciaDeViajes_log,
	FileName ='C:\BaseDatos\AgenciaDeViajes.ldf',
	Size = 5MB,
	MaxSize = 25MB,
	Filegrowth = 5MB
);
GO
Use AgenciaDeViajes;
Create Table HOTEL
(
	IdHotel int not null,
	NumeroHotel int not null,
	Nombre varchar not null,
	Telefono varchar not null,
	Calle varchar not null,
	Colonia varchar not null,
	Municipio varchar not null,
	Estado varchar not null,
	Pais varchar not null,
	Estatus bit default 1  not null
);
Create Table SUCURSAL
(
	IdSucursal int not null,
	NumeroSucursal int not null,
	Telefono varchar not null,
	CodigoPostal int not null,
	Calle varchar not null,
	Municipio varchar not null,
	Pais varchar not null,
	Estatus bit default 1 not null
);
Create Table TURISTA
(
	IdTurista int not null,
	Nombre varchar not null,
	ApellidoPaterno varchar not null,
	ApellidoMaterno varchar not null,
	Telefono varchar not null,
	CodigoPostal int not null,
	NumeroCasa int not null,
	Calle varchar not null,
	Municipio varchar not null,
	Estado varchar not null,
	Pais varchar not null,
	Estatus bit default 1 not null
);
Create Table VIAJE 
(
	IdViaje int not null,
	IdTurista int not null,
	IdSucursal int not null,
	Fecha datetime not null,
	Estatus bit default 1 not null
);
Create Table VUELO
(
	IdVuelo int not null,
	NumeroVuelo int not null,
	PlazasTotales int not null,
	PlazasTuristas int not null,
	Destino varchar not null,
	Origen varchar not null,
	Fecha datetime not null,
	Estatus bit default 1 not null
);
Create Table VIAJEHOTEL
(
	IdViajeHotel int not null,
	IdViaje int not null,
	IdHotel int not null,
	Estatus bit default 1 not null
);
Create Table VIAJEVUELO
(
	IdViajeVuelo int not null,
	IdViaje int not null,
	IdVuelo int not null,
	Clase int not null,
	Estatus bit default 1 not null
);
--Llaves primarias 
Alter Table HOTEL add constraint PK_Hotel Primary key (IdHotel)
Alter Table SUCURSAL add constraint PK_Sucursal Primary key (IdSucursal)
Alter Table TURISTA add constraint PK_Turista Primary key (IdTurista)
Alter Table VIAJE add constraint PK_Viaje Primary key (IdViaje)
Alter Table VUELO add constraint PK_Vuelo Primary key (IdVuelo)
Alter Table VIAJEHOTEL add constraint PK_ViajeHotel Primary key (IdViajeHotel)
Alter Table VIAJEVUELO add constraint PK_ViajeVuelo Primary key (IdViajeVuelo)

--Llaves foraneas 
Alter Table VIAJE add constraint FK_ViajeTurista foreign key (IdViaje)References 
TURISTA(IdTurista)
Alter Table VIAJE add constraint FK_ViajeSucursal foreign key (IdViaje)References 
SUCURSAL(IdSucursal)
Alter Table VIAJEHOTEL add constraint FK_ViajeHotelViaje foreign key(IdViajeHotel)References 
VIAJE(IdVIAJE)
ALter Table VIAJEHOTEL add constraint FK_ViajeHotelHotel foreign key (IdViajeHotel)References
HOTEL(IdHotel)
Alter Table VIAJEVUELO add constraint FK_ViajeVueloViaje foreign key (IdViajeVuelo)References
VIAJE(IdViaje)
Alter Table VIAJEVUELO add constraint FK_ViajeVueloVuelo foreign key (IdViajeVuelo)References
VUELO(IdVuelo)

--Indices
Create Index IX_Hotel on HOTEL(IdHotel)
Create Index IX_Sucursal on SUCURSAL(IdSucursal)
Create Index IX_Turista on TURISTA (IdTurista)
Create Index IX_Viaje on VIAJE (IdViaje)
Create Index IX_Vuelo on VUELO (IdVuelo)
Create Index IX_ViajeHotel on VIAJEHOTEL(IdViajeHotel)
Create Index IX_ViajeVuelo on VIAJEVUELO (IdViajeVuelo)
