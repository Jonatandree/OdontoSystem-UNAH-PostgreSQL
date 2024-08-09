DROP TABLE Protesis_Fija_Propuesta;
DROP TABLE Estado_Actual_Protesis_Fija;
DROP TABLE Impresion_Clinica_Extraoral_Protesis_Fija;
DROP TABLE Examen_ATM_Protesis_Fija;
DROP TABLE Examen_Extraoral_Protesis_Fija;
DROP TABLE Impresion_Clinica_Intraoral_Protesis_Fija;
DROP TABLE Observaciones_Intraoral_Protesis_Fija;
DROP TABLE Analisis_Radiografico_Protesis_Fija;
DROP TABLE Diagnostico_Protesis_Fija;
DROP TABLE Plan_Tratamiento_Preprotesico_Protesis_Fija;
DROP TABLE Encerado_Diagnostico_Protesis_Fija;
DROP TABLE Tratamientos_Implantes_Protesis_Fija;
DROP TABLE Protesis_Protesis_Fija;
DROP TABLE Toma_de_color_Protesis_Fija;
DROP TABLE Mapeo_de_Color_Protesis_Fija;
DROP TABLE Remplazo_Ceramico_Protesis_Fija;
DROP TABLE Protesis_Adhesion_Protesis_Fija;
DROP TABLE Tipo_Higiene_Paciente;
DROP TABLE Tipo_Medio_Fijacion;
DROP TABLE Tipo_Material_Restauracion;
DROP TABLE Tipo_Protesis_Provisional;
DROP TABLE Tipo_Escala_De_Color_Utilizada;
DROP TABLE Tipo_Color_Base_Final_Escogido;
DROP TABLE Tipo_Preparacion;
DROP TABLE Tipo_Tecnica_Impresion;
DROP TABLE Tipo_Color_Carillas;
DROP TABLE Tipo_Presencia;
DROP TABLE Tipo_Material;
drop table Tipo_Paciente_Edentulo;



CREATE TABLE Tipo_Paciente_Edentulo (
    Tipo_Paciente_Edentuloid SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Higiene_Paciente (
    Higiene_Pacienteid SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Medio_Fijacion (
    Tipo_Medio_Fijacionid SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Material_Restauracion (
    Tipo_Material_Restauracionid SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Protesis_Provisional (
    Protesis_Provisionalid SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Escala_De_Color_Utilizada (
    Escala_De_Color_Utilizadaid SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Color_Base_Final_Escogido (
    Tipo_Color_Base_Final_Escogidoid SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Preparacion (
    Tipo_Preparacionid SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Tecnica_Impresion (
    Tipo_Tecnica_Impresionid SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Color_Carillas (
    IdTipo_Color_Carillas SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Tipo_Presencia (
    IdTipo_Presencia SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Tipo_Material (
    IdTipo_Material SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) UNIQUE NOT NULL
);


--DROP TABLE Impresion_Clinica_Extraoral_Protesis_Fija
CREATE TABLE Impresion_Clinica_Extraoral_Protesis_Fija (
    Impresion_Clinica_Extraoralid SERIAL PRIMARY KEY,
    Menton_Prominente BOOLEAN,
    Disminucion_Soporte BOOLEAN,
    Existe_Patologia BOOLEAN,
    Existe_Patologia_detalle TEXT,
    Presencia_Asimetria BOOLEAN
);

--DROP TABLE Examen_ATM_Protesis_Fija

	
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
    Observaciones TEXT
);


--DROP TABLE Examen_Extraoral_Protesis_Fija
	
CREATE TABLE Examen_Extraoral_Protesis_Fija (
    Examen_Extraoralid SERIAL PRIMARY KEY,
    Fenotipo_Facial INTEGER REFERENCES Tipo_Fenotipo_Facial(Tipo_Fenotipo_Facialid),
    Forma_Facial INTEGER REFERENCES Tipo_Forma_Facial(Tipo_Forma_Facialid),
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
    Perfil INTEGER REFERENCES Tipo_Perfil(Tipo_PerfilID),
    Relacion_Maxilomandibular INTEGER CHECK (Relacion_Maxilomandibular IN (1, 2, 3)),
    Color_de_piel INTEGER REFERENCES Tipo_Color_Piel(Tipo_Color_PielID),
    Color_De_Ojos VARCHAR(50),
    Color_De_Conjuntiva VARCHAR(50),
    Cierre_Labial_Normal BOOLEAN,
    Mordia_Abierta BOOLEAN,
    Mordida_Cruzada BOOLEAN,
    Overbite DECIMAL,
    Overjet DECIMAL
);

--DROP TABLE Impresion_Clinica_Intraoral_Protesis_Fija
	
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
    Presencia_Guia_Canina INTEGER REFERENCES Tipo_Presencia(IdTipo_Presencia),
    Guia_Insisal BOOLEAN,
    Presencia_Funcion_Grupo INTEGER REFERENCES Tipo_Presencia(IdTipo_Presencia)
);

--DROP TABLE Observaciones_Intraoral_Protesis_Fija

CREATE TABLE Observaciones_Intraoral_Protesis_Fija (
    Observaciones_Intraoralid SERIAL PRIMARY KEY,
    Mucosa_Maxilar_Superior INTEGER REFERENCES Tipo_Presencia(IdTipo_Presencia),
    Mucosa_Maxilar_Inferior INTEGER REFERENCES Tipo_Presencia(IdTipo_Presencia),
    Lesiones TEXT,
    Torus_Paladino INTEGER REFERENCES Tipo_Torus(Tipo_TorusID),
    Torus_Mandibular INTEGER REFERENCES Tipo_Torus(Tipo_TorusID),
    Consistencia_Papilla_Derecho INTEGER REFERENCES Tipo_Mucosa_Maxilar(Tipo_Mucosa_MaxilarID),
    Tamaño_Papilla_Derecho INTEGER REFERENCES Tipo_Tamaño_Papilla(Tipo_Tamaño_PapillaID),
    Consistencia_Papilla_Izquierdo INTEGER REFERENCES Tipo_Mucosa_Maxilar(Tipo_Mucosa_MaxilarID),
    Tamaño_Papilla_Izquierdo INTEGER REFERENCES Tipo_Tamaño_Papilla(Tipo_Tamaño_PapillaID),
    Lengua_Tamaño INTEGER REFERENCES Tipo_Lengua_Tamaño(Tipo_Lengua_TamañoID),
    Lengua_Posicion INTEGER REFERENCES Tipo_Lengua_Posicion(Tipo_Lengua_PosicionID),
    Habitos_lengua TEXT,
    Desplazamiento_Lengua BOOLEAN,
    Desplazamiento_Glandulas BOOLEAN,
    Saliva INTEGER REFERENCES Tipo_Saliva(Tipo_SalivaID)
);

--DROP TABLE Estado_Actual_Protesis_Fija

CREATE TABLE Estado_Actual_Protesis_Fija (
    Estado_Actualid SERIAL PRIMARY KEY,
    Imagen_Odontograma TEXT,
    Tipo_Paciente INTEGER REFERENCES Tipo_Paciente_Edentulo(Tipo_Paciente_Edentuloid),
    Clasificacion_Kennedy TEXT,
    Higiene_Paciente INTEGER REFERENCES Tipo_Higiene_Paciente(Higiene_Pacienteid),
    Total_Organos_Sanos INTEGER,
    Total_Organos_Ausentes INTEGER,
    Total_Indicados_Extracion INTEGER,
    Contactos_Prematuros TEXT,
    Interferencia_Oclusales TEXT,
    Pronostico_Tratamiento TEXT
);
--DROP TABLE Analisis_Radiografico_Protesis_Fija

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
    Observaciones TEXT
);
--DROP TABLE Diagnostico_Protesis_Fija

CREATE TABLE Diagnostico_Protesis_Fija (
    Diagnosticoid SERIAL PRIMARY KEY,
    Diagnostico TEXT
);
--DROP TABLE  Plan_Tratamiento_Preprotesico_Protesis_Fija

CREATE TABLE Plan_Tratamiento_Preprotesico_Protesis_Fija (
    Plan_Tratamiento_Preprotesicoid SERIAL PRIMARY KEY,
    Tratamiento_Periodontal TEXT,
    Cirugia_Preprotesica TEXT,
    Cirugia_Preprotesica_Detalle TEXT,
    Tratamiento_Conductos TEXT,
    Operatoria_Dental TEXT,
    Otros TEXT
);
--DROP TABLE Encerado_Diagnostico_Protesis_Fija

CREATE TABLE Encerado_Diagnostico_Protesis_Fija (
    Encerado_Diagnosticoid SERIAL PRIMARY KEY,
    Clasificacion_Kennedy TEXT,
    Clasificacion_Seibert TEXT,
    Zona_Encerar TEXT,
    Unidades_Dientes_Encerar TEXT,
    Altura_Incisal_Existente DECIMAL,
    Altura_Incisal_Encerado DECIMAL,
    Foto_Antes TEXT,
    Foto_Despues TEXT
);
--DROP TABLE Tratamientos_Implantes_Protesis_Fija

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
    Medio_Fijacion INTEGER REFERENCES Tipo_Medio_Fijacion(Tipo_Medio_Fijacionid),
    Tipo_Pilar TEXT,
    Material_Restauracion INTEGER REFERENCES Tipo_Material_Restauracion(Tipo_Material_Restauracionid),
    Oclusion_antagonista TEXT
);

--DROP TABLE  Protesis_Protesis_Fija
CREATE TABLE Protesis_Protesis_Fija (
    Protesisid SERIAL PRIMARY KEY,
    Numero_Unidades TEXT,
    Puente_Protesis TEXT,
    Corona_individual_Protesis TEXT,
    Tipo_Pontico TEXT,
    Tecnica_De_impresion INTEGER REFERENCES Tipo_Tecnica_Impresion(Tipo_Tecnica_Impresionid),
    Protesis_Provicional INTEGER REFERENCES Tipo_Protesis_Provisional(Protesis_Provisionalid),
    Materia_Escigido TEXT,
    Prueba_En_cera TEXT,
    Prueba_De_Resina TEXT,
    Prueba_De_Metal TEXT,
    Prueba_De_Bizcocho TEXT,
    Prueba_Final TEXT,
    Medio_De_Fijacio TEXT
);

--DROP TABLE  Toma_de_color_Protesis_Fija
CREATE TABLE Toma_de_color_Protesis_Fija (
    Toma_de_colorid SERIAL PRIMARY KEY,
    Luz_sillo TEXT,
    Luz_Oficina TEXT,
    Luz_Natural TEXT,
    Escala_De_Color_Utilizada INTEGER REFERENCES Tipo_Escala_De_Color_Utilizada(Escala_De_Color_Utilizadaid),
    Color_Base_Final_Escogido INTEGER REFERENCES Tipo_Color_Base_Final_Escogido(Tipo_Color_Base_Final_Escogidoid)
);

--DROP TABLE  Mapeo_de_Color_Protesis_Fija
CREATE TABLE Mapeo_de_Color_Protesis_Fija (
    Mapeo_de_Colorid SERIAL PRIMARY KEY,
    Imagen_Mapeo_De_Color TEXT
);

--DROP TABLE Remplazo_Ceramico_Protesis_Fija
CREATE TABLE Remplazo_Ceramico_Protesis_Fija (
    Remplazo_Ceramicoid SERIAL PRIMARY KEY,
    Color_encia TEXT,
    Colorimetro_Utilizado TEXT,
    Image_Remplazo_Ceramico TEXT
);
--DROP TABLE Protesis_Adhesion_Protesis_Fija 


CREATE TABLE Protesis_Adhesion_Protesis_Fija (
    Protesis_Adhesionid SERIAL PRIMARY KEY,
    Organo_Dental_Incrustacion TEXT,
    Tipo_Preparacion_Incrustacion INTEGER REFERENCES Tipo_Preparacion(Tipo_Preparacionid),
    Material_Incrustacion INTEGER REFERENCES Tipo_Material(IdTipo_Material),
    Color_Incrustacion TEXT,
    tecnica_impresion_Incrustacion BOOLEAN,
    Medio_Fijacion_Incrustacion TEXT,
    Organo_Dental_Carillas TEXT,
    Tipo_Preparacion_Carillas INTEGER REFERENCES Tipo_Preparacion(Tipo_Preparacionid),
    Material_Carillas INTEGER REFERENCES Tipo_Material(IDTipo_Material),
    Color_Carillas TEXT,
    tecnica_impresion_Carillas BOOLEAN,
    Medio_Fijacion_Carillas TEXT
);



--DROP TABLE Protesis_Fija_Propuesta

CREATE TABLE Protesis_Fija_Propuesta (
    Protesis_fijaid SERIAL PRIMARY KEY,
    Impresion_Clinica_Extraoralid INTEGER REFERENCES Impresion_Clinica_Extraoral_Protesis_Fija(Impresion_Clinica_Extraoralid),
    Examen_ATMid INTEGER REFERENCES Examen_ATM_Protesis_Fija(Examen_ATMid),
    Examen_Extraoralid INTEGER REFERENCES Examen_Extraoral_Protesis_Fija(Examen_Extraoralid),
    Impresion_Clinica_Intraoralid INTEGER REFERENCES Impresion_Clinica_Intraoral_Protesis_Fija(Impresion_Clinica_Intraoralid),
    Observaciones_Intraoralid INTEGER REFERENCES Observaciones_Intraoral_Protesis_Fija(Observaciones_Intraoralid),
    Estado_Actualid INTEGER REFERENCES Estado_Actual_Protesis_Fija(Estado_Actualid),
    Analisis_Radiograficoid INTEGER REFERENCES Analisis_Radiografico_Protesis_Fija(Analisis_Radiograficoid),
    Diagnosticoid INTEGER REFERENCES Diagnostico_Protesis_Fija(Diagnosticoid),
    Plan_Tratamiento_Preprotesicoid INTEGER REFERENCES Plan_Tratamiento_Preprotesico_Protesis_Fija(Plan_Tratamiento_Preprotesicoid),
    Encerado_Diagnosticoid INTEGER REFERENCES Encerado_Diagnostico_Protesis_Fija(Encerado_Diagnosticoid),
    Tratamientos_Implantesid INTEGER REFERENCES Tratamientos_Implantes_Protesis_Fija(Tratamientos_Implantesid),
    Protesisid INTEGER REFERENCES Protesis_Protesis_Fija(Protesisid),
    Toma_de_colorid INTEGER REFERENCES Toma_de_color_Protesis_Fija(Toma_de_colorid),
    Mapeo_de_Colorid INTEGER REFERENCES Mapeo_de_Color_Protesis_Fija(Mapeo_de_Colorid),
    Remplazo_Ceramicoid INTEGER REFERENCES Remplazo_Ceramico_Protesis_Fija(Remplazo_Ceramicoid),
    Protesis_Adhesionid INTEGER REFERENCES Protesis_Adhesion_Protesis_Fija(Protesis_Adhesionid),
    Historia_ClinicaID INTEGER REFERENCES Historia_Clinica(Historia_ClinicaID),
    Plan_TratamientoID INTEGER REFERENCES Plan_Tratamiento(Plan_TratamientoID),
    EstudianteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta),
    DocenteID VARCHAR(20) REFERENCES Usuarios(NumeroCuenta)
);

