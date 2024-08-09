DROP TABLE Cirugias_Bucal_Propuesta;
DROP TABLE Evalucion_Dental_Cirugia;



CREATE TABLE Evalucion_Dental_Cirugia (
    Evalucion_Dental_CirugiaID SERIAL PRIMARY KEY, 
    Pieza_Dentaria INTEGER,
    Diagnostico TEXT
);

CREATE TABLE Cirugias_Bucal_Propuesta (
    Cirugia_BucalID SERIAL PRIMARY KEY,  
    Evalucion_Dental_CirugiaID INTEGER REFERENCES Evalucion_Dental_Cirugia(Evalucion_Dental_CirugiaID),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID), 
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta), 
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID), 
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);