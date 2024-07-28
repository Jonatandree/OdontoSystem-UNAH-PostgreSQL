ALTER TABLE Cobros_Pendientes
ADD COLUMN PacienteID INTEGER REFERENCES Pacientes(PacienteID);


ALTER TABLE Cobros_Pendientes
ADD COLUMN ReciboID INTEGER REFERENCES Recibos(ReciboID);


ALTER TABLE Recibos
ADD COLUMN imagen text;


CREATE TABLE Usuarios (
    NumeroCuenta VARCHAR(20),
    CorreoID INTEGER REFERENCES Correos(CorreoID),
    CargoID INTEGER REFERENCES Cargos(CargoID),
    PersonaID INTEGER REFERENCES Personas(PersonaID),
    PRIMARY KEY (NumeroCuenta, CargoID)
);


ALTER TABLE Recibos
ADD COLUMN PacienteID INTEGER;

ALTER TABLE Recibos
ADD CONSTRAINT fk_paciente
FOREIGN KEY (PacienteID) REFERENCES Pacientes(PacienteID);
