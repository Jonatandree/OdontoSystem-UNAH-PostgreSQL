
DROP TABLE Urgencias_Propuesta;
DROP TABLE Tipo_Dolor_Urgencias;
DROP TABLE Pruebas_Diagnosticas_Urgencia;
DROP TABLE Evaluacion_Dental_Urgencia;


CREATE TABLE Evaluacion_Dental_Urgencia (
    Evaluacion_Dental_Urgenciaid SERIAL PRIMARY KEY,
    Num_de_Organo_Dentario INTEGER,
    Num_dientes_Con_Caries INTEGER,
    Num_dientes_Con_Fractura INTEGER,
    Exposicion_Pulpar TEXT,
    Num_Protesis_Dentales INTEGER,
    Presencia_Dolor BOOLEAN,
    Intensidad INTEGER CHECK (Intensidad IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
    PresenciaDeFistula BOOLEAN,
    Presencia_Bolsa_Periodontal BOOLEAN,
    Movilidad BOOLEAN,
    Grado_movilidad INTEGER CHECK (Grado_movilidad IN (1, 2, 3))
);


CREATE TABLE Pruebas_Diagnosticas_Urgencia(
     Pruebas_Diagnosticas_Urgenciaid SERIAL PRIMARY KEY,
     Prueba_Termica BOOLEAN,
     Prueba_Termica_resultado INTEGER REFERENCES Tipo_Resultado_Urgencia(Tipo_Resultado_UrgenciaID),
     Palpitacion BOOLEAN,
     Palpitacion_resultado INTEGER REFERENCES Tipo_Resultado_Urgencia(Tipo_Resultado_UrgenciaID),
     percucion_Vertical BOOLEAN,
     percucion_Vertical_Resultado INTEGER REFERENCES Tipo_Resultado_Urgencia(Tipo_Resultado_UrgenciaID),
     percucion_Horizontal BOOLEAN,
    percucion_Horizontal_Resultado INTEGER REFERENCES Tipo_Resultado_Urgencia(Tipo_Resultado_UrgenciaID),
    imagen TEXT
);

CREATE TABLE Tipo_Dolor_Urgencias (
    Tipo_DolorID INT NOT NULL,
    Evaluacion_Dental_Urgenciaid INT NOT NULL,
    Historia_ClinicaID INT NOT NULL,
    PRIMARY KEY (Tipo_DolorID, Evaluacion_Dental_Urgenciaid, Historia_ClinicaID),
    FOREIGN KEY (Tipo_DolorID) REFERENCES Tipo_Dolor(Tipo_DolorID),
    FOREIGN KEY (Evaluacion_Dental_Urgenciaid) REFERENCES Evaluacion_Dental_Urgencia(Evaluacion_Dental_Urgenciaid),
    FOREIGN KEY (Historia_ClinicaID) REFERENCES Historia_Clinica(Historia_ClinicaID)
);



--65.
CREATE TABLE Urgencias_Propuesta (
    UrgenciaID SERIAL PRIMARY KEY,
    evaluacion_dental_id INTEGER REFERENCES Evaluacion_Dental_Urgencia(Evaluacion_Dental_Urgenciaid),
    Pruebas_Diagnosticas_id INTEGER REFERENCES Pruebas_Diagnosticas_Urgencia(Pruebas_Diagnosticas_Urgenciaid),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);
