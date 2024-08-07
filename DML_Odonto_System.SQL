
--------------- INSERTS KEVIN ---------------
-- Insertar datos en Cargos
INSERT INTO Cargos (Nombre, Descripcion) VALUES 
('Estudiante', 'Estudiante de la universidad'),
('Docente', 'Docente de la universidad'),
('Jefatura', 'Jefe de departamento'),
('Recepción', 'Personal de recepción'),
('Pre-recepción', 'Personal de pre-recepción'),
('Imagenología', 'Imagenología'),
('Paciente', 'Paciente');

-- Insertar datos en Sexos
INSERT INTO Sexos (Nombre) VALUES 
('Masculino'),
('Femenino'),
('Otro');

-- Insertar datos en Estado_Civil
INSERT INTO Estado_Civil (Nombre) VALUES 
('Soltero'),
('Casado');

-- Insertar datos en Nacionalidades
INSERT INTO Nacionalidades (Nombre) VALUES 
('Hondureña'),
('Guatemalteca'),
('Salvadoreña'),
('Nicaragüense'),
('Costarricense');

-- Insertar datos en Tipo_Documentos
INSERT INTO Tipo_Documentos (Nombre_Documento) VALUES 
('DNI'),
('Pasaporte'),
('Carnet de estudiante');

---------------------------------------------------------------


-- Insertar datos en Estados_Aprobacion_Docente
INSERT INTO Estados_Aprobacion_Docente (Nombre)
VALUES
    ('Pendiente'),
    ('Aprobado'),
    ('Rechazado');



INSERT INTO Clinicas (Nombre, DepartamentoID)
VALUES
    ('Diagnostico', null), 
    ('Urgencia', null), 
    ('Periodoncia', null), 
    ('Ortodoncia', null), 
    ('Operatoria', null),
    ('Cirugía', null),
    ('Paidodoncia', null),
    ('Endodoncia', null),
    ('Prótesis Removible', null),
    ('Prótesis Total', null)
    ; 



INSERT INTO Cobros_Pendientes (Concepto, Estado, monto, PacienteID, Remisiones_imagenologiaID)
VALUES ('Periapical', 'Pendiente', 150.00, 1, 1);


INSERT INTO Tipo_Radiografias (Nombre, Costo) VALUES ('Panorámica', 80.00);
INSERT INTO Tipo_Radiografias (Nombre, Costo) VALUES ('Periapical', 50.00);
INSERT INTO Tipo_Radiografias (Nombre, Costo) VALUES ('Oclusal', 60.00);
INSERT INTO Tipo_Radiografias (Nombre, Costo) VALUES ('Bitewing', 70.00);
INSERT INTO Tipo_Radiografias (Nombre, Costo) VALUES ('Palatina', 55.00);
INSERT INTO Tipo_Radiografias (Nombre, Costo) VALUES ('Cefalométrica', 90.00);
INSERT INTO Tipo_Radiografias (Nombre, Costo) VALUES ('Tomografía', 120.00);
