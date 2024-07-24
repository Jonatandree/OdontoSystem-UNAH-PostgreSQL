ALTER TABLE Cobros_Pendientes
ADD COLUMN PacienteID INTEGER REFERENCES Pacientes(PacienteID);