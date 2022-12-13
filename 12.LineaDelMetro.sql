Create DATABASE LineaDelMetro
Use master;
go
If DB_ID(N'LineaDelMetro') is Not null
Drop DataBase LineaDelMetro;
go
Create DataBase LineaDelMetro
on
(
	NAME = LineaDelMetro_dat,
	Filename = 'C:\BaseDatos\LineaDelMetro.mdf',
	Size = 10,
	MaxSize = 50,
	Filegrowth = 5
)
Log on
(
	Name =  LineaDelMetro_log,
	Filename = 'C:\BaseDatos\ LineaDelMetro.ldf',
	Size = 5MB,
	MaxSize = 25MB,
	Filegrowth = 5MB
);
Go 
Use LineaDelMetro;
Create Table ACCESO
(
	IdAcceso int Not null,
	IdEstacion int Not null,
	Nombre varchar Not null,
    Ubicacion varchar Not null,
	Estatus bit default 1 Not null
);
Create Table COCHERA 
(
	IdCochera int Not null,
	IdEstacion int Not null,
	Numero int Not null,
	Capacidad int Not null,
	CantidadReservada int Not null,
	Estatus bit default 1 Not null
);
Create Table ESTACION
(
	IdEstacion int Not null, 
	Nombre varchar Not null,
	Ubicacion varchar Not null,
	Inicio varchar Not null,
	Fin varchar Not null,
	Estatus bit default 1 Not null
);
Create Table Linea
(
	IdLinea int Not null,
	Nombre varchar Not null,
	Tarifa int Not null,
	Estatus bit default 1 Not null
);
Create Table LINEAESTACION 
(
	IdLineaEstacion int Not null,
	IdLinea int Not null,
	IdEstacion int Not null,
	Estatus bit default 1 Not null
);
Create Table TREN 
(
	IdTren int Not null,
	IdCochera int Not null,
	Modelo varchar Not null,
	NoVagones int Not null,
	Estatus bit default 1 Not null
);

--Llaves primarias 
Alter Table ACCESO add constraint PK_ACCESO Primary key (IdAcceso)
Alter Table COCHERA add constraint PK_COCHERA primary key (IdCochera)
Alter Table ESTACION add constraint PK_ESTACION primary key (IdEstacion)
Alter Table Linea add constraint PK_LINEA primary key (IdLinea)
Alter Table LINEAESTACION add constraint PK_LINEAESTACION primary key (IdLineaEstacion)
Alter Table TREN add constraint PK_TREN primary key (IdTren)

--Llaves foraneas
Alter Table ACCESO add constraint FK_ACCESOESTACION foreign key (IdAcceso)References
ESTACION (IdEstacion)
Alter Table COCHERA add constraint FK_COCHERAESTACION foreign key (IdCochera) References
ESTACION(IdEstacion)
Alter Table LINEAESTACION add constraint FK_LINEAESTACIONLINEA foreign key (IdLineaEstacion)References
Linea(IdLinea)
Alter Table LINEAESTACION add constraint FK_LINEAESTACIONESTACION foreign key (IdLineaEstacion)References
ESTACION(IdEstacion)
Alter Table TREN add constraint FK_TRENCOCHERA foreign key(IdTren)References
COCHERA(IdCochera)

--Indice
Create Index IX_ACCESO on ACCESO (IdAcceso)
Create Index IX_COCHERA on COCHERA (IdCochera)
Create Index IX_ESTACION on ESTACION (IdEstacion)
Create Index IX_LINEA on LINEA (IdLinea)
Create Index IX_LINEAESTACION on LINEAESTACION (IdLineaEstacion)
Create Index IX_TREN on TREN(IdTren)
