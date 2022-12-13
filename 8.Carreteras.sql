Create DataBase CARRETERAS
Use master;
go
IF DB_ID(N'Carreteras') is not null
Drop DataBase Carreteras;
go
Create DataBase Carreteras
on
(
	Name = Carreteras_dat,
	FileName = 'C:\BaseDatos\Carreteras.mdf',
	Size = 10,
	MaxSize = 50,
	FileGrowth = 5
)
Log on
(
	Name = Carreteras_log,
	FileName = 'C:\BaseDatos\Carreteras.ldf',
	Size = 5MB,
	MaxSize = 25MB,
	Filegrowth = 5MB
);
go
Use Carreteras;
Create Table CARRETERA
(
	IdCarretera int not null,
	Nombre varchar not null,
	KM int not null,
	Estatus bit default 1 not null
);
go
Create Table MUNICIPIO
(
	IdMunicipio int not null,
	NoMuncipio int not null,
	Nombre varchar not null,
	Estatus bit default 1 not null
);
go
Create Table TRAMO
(
	IdTramo int not null,
	IdCarretera int not null,
	NoTramo int not null,
	Descripcion varchar not null,
	Estatus bit default 1 not null
);
go
Create Table TRAMOMUNICIPIO
(
	IdTramoMunicipio int not null,
	IdTramo int not null,
	IdMunicipio int not null,
	KmEntra int not null,
	KmSale int not null,
	Estatus bit default 1 not null
)

--Llaves primarias 
Alter Table CARRETERA add constraint PK_Carretera primary key (IdCarretera)
Alter Table MUNICIPIO add constraint PK_Municipio primary key (IdMunicipio)
Alter Table TRAMO add constraint PK_Tramo primary key (IdTramo)
Alter Table TRAMOMUNICIPIO add constraint PK_TramoMunicipio primary key (IdTramoMunicipio)

--Llaves foraneas 
Alter Table TRAMO add constraint PK_TramoCarretera foreign key (IdTramo)References 
CARRETERA(IdCarretera)
Alter Table TRAMOMUNICIPIO add constraint PK_TramoMunicipioTramo foreign key (IdTramoMunicipio)References
TRAMO(IdTramo)
Alter Table TRAMOMUNICIPIO add constraint PK_TramoMunicipioMunicipio foreign key (IdTramoMunicipio)References
MUNICIPIO(IdMunicipio)

--Indice 
Create Index IX_Carretera on CARRETERA(IdCarretera)
Create Index IX_Municipio on MUNICIPIO(IdMunicipio)
Create Index IX_Tramo on TRAMO(IdTramo)
Create Index IX_TRAMOMUNICIPIO on TRAMOMUNICIPIO(IdTramoMunicipio)

