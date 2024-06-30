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

--61 
CREATE TABLE Periodoncias (
    PeriodonciaID SERIAL PRIMARY KEY,
    Color BOOLEAN,
    Explique_Color TEXT,
    Tamaño BOOLEAN,
    Explique_Tamaño TEXT,
    Contorno BOOLEAN,
    Explique_Contorno TEXT,
    forma BOOLEAN,
    Explique_forma TEXT,
    ConsistencIa BOOLEAN,
    Explique_ConsistencIa TEXT,
    Textura BOOLEAN,
    Explique_Textura TEXT,
    Posicion BOOLEAN,
    Explique_Posicion TEXT,
    Valor_Riesgo_Peridontal VARCHAR(255),
    Recomendaciones TEXT,
    Diagnostico_General TEXT,
    Pronostico_General TEXT,
    Fundamentos_Pronostico TEXT,
    HistoriaClinicaID INTEGER REFERENCES HistoriaClinica(HistoriaClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID INTEGER REFERENCES Usuarios(UsuarioID)
);



--62.
CREATE TABLE Periodontogramas (
    PeriodontogramasID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada periodontograma
    Nombre VARCHAR(100), -- Nombre descriptivo del periodontograma
    Imagen BYTEA, -- Almacena la imagen del periodontograma en formato binario
    PeriodonciaID INTEGER REFERENCES Periodoncias(PeriodonciaID) -- Clave foránea referenciando a la tabla Periodoncia
);


--63
CREATE TABLE Operatorias (
    OperatoriaID SERIAL PRIMARY KEY,
    Sobremordida_Vertical BOOLEAN,
    Mordida_Abierta BOOLEAN,
    Ruidos_En_Boca BOOLEAN,
    Sobremordida_Horizontal BOOLEAN,
    Hiperlaxitud_Ligamentos BOOLEAN,
    Abrasion BOOLEAN,
    Erosion BOOLEAN,
    Atriccion BOOLEAN,
    Bruxismo BOOLEAN,
    imagen_diagnostico_inicial BYTEA,
    imagen_diagnostico_Final BYTEA,
    HistoriaClinicaID INTEGER REFERENCES HistoriaClinica(HistoriaClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID INTEGER REFERENCES Usuarios(UsuarioID)
);




--64.
CREATE TABLE OdontoPedriatrias (
    OdontoPedriatriaID SERIAL PRIMARY KEY,
    Prenatales TEXT,
    Perinatales TEXT,
    Patologicos TEXT,
    Farmacologicos TEXT,
    Quirurgicos_Hospitalarios TEXT,
    Traumaticos TEXT,
    alergias_Medicamento BOOLEAN,
    Especificacion_alergias_Medicamento TEXT,
    Alergia_Anestesico BOOLEAN,
    Especificacion_Alergia_Anestesico TEXT,
    Alergia_Alimentos BOOLEAN,
    Especificacion_Alergia_Alimentos TEXT,
    Transfunciones TEXT,
    Perfil VARCHAR(7) CHECK (Perfil IN ('CONCAVO', 'CONVEXO', 'RECTO')),
    Cabeza VARCHAR(14) CHECK (Cabeza IN ('MESOCEFALICO', 'DOLICOCEFALICA', 'BRANQUICEFALICA')),
    Denticion VARCHAR(10) CHECK (Denticion IN ('DECIDUA', 'MIXTA', 'PERMANENTE')),
    Clase_Molar_Derecha VARCHAR(3) CHECK (Clase_Molar_Derecha IN ('I', 'II', 'III')),
    Clase_Molar_Izquierda VARCHAR(3) CHECK (Clase_Molar_Izquierda IN ('I', 'II', 'III')),
    Plano_Recto VARCHAR(9) CHECK (Plano_Recto IN ('DERECHO', 'IZQUIERDO')),
    Plano_Mesial VARCHAR(9) CHECK (Plano_Mesial IN ('DERECHO', 'IZQUIERDO')),
    Plano_Distal VARCHAR(9) CHECK (Plano_Distal IN ('DERECHO', 'IZQUIERDO')),
    Clase_Canina_Derecha VARCHAR(3) CHECK (Clase_Canina_Derecha IN ('I', 'II', 'III')),
    Clase_Canina_Izquierda VARCHAR(3) CHECK (Clase_Canina_Izquierda IN ('I', 'II', 'III')),
    Sobre_mordida_Horizontal NUMERIC(5, 2),
    Piezas_Involucradas_Modida_Horizontal INTEGER,
    Sobre_Mordida_Vertical NUMERIC(5, 2),
    Piezas_Involucradas_Modida_Vertical INTEGER,
    Mordida_Cruzada BOOLEAN,
    Anterior BOOLEAN,
    Posterior BOOLEAN,
    Piezas_Involucradas_Mordida_Cruzada INTEGER,
    Mordida_Borde_A_Borde BOOLEAN,
    Mordida_Abierta BOOLEAN,
    Razon_Mordida_Abierta TEXT,
    Linea_Media BOOLEAN,
    Arco_Dentario VARCHAR(5) CHECK (Arco_Dentario IN ('TIPO1', 'TIPO2')),
    Tipo_Respiracion VARCHAR(5) CHECK (Tipo_Respiracion IN ('NASAL', 'ORAL')),
    Ronca BOOLEAN,
    Rechina_Dientes BOOLEAN,
    Sellado_Labial BOOLEAN,
    Desglucion VARCHAR(7) CHECK (Desglucion IN ('INFANTIL', 'ADULTO')),
    Tonicidad_Labial VARCHAR(11) CHECK (Tonicidad_Labial IN ('NORMAL', 'HIPERTONISMO', 'HIPOTONISMO')),
    Apertura_Bucal NUMERIC(5, 2),
    Desgaste_Caninos BOOLEAN,
    Habitos_Bucales VARCHAR(100) CHECK (Habitos_Bucales IN ('SUCCION DIGITAL', 'CHUPON', 'MORDERSE LAS UÑAS', 'PROTECCION LINGUAL')),
    Presencia_Sangrado BOOLEAN,
    Movilidad_Dentaria BOOLEAN,
    Fisiologica BOOLEAN,
    Patologica BOOLEAN,
    Presencia_Abceso BOOLEAN,
    Localizacion_Presencia_Absceso TEXT,
    Halitosis BOOLEAN,
    Alimentos_Mas_Consumidos TEXT,
    Carbohidratos TEXT,
    Proteinas TEXT,
    Grasas TEXT,
    Come_Frecuentemente_Entre_Comidas BOOLEAN,
    Frecuencia_Comidas TEXT,
    Uso_Biberon VARCHAR(9) CHECK (Uso_Biberon IN ('DIURNO', 'NOCTURNO', 'MADRUGADA')),
    Frecuencia_uso_de_biberon TEXT,
    Numero_Biberones_Por_Dia INTEGER,
    Onzas_De_Leche_Biberon INTEGER,
    Agregados_Biberon TEXT,
    Cepillado_Despues_Biberon BOOLEAN,
    Duerme_con_el_biberon BOOLEAN,
    Uso_Vaso_Entrenador BOOLEAN,
    Leche_de_Vaso_Entrenador TEXT,
    Consumo_Bebidas_Azucaradas TEXT,
    Consumo_Jugos_Azucarados TEXT,
    Mantiene_Lactancia_Materna BOOLEAN,
    Exclusiva BOOLEAN,
    Combinada BOOLEAN,
    Combinacion_Lactancia TEXT,
    Observaciones TEXT,
    Imagen_Control_Placa_oleary BYTEA,
    HistoriaClinicaID INTEGER REFERENCES HistoriaClinica(HistoriaClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID INTEGER REFERENCES Usuarios(UsuarioID)
);


--65.
CREATE TABLE Emergencias (
    EmergenciaID SERIAL PRIMARY KEY,
    Num_de_Diente INTEGER,
    Num_dientes_Con_Caries INTEGER,
    Num_dientes_Con_Fractura INTEGER,
    Exposicion_Pulpar TEXT,
    Num_Protesis_Dentales INTEGER,
    Presencia_Dolor BOOLEAN,
    Tipo_Dolor VARCHAR(20) CHECK (Tipo_Dolor IN ('LOCALIZADO', 'IRRADIADO', 'ESPORANEO', 'ESTIMULOS', 'NOCTURNOS')),
    Intensidad INTEGER CHECK (Intensidad IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
    PresenciaDeFistula BOOLEAN,
    Presencia_Bolsa_Periodontal BOOLEAN,
    Movilidad BOOLEAN,
    Grado_movilidad INTEGER CHECK (Grado_movilidad IN (1, 2, 3)),
    Prueba_Termica BOOLEAN,
    Prueba_Termica_resultado VARCHAR(1) CHECK (Prueba_Termica_resultado IN ('+', '-')),
    Palpitacion BOOLEAN,
    Palpitacion_resultado VARCHAR(1) CHECK (Palpitacion_resultado IN ('+', '-')),
    percucion_Vertical BOOLEAN,
    percucion_Vertical_Resultado VARCHAR(1) CHECK (percucion_Vertical_Resultado IN ('+', '-')),
    percucion_Horizontal BOOLEAN,
    percucion_Horizontal_Resultado VARCHAR(1) CHECK (percucion_Horizontal_Resultado IN ('+', '-')),
    imagen BYTEA,
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    HistoriaClinicaID INTEGER REFERENCES HistoriaClinica(HistoriaClinicaID),
    EstudianteID INTEGER REFERENCES Usuarios(UsuarioID)
);



--66.
CREATE TABLE TipoConductos (
    TipoConductosID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada tipo de conducto
    Nombre VARCHAR(100) NOT NULL, -- Nombre del tipo de conducto, con un límite de 100 caracteres
    Descripcion TEXT -- Descripción detallada del tipo de conducto
);


--67.
CREATE TABLE Endodoncias (
    EndodonciaID SERIAL PRIMARY KEY,
    Num_Organo_dentario INTEGER,
    Presencia_de_Dolor VARCHAR(20) CHECK (Presencia_de_Dolor IN ('LOCALIZADO', 'IRRADIADO', 'ESPONTANEOS', 'NOCTURNOS', 'PROVOCADOS')),
    Estimulo VARCHAR(20) CHECK (Estimulo IN ('FRIO', 'CALOR', 'DULCE', 'MASTICADO')),
    Movilidad VARCHAR(20) CHECK (Movilidad IN ('FISIOLOGICA(SANO)', 'GRADO 1', 'GRADO 2', 'GRADO 3')),
    Pruebas_Termicas TEXT,
    Palpitacion BOOLEAN,
    Percucion BOOLEAN,
    Profundida_Sondaje TEXT,
    Presencia_Bolsa_Periodontal BOOLEAN,
    Profundidad_Bolsa_Periodontal TEXT,
    Presencia_Trayecto_fistuloso BOOLEAN,
    Caries BOOLEAN,
    Restauraciones BOOLEAN,
    R_Interna BOOLEAN,
    R_Externa BOOLEAN,
    Zona_Radiolucida_periapipal BOOLEAN,
    Tratamiento_Conductos_Previos BOOLEAN,
    Esp_ligamento_periodontal_Ensanchado BOOLEAN,
    Discontinuidad_del_espacio BOOLEAN,
    Tamaño_Camara_pulpar VARCHAR(20) CHECK (Tamaño_Camara_pulpar IN ('NORMAL', 'ESTRECHA', 'ENSANCHADA', 'RETRAIDA')),
    Tamaño_condunto VARCHAR(20) CHECK (Tamaño_condunto IN ('NORMAL', 'ESTRECHO', 'AMPLIO', 'APICE ABIERTO')),
    Diagnostico_Pulpar TEXT,
    Diagnostico_Periapical TEXT,
    Plan_Tratamiento INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    HistoriaClinicaID INTEGER REFERENCES HistoriaClinica(HistoriaClinicaID),
    EstudianteID INTEGER REFERENCES Usuarios(UsuarioID)
);


--68.
CREATE TABLE Conductos (
    EndodonciaID INTEGER,
    TipoConductosID INTEGER,
    Log_Trabajo DECIMAL,
    Puntos_De_Referencia VARCHAR(100),
    Lima_Maestra DECIMAL,
    Cono_Maestro DECIMAL,
    PRIMARY KEY (EndodonciaID, TipoConductosID),
    FOREIGN KEY (EndodonciaID) REFERENCES Endodoncias(EndodonciaID)
);


--69.

--70.
