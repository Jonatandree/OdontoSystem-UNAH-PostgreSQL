DROP TABLE IF EXISTS Operatorias_Propuesta;
DROP TABLE IF EXISTS Estado_Piezas_Operatorias;
DROP TABLE IF EXISTS Patologias_No_Dentarias_Operatorias;
DROP TABLE IF EXISTS Oclusion_Operatorias;

CREATE TABLE Oclusion_Operatorias (
    Oclusion_Operatoriasid SERIAL PRIMARY KEY,
    Sobremordida_Vertical BOOLEAN,
    Mordida_Abierta BOOLEAN,
    Ruidos_En_Boca BOOLEAN,
    Sobremordida_Horizontal BOOLEAN,
    Hiperlaxitud_Ligamentos BOOLEAN

);

CREATE TABLE Patologias_No_Dentarias_Operatorias (
    Patologias_No_Dentarias_Operatoriasid SERIAL PRIMARY KEY,
    Abrasion BOOLEAN,
    Erosion BOOLEAN,
    Atriccion BOOLEAN,
    Bruxismo BOOLEAN
);

CREATE TABLE Estado_Piezas_Operatorias (
    Estado_Piezas_Operatoriasid SERIAL PRIMARY KEY,
    imagen_diagnostico_inicial TEXT,
    imagen_diagnostico_Final TEXT
);


CREATE TABLE Operatorias_Propuesta (
    OperatoriaID SERIAL PRIMARY KEY,
    Oclusion_Operatoriasid INTEGER REFERENCES Oclusion_Operatorias(Oclusion_Operatoriasid),
    Patologias_No_Dentarias_Operatoriasid INTEGER REFERENCES Patologias_No_Dentarias_Operatorias (Patologias_No_Dentarias_Operatoriasid),
    Estado_Piezas_Operatoriasid INTEGER REFERENCES Estado_Piezas_Operatorias (Estado_Piezas_Operatoriasid),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);
