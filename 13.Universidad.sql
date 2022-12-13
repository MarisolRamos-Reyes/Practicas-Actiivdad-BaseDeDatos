use master;
go
If DB_ID (N'Universidad') is not Null
Drop database Universidad;
go 
Create database Universidad
on
(
	Name = Universidad_dat,
	FileName = 'C:\BaseDatos\Universidad.mdf',
	Size = 10,
	MaxSize = 50, 
	FileGrowth = 5
)
Log on
(
	Name = Universidad_log,
	FileName = 'C:\BaseDatos\Universidad.ldf',
	Size= 5MB,
	MaxSize = 25MB,
	FileGrowth = 5MB
);
go
use Universidad;
go
Create Table AreaConocimiento
(
	IdAreaConocimiento int Not null,
	Nombre varchar (50) Not Null,
	Estatus bit default 1 Not null
);
Create Table Catedral
(
	IdCatedral int Not null,
	NivelEducativo varchar (50) Not null,
	Condiciones varchar (50) Not null,
	CantidadProfesores int Not null,
	Estatus bit default 1 Not null
);
Create Table Departamento
(
	IdDepartamento int Not null,
	IdCatedral int Not null,
	IdAreaConocimiento int Not null,
	NoDepartamento int Not null,
	Nombre varchar (50) Not null,
	Descripcion varchar (50) Not null,
	Estatus bit default 1 Not null
);
Create Table Profesor
(
	IdProfesor int Not null,
	Nombre varchar (50) Not null,
	APaterno varchar (50) Not null,
	AMaterno varchar (50) Not null,
	Telefono int Not null,
	Cedula int Not null,
	Estatus bit default 1 Not null
);
Create Table Facultad
(
	IdFacultad int Not null,
	Nombre varchar(50) Not null,
	Telefono int Not null,
	Calle varchar (50) Not null,
	Colonia varchar (50) Not null,
	Numero varchar (50) Not null,
	NumEstudiantes int Not null,
	Estatus bit default 1 Not null
);
Create Table FacultadDepartamento
(
	IdFacultadDepartamento int Not null,
	IdFacultad int Not null,
	IdDepartamento int Not null,
	Estatus bit default 1 Not null
);
Create Table CatedralProfesor
(
	IdCatedralProfesor int Not null,
	IdCatedral int Not null,
	IdProfesor int Not null,
	FechaIngreso datetime Not null,
	Estatus bit default 1 Not null
);
Alter Table AreaConocimiento add constraint PK_AreaConocimiento primary key (IdAreaConocimiento)
Alter Table Catedral add constraint PK_Catedral primary key (IdCatedral)
Alter Table Departamento add constraint PK_Departamento primary key (IdDepartamento)
Alter Table Profesor add constraint PK_Profesor primary key (IdProfesor)
Alter Table Facultad add constraint PK_Facultad primary key (IdFacultad)
Alter Table FacultadDepartamento add constraint PK_FacultadDepartamento primary key (IdFacultadDepartamento)
Alter Table CatedralProfesor add constraint PK_CatedralProfesor primary key (IdCatedralProfesor)