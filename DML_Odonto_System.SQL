
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

INSERT INTO area (nombre) VALUES
('Encía Paladar blando'),
('Lengua'),
('Paladar duro'),
('Labios'),
('ATM'),
('Carrillos'),
('Anodoncia'),
('Piso de la boca'),
('Supernumerarios'),
('Ganglios linfáticos'),
('Músculos'),
('Glándulas salivales'),
('Amígdalas'),
('Otros');

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
