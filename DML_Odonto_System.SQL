
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


-- Insertar datos en Drogas
INSERT INTO Drogas (nombre) VALUES
('Cocaína'),
('Marihuana'),
('Éxtasis'),
('LSD'),
('Heroína'),
('Metanfetaminas'),
('Ketamina'),
('MDMA'),
('Fentanilo'),
('GHB'),
('MDA'),
('Psilocibina'),
('Anfetaminas'),
('Mescalina'),
('DMT'),
('Crack'),
('Mushrooms'),
('LSD'),
('Otras');  -- Opción para otras drogas

-- Insertar datos en TamanoCepillo
INSERT INTO TamanoCepillo (descripcion) VALUES
('Pequeño'),
('Mediano'),
('Grande');

-- Insertar datos en TipoCerdas
INSERT INTO TipoCerdas (descripcion) VALUES
('Suave'),
('Medio'),
('Duro');

-- Insertar datos en PresionCepillado
INSERT INTO PresionCepillado (descripcion) VALUES
('Bajo'),
('Medio'),
('Alto');

-- Insertar datos en TipoDisfuncion
INSERT INTO TipoDisfuncion (descripcion) VALUES
('TMD'),
('ATM'),
('Sin Disfunción');

-- Insertar datos en RuidosArticulares
INSERT INTO RuidosArticulares (descripcion) VALUES
('Crujidos'),
('Sin ruidos'),
('Chasquidos');

-- Insertar datos en Medicamentos
INSERT INTO Medicamentos (nombre) VALUES
('Paracetamol'),
('Ibuprofeno'),
('Amoxicilina'),
('Aspirina'),
('Metformina'),
('Loratadina'),
('Cetirizina'),
('Clopidogrel'),
('Atorvastatina'),
('Enalapril'),
('Omeprazol'),
('Salbutamol'),
('Captopril'),
('Losartán'),
('Metoprolol'),
('Diclofenaco'),
('Naproxeno'),
('Azitromicina'),
('Tramadol'),
('Doxiciclina'),
('Lorazepam'),
('Hydroxyzine'),
('Morfina'),
('Prednisona'),
('Furosemida'),
('Diazepam'),
('Levotiroxina'),
('Simvastatina'),
('Sertralina'),
('Ranitidina'),
('Pantoprazol'),
('Sildenafil'),
('Buspirona'),
('Clonazepam'),
('Tamoxifeno'),
('Insulina'),
('Mebendazol'),
('Ciprofloxacino'),
('Lisinopril'),
('Cefalexina'),
('Valeriana'),
('Ropinirol'),
('Gabapentina'),
('Carbamazepina'),
('Otras');  -- Opción para otros medicamentos

-- Insertar datos en Presentaciones
INSERT INTO Presentaciones (descripcion) VALUES
('Tabletas'),
('Jarabe'),
('Capsulas'),
('Polvo'),
('Inyección');

-- Insertar datos en Frecuencias
INSERT INTO Frecuencias (descripcion) VALUES
('Cada 6 horas'),
('Cada 12 horas'),
('Una vez al día'),
('Cada 2 días'),
('Cada semana');

-- Insertar datos en Enfermedades
INSERT INTO Enfermedades (nombre) VALUES
('Diabetes'),
('Hipertensión'),
('Asma'),
('Cáncer'),
('Artritis'),
('Colesterol alto'),
('Enfermedad cardíaca'),
('EPOC (Enfermedad Pulmonar Obstructiva Crónica)'),
('Insuficiencia renal'),
('Gastritis'),
('Úlcera péptica'),
('Epilepsia'),
('Esclerosis múltiple'),
('Parkinson'),
('Sclerosis lateral amiotrófica (ELA)'),
('Fibromialgia'),
('Lupus'),
('Espondilitis anquilosante'),
('Células de Sickle (Anemia de células falciformes)'),
('Anemia'),
('Hepatitis'),
('Cirrosis'),
('HIV/SIDA'),
('Tuberculosis'),
('Síndrome de Down'),
('Síndrome de Marfan'),
('Alergias alimentarias'),
('Alergias estacionales'),
('Migrañas'),
('Síndrome del túnel carpiano'),
('Obesidad'),
('Osteoporosis'),
('Psoriasis'),
('Síndrome de fatiga crónica'),
('Trastorno bipolar'),
('Depresión'),
('Esquizofrenia'),
('Otras');  -- Opción para otras enfermedades


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
