DROP TABLE Endodoncias_Propuesta;
DROP TABLE Evaluacion_Dental_Endodoncias;
DROP TABLE Pruebas_Diagnosticas_Endodoncias;
DROP TABLE Sondeo_Endodoncias;
DROP TABLE Examen_Radiografico_Endodoncias;
DROP TABLE Datos_De_Trabajo_Endodoncias;


CREATE TABLE  Evaluacion_Dental_Endodoncias(
  Evaluacion_Dental_ID SERIAL PRIMARY KEY,
  Num_Organo_dentario INTEGER,
  Presencia_de_Dolor BOOLEAN,
  MovilidadID INTEGER REFERENCES  Tipo_Grado_Movilidad(Tipo_Grado_MovilidadID) 
);


CREATE TABLE  Pruebas_Diagnosticas_Endodoncias(
  Pruebas_Diagnosticas_ID SERIAL PRIMARY KEY,
  Pruebas_Termicas BOOLEAN,
  Palpitacion BOOLEAN,
  Percucion BOOLEAN
);


CREATE TABLE  Sondeo_Endodoncias(
  Sondeo_ID SERIAL PRIMARY KEY,
Profundidad_Sondaje TEXT,
    Presencia_Bolsa_Periodontal BOOLEAN,
    Profundidad_Bolsa_Periodontal TEXT,
    Presencia_Trayecto_fistuloso BOOLEAN
);


CREATE TABLE Examen_Radiografico_Endodoncias(
  Examen_Radiografico_ID SERIAL PRIMARY KEY,
   Caries BOOLEAN,
    Restauraciones BOOLEAN,
    R_Interna BOOLEAN,
    R_Externa BOOLEAN,
    Zona_Radiolucida_Periapical BOOLEAN,
    Tratamiento_Conductos_Previos BOOLEAN,
    Esp_ligamento_periodontal_Ensanchado BOOLEAN,
    Discontinuidad_del_espacio BOOLEAN,
    Tamaño_Camara_pulparID INTEGER REFERENCES Tipo_Tamaño_Camara(Tipo_Tamaño_CamaraID),
    Diagnostico_Pulpar TEXT,
    Diagnostico_Periapical TEXT
);


CREATE TABLE  Datos_De_Trabajo_Endodoncias(
  Datos_De_Trabajo_ID SERIAL PRIMARY KEY,
    Tamaño_conduntoID INTEGER REFERENCES Tipo_Tamaño_Conducto(Tipo_Tamaño_ConductoID)
);





CREATE TABLE Endodoncias_Propuesta (
    EndodonciaID SERIAL PRIMARY KEY,
    Evaluacion_Dental_ID INTEGER REFERENCES Evaluacion_Dental_Endodoncias(Evaluacion_Dental_ID),
    Pruebas_Diagnosticas_ID INTEGER REFERENCES Pruebas_Diagnosticas_Endodoncias(Pruebas_Diagnosticas_ID),
    Sondeo_ID INTEGER REFERENCES  Sondeo_Endodoncias(Sondeo_ID),
    Examen_Radiografico_ID INTEGER REFERENCES Examen_Radiografico_Endodoncias(Examen_Radiografico_ID),
    Datos_De_Trabajo_ID INTEGER REFERENCES Datos_De_Trabajo_Endodoncias(Datos_De_Trabajo_ID),
    Plan_Tratamiento INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);
