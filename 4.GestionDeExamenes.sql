use master;
go
If DB_ID (N'GestionDeExamenes') is not null
Drop database GestionDeExamenes;
go
Create database GestionDeExamenes
on
(
	Name = GestionDeExamenes_dat,
	FileName = 'C:\BaseDatos\GestionDeExamenes.mdf',
	Size = 10,
	MaxSize = 50,
	FileGrowth = 5
)
Log on
(
	Name = GestionDeExamenes_log,
	FileName ='C:\BaseDatos\GestionDeExamenes.ldf',
	Size = 5MB,
	MaxSize = 25MB,
	FileGrowth = 5MB
);
GO
USE GestionDeExamenes;
GO
Create Table ALUMNO
(
	IdAlumno int not null,
	NumeroMatricula int not null,
	Nombre varchar not null,
	ApellidoPaterno varchar not null,
	ApellidoMaterno varchar not null,
	Grupo varchar not null,
	Estatus bit default 1 not null
);
Create Table EXAMEN 
(
	IdExamen int not null,
	IdAlumno int not null,
	NumeroExamen int not null,
	NumeroPreguntas int not null,
	Calificaion int not null,
	FechaDeRealizacion datetime not null,
	Estatus bit default 1 not null
);
Create Table PRACTICA 
(
	IdPractica int not null,
	IdAlumno int not null,
	NumeroPractica int not null,
	Titulo varchar not null,
	Codigo varchar not null,
	Grado varchar not null,
	Fecha datetime not null,
	Tipo varchar not null,
	Estatus bit default 1 not null
);
Create Table PROFESOR
(
	IdProfesor int not null,
	Nombre varchar not null,
	ApellidoPaterno varchar not null,
	ApellidoMaterno varchar not null,
	Matricula varchar not null,
	Estatus bit default 1 not null
);
Create Table ALUMNOEXAMEN 
(
	IdAlumnoExamen int not null,
	IdAlumno int not null,
	IdExamen int not null,
	Nota int not null,
	Estatus bit default 1 not null
);
Create Table PROFESORPRACTICA 
(
	IdProfesorPractica int not null,
	IdProfesor int not null,
	IdPractica int not null,
	Nota int not null,
	Fecha datetime not null,
	Estatus bit default 1 not null
);

--Llaves primarias 
Alter Table ALUMNO add constraint PK_Alumno primary key (IdAlumno)
Alter Table EXAMEN add constraint PK_Examen primary key (IdExamen)
Alter Table PRACTICA add constraint PK_Practica primary key (IdPractica)
Alter Table PROFESOR add constraint PK_Profesor primary key (IdProfesor)
Alter Table ALUMNOEXAMEN add constraint PK_AlumnoExamen primary key (IdAlumnoExamen)
Alter Table PROFESORPRACTICA add constraint PK_ProfesorPractica primary key (IdProfesorPractica)

---Llaves foraneas
Alter Table EXAMEN add constraint FK_EXAMENALUMNO foreign key (IdExamen) References 
ALUMNO(IdAlumno)
Alter Table PRACTICA add constraint FK_PracticaAlumno foreign key (IdPractica)References
ALUMNO(IdAlumno)
Alter Table ALUMNOEXAMEN add constraint FK_AlumnoExamenAlumno foreign key (IdAlumnoExamen)References
ALUMNO(IdAlumno)
Alter Table ALUMNOEXAMEN add constraint FK_AlumnoExamenExamen foreign key (IdAlumnoExamen)References
EXAMEN (IdExamen)
Alter Table PROFESORPRACTICA add constraint FK_ProfesorPracticaPractica foreign key(IdProfesorPractica)References
PRACTICA(IdPractica)
Alter Table PROFESORPRACTICA add constraint FK_ProfesorPracticaProfesor foreign key (IdProfesorPractica)References
PROFESOR(IdProfesor)

--Indice
Create Index IX_ALUMNO on ALUMNO(IdAlumno)
Create Index IX_EXAMEN on EXAMEN(IdExamen)
Create Index IX_PRACTICA on PRACTICA(IdPractica)
Create Index IX_PROFESOR on PROFESOR(IdProfesor)
Create Index IX_PROFESORPRACTCA on PROFESORPRACTICA(IdProfesorPractica)
Create Index IX_ALUMNOEXAMEN on ALUMNOEXAMEN (IdAlumnoExamen)


