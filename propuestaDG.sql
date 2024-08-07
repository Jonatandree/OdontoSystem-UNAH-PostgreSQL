CREATE TABLE Drogas (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL
);

CREATE TABLE TamanoCepillo (
    id SERIAL PRIMARY KEY,
    descripcion TEXT NOT NULL
);

CREATE TABLE TipoCerdas (
    id SERIAL PRIMARY KEY,
    descripcion TEXT NOT NULL
);

CREATE TABLE PresionCepillado (
    id SERIAL PRIMARY KEY,
    descripcion TEXT NOT NULL
);

CREATE TABLE TipoDisfuncion (
    id SERIAL PRIMARY KEY,
    descripcion TEXT NOT NULL
);

CREATE TABLE RuidosArticulares (
    id SERIAL PRIMARY KEY,
    descripcion TEXT NOT NULL
);

CREATE TABLE Medicamentos (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL
);

CREATE TABLE Presentaciones (
    id SERIAL PRIMARY KEY,
    descripcion TEXT NOT NULL
);

CREATE TABLE Frecuencias (
    id SERIAL PRIMARY KEY,
    descripcion TEXT NOT NULL
);

CREATE TABLE Enfermedades (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL
);

CREATE TABLE Anamnesis (
    id SERIAL PRIMARY KEY,
    motivo_consulta TEXT,
    historia_enfermedad_actual TEXT,
    sintoma_principal TEXT
);

CREATE TABLE Interrogatorio (
    id SERIAL PRIMARY KEY,
    orl TEXT,
    osteomuscular TEXT,
    cardiovascular TEXT,
    respiratorio TEXT,
    endocrino TEXT,
    circulatorio TEXT,
    gastrointestinal TEXT
);

CREATE TABLE AntecedentesPatologicos (
    id SERIAL PRIMARY KEY,
    antecedentes_adulto TEXT,
    inmunolaergicos TEXT,
    ant_go_menarquia TEXT,
    fum DATE,
    planificacion_familiar TEXT,
    menopausia BOOLEAN,
    g INTEGER,
    p INTEGER,
    a INTEGER,
    o INTEGER,
    hv INTEGER,
    hm INTEGER,
    c INTEGER
);

CREATE TABLE AntecedentesNoPatologicos (
    id SERIAL PRIMARY KEY,
    consume_tabaco BOOLEAN,
    no_cigarros_diarios INTEGER,
    hace_cuanto_fuma INTEGER,
    consume_alcohol BOOLEAN,
    frecuencia_consumo_alcohol INTEGER,
    consume_drogas BOOLEAN,
    tipo_droga INTEGER REFERENCES Drogas(id),
    hace_cuanto_drogas INTEGER,
    embarazada BOOLEAN,
    menstruacion BOOLEAN,
    apiñamiento_dental BOOLEAN,
    dificultad_respiratoria BOOLEAN,
    bruxismo BOOLEAN,
    piercing_bucal BOOLEAN,
    usa_protesis_dental BOOLEAN,
    observaciones TEXT
);

CREATE TABLE AparienciaGeneral (
    id SERIAL PRIMARY KEY,
    estado_paciente TEXT
);

CREATE TABLE SignosVitales (
    id SERIAL PRIMARY KEY,
    presion_arterial DECIMAL,
    pulso INTEGER,
    fc INTEGER,
    peso INTEGER,
    talla DECIMAL,
    saturacion_oxigeno INTEGER
);

CREATE TABLE RevisionPorOrgano (
    id SERIAL PRIMARY KEY,
    orl TEXT,
    cuello TEXT,
    cardiovascular TEXT,
    extremidades TEXT
);

CREATE TABLE ArticulacionTemporomandibular (
    id SERIAL PRIMARY KEY,
    tipo_disfuncion INTEGER REFERENCES TipoDisfuncion(id),
    ruidos_articulares INTEGER REFERENCES RuidosArticulares(id),
    observaciones TEXT
);

CREATE TABLE HigieneBucal (
    id SERIAL PRIMARY KEY,
    frecuencia_cepillado TEXT,
    tamano_cepillo INTEGER REFERENCES TamanoCepillo(id),
    tipo_cerdas INTEGER REFERENCES TipoCerdas(id),
    presion_cepillado INTEGER REFERENCES PresionCepillado(id),
    usa_hilo_dental BOOLEAN,
    usa_enjuague_bucal BOOLEAN
);

CREATE TABLE Odontograma (
    id SERIAL PRIMARY KEY,
    observaciones TEXT,
    diagnostico TEXT,
    pronostico TEXT
);

CREATE TABLE DientesOdontograma (
    id SERIAL PRIMARY KEY,
    odontograma_id INTEGER REFERENCES Odontograma(id) ON DELETE CASCADE,
    diente INTEGER NOT NULL,
    condicion TEXT
);


CREATE TABLE Diagnostico (
    id SERIAL PRIMARY KEY,
    consentimiento TEXT,
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    anamnesis_id INTEGER REFERENCES Anamnesis(id),
    interrogatorio_id INTEGER REFERENCES Interrogatorio(id),
    antecedentes_patologicos_id INTEGER REFERENCES AntecedentesPatologicos(id),
    antecedentes_no_patologicos_id INTEGER REFERENCES AntecedentesNoPatologicos(id),
    apariencia_general_id INTEGER REFERENCES AparienciaGeneral(id),
    signos_vitales_id INTEGER REFERENCES SignosVitales(id),
    higiene_bucal_id INTEGER REFERENCES HigieneBucal(id),
    revision_por_organo_id INTEGER REFERENCES RevisionPorOrgano(id),
    articulacion_temporomandibular_id INTEGER REFERENCES ArticulacionTemporomandibular(id),
    odontograma_id INTEGER REFERENCES Odontograma(id),
    estado_aprobacion_id INTEGER REFERENCES Estados_Aprobacion_Docente(Estado_AprobacionID),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Medicamentos_X_Diagnostico (
    id SERIAL PRIMARY KEY,
    diagnostico_id INTEGER REFERENCES Diagnostico(id),
    medicamento INTEGER REFERENCES Medicamentos(id),
    presentation INTEGER REFERENCES Presentaciones(id),
    dosis TEXT,
    frecuencia INTEGER REFERENCES Frecuencias(id)
);

CREATE TABLE Enfermedades_X_Diagnostico (
    id SERIAL PRIMARY KEY,
    diagnostico_id INTEGER REFERENCES Diagnostico(id),
    enfermedad INTEGER REFERENCES Enfermedades(id)
);

--Trigger Update
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_diagnostico_updated_at
BEFORE UPDATE ON Diagnostico
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
