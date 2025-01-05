DROP TABLE Protesis_Total_Propuesta;
DROP TABLE Encerado_diagnostico_Protesis_Total;
DROP TABLE Examen_Intraoral_Protesis_Total;
DROP TABLE Observaciones_Protesis_Total;
DROP TABLE Impresion_Clinica_Intraoral_Protesis_Total;
DROP TABLE Examen_Extraoral_Protesis_Total;
DROP TABLE Examen_ATM_Protesis_Total;
DROP TABLE Impresion_Clinica_Extraoral_Protesis_Total;




CREATE TABLE Impresion_Clinica_Extraoral_Protesis_Total (
    Impresion_Clinica_Extraoralid SERIAL PRIMARY KEY,
    Menton_Prominente BOOLEAN,
    Musculatura_Perioral BOOLEAN,
    Existe_Patologia_Extraoral BOOLEAN,
    Explicacion_Patologia_Extraoral TEXT,
    Asimetrias_Faciales BOOLEAN
);




CREATE TABLE Examen_ATM_Protesis_Total (
    Examen_ATMid SERIAL PRIMARY KEY,
    Desviacion_Apertura TEXT,
    Desviacion_Cierre TEXT,
    Tono_Muscular TEXT,
    Masetero_Izquierdo TEXT,
    Masetero_Derecho TEXT,
    Temporal_Izquierdo TEXT,
    Temporal_Derecho TEXT,
    Presencia_Ruido_Derecho TEXT,
    Presencia_Ruido_Izquierda TEXT,
    Luxacion_Derecha TEXT,
    Luxacion_Izquierda TEXT,
    Subluxacion_Derecha TEXT,
    Subluxacion_Izquierda TEXT,
    Observaciones TEXT
);



CREATE TABLE Examen_Extraoral_Protesis_Total (
    Examen_Extraoralid SERIAL PRIMARY KEY,
    Fenotipo_Facial INTEGER REFERENCES Tipo_Fenotipo_Facial(Tipo_Fenotipo_FacialID),
    Forma_Facial INTEGER REFERENCES Tipo_Forma_Facial(Tipo_Forma_FacialID),
    Medida_Vertical_Reposo DECIMAL(5, 2),
    Tercio_Superior DECIMAL(5, 2),
    Tercio_Medio DECIMAL(5, 2),
    Tercio_Inferior DECIMAL(5, 2),
    Asimetria_Tercios BOOLEAN,
    Especifique_Asimetria_Tercios TEXT,
    Quinto_Central DECIMAL(5, 2),
    Quinto_Lateral_Derecha DECIMAL(5, 2),
    Quinto_Lateral_Izquierda DECIMAL(5, 2),
    Quinto_Externo_Derecho DECIMAL(5, 2),
    Quinto_Externo_Izquierdo DECIMAL(5, 2),
    Asimetria_Quintos BOOLEAN,
    Especifique_Asimetria_Quintos TEXT,
    Perfil INTEGER REFERENCES Tipo_Perfil(Tipo_PerfilID),
    Relacion_Maxilomandibular TEXT,
    Color_de_piel INTEGER REFERENCES Tipo_Color_Piel(Tipo_Color_PielID),
    Color_de_ojos INTEGER REFERENCES Color_de_Ojos(Color_de_OjosID)
);



CREATE TABLE Impresion_Clinica_Intraoral_Protesis_Total (
    Impresion_Clinica_Intraoralid SERIAL PRIMARY KEY,
    Presencia_Dientes BOOLEAN,
    Ausencia_Total_Dientes BOOLEAN,
    Portador_Protesis BOOLEAN,
    Protesis_Combinada BOOLEAN, 
    Protesis_Bien_Adaptada BOOLEAN,
    Requiere_Cambio BOOLEAN,
    Porque_Requiere_Cambios TEXT,
    Espacio_Intermaxilar_Reducido BOOLEAN,
    Espacio_Intermaxilar_Suficiente BOOLEAN
);



CREATE TABLE Observaciones_Protesis_Total (
    Observacionesid SERIAL PRIMARY KEY,
    Mucosa_Maxilar_Superior INTEGER REFERENCES Tipo_Mucosa_Maxilar(Tipo_Mucosa_MaxilarID),
    Mucosa_Maxilar_Inferior INTEGER REFERENCES Tipo_Mucosa_Maxilar(Tipo_Mucosa_MaxilarID),
    Lesiones TEXT,
    Torus_Paladino INTEGER REFERENCES Tipo_Torus(Tipo_TorusID),
    Torus_Mandibular INTEGER REFERENCES Tipo_Torus(Tipo_TorusID),
    Consistencia_Papila_Derecho INTEGER REFERENCES Tipo_Consistencia_Papilla(Tipo_Consistencia_PapillaID),
    Tamaño_Papila_Derecho INTEGER REFERENCES Tipo_Tamaño_Papilla(Tipo_Tamaño_PapillaID),
    Consistencia_Papila_Izquierdo INTEGER REFERENCES Tipo_Consistencia_Papilla(Tipo_Consistencia_PapillaID),
    Tamaño_Papila_Izquierdo INTEGER REFERENCES Tipo_Tamaño_Papilla(Tipo_Tamaño_PapillaID),
    Lengua_Tamaño INTEGER REFERENCES Tipo_Lengua_Tamaño(Tipo_Lengua_TamañoID),
    Lengua_Posicion INTEGER REFERENCES Tipo_Lengua_Posicion(Tipo_Lengua_PosicionID),
    Desplazamiento_Lengua BOOLEAN,
    Desplazamiento_Glandulas BOOLEAN,
    Saliva INTEGER REFERENCES Tipo_Saliva(Tipo_SalivaID)
    
);


CREATE TABLE Examen_Intraoral_Protesis_Total (
    Examen_Intraoral_protesis_totalid SERIAL PRIMARY KEY,
    Forma_Maxilar_Superior INTEGER REFERENCES Tipo_Forma_Maxilar(Tipo_Forma_MaxilarID),
    Tipo_Grande_Maxilar_Superior TEXT,
    Forma_Maxilar_Inferior INTEGER REFERENCES Tipo_Forma_Maxilar(Tipo_Forma_MaxilarID),
    Simetria_Maxilar_Superior INTEGER REFERENCES Tipo_Simetria_Maxilar(Tipo_Simetria_MaxilarID),
    Simetria_Maxilar_Inferior INTEGER REFERENCES Tipo_Simetria_Maxilar(Tipo_Simetria_MaxilarID),
    Rebordes_Maxilar_Superior INTEGER REFERENCES Tipo_Rebordes_Maxilar(Tipo_Rebordes_MaxilarID),
    Rebordes_Maxilar_Inferior INTEGER REFERENCES Tipo_Rebordes_Maxilar(Tipo_Rebordes_MaxilarID),
    Tuberosidad_Maxilar_Superior INTEGER REFERENCES Tipo_Tuberosidad_Maxilar(Tipo_Tuberosidad_MaxilarID),
    Tubo_Reten_Maxilar_Superior INTEGER REFERENCES Tipo_Tubo_Reten(Tipo_Tubo_RetenID),
    Hamular_Maxilar_Superior INTEGER REFERENCES Tipo_Torus(Tipo_TorusID),
    Zona_Cierre_Posterior INTEGER REFERENCES Tipo_Zona_Cierre(Tipo_Zona_CierreID),
    Fosa_Retro_Derecha_Profunda INTEGER REFERENCES Tipo_Fosa_Retro_Profunda( Tipo_Fosa_Retro_ProfundaID),
    Fosa_Retro_Derecha_Retentiva INTEGER REFERENCES Tipo_Fosa_Retro_Retentiva( Tipo_Fosa_Retro_RetentivaID),
    Fosa_Retro_Izquierda_Profunda INTEGER REFERENCES Tipo_Fosa_Retro_Profunda( Tipo_Fosa_Retro_ProfundaID),
    Fosa_Retro_Izquierda_Retentiva INTEGER REFERENCES Tipo_Fosa_Retro_Retentiva( Tipo_Fosa_Retro_RetentivaID),
    Frenillo_Insercion_Max_S_Anterior INTEGER REFERENCES Tipo_Frenillo_Insercion(Tipo_Frenillo_InsercionID),
    Frenillo_Insercion_Max_I_Anterior INTEGER REFERENCES Tipo_Frenillo_Insercion(Tipo_Frenillo_InsercionID),
    Frenillo_Consistencia_Max_S_Anterior INTEGER REFERENCES Tipo_Frenillo_Consistencia(Tipo_Frenillo_ConsistenciaID),
    Frenillo_Consistencia_Max_I_Anterior INTEGER REFERENCES Tipo_Frenillo_Consistencia(Tipo_Frenillo_ConsistenciaID),
    Frenillo_Insercion_Max_S_Posterior INTEGER REFERENCES Tipo_Frenillo_Insercion(Tipo_Frenillo_InsercionID),
    Frenillo_Insercion_Max_I_Posterior INTEGER REFERENCES Tipo_Frenillo_Insercion(Tipo_Frenillo_InsercionID),
    Frenillo_Consistencia_Max_S_Posterior INTEGER REFERENCES Tipo_Frenillo_Consistencia(Tipo_Frenillo_ConsistenciaID),
    Frenillo_Consistencia_Max_I_Posterior INTEGER REFERENCES Tipo_Frenillo_Consistencia(Tipo_Frenillo_ConsistenciaID),
    Seibert_Max_S_Sector_Izquierdo BOOLEAN,
    Seibert_Max_I_Sector_Izquierdo BOOLEAN,
    Seibert_Max_S_Sector_Derecho BOOLEAN,
    Seibert_Max_I_Sector_Derecho BOOLEAN
);



CREATE TABLE Encerado_diagnostico_Protesis_Total (
    Enceradoid SERIAL PRIMARY KEY,
    Longitud_Lineas_Caninas DECIMAL(5, 2),
    Altura_Incisal DECIMAL(5, 2),
    Eleccion_Color_Forma TEXT,
);


--71.
CREATE TABLE Protesis_Total_Propuesta (
    Protesis_TotalID SERIAL PRIMARY KEY,
    Impresion_Clinica_Extraoralid INTEGER REFERENCES Impresion_Clinica_Extraoral_Protesis_Total(Impresion_Clinica_Extraoralid),
    Examen_ATMid INTEGER REFERENCES Examen_ATM_Protesis_Total(Examen_ATMid),
    Examen_Extraoralid INTEGER REFERENCES Examen_Extraoral_Protesis_Total(Examen_Extraoralid),
    Impresion_Clinica_Intraoralid INTEGER REFERENCES Impresion_Clinica_Intraoral_Protesis_Total(Impresion_Clinica_Intraoralid),
    Observacionesid INTEGER REFERENCES Observaciones_Protesis_Total(Observacionesid),
    Examen_Intraoral_protesis_totalid INTEGER REFERENCES Examen_Intraoral_Protesis_Total(Examen_Intraoral_protesis_totalid),
    Enceradoid INTEGER REFERENCES Encerado_diagnostico_Protesis_Total(Enceradoid ),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);


