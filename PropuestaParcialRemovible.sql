DROP TABLE Pilares_Parcial_Removible_Propuesta;
DROP TABLE Parcial_Removible_Propuesta;
DROP TABLE Pruebas_armazon_protesis_fija;
DROP TABLE Preparación_protesis_fija;
DROP TABLE Preparación_boca_protesis_fija;
DROP TABLE Analisis_Fotografico_protesis_fija;
DROP TABLE modelos_montados_protesis_fija;
DROP TABLE analisis_modelos_protesis_fija;
DROP TABLE Examen_atm_protesis_fija;
DROP TABLE Observaciones_Intraorales_protesis_fija;
DROP TABLE anamnesis_protesis_fija;


CREATE TABLE anamnesis_protesis_fija (
    anamnesis_protesis_fijaid SERIAL PRIMARY KEY,
    Uso_protesis BOOLEAN,
    Tipo_Protesis_anterior TEXT,
    Problema_Protesis_anterior TEXT,
    Causa_Perdida_Dientes TEXT
);


CREATE TABLE Observaciones_Intraorales_protesis_fija (
    Observaciones_Intraorales_protesis_fijaid   SERIAL PRIMARY KEY,
    Ingiene_Oral BOOLEAN,
    Indice_Caries TEXT,
    Calidad_Tegido TEXT,
    Cantidad_Tegido TEXT,
    Numero_Posicion_Diente TEXT,
    Tamaño_Dientes_Remanetes TEXT, 
    Condiciones_Proceso TEXT,
    Coincide_Relacion_Oclucion BOOLEAN,
    Interaciones_Frenillo BOOLEAN,
    Tipo_Saliva TEXT,
    Cantida_Normal_Saliva  BOOLEAN,
    Cantida_Normal_Saliva_No BOOLEAN, -- si en caso Cantida_Normal_Saliva es NO  ( Sialorrea o Xerostomía) 
    Línea_milohioidea TEXT,
    Tejidos_de_crestas_alveolares TEXT,
    Tuberosidad_del_maxilar TEXT,
    Hueso_alveolar_de_soporte TEXT,
    Presenta_Anomalías_óseas BOOLEAN,
    Especificacion_Presenta_Anomalías_óseas TEXT,
    Indicado_Procedimiento_Quirurgico BOOLEAN,
    Especificacion_Indicado_Procedimiento_Quirurgico TEXT
);


CREATE TABLE  Examen_atm_protesis_fija (
    Examen_atmid  SERIAL PRIMARY KEY,
    Desviacion_Apertura TEXT,
    Desviacion_Cierre TEXT,
    Tono_Muscular TEXT,
    Maseterio_Izquierdo TEXT,
    Maseterio_Derecho TEXT,
    Temporal_Izquierdo TEXT,
    Temporal_Derecho TEXT,
    Contactos_Prematuros BOOLEAN,
    Interferencia_Oclusales BOOLEAN,
    Desgaste_Selectivo BOOLEAN
);


CREATE TABLE analisis_modelos_protesis_fija (
    analisis_modelos_protesis_fijaid SERIAL PRIMARY KEY,
    Clase_Kennedy_Superior TEXT,
    Clase_Kennedy_Inferior TEXT,
    Espacio_interoclusal BOOLEAN,
    Espacio_Endetulo_Superior TEXT,
    Espacio_Modificacion_1_Superior VARCHAR(50),
    Espacio_Modificacion_2_Superior VARCHAR(50),
    Espacio_Modificacion_3_Superior VARCHAR(50),
    Espacio_Endetulo_Inferior TEXT,
    Espacio_Modificacion_1_Inferior VARCHAR(50),
    Espacio_Modificacion_2_Inferior VARCHAR(50),
    Espacio_Modificacion_3_Inferior VARCHAR(50)
);


CREATE TABLE modelos_montados_protesis_fija (
    Modelos_Montadosid SERIAL PRIMARY KEY,
    Piezas_Adecuadas TEXT,
    Ubicacion_Favorable BOOLEAN,
    Formacion_Planos_Guias BOOLEAN,
    Modificacion_Dentales BOOLEAN,
    Especificacion TEXT
);


CREATE TABLE Analisis_Fotografico_protesis_fija (
    Analisis_Fotograficoid SERIAL PRIMARY KEY,
    Diagnostico TEXT,
    Pronostico TEXT
);

CREATE TABLE Preparación_boca_protesis_fija (
    Preparación_bocaid SERIAL PRIMARY KEY,
    Tratamiento_Periodontal TEXT,
    Tratamiento_endodontico TEXT,
    Cirugia_Preprotesica TEXT,
    Odontologia_Restaurativa TEXT
);

CREATE TABLE Preparación_protesis_fija (
    Preparaciónid SERIAL PRIMARY KEY,
    Tipo_de_Impresion_Estudio BOOLEAN,
    Tipo_de_Impresion_Trabajo BOOLEAN,
    Seleccion_Dientes TEXT 
);

CREATE TABLE Pruebas_armazon_protesis_fija (
    Pruebas_armazon_protesis_fijaid SERIAL PRIMARY KEY,
    Foto_Prueba_Armazon TEXT,
    Foto_Relacion_interoclusales TEXT,
    Foto_Instalacion_PPR TEXT,
    Foto_Control_Post_operatorio TEXT,
    Imagen_superior TEXT,
    Clase_superior VARCHAR(150),
    Conector_superior VARCHAR(150),
    Base_superior VARCHAR(150),
    Retenedores_Directos_Superior VARCHAR(150),
    Retenedores_Indirectos_Superior VARCHAR(150),
    Imagen_Inferior TEXT,
    Clase_Inferior VARCHAR(150),
    Conector_Inferior VARCHAR(150),
    Base_Inferior VARCHAR(150),
    Retenedores_Directos_Inferior VARCHAR(150),
    Retenedores_Indirectos_Inferior VARCHAR(150)
);



--69.
CREATE TABLE Parcial_Removible_Propuesta (
   Parcial_RemovibleID SERIAL PRIMARY KEY,
   anamnesis_protesis_fijaid INTEGER REFERENCES anamnesis_protesis_fija(anamnesis_protesis_fijaid),
   Observaciones_Intraorales_protesis_fijaid INTEGER REFERENCES Observaciones_Intraorales_protesis_fija(Observaciones_Intraorales_protesis_fijaid),
   Examen_atmid INTEGER REFERENCES Examen_atm_protesis_fija( Examen_atmid),
   analisis_modelos_protesis_fijaid INTEGER REFERENCES analisis_modelos_protesis_fija(analisis_modelos_protesis_fijaid),
   Modelos_Montadosid INTEGER REFERENCES modelos_montados_protesis_fija( Modelos_Montadosid),
   Analisis_Fotograficoid INTEGER REFERENCES Analisis_Fotografico_protesis_fija(Analisis_Fotograficoid),
   Preparación_bocaid INTEGER REFERENCES Preparación_boca_protesis_fija(Preparación_bocaid),
   Preparaciónid INTEGER REFERENCES Preparación_protesis_fija(Preparaciónid),
   Pruebas_armazon_protesis_fijaid INTEGER REFERENCES Pruebas_armazon_protesis_fija(Pruebas_armazon_protesis_fijaid),
   Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
   Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
   EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
   DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);



--70.
CREATE TABLE Pilares_Parcial_Removible_Propuesta(
    PilaresID SERIAL PRIMARY KEY,
    DienteID INTEGER,
    Num_Pilar INTEGER,
    Preparacion_planos_guias BOOLEAN,
    Preparacion_Descanzo BOOLEAN,
    Areas_Retentivas BOOLEAN,
    Preparaciónid INTEGER,
    FOREIGN KEY (DienteID) REFERENCES Dientes(DienteID),
    FOREIGN KEY (Preparaciónid) REFERENCES Preparación_protesis_fija(Preparaciónid)
);
