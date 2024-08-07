ALTER TABLE Lista_Tratamiento
    DROP COLUMN DiagnosticoID, -- Eliminar la columna DiagnosticoID
    ADD COLUMN ClinicaID INTEGER REFERENCES Clinicas(ClinicaID), -- Añadir la columna ClinicaID
    ADD COLUMN ReciboID INTEGER REFERENCES Recibos(ReciboID), -- Añadir la columna ReciboID
    ADD COLUMN Estado VARCHAR(20); -- Añadir la columna Estado

-- Para la tabla Plan_Tratamiento
ALTER TABLE Plan_Tratamiento
    ADD COLUMN Costo DECIMAL(10, 2), -- Añadir la columna Costo
    ADD COLUMN Saldo DECIMAL(10, 2), -- Añadir la columna Saldo
    ADD COLUMN PersonaID INTEGER REFERENCES Personas(PersonaID); -- Añadir la columna PersonaID

    ALTER TABLE Plan_Tratamiento
ADD COLUMN fecha_creacion DATE;



CREATE TABLE Lista_Tratamiento (
    Lista_TratamientoID SERIAL PRIMARY KEY,  -- Identificador único y autoincremental para cada registro de tratamiento
    DienteID INTEGER REFERENCES Dientes(DienteID), -- Clave foránea referenciando a la tabla Dientes
    TratamientoID INTEGER REFERENCES Tratamientos(TratamientoID), -- Clave foránea referenciando a la tabla Tratamientos
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID), -- Clave foránea referenciando a la tabla Plan_Tratamiento
    ClinicaID INTEGER REFERENCES Clinicas(ClinicaID), -- Clave foránea referenciando a la tabla Docentes
    Estado VARCHAR(20) 
);
