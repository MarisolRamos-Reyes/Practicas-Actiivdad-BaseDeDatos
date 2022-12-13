Create DATABASE AgenciaDeAutos 
Use master;
go
If DB_ID(N'AgenciaDeAutos') IS NOT NULL
Drop DataBase AgenciaDeAutos;
GO
Create DataBase AgenciaDeAutos
on
(
	NAME = AgenciaDeAutos_dat,
	Filename = 'C:\BaseDatos\AgenciaDeAutos.mdf',
	Size = 10,
	MaxSize = 50,
	Filegrowth = 5
)
Log on
(
	Name = AgenciaDeAutos_log,
	Filename = 'C:\BaseDatos\AgenciaDeAutos.ldf',
	Size = 5MB,
	MaxSize = 25MB,
	Filegrowth = 5MB
);
GO
Use AgenciaDeAutos;
Create Table AGENCIA
(
	IdAgencia int Not null,
	Nombre varchar Not null,
	Calle varchar Not null,
	Numero varchar Not null,
	Colonia varchar Not null,
	Municipio varchar Not null,
	Telefono varchar Not null,
	Estatus bit default 1 Not null
);
Create Table CLIENTE 
(
	IdCliente int Not null,
	Nombre varchar Not null,
	APaterno varchar Not null,
	AMaerno varchar Not null,
	RFC varchar Not null,
	Estatus bit default 1 Not null
);
Create Table COCHE 
(
	IdCoche int Not null,
	IdGaraje int Not null,
	Modelo varchar Not null,
	Marca varchar Not null,
    Precio int Not null,
	Estatus bit default 1 Not null
);
Create Table GARAJE 
(
	IdGaraje int Not null,
	Numero int Not null,
	Capacida int Not null,
	CantidadReservada int Not null,
	Estatus bit default 1 Not null
);
Create Table RESERVA
(
	IdReserva int Not null,
	IdAgencia int Not null,
	IdCliente int Not null,
	FechaInicio datetime Not null,
	FechaFinal datetime Not null,
	ArchivoContrato varchar Not null,
	Precio int Not null,
	Estatus bit default 1 Not null
);
Create Table RESERVACOCHE
(
	IdReservaCoche int Not null,
	IdReserva int Not null,
	IdCoche int Not null,
	Estatus  bit default 1 Not null
);

--Llaves primarias 
Alter Table AGENCIA add constraint PK_AGENCIA Primary key (IdAgencia)
Alter Table CLIENTE add constraint PK_CLIENTE Primary key (IdCliente)
Alter Table COCHE add constraint PK_COCHE Primary key (IdCoche)
Alter Table GARAJE add constraint PK_GARAJE Primary key (IdGaraje)
Alter Table RESERVA add constraint PK_RESERVA Primary key (IdReserva)
Alter Table RESERVACOCHE add constraint PK_RESERVACOCHE primary key (IdReservaCoche)

--LLaves Foraneas 
Alter Table COCHE add constraint FK_COCHEGARAJE foreign key (IdCoche)References
GARAJE(IdGaraje)
Alter Table RESERVA add constraint FK_RESERVAAGENCIA foreign key (IdReserva)References
AGENCIA(IdAgencia)
Alter Table RESERVA add constraint FK_RESERVACLIENTE foreign key (IdReserva)References
CLIENTE (IdCliente)
Alter TAble RESERVACOCHE add constraint FK_RESERVACOCHERESERVA foreign key(IdReservaCoche)References
RESERVA (IdReserva)
Alter Table RESERVACOCHE add constraint FK_RESERVACOCHECOCHE foreign key(IdReservaCoche)References
COCHE(IdCoche)

--Indice
Create Index IX_AGENCIA on AGENCIA(IdAgencia)
Create Index IX_CLIENTE on CLIENTE(IdCliente)
Create Index IX_COCHE on COCHE(IdCoche)
Create Index IX_GARAJE on GARAJE(IdGaraje)
Create Index IX_RESERVA on RESERVA(IdReserva)
Create Index IX_RESERVACOCHE on RESERVACOCHE(IdReservaCoche)