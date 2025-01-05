DROP TABLE Pilares_Parcial_Removible_Propuesta;
DROP TABLE Parcial_Removible_Propuesta;
DROP TABLE Pruebas_armazon_protesis_Removible;
DROP TABLE Preparación_protesis_Removible;
DROP TABLE Preparación_boca_protesis_Removible;
DROP TABLE Analisis_Fotografico_protesis_Removible;
DROP TABLE modelos_montados_protesis_Removible;
DROP TABLE analisis_modelos_protesis_Removible;
DROP TABLE Examen_atm_protesis_Removible;
DROP TABLE Observaciones_Intraorales_protesis_Removible;
DROP TABLE anamnesis_protesis_Removible;







CREATE TABLE anamnesis_protesis_Removible (
    anamnesis_protesis_Removibleid SERIAL PRIMARY KEY,
    Uso_protesis BOOLEAN,
    Tipo_Protesis_anterior TEXT,
    Problema_Protesis_anterior TEXT,
    Causa_Perdida_Dientes TEXT
);


CREATE TABLE Observaciones_Intraorales_protesis_Removible (
    Observaciones_Intraorales_protesis_Removibleid   SERIAL PRIMARY KEY,
    Higiene_Oral TEXT,
    Indice_Caries TEXT,
    Calidad_Tejido TEXT,
    Cantidad_Tejido TEXT,
    Numero_Posicion_Diente TEXT,
    Tamaño_Dientes_Remanetes TEXT, 
    Condiciones_Proceso TEXT,
    Coincide_Relacion_Oclucion BOOLEAN,
    Inserciones_Frenillo BOOLEAN,
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


CREATE TABLE  Examen_atm_protesis_Removible (
    Examen_atmid  SERIAL PRIMARY KEY,
    Desviacion_Apertura TEXT,
    Desviacion_Cierre TEXT,
    Tono_Muscular TEXT,
    Masetero_Izquierdo TEXT,
    Masetero_Derecho TEXT,
    Temporal_Izquierdo TEXT,
    Temporal_Derecho TEXT,
    Contactos_Prematuros BOOLEAN,
    Interferencia_Oclusales BOOLEAN,
    Desgaste_Selectivo BOOLEAN
);


CREATE TABLE analisis_modelos_protesis_Removible (
    analisis_modelos_protesis_Removibleid SERIAL PRIMARY KEY,
    Clase_Kennedy_Superior TEXT,
    Clase_Kennedy_Inferior TEXT,
    Img_Kennedy TEXT,
    Analisis TEXT,
    Espacio_interoclusal BOOLEAN,
);

CREATE TABLE Clasificacion_Seibert{
    Clasificacion_SeibertID SERIAL PRIMARY KEY,
    Espacio_Edetulo_Superior TEXT,
    Espacio_Modificacion_1_Superior TEXT,
    Espacio_Modificacion_2_Superior TEXT,
    Espacio_Modificacion_3_Superior TEXT,
    Espacio_Endetulo_Inferior TEXT,
    Espacio_Modificacion_1_Inferior TEXT,
    Espacio_Modificacion_2_Inferior TEXT,
    Espacio_Modificacion_3_Inferior TEXT
}


CREATE TABLE modelos_montados_protesis_Removible (
    Modelos_Montadosid SERIAL PRIMARY KEY,
    Piezas_Adecuadas TEXT,
    Ubicacion_Favorable BOOLEAN,
    Formacion_Planos_Guias BOOLEAN,
    Modificacion_Dentales BOOLEAN,
    Especificacion TEXT
);


CREATE TABLE Analisis_Fotografico_protesis_Removible (
    Analisis_Fotograficoid SERIAL PRIMARY KEY,
    Diagnostico TEXT,
    Pronostico TEXT
);

CREATE TABLE Preparación_boca_protesis_Removible (
    Preparación_bocaid SERIAL PRIMARY KEY,
    Tratamiento_Periodontal TEXT,
    Tratamiento_endodontico TEXT,
    Cirugia_Preprotesica TEXT,
    Odontologia_Restaurativa TEXT
);

CREATE TABLE Preparación_protesis_Removible (
    Preparaciónid SERIAL PRIMARY KEY,
    Tipo_de_Impresion_Estudio BOOLEAN,
    Tipo_de_Impresion_Trabajo BOOLEAN,
    Preparacion_Planos_Guias TEXT,
    Preparacion_Descansos TEXT,
    Creacion_Aumento_Areas TEXT,
    Seleccion_Dientes TEXT 
);

CREATE TABLE Pruebas_armazon_protesis_Removible (
    Pruebas_armazon_protesis_Removibleid SERIAL PRIMARY KEY,
    Foto_Prueba_Armazon TEXT,
    Foto_Relacion_interoclusales TEXT,
    Foto_Instalacion_PPR TEXT,
    Foto_Control_Post_operatorio TEXT,

    --Inicial
    Imagen_superior_Inicial TEXT,
    Clase_superior_Inicial VARCHAR(150),
    Conector_superior_Inicial VARCHAR(150),
    Base_superior_Inicial VARCHAR(150),
    Retenedores_Directos_Superior_Inicial VARCHAR(150),
    Retenedores_Indirectos_Superior_Inicial VARCHAR(150),
    Imagen_Inferior_Inicial TEXT,
    Clase_Inferior_Inicial VARCHAR(150),
    Conector_Inferior_Inicial VARCHAR(150),
    Base_Inferior_Inicial VARCHAR(150),
    Retenedores_Directos_Inferior_Inicial VARCHAR(150),
    Retenedores_Indirectos_Inferior_Inicial VARCHAR(150),

    --Final
    Imagen_superior_Final TEXT,
    Clase_superior_Final VARCHAR(150),
    Conector_superior_Final VARCHAR(150),
    Base_superior_Final VARCHAR(150),
    Retenedores_Directos_Superior_Final VARCHAR(150),
    Retenedores_Indirectos_Superior_Final VARCHAR(150),
    Imagen_Inferior_Final TEXT,
    Clase_Inferior_Final VARCHAR(150),
    Conector_Inferior_Final VARCHAR(150),
    Base_Inferior_Final VARCHAR(150),
    Retenedores_Directos_Inferior_Final VARCHAR(150),
    Retenedores_Indirectos_Inferior_Final VARCHAR(150),
    
);



--69.
CREATE TABLE Parcial_Removible_Propuesta (
   Parcial_RemovibleID SERIAL PRIMARY KEY,
   anamnesis_protesis_Removibleid INTEGER REFERENCES anamnesis_protesis_Removible(anamnesis_protesis_Removibleid),
   Observaciones_Intraorales_protesis_Removibleid INTEGER REFERENCES Observaciones_Intraorales_protesis_Removible(Observaciones_Intraorales_protesis_Removibleid),
   Examen_atmid INTEGER REFERENCES Examen_atm_protesis_Removible( Examen_atmid),
   analisis_modelos_protesis_Removibleid INTEGER REFERENCES analisis_modelos_protesis_Removible(analisis_modelos_protesis_Removibleid),
   Modelos_Montadosid INTEGER REFERENCES modelos_montados_protesis_Removible( Modelos_Montadosid),
   Analisis_Fotograficoid INTEGER REFERENCES Analisis_Fotografico_protesis_Removible(Analisis_Fotograficoid),
   Preparación_bocaid INTEGER REFERENCES Preparación_boca_protesis_Removible(Preparación_bocaid),
   Preparaciónid INTEGER REFERENCES Preparación_protesis_Removible(Preparaciónid),
   Pruebas_armazon_protesis_Removibleid INTEGER REFERENCES Pruebas_armazon_protesis_Removible(Pruebas_armazon_protesis_Removibleid),
   Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
   Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
   EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
   DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    Clasificacion_SeibertID REFERENCES Clasificacion_Seibert(Clasificacion_SeibertID)
);


CREATE TABLE Pilares_Parcial_Removible_Propuesta(
    PilaresID SERIAL PRIMARY KEY,
    DienteID INTEGER,
    Num_Pilar INTEGER,
    Preparacion_planos_guias BOOLEAN,
    Preparacion_Descanzo BOOLEAN,
    Areas_Retentivas BOOLEAN,
    Preparaciónid INTEGER,
    FOREIGN KEY (DienteID) REFERENCES Dientes(DienteID),
    FOREIGN KEY (Preparaciónid) REFERENCES Preparación_protesis_Removible(Preparaciónid)
);

