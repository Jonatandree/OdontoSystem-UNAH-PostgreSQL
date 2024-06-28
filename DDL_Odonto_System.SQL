--1.
CREATE TABLE Ocupaciones (
    OcupacionID SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
--2
CREATE TABLE Tipo_Radiografias (
    RadiografiaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Costo DECIMAL(10, 2) NOT NULL
);

--3.
CREATE TABLE Sexo (
    SexoID SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

--4.
CREATE TABLE EstadoCivil (
    EstadoCivilID SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);


--5.
CREATE TABLE Nacionalidades (
    NacionalidadID SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);


--6.
CREATE TABLE TipoDocumentos (
    TipoDocumentoID SERIAL PRIMARY KEY,
    NombreDocumento VARCHAR(50) NOT NULL
);


--7.
CREATE TABLE Cargos (
    CargoID SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT
);



--8.
CREATE TABLE Personas (
    PersonaID SERIAL PRIMARY KEY,
    Primer_Nombre VARCHAR(50) NOT NULL,
    Segundo_Nombre VARCHAR(50),
    Primer_Apellido VARCHAR(50) NOT NULL,
    Segundo_Apellido VARCHAR(50),
    Fecha_Nacimiento DATE,
    Direccion TEXT,
    Telefono VARCHAR(10),
    SexoID INTEGER REFERENCES Sexo(SexoID),
    EstadoCivilID INTEGER REFERENCES EstadoCivil(EstadoCivilID),
    NacionalidadID INTEGER REFERENCES Nacionalidades(NacionalidadID)
);


--9.
CREATE TABLE PersonaDocumentos (
    PersonaID INTEGER,
    TipoDocumentoID INTEGER,
    Documento VARCHAR(100),
    PRIMARY KEY (PersonaID, TipoDocumentoID),
    FOREIGN KEY (PersonaID) REFERENCES Personas(PersonaID),
    FOREIGN KEY (TipoDocumentoID) REFERENCES TipoDocumentos(TipoDocumentoID)
);


--10.
CREATE TABLE ContactosReferencias (
    PersonaResponsableID SERIAL PRIMARY KEY,
    Primer_Nombre VARCHAR(50) NOT NULL,
    Primer_Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(10)
);


--11.
CREATE TABLE Pacientes (
    PacienteID SERIAL PRIMARY KEY,
    Analfabeta VARCHAR(4),
    MedicoPersonalID INTEGER REFERENCES ContactosReferencias(PersonaResponsableID),
    PersonaResponsableID INTEGER REFERENCES ContactosReferencias(PersonaResponsableID),
    OdontologoAnteriorID INTEGER REFERENCES ContactosReferencias(PersonaResponsableID),
    OcupacionID INTEGER REFERENCES Ocupaciones(OcupacionID),
    PersonaID INTEGER REFERENCES Personas(PersonaID)
);

--12.
CREATE TABLE Expedientes (
    ExpedienteID SERIAL PRIMARY KEY,
    Fecha_Creacion TIMESTAMP NOT NULL,
    Numero_Expediente VARCHAR(50) NOT NULL,
    PacienteID INTEGER REFERENCES Pacientes(PacienteID)
);



--13.
CREATE TABLE Correos (
    CorreosID SERIAL PRIMARY KEY,
    Correo VARCHAR(75) NOT NULL,
    Contraseña VARCHAR(50) NOT NULL
);


--14.
CREATE TABLE Privilegios (
    PrivilegiosID SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion TEXT
);


--15.
CREATE TABLE Usuarios (
    UsuarioID SERIAL PRIMARY KEY,
    NumeroCuenta VARCHAR(50),
    CorreoID INTEGER REFERENCES Correos(CorreosID),
    CargoID INTEGER REFERENCES Cargos(CargoID),
    PersonaID INTEGER REFERENCES Personas(PersonaID)
);


--16.
CREATE TABLE Departamentos (
    DepartamentoID SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    Jefe_Departamento INTEGER REFERENCES Personas(PersonaID)
);

CREATE TABLE Clinicas (
    ClinicaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    DepartamentoID INTEGER REFERENCES Departamentos(DepartamentoID)
);


--17.
CREATE TABLE Clases (
    ClaseID SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    Codigo VARCHAR(100) NOT NULL,
    DepartamentoID INTEGER REFERENCES Departamentos(DepartamentoID)
);


--18.
CREATE TABLE HistoriaClinica (
    HistoriaClinicaID SERIAL PRIMARY KEY,
    Fecha_Creacion TIMESTAMP NOT NULL,
    Numero_Registro INTEGER NOT NULL,
    ExpedienteID INTEGER REFERENCES Expedientes(ExpedienteID)
);


--19.
CREATE TABLE Citas (
    CitasID SERIAL PRIMARY KEY,
    Fecha DATE NOT NULL,
    Estado INTEGER,
    EstudianteID INTEGER REFERENCES Estudiantes(EstudianteID),
    PacienteID INTEGER REFERENCES Pacientes(PacienteID)
);

CREATE TABLE EstadosAprovacionDocente (
    EstadoAprobacionID SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);


____________________________________________________________________________________________

--20.
CREATE TABLE Remisiones (
    RemisioID SERIAL PRIMARY KEY,
    PacienteID INTEGER REFERENCES Pacientes(PacienteID),
    ClinicaID INTEGER REFERENCES Clinicas(ClinicaID),
    HistoriaClinicaID INTEGER REFERENCES HistoriaClinica(HistoriaClinicaID),
    EstadoID INTEGER REFERENCES EstadosAprovacionDocente(EstadoAprobacionID)
);


--21.
CREATE TABLE Tickets (
    TicketsID SERIAL PRIMARY KEY,
    Fecha TIMESTAMP NOT NULL,
    NumeroDeTurno INTEGER NOT NULL,
    RemicionID INTEGER REFERENCES Remisiones(RemicionID)
);

--22.
CREATE TABLE Remisiones_imagenologia (
    Remisio_ImagenologiaID SERIAL PRIMARY KEY,
    PacienteID INTEGER REFERENCES Pacientes(PacienteID),
    imagen_remision BYTEA,
    centro_medico VARCHAR(100),
    ClinicaID INTEGER REFERENCES Clinicas(ClinicaID)
);


--23.
CREATE TABLE Radiografias_X_remision (
    Radiografias_X_remisionID SERIAL PRIMARY KEY,
    Imagenradiografia BYTEA,
    RadiografiaID INTEGER REFERENCES Radiografias(RadiografiaID),
    Remisio_ImagenologiaID INTEGER REFERENCES Remisiones_imagenologia(Remisio_ImagenologiaID)
);


--24.
CREATE TABLE CobrosPendientes (
    CobrosPendientesID SERIAL PRIMARY KEY,
    Concepto VARCHAR(255),
    Estado VARCHAR(50),
    monto DECIMAL(10, 2),
    Remisiones_imagenologiaID INTEGER REFERENCES Remisiones_imagenologia(Remisio_ImagenologiaID)
);


--25.

--26.

--27.

--28.

--29.

--30.

--31.

--32.

--33.

--34.

--35.

--36.

--37.

--38.

--39.

--40.

--41.

--42.

--43.

--44.

--45.

--46.

--47.

--48.

--49.

--50.

--51.

--52.

--53.

--54.

--55.

--56.

--57.

--58.

--59.

--60.

--61.

--62.

--63.

--64.

--65.

--66.

--67.

--68.

--69.

--70.
