CREATE TABLE Cirugias_Bucal (
    Cirugia_BucalID SERIAL PRIMARY KEY,  -- Identificador único y autoincremental para cada cirugía bucal
    Pieza_Dentaria INTEGER, -- Almacena la descripción de la pieza dentaria involucrada en la cirugía
    Diagnostico TEXT, -- Almacena la descripción del diagnóstico relacionado con la cirugía
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID), -- Clave foránea referenciando a la tabla Registros
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta), -- Clave foránea referenciando a la tabla Estudiantes
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID), -- Clave foránea referenciando a la tabla Plan_Tratamiento
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);