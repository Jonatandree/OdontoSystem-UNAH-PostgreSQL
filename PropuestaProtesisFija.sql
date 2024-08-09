
CREATE TABLE Impresion_Clinica_Extraoral_Protesis_Fija (
    Impresion_Clinica_Extraoralid SERIAL PRIMARY KEY,
    Menton_Prominente BOOLEAN,
    Disminucion_Soporte BOOLEAN,
    Existe_Patologia BOOLEAN,
    Existe_Patologia_detalle TEXT,
    Presencia_Asimetria BOOLEAN
);

CREATE TABLE Examen_ATM_Protesis_Fija (
    Examen_ATMid SERIAL PRIMARY KEY,
    Deviacion_Apertura TEXT,
    Desviacion_Cierre TEXT,
    Tono_Muscular TEXT,
    Masetero_Izquierdo TEXT,
    Masetero_Derecho TEXT,
    Temporal_Izquierdo TEXT,
    Temporal_Derecho TEXT,
    Grado_Apertura TEXT,
    Presencia_Ruido_A_Derecho TEXT,
    Presencia_Ruido_A_Izquierdo TEXT,
    Luxacion_Articular_Derecha TEXT,
    Luxacion_Articular_Izquierda TEXT,
    Sub_Luxacion_Articular_Derecha TEXT,
    Sub_Luxacion_Articular_Izquierda TEXT,
    Patologia_Articula TEXT,
    Habitos_Parafuncionales BOOLEAN,
    Especifique TEXT,
    Observaciones TEXT,
);

CREATE TABLE Examen_Extraoral_Protesis_Fija (
    Examen_Extraoralid SERIAL PRIMARY KEY,
    Fenotipo_Facial INTEGER REFERENCES Tipo_Fenotipo_Facial(IdTipo_Fenotipo_Facial),
    Forma_Facial INTEGER REFERENCES Tipo_Forma_Facial(IdTipo_Forma_Facial),
    Tercio_Superior DECIMAL,
    Tercio_medio DECIMAL,
    Tercio_inferior DECIMAL,
    asimetria_tersios BOOLEAN,
    Especifique_asimetria_tersios TEXT,
    Quinto_Central DECIMAL,
    Quinto_Lateral_Derecha DECIMAL,
    Quintos_Lateral_Izquierda DECIMAL,
    Quitos_Externos_Izquierdo DECIMAL,
    Quintos_Externos_Derecho DECIMAL,
    asimetria_quintos BOOLEAN,
    Especifique_asimetria_Quintos TEXT,
    Perfil VARCHAR(255) CHECK (Perfil IN ('CONVEXO', 'RECTO', 'CONCAVO')),
    Relacion_Maxilomandibular INTEGER CHECK (Relacion_Maxilomandibular IN (1, 2, 3)),
    Color_de_piel VARCHAR(255) CHECK (Color_de_piel IN ('MESTIZO', 'AFRODECENDIENTE', 'CAUCASICO')),
    Color_De_Ojos VARCHAR(50),
    Color_De_Conjuntiva VARCHAR(50),
    Cierre_Labial_Normal BOOLEAN,
    Mordia_Abierta BOOLEAN,
    Mordida_Cruzada BOOLEAN,
    Overbite DECIMAL,
    Overjet DECIMAL,
);

CREATE TABLE Impresion_Clinica_Intraoral_Protesis_Fija (
    Impresion_Clinica_Intraoralid SERIAL PRIMARY KEY,
    ausencia_Total_Dientes_Superior BOOLEAN,
    ausencia_Total_Dientes_Inferior BOOLEAN,
    Portador_Protesis BOOLEAN,
    Protesis_Combinada BOOLEAN,
    Protesis_Bien_Adactada BOOLEAN,
    Requiere_Cambio BOOLEAN,
    Porque_Requiere_Cambios TEXT,
    Presencia_Guia_anterior BOOLEAN,
    Presencia_Guia_Canina VARCHAR(255) CHECK (Presencia_Guia_Canina IN ('IZQUIERDA', 'DERECHA')),
    Guia_Insisal BOOLEAN,
    Presencia_Funcion_Grupo VARCHAR(255) CHECK (Presencia_Funcion_Grupo IN ('IZQUIERDA', 'DERECHA')),


);

CREATE TABLE Observaciones_Intraoral_Protesis_Fija (
    Observaciones_Intraoralid SERIAL PRIMARY KEY,
    Mucosa_Maxilar_Superior INTEGER REFERENCES Tipo_Presencia(IdTipo_Presencia),
    Mucosa_Maxilar_Inferior INTEGER REFERENCES Tipo_Presencia(IdTipo_Presencia),
    Lesiones TEXT,
    Torus_Paladino VARCHAR(255) CHECK (Torus_Paladino IN ('PRESENTE', 'AUSENTE')),
    Torus_Mandibular VARCHAR(255) CHECK (Torus_Mandibular IN ('PRESENTE', 'AUSENTE')),
    Consistencia_Papilla_Derecho VARCHAR(255) CHECK (Consistencia_Papilla_Derecho IN ('FIRME', 'RESILIENTE', 'FLACIDO')),
    Tamaño_Papilla_Derecho VARCHAR(255) CHECK (Tamaño_Papilla_Derecho IN ('PEQUEÑO', 'MEDIANO', 'GRANDE')),
    Consistencia_Papilla_Izquierdo VARCHAR(255) CHECK (Consistencia_Papilla_Izquierdo IN ('FIRME', 'RESILIENTE', 'FLACIDO')),
    Tamaño_Papilla_Izquierdo VARCHAR(255) CHECK (Tamaño_Papilla_Izquierdo IN ('PEQUEÑO', 'MEDIANO', 'GRANDE')),
    Lengua_Tamaño VARCHAR(255) CHECK (Lengua_Tamaño IN ('NORMAL', 'MACROGLOSIA', 'MICROGLOSIA')),
    Lengua_Posicion VARCHAR(255) CHECK (Lengua_Posicion IN ('RETRAIDA', 'ADELANTADA')),
    Habitos_lengua TEXT,
    Desplazamiento_Lengua BOOLEAN,
    Desplazamiento_Glandulas BOOLEAN,
    Saliva VARCHAR(255) CHECK (Saliva IN ('AUMENTADA', 'DISMINUIDA')),



);


CREATE TABLE Estado_Actual_Protesis_Fija (
    Estado_Actualid SERIAL PRIMARY KEY,
    Imagen_Odontograma TEXT,
    Tipo_Paciente INTEGER REFERENCES Tipo_Paciente_Edentulo(IdTipo_Paciente_Edentulo),
    Clasificacion_Kennedy TEXT,
    Higiene_Paciente INTEGER REFERENCES Tipo_Higiene_Paciente(IdHigiene_Paciente),
    Total_Organos_Sanos INTEGER,
    Total_Organos_Ausentes INTEGER,
    Total_Indicados_Extracion INTEGER,
    Contactos_Prematuros TEXT,
    Interferencia_Oclusales TEXT,
    Pronostico_Tratamiento TEXT,


);


CREATE TABLE Analisis_Radiografico_Protesis_Fija (
    Analisis_Radiograficoid SERIAL PRIMARY KEY,
    Hallazgo_Radiografico TEXT,
    Presencia_Radiopacas BOOLEAN,
    Presencia_Radiolucidad BOOLEAN,
    Organos_Dentales_Incluidos BOOLEAN,
    Presencia_Restos BOOLEAN,
    Protesico TEXT,
    Forma_Alveolar_Residual TEXT,
    Relacion_Corona_Pilar TEXT,
    Pilar1 TEXT,
    Pilar2 TEXT,
    Pilar3 TEXT,
    Nume_Raiz_Pilar1 TEXT,
    Nume_Raiz_Pilar2 TEXT,
    Nume_Raiz_Pilar3 TEXT,
    largo_Pilar1 TEXT,
    largo_Pilar2 TEXT,
    largo_Pilar3 TEXT,
    Forma_Pilar1 TEXT,
    Forma_Pilar2 TEXT,
    Forma_Pilar3 TEXT,
    Observaciones TEXT,

);


CREATE TABLE Diagnostico_Protesis_Fija (
    Diagnosticoid SERIAL PRIMARY KEY,
    Diagnostico TEXT
);


CREATE TABLE Plan_Tratamiento_Preprotesico_Protesis_Fija (
    Plan_Tratamiento_Preprotesicoid SERIAL PRIMARY KEY,
    Tratamiento_Periodontal TEXT,
    Cirugia_Preprotesica TEXT,
    Cirugia_Preprotesica_Detalle TEXT,
    Tratamiento_Conductos TEXT,
    Operatoria_Dental TEXT,
    Otros TEXT,

);


CREATE TABLE Encerado_Diagnostico_Protesis_Fija (
    Encerado_Diagnosticoid SERIAL PRIMARY KEY,
    Clasificacion_Kennedy TEXT,
    Clasificacion_Seibert TEXT,
    Zona_Encerar TEXT,
    Unidades_Dientes_Encerar TEXT,
    Altura_Incisal_Existente DECIMAL,
    Altura_Incisal_Encerado DECIMAL,
    Foto_Antes TEXT,
    Foto_Despues TEXT,

);


CREATE TABLE Tratamientos_Implantes_Protesis_Fija (
    Tratamientos_Implantesid SERIAL PRIMARY KEY,
    Zona_Colocacion_Implantes TEXT,
    Num_Unidades TEXT,
    Corona_individual TEXT,
    Puente TEXT,
    Arcada_Competa TEXT,
    Marca_Del_Implante TEXT,
    Tipo_Conexion TEXT,
    Geometria_Implante TEXT,
    Longitud TEXT,
    Diametro TEXT,
    Profundidad TEXT,
    Medio_Fijacion INTEGER REFERENCES Tipo_Medio_Fijacion(IdTipo_Medio_Fijacion),
    Tipo_Pilar TEXT,
    Material_Restauracion INTEGER REFERENCES Tipo_Material_Restauracion(IdTipo_Material_Restauracion),
    Oclusion_antagonista TEXT,



);


CREATE TABLE Protesis_Protesis_Fija (
    Protesisid SERIAL PRIMARY KEY,
    Numero_Unidades TEXT,
    Puente_Protesis TEXT,
    Corona_individual_Protesis TEXT,
    Tipo_Pontico TEXT,
    Tecnica_De_impresion INTEGER REFERENCES Tipo_Tecnica_Impresion(IdTipo_Tecnica_Impresion),
    Protesis_Provicional INTEGER REFERENCES Tipo_Protesis_Provisional(IdProtesis_Provisional),
    Materia_Escigido TEXT,
    Prueba_En_cera TEXT,
    Prueba_De_Resina TEXT,
    Prueba_De_Metal TEXT,
    Prueba_De_Bizcocho TEXT,
    Prueba_Final TEXT,
    Medio_De_Fijacio TEXT,

);


CREATE TABLE Toma_de_color_Protesis_Fija (
    Toma_de_colorid SERIAL PRIMARY KEY,
    Luz_sillo TEXT,
    Luz_Oficina TEXT,
    Luz_Natural TEXT,
    Escala_De_Color_Utilizada INTEGER REFERENCES Tipo_Escala_De_Color_Utilizada(IdEscala_De_Color_Utilizada),
    Color_Base_Final_Escogido INTEGER REFERENCES Tipo_Color_Base_Final_Escogido(IdTipo_Color_Base_Final_Escogido),


);


CREATE TABLE Mapeo_de_Color_Protesis_Fija (
    Mapeo_de_Colorid SERIAL PRIMARY KEY,
    Imagen_Mapeo_De_Color TEXT,



);


CREATE TABLE Remplazo_Ceramico_Protesis_Fija (
    Remplazo_Ceramicoid SERIAL PRIMARY KEY,
    Color_encia TEXT,
    Colorimetro_Utilizado TEXT,
    Image_Remplazo_Ceramico TEXT
);

CREATE TABLE Protesis_Adhesion_Protesis_Fija (
    Protesis_Adhesionid SERIAL PRIMARY KEY,
    Organo_Dental_Incrustacion TEXT,
    Tipo_Preparacion_Incrustacion INTEGER REFERENCES Tipo_Preparacion(IdTipo_Preparacion),
    Material_Incrustacion INTEGER REFERENCES Tipo_Material(IdTipo_Material),
    Color_Incrustacion TEXT,
    tecnica_impresion_Incrustacion BOOLEAN,
    Medio_Fijacion_Incrustacion TEXT,
    Organo_Dental_Carillas TEXT,
    Tipo_Preparacion_Carillas INTEGER REFERENCES Tipo_Preparacion(IdTipo_Preparacion),
    Material_Carillas INTEGER REFERENCES Tipo_Material(IdTipo_Material),
    Color_Carillas TEXT,
    tecnica_impresion_Carillas BOOLEAN,
    Medio_Fijacion_Carillas TEXT,


);





CREATE TABLE Protesis_Fija (
    Protesis_fijaid SERIAL PRIMARY KEY,
    Impresion_Clinica_Extraoralid INTEGER REFERENCES Impresion_Clinica_Extraoral_Protesis_Fija();
    Examen_ATMid INTEGER REFERENCES Examen_ATM_Protesis_Fija();
    Examen_Extraoralid INTEGER REFERENCES Examen_Extraoral_Protesis_Fija();
    Impresion_Clinica_Intraoralid INTEGER REFERENCES Impresion_Clinica_Intraoral_Protesis_Fija();
    Observaciones_Intraoralid INTEGER REFERENCES Observaciones_Intraoral_Protesis_Fija();
    Estado_Actualid INTEGER REFERENCES Estado_Actual_Protesis_Fija();
    Analisis_Radiograficoid INTEGER REFERENCES Analisis_Radiografico_Protesis_Fija();
    Diagnosticoid INTEGER REFERENCES Diagnostico_Protesis_Fija();
    Plan_Tratamiento_Preprotesicoid INTEGER REFERENCES Plan_Tratamiento_Preprotesico_Protesis_Fija();
    Encerado_Diagnosticoid INTEGER REFERENCES Encerado_Diagnostico_Protesis_Fija();
    Tratamientos_Implantesid INTEGER REFERENCES Tratamientos_Implantes_Protesis_Fija();
    Protesisid INTEGER REFERENCES Protesis_Protesis_Fija();
    Toma_de_colorid INTEGER REFERENCES Toma_de_color_Protesis_Fija();
    Mapeo_de_Colorid INTEGER REFERENCES Mapeo_de_Color_Protesis_Fija();
    Remplazo_Ceramicoid INTEGER REFERENCES Remplazo_Ceramico_Protesis_Fija();
    Protesis_Adhesionid INTEGER REFERENCES Protesis_Adhesion_Protesis_Fija();
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);


