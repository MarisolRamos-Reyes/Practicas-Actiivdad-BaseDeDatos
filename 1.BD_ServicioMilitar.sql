--SQL
CREATE DATABASE ServicioMilitar 
USE master;
go
IF DB_ID (N'ServicioMilitar') is not null
DROP DATABASE ServicioMilitar;
GO
CREATE DATABASE ServicioMilitar
ON
( NAME = ServicioMilitar_dat,
    FILENAME = 'C:\BaseDatos\ServicioMilitar.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
( NAME = ServicioMilitar_log,
    FILENAME = 'C:\BaseDatos\ServicioMilitar.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB ) ;
GO
Use SericioMilitar;
Create Table Compania
(
	IdCompania int Not null,
	Numero int Not null,
	Descripcion Varchar(50) not Null,
	Estatus Bit Default 1 Not Null
);
go
CREATE Table Cuartel
(
	IdCuartel int Not Null,
	NombreCuartel varchar Not null,
	Calle varchar Not null,
	NoExterior varchar Not null,
	NoInterior varchar Not null,
	Municipio varchar Not null,
	Estado varchar not null,
	Codigo varchar not null,
	Estatus bit Default 1 Not null
);
GO
Create Table Cuerpo 
(
	IdCuerpo int Not Null,
	Numero int Not null,
	Denominacion varchar Not Null,
	Estatus bit Default 1 Not null
);
Go
Create Table Servicio	
(	
	IdServicio int Not Null,
	Descripcion varchar Not Null,
	Estatus bit default 1 Not null
);
Go 
Create Table Soldado
(
	IdSoldado int Not Null,
	IdCodigo int Not null,
	Nombre varchar Not null,
	APaterno varchar Not Null,
	AMaterno varchar Not Null,
	Graduacion varchar Not Null,
	IdCompañia int Not Null,
	IdCuartel int Not Null,
	IdCuerpo int Not Null,
	Estatus bit default 1 Not Null
);
Go 
Create Table ServicioSoldado
(
	IdServicioSoldado int Not Null,
	IdServicio int Not Null,
	IdSoldado int Not Null,
	Fecha int Not Null,
	Estatus bit default 1 Not Null
);
Go 
Create Table CuartelCompania
(
	IdCuartelCompania int Not Null,
	IdCuartel int Not Null,
	IdCompania int Not Null,
	Estatus bit default 1 Not Null
);

--Llaves primarias 
Alter Table Compania add constraint PK_Compania Primary Key (IdCompania)
Alter Table Cuartel add constraint PK_Cuartel Primary Key (IdCuartel)
Alter Table Cuerpo add constraint PK_Cuerpo Primary Key (IdCuerpo)
Alter Table Soldado add constraint PK_Soldado Primary Key (IdSoldado)
Alter Table Servicio add constraint PK_Servicio Primary Key (IdServicio)
Alter Table ServicioSoldado add constraint PK_ServicioSoldado Primary Key(IdServicioSoldado)
Alter Table CuartelCompania add constraint PK_CuartelCompania Primary Key (IdCuartelCompania)
 
 --Llaves Foraneas 
 --Tabla Soldado
Alter Table Soldado ADD CONSTRAINT FK_SoldadoCompania Foreign Key (IdSoldado)References
Compania(IdCompania)
Alter Table Soldado ADD CONSTRAINT FK_SoldadoCuartel Foreign Key (IdSoldado)References
Cuartel(IdCuartel)
Alter Table Soldado ADD CONSTRAINT FK_SoldadoCuerpo FOREIGN KEY (IdSoldado)References
Cuerpo(IdCuerpo)

--Tabla ServicioSoldado
Alter Table ServicioSoldado ADD CONSTRAINT FK_ServicioSoldadoServicio FOREIGN KEY (IdServicioSoldado)References
Servicio(IdServicio)
Alter Table ServicioSoldado ADD CONSTRAINT FK_ServicioSoldadoSoldado FOREIGN KEY (IdServicioSoldado)References
Soldado(IdSoldado)

--Tabla CuartelCompania
ALTER TABLE CuartelCompania ADD CONSTRAINT FK_CuartelCompaniaCuartel FOREIGN KEY (IdCuartelCompania)References
Cuartel(IdCuartel)
Alter Table CuartelCompania ADD CONSTRAINT FK_CuartelCompaniaCompania Foreign key (IdCuartelCompania)References
Compania (IdCompania)

 --Indices 
 Create Index IX_Compania ON COMPANIA(IdCompania)
 Create Index IX_Cuartel ON CUARTEL(IdCuartel)
 Create Index IX_Cuerpo ON CUERPO(IdCuerpo)
 Create Index IX_Servicio ON SERVICIO(IdServicio)
 Create Index IX_Soldado ON SOLDADO(IdSoldado)
 Create Index IX_ServicioSoldado ON SERVICIOSOLDADO(IdServicioSoldado)
 Create Index IX_CuartelCompania ON CUARTELCOMPANIA(IdCuartelCompania)
