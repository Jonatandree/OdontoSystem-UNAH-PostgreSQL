

CREATE TABLE  Caracteristicas_De_La_Encia_Periodoncia(
  Caracteristicas_De_La_EnciaID SERIAL PRIMARY KEY,
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
    Explique_Posicion TEXT
);

CREATE TABLE  Periodontograma_Periodoncia(
  PeriodontogramaID SERIAL PRIMARY KEY,
      Porcenaje_Sangrado_Periodontograma INTEGER,
   imagen TEXT
);
CREATE TABLE   Diagnostico_Pronostico_individual_Periodoncia(
   Diagnostico_Pronostico_individualID SERIAL PRIMARY KEY,
     imagen TEXT,
     Pronostico_Individual VARCHAR(20),
    Explique_Pronostico TEXT
);
CREATE TABLE  Valoracion_Riesgo_Peridontal_Periodoncia(
  Valoracion_Riesgo_Peridontal_Periodoncia SERIAL PRIMARY KEY,
       Valor_Riesgo_Peridontal VARCHAR(255),
    Recomendaciones TEXT
);

CREATE TABLE  Diagnostico_Periodoncia(
  DiagnosticoID SERIAL PRIMARY KEY,
    Diagnostico_General TEXT,
    Pronostico_General TEXT,
    Fundamentos_Pronostico TEXT

);

CREATE TABLE Periodoncias (
    PeriodonciaID SERIAL PRIMARY KEY,
    Caracteristicas_De_La_EnciaID INTEGER REFERENCES Caracteristicas_De_La_Encia_Periodoncia(Caracteristicas_De_La_EnciaID),
    PeriodontogramaID INTEGER REFERENCES Periodontograma_Periodoncia(PeriodontogramaID),
    Diagnostico_Pronostico_individualID INTEGER REFERENCES Diagnostico_Pronostico_individual_Periodoncia(Diagnostico_Pronostico_individualID),
    Valoracion_Riesgo_PeridontalID INTEGER REFERENCES Valoracion_Riesgo_Peridontal_Periodoncia(Valoracion_Riesgo_PeridontalID),
    DiagnosticoID INTEGER REFERENCES Diagnostico_Periodoncia(DiagnosticoID),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);