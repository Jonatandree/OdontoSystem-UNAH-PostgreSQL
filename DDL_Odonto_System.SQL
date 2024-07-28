DROP TABLE Ortodoncias;
DROP TABLE Estado_Bucal_Ortodoncia;
DROP TABLE Tipo_Biotipo_Facial;
DROP TABLE Tipo_Forma_Paladar;
DROP TABLE Tipo_Desviacion;
DROP TABLE Tipo_Relacion_Clases;
DROP TABLE Tipo_Protrusion_Labial;
DROP TABLE Tipo_Relacion_Tercios;
DROP TABLE Tipo_Musculatura_Peribucal;
DROP TABLE Tipo_Forma_Cara;
DROP TABLE protesis_total;
DROP TABLE Tipo_Frenillo_Consistencia;
DROP TABLE Tipo_Frenillo_Insercion;
DROP TABLE Tipo_Fosa_Retro_Retentiva;
DROP TABLE Tipo_Fosa_Retro_Profunda;
DROP TABLE Tipo_Zona_Cierre;
DROP TABLE Tipo_Tuberosidad_Maxilar;
DROP TABLE Tipo_Rebordes_Maxilar;
DROP TABLE Tipo_Simetria_Maxilar;
DROP TABLE Tipo_Tubo_Reten;
DROP TABLE Tipo_Forma_Maxilar;
DROP TABLE Tipo_Saliva;
DROP TABLE Tipo_Lengua_Tamaño;
DROP TABLE Tipo_Lengua_Posicion;
DROP TABLE Tipo_Tamaño_Papilla;
DROP TABLE Tipo_Consistencia_Papilla;
DROP TABLE Tipo_Torus;
DROP TABLE Tipo_Mucosa_Maxilar;
DROP TABLE Color_de_ojos;
DROP TABLE Tipo_Color_Piel;
DROP TABLE Tipo_Forma_Facial;
DROP TABLE Tipo_Fenotipo_Facial;
DROP TABLE Pilares;
DROP TABLE Parcial_Removible;
DROP TABLE Tipo_Dolor_Emergencias;
DROP TABLE Emergencias;
DROP TABLE Tipo_Resultado_Emergencia;
DROP TABLE Conductos;
DROP TABLE Tipo_Estimulo_Endodoncia;
DROP TABLE Tipo_Dolor_Endodoncias;
DROP TABLE Endodoncias;
DROP TABLE Tipo_Tamaño_Conducto;
DROP TABLE Tipo_Tamaño_Camara;
DROP TABLE Tipo_Dolor;
DROP TABLE Tipo_Estimulo;
DROP TABLE Tipo_Grado_Movilidad;
DROP TABLE Tipo_Conductos;
DROP TABLE Tipo_Uso_Biberon_X_Odonto_Pedriatrias;
DROP TABLE Habitos_Bucales_X_Odonto_Pedriatrias;
DROP TABLE Odonto_Pedriatrias;
DROP TABLE Tipo_Perfil;
DROP TABLE Tipo_Desglucion;
DROP TABLE Tipo_Respiracion;
DROP TABLE Tipo_Arco_Odonto_Pedriatrias;
DROP TABLE Tipo_Planos_Odonto_Pedriatrias;
DROP TABLE Tipo_Cabeza;
DROP TABLE Tipo_Denticion;
DROP TABLE Tipo_Clase_Num_Romano;
DROP TABLE Tonicidad_Labial;
DROP TABLE Habitos_Bucales;
DROP TABLE Tipo_Uso_Biberon;
DROP TABLE Operatorias;
DROP TABLE Periodontogramas;
DROP TABLE Periodoncias;
DROP TABLE Cirugias_Bucal;
DROP TABLE Lista_Dientes;
DROP TABLE Evolucion_Procedimiento;
DROP TABLE Evolucion_Tratamiento;
DROP TABLE Recibos;
DROP TABLE Detalle_Presupuesto;
DROP TABLE Lista_Tratamiento;
DROP TABLE Presupuestos;
DROP TABLE Tratamiento_X_Clinica;
DROP TABLE Tratamientos;
DROP TABLE Plan_Tratamiento;
DROP TABLE Dientes;
DROP TABLE Cuadrantes;
DROP TABLE Estados_Piezas_Dentarias;
DROP TABLE Odontogramas;
DROP TABLE Signos_Vitales;
DROP TABLE Descripcion_Medicamentos;
DROP TABLE Medicamentos_Recetados;
DROP TABLE Medicamentos;
DROP TABLE Enfermeda_X_Paciente;
DROP TABLE Enfermedad;
DROP TABLE Tipo_Enfermedad;
DROP TABLE Alergias_X_Pacientes;
DROP TABLE Alergias;
DROP TABLE Tipo_Alergias;
DROP TABLE Consentimiento_Informado;
DROP TABLE Area_X_Examen;
DROP TABLE Examen_Estomatologico;
DROP TABLE Area;
DROP TABLE Consumo_Drogas;
DROP TABLE Tipo_Droga;
DROP TABLE Diagnosticos;
DROP TABLE Privilegios_X_Cargo;
DROP TABLE Tipo_Tecnica_Radiográfica;
DROP TABLE Alumnos_X_Seccion;
DROP TABLE Secciones;
DROP TABLE Cobros_Pendientes;
DROP TABLE Radiografias_X_remision;
DROP TABLE Remisiones_imagenologia;
DROP TABLE Tickets;
DROP TABLE Remisiones;
DROP TABLE Estados_Aprobacion_Docente;
DROP TABLE Citas;
DROP TABLE Historia_Clinica;
DROP TABLE Clases;
DROP TABLE Clinicas;
DROP TABLE Departamentos;
DROP TABLE Usuarios;
DROP TABLE Privilegios;
DROP TABLE Correos;
DROP TABLE Expedientes;
DROP TABLE Pacientes;
DROP TABLE Contactos_Referencias;
DROP TABLE Persona_Documentos;
DROP TABLE Personas;
DROP TABLE Cargos;
DROP TABLE Tipo_Documentos;
DROP TABLE Nacionalidades;
DROP TABLE Estado_Civil;
DROP TABLE Sexos;
DROP TABLE Tipo_Radiografias;
DROP TABLE Ocupaciones;



--1
CREATE TABLE Ocupaciones (
    OcupacionID SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE 
);
--2
CREATE TABLE Tipo_Radiografias (
    RadiografiaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE,
    Costo DECIMAL(10, 2) NOT NULL
);

--3.
CREATE TABLE Sexos (
    SexoID SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE
);

--4.
CREATE TABLE Estado_Civil (
    Estado_CivilID SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);


--5.
CREATE TABLE Nacionalidades (
    NacionalidadID SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);
--6.
CREATE TABLE Tipo_Documentos (
    Tipo_DocumentoID SERIAL PRIMARY KEY,
    Nombre_Documento VARCHAR(50) NOT NULL
);

--7.
CREATE TABLE Cargos (
    CargoID SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE,
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
    SexoID INTEGER REFERENCES Sexos(SexoID),
    Estado_CivilID INTEGER REFERENCES Estado_Civil(Estado_CivilID),
    NacionalidadID INTEGER REFERENCES Nacionalidades(NacionalidadID)
);
--9.
CREATE TABLE Persona_Documentos (
    PersonaID INTEGER,
    Tipo_DocumentoID INTEGER,
    Documento VARCHAR(100) UNIQUE,
    PRIMARY KEY (PersonaID, Tipo_DocumentoID),
    FOREIGN KEY (PersonaID) REFERENCES Personas(PersonaID),
    FOREIGN KEY (Tipo_DocumentoID) REFERENCES Tipo_Documentos(Tipo_DocumentoID)
);
--10.
CREATE TABLE Contactos_Referencias (
    Persona_ResponsableID SERIAL PRIMARY KEY,
    Primer_Nombre VARCHAR(50) NOT NULL,
    Primer_Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(10)
);
--11.
CREATE TABLE Pacientes (
    PacienteID SERIAL PRIMARY KEY,
    Analfabeta VARCHAR(4),
    Medico_PersonalID INTEGER REFERENCES Contactos_Referencias(Persona_ResponsableID),
    Persona_ResponsableID INTEGER REFERENCES Contactos_Referencias(Persona_ResponsableID),
    Odontologo_AnteriorID INTEGER REFERENCES Contactos_Referencias(Persona_ResponsableID),
    OcupacionID INTEGER REFERENCES Ocupaciones(OcupacionID),
    PersonaID INTEGER REFERENCES Personas(PersonaID)
);
--12.
CREATE TABLE Expedientes (
    ExpedienteID SERIAL PRIMARY KEY,
    Fecha_Creacion TIMESTAMP NOT NULL,
    Numero_Expediente VARCHAR(50) NOT NULL UNIQUE,
    PacienteID INTEGER REFERENCES Pacientes(PacienteID)
);
--13.
CREATE TABLE Correos (
    CorreosID SERIAL PRIMARY KEY,
    Correo VARCHAR(75) NOT NULL,
    Contraseña text NOT NULL
);
--14.
CREATE TABLE Privilegios (
    PrivilegiosID SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL UNIQUE,
    Descripcion TEXT
);
--15.
CREATE TABLE Usuarios (
    NumeroCuenta VARCHAR(20),
    CorreoID INTEGER REFERENCES Correos(CorreosID),
    CargoID INTEGER REFERENCES Cargos(CargoID),
    PersonaID INTEGER REFERENCES Personas(PersonaID),
    PRIMARY KEY (NumeroCuenta, CargoID)
);
--16.
CREATE TABLE Departamentos (
    DepartamentoID SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE,
    Jefe_Departamento INTEGER REFERENCES Personas(PersonaID)
);
--17
CREATE TABLE Clinicas (
    ClinicaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL UNIQUE,
    DepartamentoID INTEGER REFERENCES Departamentos(DepartamentoID)
);
--18
CREATE TABLE Clases (
    Codigo_ClaseID VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE,
    DepartamentoID INTEGER REFERENCES Departamentos(DepartamentoID)
);
--19.
CREATE TABLE Historia_Clinica (
    Historia_ClinicaID SERIAL PRIMARY KEY,
    Fecha_Creacion TIMESTAMP NOT NULL,
    Numero_Registro INTEGER NOT NULL,
    ExpedienteID INTEGER REFERENCES Expedientes(ExpedienteID)
);
--20.
CREATE TABLE Citas (
    CitasID SERIAL PRIMARY KEY,
    Fecha DATE NOT NULL,
    Estado INTEGER,
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    PacienteID INTEGER REFERENCES Pacientes(PacienteID)
);
--21
CREATE TABLE Estados_Aprobacion_Docente (
    Estado_AprobacionID SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE
);
--22.
CREATE TABLE Remisiones (
    RemisionID SERIAL PRIMARY KEY,
    PacienteID INTEGER REFERENCES Pacientes(PacienteID),
    ClinicaID INTEGER REFERENCES Clinicas(ClinicaID),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    EstadoID INTEGER REFERENCES Estados_Aprobacion_Docente(Estado_AprobacionID)
);

--23.
CREATE TABLE Tickets (
    TicketsID SERIAL PRIMARY KEY,
    Fecha TIMESTAMP NOT NULL,
    Numero_De_Turno INTEGER NOT NULL,
    RemicionID INTEGER REFERENCES Remisiones(RemisionID)
);
--24.
CREATE TABLE Remisiones_imagenologia (
    Remisio_ImagenologiaID SERIAL PRIMARY KEY,
    PacienteID INTEGER REFERENCES Pacientes(PacienteID),
    imagen_remision TEXT,
    centro_medico VARCHAR(100),
    ClinicaID INTEGER REFERENCES Clinicas(ClinicaID)
);
--25.
CREATE TABLE Radiografias_X_remision (
    Radiografias_X_remisionID SERIAL PRIMARY KEY,
    Imagen_Radiografia TEXT,
    RadiografiaID INTEGER REFERENCES Tipo_Radiografias(RadiografiaID),
    Remisio_ImagenologiaID INTEGER REFERENCES Remisiones_imagenologia(Remisio_ImagenologiaID)
);
--26.
CREATE TABLE Cobros_Pendientes (
    Cobros_PendientesID SERIAL PRIMARY KEY,
    Concepto VARCHAR(255),
    Estado VARCHAR(50),
    monto DECIMAL(10, 2),
    ReciboID INTEGER REFERENCES Recibos(ReciboID);
    PacienteID INTEGER REFERENCES Pacientes(PacienteID),
    Remisiones_imagenologiaID INTEGER REFERENCES Remisiones_imagenologia(Remisio_ImagenologiaID)
);
--27.
CREATE TABLE Secciones (
    SeccionesID INTEGER PRIMARY KEY,        
    Horario INTEGER,                 
    Año_Academico VARCHAR(50),        
    Semestre_Academico VARCHAR(50),   
    DoctorID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta), 
    Codigo_ClaseID VARCHAR(10) REFERENCES Clases(Codigo_ClaseID)      
);

--28.
CREATE TABLE Alumnos_X_Seccion (
    SeccionesID INTEGER NOT NULL,           
    AlumnoID VARCHAR(20) NOT NULL,                
    Nota_Final DECIMAL(10,2),                
    PRIMARY KEY (SeccionesID, AlumnoID),  
    FOREIGN KEY (SeccionesID) REFERENCES Secciones(SeccionesID),
    FOREIGN KEY (AlumnoID) REFERENCES Usuarios(NumeroCuenta)          
);

CREATE TABLE Tipo_Tecnica_Radiográfica (
    Tipo_Tecnica_RadiográficaID SERIAL PRIMARY KEY,
    Nombre_Tecnica_Radiográfica TEXT NOT NULL UNIQUE
);

--30.
CREATE TABLE Privilegios_X_Cargo (
    CargoID INTEGER NOT NULL,                        
    PrivilegiosID INTEGER NOT NULL,                
    PRIMARY KEY (CargoID, PrivilegiosID),           
    FOREIGN KEY (CargoID) REFERENCES Cargos(CargoID), 
    FOREIGN KEY (PrivilegiosID) REFERENCES Privilegios(PrivilegiosID) 
);

--31.
CREATE TABLE Diagnosticos (
    DiagnosticoID SERIAL PRIMARY KEY, 
    Fecha_Creacion DATE, 
    Motivo_Consulta TEXT, 
    Sintoma_Principal TEXT, 
    Historia_de_Enfermedad TEXT,
    Interrogatorio_ORL TEXT,
    Interrogatorio_Osteomuscular  TEXT,
    Interrogatorio_Cardiovascular  TEXT,
    Interrogatorio_Respiratorio  TEXT,
    Interrogatorio_Endocrino TEXT,
    Interrogatorio_Circulatorio TEXT,
    Interrogatorio_Gastrointestinal TEXT,
    Antecedentes_Adulto TEXT,
    Inmunoalérgicos TEXT,
    Menarquia TEXT,
    FUM TEXT,
    Método_Plan_Familiar TEXT,
    Menopausia  TEXT,
    G INTEGER,
    P INTEGER,
    A INTEGER,
    O INTEGER,
    HV INTEGER,
    HM INTEGER,
    C INTEGER,
    Cigarros_Diarios INTEGER,
    Hace_Cuanto_Fuma INTEGER, 
    Consume_Alcoho BOOLEAN,
    frecuencia_Consumo_Alcohol_Semanal INTEGER,
    Usa_Drogas BOOLEAN,
    Interconsultas TEXT, 
    Estado_Gestacion BOOLEAN, 
    Periodo_Menstrual BOOLEAN, 
    Consume_Tabaco BOOLEAN, 
    Apiñamiento_Dental BOOLEAN, 
    Dificultad_Respiratoria BOOLEAN, 
    Brumismo BOOLEAN, 
    Piersin_Bucal BOOLEAN, 
    Usa_Protesis_Dental BOOLEAN, 
    Observaciones TEXT, 
    Frecuencia_Cepillado_Por_Dia INTEGER, 
    Tiempo_De_Cepillado VARCHAR(50), 
    Tamaño_De_Cepillo VARCHAR(50), 
    Tipo_De_Cerdas_Del_Cepillo VARCHAR(50), 
    Presion_Ejercida_Al_Cepillarse VARCHAR(50), 
    Usa_Hilo_Dental BOOLEAN, 
    Sangrado_Encillas BOOLEAN, 
    Comentario TEXT, 
    Apariencia_General TEXT,
    Revision_ORL TEXT,
    Revision_Cuello TEXT,
    Revision_Cardiovascular TEXT,
    Revision_Extremidades TEXT,
    Tipo_Disfuncion_Temporomandibular TEXT,
    Ruidos_Articulares TEXT,
    Tecnica_Radiográfica INTEGER REFERENCES Tipo_Tecnica_Radiográfica(Tipo_Tecnica_RadiográficaID),
    Organo_Dentario TEXT, 
    Motivo_Examen_Radiografico TEXT,
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta), 
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta) 
);




CREATE TABLE Tipo_Droga (
    DrogaID SERIAL PRIMARY KEY,
    Nombre_Droga TEXT NOT NULL UNIQUE
);

CREATE TABLE Consumo_Drogas (
    DiagnosticoID INTEGER NOT NULL,
    DrogaID INTEGER NOT NULL,
    Historia_ClinicaID INTEGER NOT NULL,
    HaceCuantoConsumeDrogas INTEGER NOT NULL, 
    PRIMARY KEY (DiagnosticoID, DrogaID, Historia_ClinicaID),
    FOREIGN KEY (DiagnosticoID) REFERENCES Diagnosticos(DiagnosticoID),
    FOREIGN KEY (DrogaID) REFERENCES Tipo_Droga(DrogaID),
    FOREIGN KEY (Historia_ClinicaID) REFERENCES Historia_Clinica(Historia_ClinicaID)
);

--32.
CREATE TABLE Area (
    AreaID SERIAL PRIMARY KEY,    
    Nombre VARCHAR(100) NOT NULL UNIQUE    
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
CREATE TABLE Consentimiento_Informado (
    ConsentimientoID SERIAL PRIMARY KEY,      -- Identificador único y autoincremental para cada registro de consentimiento
    Fecha DATE NOT NULL,                      -- Fecha en que se otorgó el consentimiento
    Consentimiento BYTEA NOT NULL,            -- Imagen del consentimiento en formato binario
    DiagnosticoID INTEGER REFERENCES Diagnosticos(DiagnosticoID) -- Clave foránea referenciando a la tabla Diagnostico
);
--36.
CREATE TABLE Tipo_Alergias (
    TipoAlergiasID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada tipo de alergia
    Nombre VARCHAR(100) NOT NULL UNIQUE,        -- Nombre del tipo de alergia, con una longitud máxima de 100 caracteres
    Descripcion TEXT                     -- Descripción del tipo de alergia
);
--37.
CREATE TABLE Alergias (
    AlergiasID SERIAL PRIMARY KEY,           -- Identificador único y autoincremental para cada alergia
    Nombre VARCHAR(100) NOT NULL UNIQUE,            -- Nombre de la alergia, con una longitud máxima de 100 caracteres
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
    Nombre VARCHAR(100) NOT NULL UNIQUE,        -- Nombre del tipo de enfermedad, con una longitud máxima de 100 caracteres
    Descripcion TEXT                     -- Descripción del tipo de enfermedad
);

--40.
CREATE TABLE Enfermedad (
    EnfermedadID SERIAL PRIMARY KEY,           -- Identificador único y autoincremental para cada enfermedad
    Nombre VARCHAR(100) NOT NULL UNIQUE,              -- Nombre de la enfermedad, con una longitud máxima de 100 caracteres
    Descripcion TEXT,                          -- Descripción de la enfermedad
    Tipo_EnfermedadID INTEGER REFERENCES Tipo_Enfermedad(TipoEnfermedadID) -- Clave foránea referenciando a la tabla Tipo_Enfermedad
);










------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------



--41.
CREATE TABLE Enfermeda_X_Paciente (
    EnfermedadID INTEGER REFERENCES Enfermedad(EnfermedadID), -- Clave foránea referenciando a la tabla Enfermedad
    DiagnosticoID INTEGER REFERENCES Diagnosticos(DiagnosticoID), -- Clave foránea referenciando a la tabla Diagnostico
    PRIMARY KEY (EnfermedadID, DiagnosticoID)                  -- Clave primaria compuesta por EnfermedadID y DiagnosticoID
);

--42.
CREATE TABLE Medicamentos (
    MedicamentoID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada medicamento
    Nombre VARCHAR(100) NOT NULL UNIQUE      -- Nombre del medicamento, con una longitud máxima de 100 caracteres
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
CREATE TABLE Signos_Vitales (
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













------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------




--51.
CREATE TABLE Tratamientos (
    TratamientoID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada tratamiento
    Nombre VARCHAR(100) UNIQUE,
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
CREATE TABLE Lista_Tratamiento (
    Lista_TratamientoID SERIAL PRIMARY KEY,  -- Identificador único y autoincremental para cada registro de tratamiento
    DienteID INTEGER REFERENCES Dientes(DienteID), -- Clave foránea referenciando a la tabla Dientes
    DiagnosticoID INTEGER REFERENCES Diagnosticos(DiagnosticoID), -- Clave foránea referenciando a la tabla Diagnosticos
    TratamientoID INTEGER REFERENCES Tratamientos(TratamientoID), -- Clave foránea referenciando a la tabla Tratamientos
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID), -- Clave foránea referenciando a la tabla Plan_Tratamiento
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta), -- Clave foránea referenciando a la tabla Estudiantes
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta), -- Clave foránea referenciando a la tabla Docentes
    SeccionID INTEGER REFERENCES Secciones(SeccionesID) -- Clave foránea referenciando a la tabla Secciones
);


--55
CREATE TABLE Detalle_Presupuesto (
    ID_Detalle_Presupuesto SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada detalle de presupuesto
    ClinicaID INTEGER REFERENCES Clinicas(ClinicaID), -- Clave foránea referenciando a la tabla Clinicas
    TratamientoID INTEGER REFERENCES Tratamientos(TratamientoID), -- Clave foránea referenciando a la tabla Tratamientos
    EstadoID INTEGER REFERENCES Estados_Aprobacion_Docente(Estado_AprobacionID), -- Clave foránea referenciando a la tabla Estados
    Numero_Diente VARCHAR(10), -- Número o identificador del diente involucrado, limitado a 10 caracteres
    Monto NUMERIC(10, 2), -- Monto asociado al tratamiento, con precisión para valores monetarios
    PresupuestoID INTEGER REFERENCES Presupuestos(PresupuestoID), -- Clave foránea referenciando a la tabla Presupuestos
    Lista_TratamientoID INTEGER REFERENCES Lista_Tratamiento(Lista_TratamientoID) -- Clave foránea referenciando a la tabla Lista_Tratamiento
);

--56
CREATE TABLE Recibos (
    ReciboID SERIAL PRIMARY KEY,
    CodigoRecibo VARCHAR(50),
    imagen TEXT,
    ClinicaID INTEGER REFERENCES Clinicas(ClinicaID),
    DocenteID VARCHAR(20) REFERENCES  Usuarios(NumeroCuenta) ,
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta) ,
    Monto DECIMAL(10, 2),
    CajeroID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta) ,
    (PacienteID) REFERENCES Pacientes(PacienteID),
    ID_Detalle_Presupuesto INTEGER REFERENCES Detalle_Presupuesto(ID_Detalle_Presupuesto)
);

--57.
CREATE TABLE Evolucion_Tratamiento (
    Evolucion_TratamientoID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada registro de evolución
    Nota_Final INTEGER, -- Nota final del tratamiento
    Estado_AprobacionID INTEGER REFERENCES Estados_Aprobacion_Docente(Estado_AprobacionID), -- Clave foránea referenciando a la tabla Estados_Aprobacion_Docente
    Lista_TratamientoID INTEGER REFERENCES Lista_Tratamiento(Lista_TratamientoID) -- Clave foránea referenciando a la tabla Lista_Tratamiento
);

--58.
CREATE TABLE Evolucion_Procedimiento (
    Evolucion_ProcedimientoID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada procedimiento de evolución
    Fecha DATE, -- Fecha en que se realizó el procedimiento
    Procedimiento_Realizado TEXT, -- Detalles del procedimiento realizado
    Estado_AprobacionID INTEGER REFERENCES Estados_Aprobacion_Docente(Estado_AprobacionID), -- Clave foránea referenciando a la tabla Estados_Aprobacion_Docente
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
CREATE TABLE Cirugias_Bucal (
    Cirugia_BucalID SERIAL PRIMARY KEY,  -- Identificador único y autoincremental para cada cirugía bucal
    Pieza_Dentaria INTEGER, -- Almacena la descripción de la pieza dentaria involucrada en la cirugía
    Diagnostico TEXT, -- Almacena la descripción del diagnóstico relacionado con la cirugía
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID), -- Clave foránea referenciando a la tabla Registros
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta), -- Clave foránea referenciando a la tabla Estudiantes
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID), -- Clave foránea referenciando a la tabla Plan_Tratamiento
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);





















------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------






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
    Porcenaje_Sangrado_Periodonntograda INTEGER,
    Pronostico_Individual VARCHAR(20),
    Explique_Pronostico TEXT,    
    Valor_Riesgo_Peridontal VARCHAR(255),
    Recomendaciones TEXT,
    Diagnostico_General TEXT,
    Pronostico_General TEXT,
    Fundamentos_Pronostico TEXT,
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);



--62.
CREATE TABLE Periodontogramas (
    PeriodontogramasID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada periodontograma
    Nombre VARCHAR(100), -- Nombre descriptivo del periodontograma
    Imagen TEXT, -- Almacena la imagen del periodontograma en formato binario
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
    imagen_diagnostico_inicial TEXT,
    imagen_diagnostico_Final TEXT,
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);








CREATE TABLE Tipo_Uso_Biberon (
    Tipo_Uso_BiberonID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Habitos_Bucales (
    Habitos_BucalesID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Tonicidad_Labial (
    Tonicidad_LabialID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Clase_Num_Romano (
    Tipo_Clase_Num_RomanoID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Denticion (
    Tipo_DenticionID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Cabeza (
    Tipo_CabezaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Perfil (
    Tipo_PerfilID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Planos_Odonto_Pedriatrias (
    Tipo_Planos_Odonto_PedriatriasID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Arco_Odonto_Pedriatrias (
    Tipo_Arco_Odonto_PedriatriasID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);



CREATE TABLE Tipo_Respiracion (
    Tipo_RespiracionID SERIAL PRIMARY KEY,
    Nombre VARCHAR(25) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Desglucion (
    Tipo_DesglucionID SERIAL PRIMARY KEY,
    Nombre VARCHAR(25) UNIQUE NOT NULL
);


--64.
CREATE TABLE Odonto_Pedriatrias (
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
    Perfil INTEGER REFERENCES Tipo_Perfil(Tipo_PerfilID),
    Cabeza INTEGER REFERENCES Tipo_Cabeza(Tipo_CabezaID),
    Denticion INTEGER REFERENCES Tipo_Denticion(Tipo_DenticionID),
    Clase_Molar_Derecha INTEGER REFERENCES Tipo_Clase_Num_Romano(Tipo_Clase_Num_RomanoID),
    Clase_Molar_Izquierda INTEGER REFERENCES Tipo_Clase_Num_Romano(Tipo_Clase_Num_RomanoID),
    Plano_Recto INTEGER REFERENCES Tipo_Planos_Odonto_Pedriatrias(Tipo_Planos_Odonto_PedriatriasID),
    Plano_Mesial INTEGER REFERENCES Tipo_Planos_Odonto_Pedriatrias(Tipo_Planos_Odonto_PedriatriasID),
    Plano_Distal INTEGER REFERENCES Tipo_Planos_Odonto_Pedriatrias(Tipo_Planos_Odonto_PedriatriasID),
    Clase_Canina_Derecha INTEGER REFERENCES Tipo_Clase_Num_Romano(Tipo_Clase_Num_RomanoID),
    Clase_Canina_Izquierda INTEGER REFERENCES Tipo_Clase_Num_Romano(Tipo_Clase_Num_RomanoID),
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
    Arco_Dentario INTEGER REFERENCES Tipo_Arco_Odonto_Pedriatrias(Tipo_Arco_Odonto_PedriatriasID),
    Tipo_Respiracion INTEGER REFERENCES Tipo_Respiracion(Tipo_RespiracionID),
    Ronca BOOLEAN,
    Rechina_Dientes BOOLEAN,
    Sellado_Labial BOOLEAN,
    Desglucion INTEGER REFERENCES Tipo_Desglucion(Tipo_DesglucionID),
    Tonicidad_Labial INTEGER REFERENCES Tonicidad_Labial(Tonicidad_LabialID),
    Apertura_Bucal NUMERIC(5, 2),
    Desgaste_Caninos BOOLEAN,
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
    Imagen_Control_Placa_oleary TEXT,
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);

CREATE TABLE Habitos_Bucales_X_Odonto_Pedriatrias (
    Habitos_BucalesID INT NOT NULL,
    OdontoPedriatriaID INT NOT NULL,
    Historia_ClinicaID INT NOT NULL,
    PRIMARY KEY (Habitos_BucalesID, OdontoPedriatriaID, Historia_ClinicaID),
    FOREIGN KEY (Habitos_BucalesID) REFERENCES Habitos_Bucales(Habitos_BucalesID),
    FOREIGN KEY (OdontoPedriatriaID) REFERENCES Odonto_Pedriatrias(OdontoPedriatriaID),
    FOREIGN KEY (Historia_ClinicaID) REFERENCES Historia_Clinica(Historia_ClinicaID)
);

CREATE TABLE Tipo_Uso_Biberon_X_Odonto_Pedriatrias (
    Tipo_Uso_BiberonID INT NOT NULL,
    OdontoPedriatriaID INT NOT NULL,
    Historia_ClinicaID INT NOT NULL,
    PRIMARY KEY (Tipo_Uso_BiberonID, OdontoPedriatriaID, Historia_ClinicaID),
    FOREIGN KEY (Tipo_Uso_BiberonID) REFERENCES Tipo_Uso_Biberon(Tipo_Uso_BiberonID),
    FOREIGN KEY (OdontoPedriatriaID) REFERENCES Odonto_Pedriatrias(OdontoPedriatriaID),
    FOREIGN KEY (Historia_ClinicaID) REFERENCES Historia_Clinica(Historia_ClinicaID)
);




--66.
CREATE TABLE Tipo_Conductos (
    Tipo_ConductosID SERIAL PRIMARY KEY, -- Identificador único y autoincremental para cada tipo de conducto
    Nombre VARCHAR(100) NOT NULL UNIQUE, -- Nombre del tipo de conducto, con un límite de 100 caracteres
    Descripcion TEXT -- Descripción detallada del tipo de conducto
);



CREATE TABLE Tipo_Grado_Movilidad (
    Tipo_Grado_MovilidadID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Estimulo (
    Tipo_EstimuloID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Dolor (
    Tipo_DolorID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Tamaño_Camara (
    Tipo_Tamaño_CamaraID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Tamaño_Conducto (
    Tipo_Tamaño_ConductoID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

-- Tabla principal con las FK
CREATE TABLE Endodoncias (
    EndodonciaID SERIAL PRIMARY KEY,
    Num_Organo_dentario INTEGER,
    Movilidad INTEGER REFERENCES Tipo_Grado_Movilidad(Tipo_Grado_MovilidadID),
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
    Tamaño_Camara_pulpar INTEGER REFERENCES Tipo_Tamaño_Camara(Tipo_Tamaño_CamaraID),
    Tamaño_condunto INTEGER REFERENCES Tipo_Tamaño_Conducto(Tipo_Tamaño_ConductoID),
    Diagnostico_Pulpar TEXT,
    Diagnostico_Periapical TEXT,
    Plan_Tratamiento INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);

-- Tabla de relación para Tipo_Dolor y Endodoncias
CREATE TABLE Tipo_Dolor_Endodoncias (
    Tipo_DolorID INT NOT NULL REFERENCES Tipo_Dolor(Tipo_DolorID),
    EndodonciaID INT NOT NULL REFERENCES Endodoncias(EndodonciaID),
    PRIMARY KEY (Tipo_DolorID, EndodonciaID)
);

CREATE TABLE Tipo_Estimulo_Endodoncia (
    Tipo_EstimuloID INT NOT NULL REFERENCES Tipo_Estimulo(Tipo_EstimuloID),
    EndodonciaID INT NOT NULL REFERENCES Endodoncias(EndodonciaID),
    PRIMARY KEY (Tipo_EstimuloID, EndodonciaID)

);



--68.
CREATE TABLE Conductos (
    EndodonciaID INTEGER,
    Tipo_ConductosID INTEGER REFERENCES Tipo_Conductos(Tipo_ConductosID),
    Log_Trabajo DECIMAL,
    Puntos_De_Referencia VARCHAR(100),
    Lima_Maestra DECIMAL,
    Cono_Maestro DECIMAL,
    PRIMARY KEY (EndodonciaID, Tipo_ConductosID),
    FOREIGN KEY (EndodonciaID) REFERENCES Endodoncias(EndodonciaID)
);

CREATE TABLE Tipo_Resultado_Emergencia (
    Tipo_Resultado_EmergenciaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(25) UNIQUE NOT NULL
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
    Intensidad INTEGER CHECK (Intensidad IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
    PresenciaDeFistula BOOLEAN,
    Presencia_Bolsa_Periodontal BOOLEAN,
    Movilidad BOOLEAN,
    Grado_movilidad INTEGER CHECK (Grado_movilidad IN (1, 2, 3)),
    Prueba_Termica BOOLEAN,
    Prueba_Termica_resultado INTEGER REFERENCES Tipo_Resultado_Emergencia(Tipo_Resultado_EmergenciaID),
    Palpitacion BOOLEAN,
    Palpitacion_resultado INTEGER REFERENCES Tipo_Resultado_Emergencia(Tipo_Resultado_EmergenciaID),
    percucion_Vertical BOOLEAN,
    percucion_Vertical_Resultado INTEGER REFERENCES Tipo_Resultado_Emergencia(Tipo_Resultado_EmergenciaID),
    percucion_Horizontal BOOLEAN,
    percucion_Horizontal_Resultado INTEGER REFERENCES Tipo_Resultado_Emergencia(Tipo_Resultado_EmergenciaID),
    imagen TEXT,
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);


CREATE TABLE Tipo_Dolor_Emergencias (
    Tipo_DolorID INT NOT NULL,
    EmergenciaID INT NOT NULL,
    Historia_ClinicaID INT NOT NULL,
    PRIMARY KEY (Tipo_DolorID, EmergenciaID, Historia_ClinicaID),
    FOREIGN KEY (Tipo_DolorID) REFERENCES Tipo_Dolor(Tipo_DolorID),
    FOREIGN KEY (EmergenciaID) REFERENCES Emergencias(EmergenciaID),
    FOREIGN KEY (Historia_ClinicaID) REFERENCES Historia_Clinica(Historia_ClinicaID)
);







--69.
CREATE TABLE Parcial_Removible (
    Parcial_RemovibleID SERIAL PRIMARY KEY,
    Uso_protesis BOOLEAN,
    Tipo_Protesis_anterior TEXT,
    Problema_Protesis_anterior TEXT,
    Causa_Perdida_Dientes TEXT,
    Ingiene_Oral BOOLEAN,
    Indice_Caries //  ALTO , MODERADO- BAJO
    Calidad_Tegido TEXT,
    Cantidad_Tegido TEXT,// ALTO , MODERADO- BAJO
    Numero_Posicion_Diente TEXT,
    Tamaño_Dientes_Remanetes TEXT, 
    Condiciones_Proceso TEXT,
    Coincide_Relacion_Oclucion BOOLEAN,
    Interaciones_Frenillo BOOLEAN,
    Tipo_Saliva TEXT,
    Cantida_Normal_Saliva  BOOLEAN,
    Cantida_Normal_Saliva_No BOOLEAN, -- si en caso Cantida_Normal_Saliva es NO  ( Sialorrea o Xerostomía) 
    Línea_milohioidea TEXT,
    Tejidos_de_crestas_alveolares TEXT,
    Tuberosidad_del_maxilar TEXT,
    Hueso_alveolar_de_soporte TEXT,
    Presenta_Anomalías_óseas BOOLEAN,
    Especificacion_Presenta_Anomalías_óseas TEXT,
    Indicado_Procedimiento_Quirurgico BOOLEAN,
    Especificacion_Indicado_Procedimiento_Quirurgico TEXT,
    Desviacion_Apertura TEXT,
    Desviacion_Cierre TEXT,
    Tono_Muscular TEXT,
    Maseterio_Izquierdo TEXT,
    Maseterio_Derecho TEXT,
    Temporal_Izquierdo TEXT,
    Temporal_Derecho TEXT,
    Contactos_Prematuros BOOLEAN,
    Interferencia_Oclusales BOOLEAN,
    Desgaste_Selectivo BOOLEAN,
    Clase_Kennedy_Superior TEXT,
    Clase_Kennedy_Inferior TEXT,
    Espacio_interoclusal BOOLEAN,
    Espacio_Endetulo_Superior TEXT,
    Espacio_Modificacion_1_Superior VARCHAR(50),
    Espacio_Modificacion_2_Superior VARCHAR(50),
    Espacio_Modificacion_3_Superior VARCHAR(50),
    Espacio_Endetulo_Inferior TEXT,
    Espacio_Modificacion_1_Inferior VARCHAR(50),
    Espacio_Modificacion_2_Inferior VARCHAR(50),
    Espacio_Modificacion_3_Inferior VARCHAR(50),
    Piezas_Adecuadas TEXT,
    Ubicacion_Favorable BOOLEAN,
    Formacion_Planos_Guias BOOLEAN,
    Modificacion_Dentales BOOLEAN,
    Especificacion TEXT,
    Foto_Prueba_Armazon TEXT,
    Foto_Relacion_interoclusales TEXT,
    Foto_Instalacion_PPR TEXT,
    Foto_Control_Post_operatorio TEXT,
    Imagen_superior TEXT,
    Clase_superior VARCHAR(150),
    Conector_superior VARCHAR(150),
    Base_superior VARCHAR(150),
    Retenedores_Directos_Superior VARCHAR(150),
    Retenedores_Indirectos_Superior VARCHAR(150),
    Imagen_Inferior TEXT,
    Clase_Inferior VARCHAR(150),
    Conector_Inferior VARCHAR(150),
    Base_Inferior VARCHAR(150),
    Retenedores_Directos_Inferior VARCHAR(150),
    Retenedores_Indirectos_Inferior VARCHAR(150),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);



--70.
CREATE TABLE Pilares (
    PilaresID SERIAL PRIMARY KEY,
    DienteID INTEGER,
    Num_Pilar INTEGER,
    Preparacion_planos_guias BOOLEAN,
    Preparacion_Descanzo BOOLEAN,
    Areas_Retentivas BOOLEAN,
    Parcial_RemovibleID INTEGER,
    FOREIGN KEY (DienteID) REFERENCES Dientes(DienteID),
    FOREIGN KEY (Parcial_RemovibleID) REFERENCES Parcial_Removible(Parcial_RemovibleID)
);






------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--( MESOFACIAL, BRANQUIFACIAL, DOLICOFACIA)
CREATE TABLE Tipo_Fenotipo_Facial (
    Tipo_Fenotipo_FacialID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);
--(REDONDA, OVALADA, CUADRADA,TRIANGULAR)
CREATE TABLE Tipo_Forma_Facial (
    Tipo_Forma_FacialID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);



--(MESTIZO, AFRODECENDIENTE, CAUCASICO)
CREATE TABLE Tipo_Color_Piel (
    Tipo_Color_PielID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Color_de_Ojos (
    Color_de_OjosID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

--( RESILIENTE, FIRME, FLACIDA)
CREATE TABLE Tipo_Mucosa_Maxilar (
    Tipo_Mucosa_MaxilarID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

--( PRESENTE, AUSENTE) Hamular_Maxilar_Superior
CREATE TABLE Tipo_Torus (
    Tipo_TorusID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


--( FIRME, RESILIENTE,FLACIDO-)
CREATE TABLE Tipo_Consistencia_Papilla (
    Tipo_Consistencia_PapillaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

--( PEQUEÑO, MEDIANO,GRANDE)
CREATE TABLE Tipo_Tamaño_Papilla (
    Tipo_Tamaño_PapillaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

--( RETRAIDA,ADELANTADA)
CREATE TABLE Tipo_Lengua_Posicion (
    Tipo_Lengua_PosicionID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

--( NORMAL, MACROGLOSIA,MICROGLOSIA)
CREATE TABLE Tipo_Lengua_Tamaño (
    Tipo_Lengua_TamañoID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

--( AUMENTADA, DISMINUIDA)-
CREATE TABLE Tipo_Saliva (
    Tipo_SalivaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

--( OVOIDE,TRIANGULAR, CUADRANGULAR).
CREATE TABLE Tipo_Forma_Maxilar (
    Tipo_Forma_MaxilarID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

--( RENTENTIVA, NO RETENTIVA)
CREATE TABLE Tipo_Tubo_Reten (
    Tipo_Tubo_RetenID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

--( SIMETRICOS, ASIMETRICOS)
CREATE TABLE Tipo_Simetria_Maxilar (
    Tipo_Simetria_MaxilarID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

--( FORMA U, FORMA V, FORMA C)
CREATE TABLE Tipo_Rebordes_Maxilar (
    Tipo_Rebordes_MaxilarID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Tipo_Tuberosidad_Maxilar (
    Tipo_Tuberosidad_MaxilarID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Tipo_Zona_Cierre (
    Tipo_Zona_CierreID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Tipo_Fosa_Retro_Profunda (
    Tipo_Fosa_Retro_ProfundaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Tipo_Fosa_Retro_Retentiva (
    Tipo_Fosa_Retro_RetentivaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Tipo_Frenillo_Insercion (
    Tipo_Frenillo_InsercionID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Tipo_Frenillo_Consistencia (
    Tipo_Frenillo_ConsistenciaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);





--71.
CREATE TABLE Protesis_Total (
    Protesis_TotalID SERIAL PRIMARY KEY,
    Menton_Prominente BOOLEAN,
    Musculatura_Perioral BOOLEAN,
    Existe_Patologia_Extraoral BOOLEAN,
    Explicacion_Patologia_Extraoral TEXT,
    Asimetrias_Faciales BOOLEAN,
    Desviacion_Apertura TEXT,
    Desviacion_Cierre TEXT,
    Tono_Muscular TEXT,
    Masetero_Izquierdo TEXT,
    Masetero_Derecho TEXT,
    Temporal_Izquierdo TEXT,
    Temporal_Derecho TEXT,
    Presencia_Ruido_Derecho TEXT,
    Presencia_Ruido_Izquierda TEXT,
    Luxacion_Derecha TEXT,
    Luxacion_Izquierda TEXT,
    Subluxacion_Derecha TEXT,
    Subluxacion_Izquierda TEXT,
    Observaciones TEXT,
    Fenotipo_Facial INTEGER REFERENCES Tipo_Fenotipo_Facial(Tipo_Fenotipo_FacialID),
    Forma_Facial INTEGER REFERENCES Tipo_Forma_Facial(Tipo_Forma_FacialID),
    Medida_Vertical_Reposo DECIMAL(5, 2),
    Tercio_Superior DECIMAL(5, 2),
    Tercio_Medio DECIMAL(5, 2),
    Tercio_Inferior DECIMAL(5, 2),
    Asimetria_Tercios BOOLEAN,
    Especifique_Asimetria_Tercios TEXT,
    Quinto_Central DECIMAL(5, 2),
    Quinto_Lateral_Derecha DECIMAL(5, 2),
    Quinto_Lateral_Izquierda DECIMAL(5, 2),
    Quinto_Externo_Derecho DECIMAL(5, 2),
    Quinto_Externo_Izquierdo DECIMAL(5, 2),
    Asimetria_Quintos BOOLEAN,
    Especifique_Asimetria_Quintos TEXT,
    Perfil INTEGER REFERENCES Tipo_Perfil(Tipo_PerfilID),
    Relacion_Maxilomandibular TEXT,
    Color_de_piel INTEGER REFERENCES Tipo_Color_Piel(Tipo_Color_PielID),
    Color_de_ojos INTEGER REFERENCES Color_de_Ojos(Color_de_OjosID),
    Presencia_Dientes BOOLEAN,
    Ausencia_Total_Dientes BOOLEAN,
    Portador_Protesis BOOLEAN,
    Protesis_Combinada BOOLEAN, 
    Protesis_Bien_Adaptada BOOLEAN,
    Requiere_Cambio BOOLEAN,
    Porque_Requiere_Cambios TEXT,
    Espacio_Intermaxilar_Reducido BOOLEAN,
    Espacio_Intermaxilar_Suficiente BOOLEAN,
    Mucosa_Maxilar_Superior INTEGER REFERENCES Tipo_Mucosa_Maxilar(Tipo_Mucosa_MaxilarID),
    Mucosa_Maxilar_Inferior INTEGER REFERENCES Tipo_Mucosa_Maxilar(Tipo_Mucosa_MaxilarID),
    Lesiones TEXT,
    Torus_Paladino INTEGER REFERENCES Tipo_Torus(Tipo_TorusID),
    Torus_Mandibular INTEGER REFERENCES Tipo_Torus(Tipo_TorusID),
    Consistencia_Papila_Derecho INTEGER REFERENCES Tipo_Consistencia_Papilla(Tipo_Consistencia_PapillaID),
    Tamaño_Papila_Derecho INTEGER REFERENCES Tipo_Tamaño_Papilla(Tipo_Tamaño_PapillaID),
    Consistencia_Papila_Izquierdo INTEGER REFERENCES Tipo_Consistencia_Papilla(Tipo_Consistencia_PapillaID),
    Tamaño_Papila_Izquierdo INTEGER REFERENCES Tipo_Tamaño_Papilla(Tipo_Tamaño_PapillaID),
    Lengua_Tamaño INTEGER REFERENCES Tipo_Lengua_Tamaño(Tipo_Lengua_TamañoID),
    Lengua_Posicion INTEGER REFERENCES Tipo_Lengua_Posicion(Tipo_Lengua_PosicionID),
    Desplazamiento_Lengua BOOLEAN,
    Desplazamiento_Glandulas BOOLEAN,
    Saliva INTEGER REFERENCES Tipo_Saliva(Tipo_SalivaID),
    Forma_Maxilar_Superior INTEGER REFERENCES Tipo_Forma_Maxilar(Tipo_Forma_MaxilarID),
    Forma_Maxilar_Inferior INTEGER REFERENCES Tipo_Forma_Maxilar(Tipo_Forma_MaxilarID),
    Simetria_Maxilar_Superior INTEGER REFERENCES Tipo_Simetria_Maxilar(Tipo_Simetria_MaxilarID),
    Simetria_Maxilar_Inferior INTEGER REFERENCES Tipo_Simetria_Maxilar(Tipo_Simetria_MaxilarID),
    Rebordes_Maxilar_Superior INTEGER REFERENCES Tipo_Rebordes_Maxilar(Tipo_Rebordes_MaxilarID),
    Rebordes_Maxilar_Inferior INTEGER REFERENCES Tipo_Rebordes_Maxilar(Tipo_Rebordes_MaxilarID),
    Tuberosidad_Maxilar_Superior INTEGER REFERENCES Tipo_Tuberosidad_Maxilar(Tipo_Tuberosidad_MaxilarID),
    Tubo_Reten_Maxilar_Superior INTEGER REFERENCES Tipo_Tubo_Reten(Tipo_Tubo_RetenID),
    Hamular_Maxilar_Superior INTEGER REFERENCES Tipo_Torus(Tipo_TorusID),
    Zona_Cierre_Posterior INTEGER REFERENCES Tipo_Zona_Cierre(Tipo_Zona_CierreID),
    Fosa_Retro_Derecha_Profunda INTEGER REFERENCES Tipo_Fosa_Retro_Profunda( Tipo_Fosa_Retro_ProfundaID),
    Fosa_Retro_Derecha_Retentiva INTEGER REFERENCES Tipo_Fosa_Retro_Retentiva( Tipo_Fosa_Retro_RetentivaID),
    Fosa_Retro_Izquierda_Profunda INTEGER REFERENCES Tipo_Fosa_Retro_Profunda( Tipo_Fosa_Retro_ProfundaID),
    Fosa_Retro_Izquierda_Retentiva INTEGER REFERENCES Tipo_Fosa_Retro_Retentiva( Tipo_Fosa_Retro_RetentivaID),
    Frenillo_Insercion_Max_S_Anterior INTEGER REFERENCES Tipo_Frenillo_Insercion(Tipo_Frenillo_InsercionID),
    Frenillo_Insercion_Max_I_Anterior INTEGER REFERENCES Tipo_Frenillo_Insercion(Tipo_Frenillo_InsercionID),
    Frenillo_Consistencia_Max_S_Anterior INTEGER REFERENCES Tipo_Frenillo_Consistencia(Tipo_Frenillo_ConsistenciaID),
    Frenillo_Consistencia_Max_I_Anterior INTEGER REFERENCES Tipo_Frenillo_Consistencia(Tipo_Frenillo_ConsistenciaID),
    Frenillo_Insercion_Max_S_Posterior INTEGER REFERENCES Tipo_Frenillo_Insercion(Tipo_Frenillo_InsercionID),
    Frenillo_Insercion_Max_I_Posterior INTEGER REFERENCES Tipo_Frenillo_Insercion(Tipo_Frenillo_InsercionID),
    Frenillo_Consistencia_Max_S_Posterior INTEGER REFERENCES Tipo_Frenillo_Consistencia(Tipo_Frenillo_ConsistenciaID),
    Frenillo_Consistencia_Max_I_Posterior INTEGER REFERENCES Tipo_Frenillo_Consistencia(Tipo_Frenillo_ConsistenciaID),
    Seibert_Max_S_Sector_Izquierdo BOOLEAN,
    Seibert_Max_I_Sector_Izquierdo BOOLEAN,
    Seibert_Max_S_Sector_Derecho BOOLEAN,
    Seibert_Max_I_Sector_Derecho BOOLEAN,
    Longitud_Lineas_Caninas DECIMAL(5, 2),
    Altura_Incisal DECIMAL(5, 2),
    Eleccion_Color_Dientes TEXT,
    Eleccion_Formas_Dientes TEXT,
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);




--(LARGA, CUADRADA, OVALADA)
CREATE TABLE Tipo_Forma_Cara (
    Tipo_Forma_CaraID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


--( NORMAL, HIPOTONICA, HIPERTONICA)
CREATE TABLE Tipo_Musculatura_Peribucal (
    Tipo_Musculatura_PeribucalID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


--(AUMENTADO, DISMINUIDO)
CREATE TABLE Tipo_Relacion_Tercios (
    Tipo_Relacion_TerciosID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Protrusion_Labial (
    Tipo_Protrusion_LabialID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Relacion_Clases (
    Tipo_Relacion_ClasesID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Desviacion (
    Tipo_DesviacionID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Forma_Paladar (
    Tipo_Forma_PaladarID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Biotipo_Facial (
    Tipo_Biotipo_FacialID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Estado_Bucal_Ortodoncia (
    Estado_Bucal_OrtodonciaID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

--

--72.
CREATE TABLE Ortodoncias (
    OrtodonciaID SERIAL PRIMARY KEY,
    foto_extraoral_centrada TEXT,
    foto_extraoral_sonrisa TEXT,
    foto_extraoral_perfil TEXT,
    Forma_CaraID INTEGER REFERENCES Tipo_Forma_Cara(Tipo_Forma_CaraID),
    Ojeras BOOLEAN,
    Musculatura_PeribucalID INTEGER REFERENCES Tipo_Musculatura_Peribucal(Tipo_Musculatura_PeribucalID),
    Relacion_Tercios_Medios_InferiorID INTEGER REFERENCES Tipo_Relacion_Tercios(Tipo_Relacion_TerciosID),
    Relacion_Tercios_Inferior_MediosID INTEGER REFERENCES Tipo_Relacion_Tercios(Tipo_Relacion_TerciosID),
    Presencia_Mentolabial BOOLEAN,
    Perfil INTEGER REFERENCES Tipo_Perfil(Tipo_PerfilID),
    Protrusion_LabialID INTEGER REFERENCES Tipo_Protrusion_Labial(Tipo_Protrusion_LabialID),
    Relacion_Molar_DerechaID INTEGER REFERENCES Tipo_Relacion_Clases(Tipo_Relacion_ClasesID),
    Relacion_Molar_IzquierdaID INTEGER REFERENCES Tipo_Relacion_Clases(Tipo_Relacion_ClasesID),
    Relacion_Canina_DerechaID INTEGER REFERENCES Tipo_Relacion_Clases(Tipo_Relacion_ClasesID),
    Relacion_Canina_IzquierdaID INTEGER REFERENCES Tipo_Relacion_Clases(Tipo_Relacion_ClasesID),
    Mordida_Profunda BOOLEAN,
    Mordida_Profunda_Porcentaje DECIMAL(5, 2),
    Mordida_Abierta BOOLEAN,
    Sobremordida_Horizontal BOOLEAN,
    Sobremordida_Horizontal_Medida DECIMAL(5, 2),
    Perdida_Dientes_Temporales BOOLEAN,
    Perdida_Dientes_Temporales_Detalle TEXT,
    Perdida_Dientes_Permanentes BOOLEAN,
    Perdida_Dientes_Permanentes_Detalle TEXT,
    Desviacion_SuperiorID INTEGER REFERENCES Tipo_Desviacion(Tipo_DesviacionID),
    Desviacion_InferiorID INTEGER REFERENCES Tipo_Desviacion(Tipo_DesviacionID),
    Desviacion_Linea_Media_Arqueada BOOLEAN,
    Mordida_Cruzada_Posterior_Derecha BOOLEAN,
    Mordida_Cruzada_Posterior_Izquierda BOOLEAN,
    Mordida_Cruzada_Anterior BOOLEAN,
    Discrepancia_Dental_Superior DECIMAL(5, 2),
    Discrepancia_Dental_Inferior DECIMAL(5, 2),
    Incompetencia_Labial BOOLEAN,
    Higiene_Bucal INTEGER REFERENCES Estado_Bucal_Ortodoncia(Estado_Bucal_OrtodonciaID),
    Estado_Periodontal INTEGER REFERENCES Estado_Bucal_Ortodoncia(Estado_Bucal_OrtodonciaID),
    Frenillo BOOLEAN,
    Frenillo_Detalle TEXT,
    Forma_PaladarID INTEGER REFERENCES Tipo_Forma_Paladar(Tipo_Forma_PaladarID),
    Paladar_Profundo BOOLEAN,
    Presencia_Torus VARCHAR(50),
    Foto_Oclusal_Superior TEXT,
    Foto_Oclusal_Inferior VARCHAR(255),
    Apertura_Boca_Dolor BOOLEAN,
    Apertura_Boca_Chasquido BOOLEAN,
    Disminucion_De_Apertura_Boca BOOLEAN, 
    Biotipo_FacialID INTEGER REFERENCES Tipo_Biotipo_Facial(Tipo_Biotipo_FacialID),
    Clase_Esqueletica INTEGER REFERENCES Tipo_Relacion_Clases(Tipo_Relacion_ClasesID),
    Clase_Dental INTEGER REFERENCES Tipo_Relacion_Clases(Tipo_Relacion_ClasesID),
    IMPA_93_97 INTEGER REFERENCES Tipo_Relacion_Tercios(Tipo_Relacion_TerciosID),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);



