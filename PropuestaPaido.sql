DROP TABLE Odonto_Pedriatrias_Propuesta;
DROP TABLE Control_Placa_Indice_Odonto_Pedriatrias;
DROP TABLE Dieta_Odonto_Pedriatrias;
DROP TABLE Sistema_Periodontal_Odonto_Pedriatrias;
DROP TABLE Analisis_Funcional_Odonto_Pedriatria;
DROP TABLE Sistema_Craneofacial_Odonto_Pedriatrias;
DROP TABLE Area_Estomatognica_Odonto_Pedriatria;
DROP TABLE Antecedentes_Personales_Odonto_Pedriatrias;





CREATE TABLE  Antecedentes_Personales_Odonto_Pedriatrias(
  Antecedentes_PersonalesID SERIAL PRIMARY KEY,
    Prenatales TEXT,
    Perinatales TEXT,
    Patologicos TEXT,
    Farmacologicos TEXT,
    Quirurgicos_Hospitalarios TEXT,
    Traumaticos TEXT,
    alergias_Medicamento BOOLEAN,
    Especificacion_alergias_Medicamento TEXT,
    Alergia_Anestesico BOOLEAN,
    Especificacion_Alergia_Anestesico TEXT,
    Alergia_Alimentos BOOLEAN,
    Especificacion_Alergia_Alimentos TEXT,
    Transfunciones TEXT
);


-- falta en frontend
CREATE TABLE  Area_Estomatognica_Odonto_Pedriatria(
  Area_EstomatognicaID SERIAL PRIMARY KEY,
    Labios TEXT,
    Comisuras TEXT,
    Incursion_De_Frenillos TEXT,
    Mucosa TEXT,
    Encía TEXT,
    Paladar_Duro TEXT,
    Uvula TEXT,
    Orofaringe TEXT,
    Lengua TEXT,
    Piso_De_La_boca TEXT,
    Saliva VARCHAR(255)
);



CREATE TABLE  Sistema_Craneofacial_Odonto_Pedriatrias(
  Sistema_CraneofacialID SERIAL PRIMARY KEY,
    Perfil INTEGER REFERENCES Tipo_Perfil(Tipo_PerfilID),
    Cabeza INTEGER REFERENCES Tipo_Cabeza(Tipo_CabezaID),
    Denticion INTEGER REFERENCES Tipo_Denticion(Tipo_DenticionID),
    Clase_Molar_Derecha INTEGER REFERENCES Tipo_Clase_Num_Romano(Tipo_Clase_Num_RomanoID),
    Clase_Molar_Izquierda INTEGER REFERENCES Tipo_Clase_Num_Romano(Tipo_Clase_Num_RomanoID),
    Plano_Recto INTEGER REFERENCES Tipo_Planos_Odonto_Pedriatrias(Tipo_Planos_Odonto_PedriatriasID),
    Plano_Mesial INTEGER REFERENCES Tipo_Planos_Odonto_Pedriatrias(Tipo_Planos_Odonto_PedriatriasID),
    Plano_Distal INTEGER REFERENCES Tipo_Planos_Odonto_Pedriatrias(Tipo_Planos_Odonto_PedriatriasID),
    Clase_Canina_Derecha INTEGER REFERENCES Tipo_Clase_Num_Romano(Tipo_Clase_Num_RomanoID),
    Clase_Canina_Izquierda INTEGER REFERENCES Tipo_Clase_Num_Romano(Tipo_Clase_Num_RomanoID),
    Sobre_mordida_Horizontal NUMERIC(5, 2),
    Piezas_Involucradas_Modida_Horizontal TEXT,
    Sobre_Mordida_Vertical NUMERIC(5, 2),
    Piezas_Involucradas_Modida_Vertical TEXT,
    Mordida_Cruzada BOOLEAN,
    Anterior BOOLEAN,
    Posterior BOOLEAN,
    Piezas_Involucradas_Mordida_Cruzada INTEGER,
    Mordida_Borde_A_Borde BOOLEAN,
    Mordida_Abierta BOOLEAN,
    Razon_Mordida_Abierta TEXT,
    Linea_Media BOOLEAN,
    Arco_Dentario INTEGER REFERENCES Tipo_Arco_Odonto_Pedriatrias(Tipo_Arco_Odonto_PedriatriasID)
);



CREATE TABLE  Analisis_Funcional_Odonto_Pedriatria(
  Analisis_FuncionalID SERIAL PRIMARY KEY,
    Tipo_Respiracion INTEGER REFERENCES Tipo_Respiracion(Tipo_RespiracionID),
    Ronca BOOLEAN,
    Rechina_Dientes BOOLEAN,
    Sellado_Labial BOOLEAN,
    Desglucion INTEGER REFERENCES Tipo_Desglucion(Tipo_DesglucionID),
    Tonicidad_Labial INTEGER REFERENCES Tonicidad_Labial(Tonicidad_LabialID),
    Apertura_Bucal NUMERIC(5, 2),
    Desgaste_Caninos BOOLEAN,
    Succion_Digital BOOLEAN,
    Chupon BOOLEAN,
    Morderse_Unyas BOOLEAN,
    Proyeccion_Lingual BOOLEAN
);



CREATE TABLE  Sistema_Periodontal_Odonto_Pedriatrias(
  Sistema_PeriodontalID SERIAL PRIMARY KEY,
  Presencia_Sangrado BOOLEAN,
  Movilidad_Dentaria BOOLEAN,
  Fisiologica BOOLEAN,
  Patologica BOOLEAN,
  Presencia_Abceso BOOLEAN,
  Localizacion_Presencia_Absceso TEXT,
  Halitosis BOOLEAN
);

CREATE TABLE Lactancia_Materna{
  Lactancia_MaternaID SERIAL PRIMARY KEY,
  Nombre VARCHAR(255) UNIQUE NOT NULL
  
  }


CREATE TABLE  Dieta_Odonto_Pedriatrias(
  DietaID SERIAL PRIMARY KEY,
  Carbohidratos TEXT,
  Proteinas TEXT,
  Grasas TEXT,
  Come_Frecuentemente_Entre_Comidas BOOLEAN,
  Frecuencia_Comidas INTEGER,
  Uso_De_Biberon TEXT,
  Frecuencia_uso_de_biberon TEXT,
  Numero_Biberones_Por_Dia INTEGER,
  Onzas_De_Leche_Biberon INTEGER,
  Otros_Agregados_Biberon TEXT,
  Cepillado_Despues_Biberon BOOLEAN,
  Duerme_con_el_biberon BOOLEAN,
  Uso_Vaso_Entrenador BOOLEAN,
  Otros_Bebida_Uso_Vaso_Entrenador TEXT,
  Mantiene_Lactancia_Materna INTEGER REFERENCES Lactancia_Materna(Lactancia_MaternaID),
  Combinacion_Lactancia TEXT,
  Observaciones TEXT

);


CREATE TABLE  Control_Placa_Indice_Odonto_Pedriatrias(
  Control_Placa_IndiceID SERIAL PRIMARY KEY,
  Imagen_Control_Placa_oleary TEXT
);



CREATE TABLE Odonto_Pedriatrias_Propuesta (
    OdontoPedriatriaID SERIAL PRIMARY KEY,
    Antecedentes_PersonalesID INTEGER REFERENCES  Antecedentes_Personales_Odonto_Pedriatrias( Antecedentes_PersonalesID),
    Area_EstomatognicaID INTEGER REFERENCES  Area_Estomatognica_Odonto_Pedriatria(Area_EstomatognicaID),
    Sistema_CraneofacialID INTEGER REFERENCES   Sistema_Craneofacial_Odonto_Pedriatrias(Sistema_CraneofacialID),
    Analisis_FuncionalID INTEGER REFERENCES  Analisis_Funcional_Odonto_Pedriatria(Analisis_FuncionalID),
    Sistema_PeriodontalID INTEGER REFERENCES  Sistema_Periodontal_Odonto_Pedriatrias( Sistema_PeriodontalID),
    DietaID INTEGER REFERENCES  Dieta_Odonto_Pedriatrias( DietaID),
    Control_Placa_IndiceID INTEGER REFERENCES  Control_Placa_Indice_Odonto_Pedriatrias( Control_Placa_IndiceID),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);
