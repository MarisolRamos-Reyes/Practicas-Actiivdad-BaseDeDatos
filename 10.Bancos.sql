use master;
go
If DB_ID (N'Bancos') is not Null
Drop database Bancos;
go 
Create database Bancos
on
(
	Name = Bancos_dat,
	FileName = 'C:\BaseDatos\Bancos.mdf',
	Size = 10,
	MaxSize = 50, 
	FileGrowth = 5
)
Log on
(
	Name = Bancos_log,
	FileName = 'C:\BaseDatos\Bancos.ldf',
	Size= 5MB,
	MaxSize = 25MB,
	FileGrowth = 5MB
);
go
use Bancos;
go
Create Table CLIENTE
(
	IdCliente int Not null, 
	Nombre varchar Not null,
    APaterno varchar not null,
	AMaerno varchar not null,
	Telefono varchar not null,
	CURP varchar not null, 
	Estatus bit default 1 Not null
);
Create Table CUENTA 
(
	IdCuenta int Not null,
	IdSucursal int Not null,
	NoCuenta int Not null, 
	Codigo int Not null,
	Esatus bit default 1 Not null
);
Create Table DOMILICIACION 
(
	IdDomiliciacion int Not null,
	Entidad varchar Not null,
	Oficina varchar Not null,
	Domicilio varchar Not null,
	Poblacion int Not null,
	Provincia varchar Not null,
	Estatus bit default 1 Not null,
);
Create Table PRESTAMO
(
	IdPrestamo int Not null,
	IdCliente int Not null, 
	NombrePrestario varchar  Not null,
	APaternoPrestario varchar Not null,
	AMaternoPrestario varchar Not null,
	NombrePrestamista varchar Not null,
	APaternoPrestamista varchar Not null,
	AMaternoPrestamista varchar Not null,
	Fecha datetime Not null,
	Pago int Not null,
	Cantidad int Not null,
	Intereses int Not null,
	NombreAval varchar Not null,
	APaternoAval varchar Not null, 
	AMaternoAval varchar Not null,
	Comisiones  varchar Not null,
	Estatus bit default 1 Not null
);
Create Table SUCURSAL
(
	IdSucursal int Not null,
	Codigo int Not null,
	Calle varchar Not null,
	Numero int Not null,
	Colonia varchar Not null,
	Municipio varchar Not null,
	Telefono int Not null,
	CP int Not null,
	Estatus bit default 1 Not null
);
Create Table CUENTACLIENTE
(
	IdCuentaCliente int Not null,
	IdCuenta int Not null,
	IdCliente int Not null,
	Privilegio varchar Not null,
	Estatus bit default 1 Not null
);
Create Table CUENTADOMILICIACION
(
	IdCuentaDomiliciacion int Not null,
	IdCuenta int Not null,
	IdDomiliciacion int Not Null,
	Fecha datetime Not null,
	Estatus bit default 1 Not null
);
--Llaves Primarias
	Alter Table CLIENTE add constraint PK_CLIENTE primary key (IdCliente)
	Alter Table CUENTA add constraint PK_CCUENTA primary key (IdCuenta)
	Alter Table DOMILICIACION add constraint PK_DOMILICIACION primary key (IdDomiliciacion)
	Alter Table PRESTAMO add constraint PK_PRESTAMO primary key (IdPrestamo)
	Alter Table SUCURSAL add constraint PK_SUCURSAL primary key (IdSucursal)
	Alter Table CUENTACLIENTE add constraint PK_CUENTACLIENTE primary key (IdCuentaCliente)
	Alter Table CUENTADOMILICIACION add constraint PK_CUENTADOMILICIACION primary key (IdCuentaDomiliciacion)

--Llaves Foraneas 
	Alter Table CUENTA add constraint FK_CUENTASUCURSAL foreign key (IdCuenta)References
	SUCURSAL(IdSucursal)
	Alter Table PRESTAMO add constraint FK_PRESTAMOSCLIENTE foreign key (IdPrestamo)References
	CLIENTE(IdCliente)
	Alter Table CUENTACLIENTE add constraint FK_CUENTACLIENTECUENTA foreign key(IdCuentaCliente) References
	CUENTA(IdCuenta)
	Alter Table CUENTACLIENTE add constraint FK_CUENTACLIENTECLIENTE foreign key (IdCuentaCliente)References
	Cliente(IdCliente)
	Alter Table CUENTADOMILICIACION add constraint FK_CUENTADOMILICIACIONCUENTA foreign key (IdCuentaDomiliciacion) References
	CUENTA(IdCuenta)
	Alter Table CUENTADOMILICIACION add constraint FK_CUENTADOMILICIACIONDOMILICIACION foreign key (IdCuentaDomiliciacion)References
	DOMILICIACION(IdDomiliciacion) 

--INDICE
	Create Index IX_Cliente on CLIENTE(IdCliente)
	Create Index IX_Cuenta on CUENTA(IdCuenta)
	Create Index IX_Domiliciacion on DOMILICIACION(IdDomiliciacion)
	Create Index IX_Prestamo on PRESTAMO(IdPrestamo)
	Create Index IX_SUCURSAL on SUCURSAL (IdSucursal)
	Create Index IX_CuentaCliente on CUENTACLIENTE (IdCuentaCliente)
	Create Index IX_CuentaDomiliacion on CUENTADOMILICIACION (IdCuentaDomiliciacion)