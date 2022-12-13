--SQL
Create DATABASE ControlHospitalario 
USE master ;
go 
IF DB_ID(N'ControlHospitalario') is not null
Drop Database ControlHospitalario;
go
Create Database ControlHospitalario
on
(
	Name = ControlHospitalario_dat,
	Filename = 'C:\BaseDatos\ControlHospitalario.mdf',
	Size=10,
	MaxSize = 50,
	Filegrowth = 5

)
LOG ON
(
	Name = ControlHospitalario_log,
	FileName = 'C:\BaseDatos\ControlHospitalario.ldf',
	Size = 5MB,
	MaxSize = 25MB,
	Filegrowth = 5MB
);
GO
Use ControlHospitalario;
Create Table CAMA
(
	IdCama int not null,
	IdPlanta int not null,
	NumeroCama int not null,
	Estatus bit default 1 not null,
);
Create Table DIAGNOSTICO
(
	IdDiagnostico int not null,
	CodigoDiagnostico varchar not null,
	Descripcion varchar not null,
	Estatus bit default 1 not null
);
Create TABLE MEDICO
(
	IdMedico int not null,
	Nombre varchar not null,
	ApellidoPaterno varchar not null,
	ApellidoMaterno varchar not null,
	NumeroFechaMedico int not null,
	Estatus bit default 1 not null
);
Create Table PACIENTE 
(
	IdPaciente int not null,
	Nombre varchar not null,
	ApellidoPaterno varchar not null,
	ApellidoMaterno varchar not null,
	FechaDeNacimiento datetime not null,
	NumeroSeguroSocial int not null,
	RFC varchar not null,
	Estatus bit default 1 not null
);
Create Table PLANTA
(
	IdPlanta int not null,
	Nombre varchar not null,
	NumeroCama int not null,
	NumeroPiso int not null,
	Estatus bit default 1 not null
);
Create Table VISITA
(
	IdVisita int not null,
	IdPaciente int not null,
	NumeroPaseVisita int not null,
	NombreVisitante varchar not null,
	ApellidoPaternoVisitante varchar not null,
	ApellidoMaternoVisitante varchar not null,
	HorayFechaInicial varchar not null,
	HorayFechaFinal varchar not null,
	Estatus bit default 1 not null
);
Create Table VISITAMEDICA 
(
	IdVisitaMedica int not null,
	IdPaciente int not null,
	FechayHora datetime not null,
	Estatus bit default 1 not null
);
Create Table PACIENTEMEDICO
(
	IdMedicoPaciente int not null,
	IdMedico int not null,
	IdPaciente int not null,
	Estatus bit default 1 not null
);
Create Table MEDICODIAGNOSTICO
(
	IdMedicoPaciente int not null,
	IdMedico int not null,
	IdPaciente int not null,
	Estatus bit default 1 not null
);
Create Table PACIENTECAMA
(
	IdPacienteCama int not null,
	IdPaciente int not null,
	IdCama int not null,
	Estatus bit default 1 not null
);

--Llaves primarias
Alter Table CAMA add constraint PK_Cama primary key (IdCama)
Alter Table DIAGNOSTICO add constraint PK_Diagnostico primary key (IdDiagnostico)
Alter Table MEDICO add constraint PK_Medico primary key (IdMedico)
Alter Table PACIENTE add constraint PK_Paciente primary key (IdPaciente)
Alter Table PLANTA add constraint PK_Planta primary key (IdPlanta)
Alter Table VISITA add constraint PK_Visita primary key (IdVisita)
Alter Table VISITAMEDICO add constraint PK_VisitaMedico primary key (IdVisitaMedico)
Alter Table PACIENTEMEDICO add constraint PK_PacienteMedico primary key (IdMedicoPaciente)
Alter Table MEDICODIAGNOSTICO add constraint PK_MedicoDiagnostico primary key (IdMedicoPaciente)
Alter Table PACIENTECAMA add constraint PK_PacienteCama primary key (IdPacienteCama)

--Llaves foraneas 
Alter Table CAMA add constraint FK_CamaPaciente foreign key (IdCama)References
PACIENTE (IdPaciente)
Alter Table VISITA add constraint FK_VisitaPaciente foreign key (IdVisita)References
PACIENTE (IdPaciente)
Alter Table VISITAMEDICA add constraint FK_VisitaMedicaPaciente foreign key (IdVisitaMedica)References
PACIENTE (IdPaciente)
Alter Table PACIENTEMEDICO add constraint FK_MedicoPacientePaciente foreign key (IdMedicoPaciente)References
PACIENTE (IdPaciente)
Alter Table PACIENTEMEDICO add constraint FK_MedicoPacienteMedico foreign key (IdMedicoPaciente)References
MEDICO(IdMedico)
Alter Table MEDICODIAGNOSTICO add constraint FK_MedicoDiagnosticoMedico foreign key (IdMedicoPaciente)References
MEDICO(IdMedico)
Alter Table MEDICODIAGNOSTICO add constraint FK_MedicoDiagnosticoDiagnostico foreign key (IdMedicoPaciente)References
DIAGNOSTICO(IdDiagnostico)
Alter Table PACIENTECAMA add constraint FK_PacienteCamaPaciente foreign key (IdPacienteCama)References
PACIENTE (IdPaciente)
Alter Table PACIENTECAMA add constraint FK_PacienteCamaCama foreign key (IdPacienteCama)References 
CAMA(IdCama)

--Indice 
Create Index IX_Cama on CAMA(IdCama)
Create Index IX_Diagnostico on DIAGNOSTICO(IdDiagnostico)
Create Index IX_Medico on MEDICO(IdMedico)
Create Index IX_Paciente on PACIENTE(IdPaciente)
Create Index IX_Planta on PLANTA(IdPlanta)
Create Index IX_Visita on VISITA(IdVisita)
Create Index IX_VisitaMedico on VISITAMEDICA(IdVisitaMedica)
Create Index IX_PacienteMedico on PACIENTEMEDICO(IdMedicoPaciente)
Create Index IX_MedicoDiagnostico on MEDICODIAGNOSTICO(IdMedicoPaciente)
Create Index IX_PacienteCama on PACIENTECAMA (IdPacienteCama)

