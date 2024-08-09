DROP TABLE Ortodoncias_Propuesta;
DROP TABLE Cefalometria;
DROP TABLE examen_Atm_Ortodoncia;
DROP TABLE examen_clinico_Ortodoncia;

CREATE TABLE examen_clinico_Ortodoncia (
    examen_clinico_OrtodonciaID SERIAL PRIMARY KEY,
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
    Presencia_Torus VARCHAR(50)
   
);



CREATE TABLE examen_Atm_Ortodoncia (
    examen_Atm_OrtodonciaID SERIAL PRIMARY KEY,
    Foto_Oclusal_Superior TEXT,
    Foto_Oclusal_Inferior VARCHAR(255),
    Apertura_Boca_Dolor BOOLEAN,
    Apertura_Boca_Chasquido BOOLEAN,
    Disminucion_De_Apertura_Boca BOOLEAN

    
);


CREATE TABLE Cefalometria (
    CefalometriaID SERIAL PRIMARY KEY,
    Biotipo_FacialID INTEGER REFERENCES Tipo_Biotipo_Facial(Tipo_Biotipo_FacialID),
    Clase_Esqueletica INTEGER REFERENCES Tipo_Relacion_Clases(Tipo_Relacion_ClasesID),
    Clase_Dental INTEGER REFERENCES Tipo_Relacion_Clases(Tipo_Relacion_ClasesID),
    IMPA_93_97 INTEGER REFERENCES Tipo_Relacion_Tercios(Tipo_Relacion_TerciosID)
    
);


--72.
CREATE TABLE Ortodoncias_Propuesta (
    OrtodonciaID SERIAL PRIMARY KEY,
    examen_clinico_OrtodonciaID INTEGER REFERENCES examen_clinico_Ortodoncia(examen_clinico_OrtodonciaID),
    examen_Atm_OrtodonciaID INTEGER REFERENCES examen_Atm_Ortodoncia(examen_Atm_OrtodonciaID),
    CefalometriaID INTEGER REFERENCES Cefalometria( CefalometriaID),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);