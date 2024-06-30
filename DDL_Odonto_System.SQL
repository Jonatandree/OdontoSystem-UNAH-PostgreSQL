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


17
CREATE TABLE Clinicas (
    ClinicaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    DepartamentoID INTEGER REFERENCES Departamentos(DepartamentoID)
);


--18
CREATE TABLE Clases (
    ClaseID SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    Codigo VARCHAR(100) NOT NULL,
    DepartamentoID INTEGER REFERENCES Departamentos(DepartamentoID)
);


--19.
CREATE TABLE HistoriaClinica (
    HistoriaClinicaID SERIAL PRIMARY KEY,
    Fecha_Creacion TIMESTAMP NOT NULL,
    Numero_Registro INTEGER NOT NULL,
    ExpedienteID INTEGER REFERENCES Expedientes(ExpedienteID)
);


--20.
CREATE TABLE Citas (
    CitasID SERIAL PRIMARY KEY,
    Fecha DATE NOT NULL,
    Estado INTEGER,
    EstudianteID INTEGER REFERENCES Estudiantes(EstudianteID),
    PacienteID INTEGER REFERENCES Pacientes(PacienteID)
);


21
CREATE TABLE EstadosAprovacionDocente (
    EstadoAprobacionID SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);


____________________________________________________________________________________________

--22.
CREATE TABLE Remisiones (
    RemisionID SERIAL PRIMARY KEY,
    PacienteID INTEGER REFERENCES Pacientes(PacienteID),
    ClinicaID INTEGER REFERENCES Clinicas(ClinicaID),
    HistoriaClinicaID INTEGER REFERENCES HistoriaClinica(HistoriaClinicaID),
    EstadoID INTEGER REFERENCES EstadosAprovacionDocente(EstadoAprobacionID)
);


--23.
CREATE TABLE Tickets (
    TicketsID SERIAL PRIMARY KEY,
    Fecha TIMESTAMP NOT NULL,
    NumeroDeTurno INTEGER NOT NULL,
    RemicionID INTEGER REFERENCES Remisiones(RemisionID)
);

--24.
CREATE TABLE Remisiones_imagenologia (
    Remisio_ImagenologiaID SERIAL PRIMARY KEY,
    PacienteID INTEGER REFERENCES Pacientes(PacienteID),
    imagen_remision BYTEA,
    centro_medico VARCHAR(100),
    ClinicaID INTEGER REFERENCES Clinicas(ClinicaID)
);


--25.
CREATE TABLE Radiografias_X_remision (
    Radiografias_X_remisionID SERIAL PRIMARY KEY,
    Imagenradiografia BYTEA,
    RadiografiaID INTEGER REFERENCES Radiografias(RadiografiaID),
    Remisio_ImagenologiaID INTEGER REFERENCES Remisiones_imagenologia(Remisio_ImagenologiaID)
);


--26.
CREATE TABLE CobrosPendientes (
    CobrosPendientesID SERIAL PRIMARY KEY,
    Concepto VARCHAR(255),
    Estado VARCHAR(50),
    monto DECIMAL(10, 2),
    Remisiones_imagenologiaID INTEGER REFERENCES Remisiones_imagenologia(Remisio_ImagenologiaID)
);


--27.
CREATE TABLE Secciones (
    SeccionesID SERIAL PRIMARY KEY,        
    Horario INTEGER,                 
    Año_Academico VARCHAR(50),        
    Semestre_Academico VARCHAR(50),   
    DoctorID INTEGER REFERENCES Usuarios(UsuarioID), 
    ClaseID INTEGER REFERENCES Clases(ClaseID)      
);
--28.
CREATE TABLE Alumnos_X_Seccion (
    SeccionesID INTEGER NOT NULL,           
    AlumnoID INTEGER NOT NULL,                
    Nota_Final DECIMAL(10,2),                
    PRIMARY KEY (SeccionesID, AlumnoID),  
    FOREIGN KEY (SeccionesID) REFERENCES Secciones(SeccionesID),
    FOREIGN KEY (AlumnoID) REFERENCES Usuarios(UsuarioID)          
);
--29.
CREATE TABLE Cargo (
    CargoID SERIAL PRIMARY KEY,    
    Nombre VARCHAR(100) NOT NULL,       
    Descripcion TEXT                     
);
--30.
CREATE TABLE Privilegios_X_Cargo (
    CargoID INTEGER NOT NULL,                        
    PrivilegiosID INTEGER NOT NULL,                
    PRIMARY KEY (CargoID, PrivilegiosID),           
    FOREIGN KEY (CargoID) REFERENCES Cargo(CargoID), 
    FOREIGN KEY (PrivilegiosID) REFERENCES Privilegios(PrivilegiosID) 
);
--31.
CREATE TABLE Diagnosticos (
    DiagnosticoID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada diagnóstico
    Fecha_Creacion DATE, -- Fecha de creación del diagnóstico
    Motivo_Consulta TEXT, -- Motivo de la consulta
    Historia_de_Enfermedad TEXT, -- Historia de la enfermedad
    Interconsultas TEXT, -- Interconsultas realizadas
    Estado_Gestacion BOOLEAN, -- Estado de gestación (true/false)
    Periodo_Menstrual BOOLEAN, -- Periodo menstrual (true/false)
    Consume_Tabaco BOOLEAN, -- Indicador de consumo de tabaco (true/false)
    Apiñamiento_Dental BOOLEAN, -- Indicador de apiñamiento dental (true/false)
    Dificultad_Respiratoria BOOLEAN, -- Indicador de dificultad respiratoria (true/false)
    Brumismo BOOLEAN, -- Indicador de bruxismo (true/false)
    Piersin_Bucal BOOLEAN, -- Indicador de uso de piercing bucal (true/false)
    Usa_Protesis_Dental BOOLEAN, -- Indicador de uso de prótesis dental (true/false)
    Observaciones TEXT, -- Observaciones adicionales
    Frecuencia_Cepillado_Por_Dia INTEGER, -- Frecuencia de cepillado por día
    Tiempo_De_Cepillado VARCHAR(50), -- Duración del cepillado (descripción)
    Tamaño_De_Cepillo VARCHAR(50), -- Tamaño del cepillo (descripción)
    Tipo_De_Cerdas_Del_Cepillo VARCHAR(50), -- Tipo de cerdas del cepillo
    Presion_Ejercida_Al_Cepillarse VARCHAR(50), -- Presión ejercida al cepillarse
    Usa_Hilo_Dental BOOLEAN, -- Indicador de uso de hilo dental (true/false)
    Sangrado_Encillas BOOLEAN, -- Indicador de sangrado de encías (true/false)
    Comentario TEXT, -- Comentarios adicionales
    EstudianteID INTEGER REFERENCES Usuarios(UsuarioID), -- Clave foránea referenciando a la tabla Estudiantes
    HistoriaClinicaID INTEGER REFERENCES HistoriaClinica(HistoriaClinicaID) -- Clave foránea referenciando a la tabla HistoriaClinica
);

--32.
CREATE TABLE Area (
    AreaID SERIAL PRIMARY KEY,    
    Nombre VARCHAR(100) NOT NULL    
);
--33.
CREATE TABLE Examen_Estomatologico (
    Examen_EstomatologicoID SERIAL PRIMARY KEY,    
    DiagnosticoID INTEGER NOT NULL,           
    FOREIGN KEY (DiagnosticoID) REFERENCES Diagnosticos(DiagnosticoID)  
);

--34.
CREATE TABLE Area_X_Examen (
    Examen_EstomatologicoID INTEGER NOT NULL,
    Afeccion TEXT,
    AreaID INTEGER NOT NULL,
    PRIMARY KEY (Examen_EstomatologicoID, AreaID),
    FOREIGN KEY (Examen_EstomatologicoID) REFERENCES Examen_Estomatologico(Examen_EstomatologicoID),
    FOREIGN KEY (AreaID) REFERENCES Area(AreaID)
);
--35.
CREATE TABLE ConsentimientoInformado (
    ConsentimientoID SERIAL PRIMARY KEY,      -- Identificador único y autoincremental para cada registro de consentimiento
    Fecha DATE NOT NULL,                      -- Fecha en que se otorgó el consentimiento
    Consentimiento BYTEA NOT NULL,            -- Imagen del consentimiento en formato binario
    DiagnosticoID INTEGER REFERENCES Diagnosticos(DiagnosticoID) -- Clave foránea referenciando a la tabla Diagnostico
);
--36.
CREATE TABLE Tipo_Alergias (
    TipoAlergiasID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada tipo de alergia
    Nombre VARCHAR(100) NOT NULL,        -- Nombre del tipo de alergia, con una longitud máxima de 100 caracteres
    Descripcion TEXT                     -- Descripción del tipo de alergia
);
--37.
CREATE TABLE Alergias (
    AlergiasID SERIAL PRIMARY KEY,           -- Identificador único y autoincremental para cada alergia
    Nombre VARCHAR(100) NOT NULL,            -- Nombre de la alergia, con una longitud máxima de 100 caracteres
    Descripcion TEXT,                        -- Descripción de la alergia
    Tipo_EnfermedadID INTEGER REFERENCES Tipo_Alergias(TipoAlergiasID)  -- Clave foránea referenciando a la tabla Tipo_Alergias
);

--38.
CREATE TABLE Alergias_X_Pacientes (
    DiagnosticoID INTEGER REFERENCES Diagnosticos(DiagnosticoID),                               -- Clave foránea referenciando a la tabla Diagnostico
    AlergiasID INTEGER REFERENCES Alergias(AlergiasID),  -- Clave foránea referenciando a la tabla Alergias
    PRIMARY KEY (DiagnosticoID, AlergiasID)              -- Clave primaria compuesta por DiagnosticoID y AlergiasID
);

--39.
CREATE TABLE Tipo_Enfermedad (
    TipoEnfermedadID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada tipo de enfermedad
    Nombre VARCHAR(100) NOT NULL,        -- Nombre del tipo de enfermedad, con una longitud máxima de 100 caracteres
    Descripcion TEXT                     -- Descripción del tipo de enfermedad
);

--40.
CREATE TABLE Enfermedad (
    EnfermedadID SERIAL PRIMARY KEY,           -- Identificador único y autoincremental para cada enfermedad
    Nombre VARCHAR(100) NOT NULL,              -- Nombre de la enfermedad, con una longitud máxima de 100 caracteres
    Descripcion TEXT,                          -- Descripción de la enfermedad
    Tipo_EnfermedadID INTEGER REFERENCES Tipo_Enfermedad(TipoEnfermedadID) -- Clave foránea referenciando a la tabla Tipo_Enfermedad
);

--41.
CREATE TABLE Enfermeda_X_Paciente (
    EnfermedadID INTEGER REFERENCES Enfermedad(EnfermedadID), -- Clave foránea referenciando a la tabla Enfermedad
    DiagnosticoID INTEGER REFERENCES Diagnosticos(DiagnosticoID), -- Clave foránea referenciando a la tabla Diagnostico
    PRIMARY KEY (EnfermedadID, DiagnosticoID)                  -- Clave primaria compuesta por EnfermedadID y DiagnosticoID
);

--42.
CREATE TABLE Medicamentos (
    MedicamentoID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada medicamento
    Nombre VARCHAR(100) NOT NULL      -- Nombre del medicamento, con una longitud máxima de 100 caracteres
);

--43.
CREATE TABLE Medicamentos_Recetados (
    Medicamentos_RecetadosID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada registro de medicamento recetado
    Observaciones TEXT,                          -- Observaciones asociadas a la receta de medicamento
    DiagnosticoID INTEGER REFERENCES Diagnosticos(DiagnosticoID) -- Clave foránea referenciando a la tabla Diagnostico
);

--44.
CREATE TABLE Descripcion_Medicamentos (
    Medicamentos_RecetadosID INTEGER,
    Dosis VARCHAR(255),
    Motivo TEXT,
    MedicamentosID INTEGER,
    PRIMARY KEY (Medicamentos_RecetadosID, MedicamentosID),
    FOREIGN KEY (Medicamentos_RecetadosID) REFERENCES Medicamentos_Recetados(Medicamentos_RecetadosID),
    FOREIGN KEY (MedicamentosID) REFERENCES Medicamentos(MedicamentoID)
);


--45.
CREATE TABLE SignosVitales (
    Signos_VitalesID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada registro de signos vitales
    Presion_Arterial VARCHAR(20),
    Pulso INTEGER,
    Peso DECIMAL(5,2),
    F_Respiratoria INTEGER,
    Saturacion_De_Oxigeno INTEGER,
    DiagnosticoID INTEGER REFERENCES Diagnosticos(DiagnosticoID) -- Clave foránea referenciando a la tabla Diagnostico
);

--46.
CREATE TABLE Odontogramas (
    OdontogramaID SERIAL PRIMARY KEY,  -- Identificador único y autoincremental para cada registro de odontograma
    Total_Piezas_Sana INTEGER,
    Total_Ausentes INTEGER,
    Observaciones TEXT,
    Pronostico TEXT,
    DiagnosticoID INTEGER REFERENCES Diagnosticos(DiagnosticoID) -- Clave foránea referenciando a la tabla Diagnostico
);

--47.
CREATE TABLE Estados_Piezas_Dentarias (
    Estados_Piezas_DentariasID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada estado de pieza dental
    Nombre VARCHAR(100),
    Codigo VARCHAR(20) UNIQUE -- Código único para cada estado de pieza dental
);

--48.
CREATE TABLE Cuadrantes (
    CuadranteID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada cuadrante dental
    Nombre VARCHAR(100),
    Descripcion TEXT,
    Codigo VARCHAR(20) UNIQUE -- Código único para cada cuadrante dental
);

--49.
CREATE TABLE Dientes (
    DienteID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada diente
    Nombre VARCHAR(100),
    Numero INTEGER,
    CuadranteID INTEGER REFERENCES Cuadrantes(CuadranteID) -- Clave foránea referenciando a la tabla Cuadrantes
);

--50.
CREATE TABLE Plan_Tratamiento (
    Plan_TratamientoID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada plan de tratamiento
    Observaciones TEXT -- Campo para observaciones o notas asociadas al plan de tratamiento
);

--51.
CREATE TABLE Tratamientos (
    TratamientoID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada tratamiento
    Nombre VARCHAR(100),
    Codigo VARCHAR(20) UNIQUE, -- Código único para cada tratamiento
    Costo NUMERIC(10, 2) -- Costo del tratamiento, usando NUMERIC para precisión monetaria
);

--52.
CREATE TABLE Tratamiento_X_Clinica (
    TratamientoID INTEGER,
    ClinicaID INTEGER,
    PRIMARY KEY (TratamientoID, ClinicaID),
    FOREIGN KEY (TratamientoID) REFERENCES Tratamientos(TratamientoID),
    FOREIGN KEY (ClinicaID) REFERENCES Clinicas(ClinicaID)
);

--53.
CREATE TABLE Presupuestos (
    PresupuestoID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada presupuesto
    Costo NUMERIC(10, 2), -- Costo total del presupuesto
    Saldo NUMERIC(10, 2), -- Saldo pendiente del presupuesto
    Fecha_Creacion DATE, -- Fecha de creación del presupuesto
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID) -- Clave foránea referenciando a la tabla Plan_Tratamiento
);

--54.
CREATE TABLE ListaTratamiento (
    Lista_TratamientoID SERIAL PRIMARY KEY,  -- Identificador único y autoincremental para cada registro de tratamiento
    DienteID INTEGER REFERENCES Dientes(DienteID), -- Clave foránea referenciando a la tabla Dientes
    DiagnosticoID INTEGER REFERENCES Diagnosticos(DiagnosticoID), -- Clave foránea referenciando a la tabla Diagnosticos
    TratamientoID INTEGER REFERENCES Tratamientos(TratamientoID), -- Clave foránea referenciando a la tabla Tratamientos
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID), -- Clave foránea referenciando a la tabla Plan_Tratamiento
    EstudianteID INTEGER REFERENCES Usuarios(UsuarioID), -- Clave foránea referenciando a la tabla Estudiantes
    DocenteID INTEGER REFERENCES Usuarios(UsuarioID), -- Clave foránea referenciando a la tabla Docentes
    SeccionID INTEGER REFERENCES Secciones(SeccionesID) -- Clave foránea referenciando a la tabla Secciones
);


--55
CREATE TABLE Detalle_Presupuesto (
    ID_Detalle_Presupuesto SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada detalle de presupuesto
    ClinicaID INTEGER REFERENCES Clinicas(ClinicaID), -- Clave foránea referenciando a la tabla Clinicas
    TratamientoID INTEGER REFERENCES Tratamientos(TratamientoID), -- Clave foránea referenciando a la tabla Tratamientos
    EstadoID INTEGER REFERENCES EstadosAprovacionDocente(EstadoAprobacionID), -- Clave foránea referenciando a la tabla Estados
    NumeroDiente VARCHAR(10), -- Número o identificador del diente involucrado, limitado a 10 caracteres
    Monto NUMERIC(10, 2), -- Monto asociado al tratamiento, con precisión para valores monetarios
    PresupuestoID INTEGER REFERENCES Presupuestos(PresupuestoID), -- Clave foránea referenciando a la tabla Presupuestos
    Lista_TratamientoID INTEGER REFERENCES ListaTratamiento(Lista_TratamientoID) -- Clave foránea referenciando a la tabla ListaTratamiento
);

--56
CREATE TABLE Recibos (
    ReciboID SERIAL PRIMARY KEY,
    Nombre_Paciente VARCHAR(255),
    Dni VARCHAR(50),
    CodigoRecibo VARCHAR(50),
    TratamientoID INTEGER REFERENCES Tratamientos(TratamientoID),
    ClinicaID INTEGER REFERENCES Clinicas(ClinicaID),
    DocenteID INTEGER REFERENCES  Usuarios(UsuarioID) ,
    EstudianteID INTEGER REFERENCES Usuarios(UsuarioID) ,
    Monto DECIMAL(10, 2),
    CajeroID INTEGER REFERENCES Usuarios(UsuarioID) ,
    ID_Detalle_Presupuesto INTEGER REFERENCES Detalle_Presupuesto(ID_Detalle_Presupuesto)
);


--57.
CREATE TABLE Evolucion_Tratamiento (
    Evolucion_TratamientoID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada registro de evolución
    Nota_Final INTEGER, -- Nota final del tratamiento
    EstadoAprobacionID INTEGER REFERENCES EstadosAprobacionDocente(EstadoAprobacionID), -- Clave foránea referenciando a la tabla EstadosAprobacionDocente
    Lista_TratamientoID INTEGER REFERENCES ListaTratamiento(Lista_TratamientoID) -- Clave foránea referenciando a la tabla ListaTratamiento
);

--58.
CREATE TABLE Procedimientos_De_Evolucion (
    Procedimientos_De_EvolucioID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada procedimiento de evolución
    Fecha DATE, -- Fecha en que se realizó el procedimiento
    Procedimiento_Realizado TEXT, -- Detalles del procedimiento realizado
    EstadoAprobacionID INTEGER REFERENCES EstadosAprovacionDocente(EstadoAprobacionID), -- Clave foránea referenciando a la tabla EstadosAprobacionDocente
    Evolucion_TratamientoID INTEGER REFERENCES Evolucion_Tratamiento(Evolucion_TratamientoID) -- Clave foránea referenciando a la tabla Evolucion_Tratamiento
);

--59.
CREATE TABLE Lista_Dientes (
    OdontogramaID INTEGER,
    DienteID INTEGER,
    Estados_Piezas_DentariasID INTEGER,
    PRIMARY KEY (OdontogramaID, DienteID, Estados_Piezas_DentariasID),
    FOREIGN KEY (OdontogramaID) REFERENCES Odontogramas(OdontogramaID),
    FOREIGN KEY (DienteID) REFERENCES Dientes(DienteID),
    FOREIGN KEY (Estados_Piezas_DentariasID) REFERENCES Estados_Piezas_Dentarias(Estados_Piezas_DentariasID)
);

--60.
CREATE TABLE CirugiasBucal (
    CirugiaBucalID SERIAL PRIMARY KEY,  -- Identificador único y autoincremental para cada cirugía bucal
    Pieza_Dentaria INTEGER, -- Almacena la descripción de la pieza dentaria involucrada en la cirugía
    Diagnostico TEXT, -- Almacena la descripción del diagnóstico relacionado con la cirugía
    HistoraClinicaID INTEGER REFERENCES HistoriaClinica(HistoriaClinicaID), -- Clave foránea referenciando a la tabla Registros
    EstudianteID INTEGER REFERENCES Usuarios(UsuarioID), -- Clave foránea referenciando a la tabla Estudiantes
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID) -- Clave foránea referenciando a la tabla Plan_Tratamiento
);


--61.
CREATE TABLE TipoConductos (
    TipoConductosID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada tipo de conducto
    Nombre VARCHAR(100) NOT NULL, -- Nombre del tipo de conducto, con un límite de 100 caracteres
    Descripcion TEXT -- Descripción detallada del tipo de conducto
);


--62.
CREATE TABLE Periodontogramas (
    PeriodontogramasID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada periodontograma
    Nombre VARCHAR(100), -- Nombre descriptivo del periodontograma
    Imagen BYTEA, -- Almacena la imagen del periodontograma en formato binario
    PeriodonciaID INTEGER REFERENCES Periodoncias(PeriodonciaID) -- Clave foránea referenciando a la tabla Periodoncia
);



--63.

--63.

--64.

--65.


--66.

--67.

--68.

--69.

--70.
