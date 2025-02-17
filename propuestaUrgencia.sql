
DROP TABLE Urgencias_Propuesta;
DROP TABLE Tipo_Dolor_Urgencias;
DROP TABLE Pruebas_Diagnosticas_Urgencia;
DROP TABLE Evaluacion_Dental_Urgencia;


CREATE TABLE Evaluacion_Dental_Urgencia (
    Evaluacion_Dental_Urgenciaid SERIAL PRIMARY KEY,
    Num_dientes_Con_Caries INTEGER,
    Num_dientes_Con_Fractura INTEGER,
    Exposicion_Pulpar TEXT,
    Protesis_Dentales TEXT,
    Presencia_Dolor BOOLEAN,
    Tipo_De_Dolor TEXT,
    Intensidad INTEGER CHECK (Intensidad IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
    PresenciaDeFistula BOOLEAN,
    Presencia_Bolsa_Periodontal BOOLEAN,
    Movilidad BOOLEAN,
    Grado_movilidad INTEGER CHECK (Grado_movilidad IN (1, 2, 3))
);

CREATE TABLE Tipo_Resultado_Urgencia (
	Tipo_ResultadoID SERIAL PRIMARY KEY,
	Nombre_Tipo VARCHAR(10) NOT NULL
)

CREATE TABLE Pruebas_Diagnosticas_Urgencia(
     Pruebas_Diagnosticas_Urgenciaid SERIAL PRIMARY KEY,
     Prueba_Termica_Dientes TEXT,
     Prueba_Termica_resultado INTEGER REFERENCES Tipo_Resultado_Urgencia(Tipo_ResultadoID),
     Palpitacion_Dientes TEXT,
     Palpitacion_resultado INTEGER REFERENCES Tipo_Resultado_Urgencia(Tipo_ResultadoID),
     percusion_Dientes TEXT,
     percusion_Vertical_Resultado INTEGER REFERENCES Tipo_Resultado_Urgencia(Tipo_ResultadoID),
     percusion_Horizontal_Dientes TEXT,
     percusion_Horizontal_Resultado INTEGER REFERENCES Tipo_Resultado_Urgencia(Tipo_ResultadoID),
     imagen TEXT
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
