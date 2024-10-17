use parqueadero

--BORRAR COLUMNAS 

ALTER TABLE tabla_1
DROP COLUMN [ID NÚCLEO]

ALTER TABLE tabla_1
DROP COLUMN [NÚCLEO BÁSICO DEL CONOCIMIENTO (NBC)]

ALTER TABLE tabla_1
DROP COLUMN [ID CINE CAMPO AMPLIO]

ALTER TABLE tabla_1
DROP COLUMN [DESC CINE CAMPO AMPLIO]

ALTER TABLE tabla_1
DROP COLUMN [ID CINE CAMPO ESPECIFICO]

ALTER TABLE tabla_1
DROP COLUMN [DESC CINE CAMPO ESPECIFICO]

ALTER TABLE tabla_1
DROP COLUMN [ID CINE CODIGO DETALLADO]

ALTER TABLE tabla_1
DROP COLUMN [DESC CINE CODIGO DETALLADO]

--RENOMBRAR COLUMNAS A MINUSCULAS 

EXEC sp_rename 'principal.[CÓDIGO DE LA INSTITUCIÓN]', 'codigo_institucion', 'COLUMN'; -- * codigo_institucion
EXEC sp_rename 'principal.[INSTITUCIÓN DE EDUCACIÓN SUPERIOR (IES)]', 'nombre_institucion', 'COLUMN'; -- * institucion_educacion_superior
EXEC sp_rename 'principal.[PRINCIPAL O SECCIONAL]', 'principal_seccional', 'COLUMN'; -- * principal_seccional
EXEC sp_rename 'principal.[ID SECTOR IES]', 'id_sector_ies', 'COLUMN'; -- * id_sector_ies
EXEC sp_rename 'principal.[SECTOR IES]', 'sector_ies', 'COLUMN'; -- * sector_ies
EXEC sp_rename 'principal.[IES ACREDITADA]', 'ies_acreditada', 'COLUMN'; -- * ies_acreditada
EXEC sp_rename 'principal.[ID CARACTER]', 'id_caracter', 'COLUMN'; -- * id_caracter
EXEC sp_rename 'principal.[CARACTER IES]', 'caracter_ies', 'COLUMN'; -- * caracter_ies
EXEC sp_rename 'principal.[CÓDIGO DEL DEPARTAMENTO (IES)]', 'codigo_departamento', 'COLUMN'; -- * codigo_departamento_ies
EXEC sp_rename 'principal.[DEPARTAMENTO DE DOMICILIO DE LA IES]', 'nombre_departamento', 'COLUMN'; -- * departamento_domicilio_ies
EXEC sp_rename 'principal.[CÓDIGO DEL MUNICIPIO (IES)]', 'codigo_municipio', 'COLUMN'; -- * codigo_municipio_ies
EXEC sp_rename 'principal.[MUNICIPIO DE DOMICILIO DE LA IES]', 'nombre_municipio', 'COLUMN'; -- * municipio_domicilio_ies
EXEC sp_rename 'principal.[CÓDIGO SNIES DEL PROGRAMA]', 'codigo_snies_programa', 'COLUMN'; -- * codigo_snies_programa
EXEC sp_rename 'principal.[PROGRAMA ACADÉMICO]', 'programa_academico', 'COLUMN'; -- * programa_academico
EXEC sp_rename 'principal.[PROGRAMA ACREDITADO]', 'programa_acreditado', 'COLUMN'; -- * programa_acreditado
EXEC sp_rename 'principal.[ID NIVEL ACADÉMICO]', 'id_nivel_academico', 'COLUMN'; -- * id_nivel_academico
EXEC sp_rename 'principal.[NIVEL ACADÉMICO]', 'nivel_academico', 'COLUMN'; -- * nivel_academico
EXEC sp_rename 'principal.[ID NIVEL DE FORMACIÓN]', 'id_nivel_formacion', 'COLUMN'; -- * id_nivel_formacion
EXEC sp_rename 'principal.[NIVEL DE FORMACIÓN]', 'nivel_formacion', 'COLUMN'; -- * nivel_formacion
EXEC sp_rename 'principal.[ID METODOLOGÍA]', 'id_metodologia', 'COLUMN'; -- * id_metodologia
EXEC sp_rename 'principal.[METODOLOGÍA]', 'metodologia', 'COLUMN'; -- * metodologia
EXEC sp_rename 'principal.[ID ÁREA DE CONOCIMIENTO]', 'id_area_conocimiento', 'COLUMN'; -- * id_area_conocimiento
EXEC sp_rename 'principal.[ÁREA DE CONOCIMIENTO]', 'area_conocimiento', 'COLUMN'; -- * area_conocimiento 
EXEC sp_rename 'principal.[CÓDIGO DEL DEPARTAMENTO (PROGRAMA)]', 'codigo_departamento_programa', 'COLUMN'; -- * codigo_departamento_programa
EXEC sp_rename 'principal.[DEPARTAMENTO DE OFERTA DEL PROGRAMA]', 'departamento_oferta_programa', 'COLUMN'; -- * departamento_oferta_programa
EXEC sp_rename 'principal.[CÓDIGO DEL MUNICIPIO (PROGRAMA)]', 'codigo_municipio_programa', 'COLUMN'; -- * codigo_municipio_programa
EXEC sp_rename 'principal.[MUNICIPIO DE OFERTA DEL PROGRAMA]', 'municipio_oferta_programa', 'COLUMN'; -- * municipio_oferta_programa
EXEC sp_rename 'principal.[ID SEXO]', 'id_sexo', 'COLUMN'; -- * id_sexo
EXEC sp_rename 'principal.[SEXO]', 'sexo', 'COLUMN'; -- * sexo
EXEC sp_rename 'principal.[AÑO]', 'año', 'COLUMN'; -- * año
EXEC sp_rename 'principal.[SEMESTRE]', 'semestre', 'COLUMN'; -- * semestre
EXEC sp_rename 'principal.[PRIMER CURSO]', 'primer_curso', 'COLUMN'; -- * primer_curso

--VERIFICAR TIPO DE CAMPO DE LA TABLA PRINCIPAL

SELECT * FROM sys.types;  
GO

--CREAR TABLAS


-- crear tabla: Departamento

CREATE TABLE Departamento (
    codigo_departamento INT NOT NULL, -- codigo_departamento INT PRIMARY KEY,
    nombre_departamento VARCHAR(100) NOT NULL
);


---------------------------------------------------------------------------------------------

-- crear Tabla: Municipio
---------------------------------------------------------------------------------------------
CREATE TABLE Municipio (
    codigo_municipio INT NOT NULL, -- codigo_municipio INT PRIMARY KEY,
    nombre_municipio VARCHAR(100) NOT NULL,
    codigo_departamento INT NOT NULL,  -- FK hacia la tabla Departamento    
);


---------------------------------------------------------------------------------------------

-- crear Tabla: Institucion
---------------------------------------------------------------------------------------------
CREATE TABLE Institucion (
    codigo_institucion INT NOT NULL,-- codigo_institucion INT PRIMARY KEY,
    ies_padre VARCHAR(100) NOT NULL,
    nombre_institucion VARCHAR(200) NOT NULL,
    principal_seccional VARCHAR(50)NOT NULL,
    id_sector_ies INT NOT NULL,
    sector_ies VARCHAR(100) NOT NULL,
    ies_acreditada VARCHAR(200) NOT NULL,
    id_caracter INT NOT NULL,
    caracter_ies VARCHAR(100) NOT NULL,
    codigo_departamento INT NOT NULL,  -- FK hacia la tabla Departamento
    codigo_municipio INT NOT NULL,     -- FK hacia la tabla Municipio
    
);


---------------------------------------------------------------------------------------------

-- crear Tabla: NivelAcademico
---------------------------------------------------------------------------------------------

CREATE TABLE NivelAcademico (
    id_nivel_academico INT NOT NULL, -- id_nivel_academico INT PRIMARY KEY,
    nivel_academico VARCHAR(100) NOT NULL
);



---------------------------------------------------------------------------------------------

-- crear Tabla: NivelFormacion
---------------------------------------------------------------------------------------------
CREATE TABLE NivelFormacion (
    id_nivel_formacion INT NOT NULL, -- id_nivel_formacion INT PRIMARY KEY,
    nivel_formacion VARCHAR(100) NOT NULL
);



---------------------------------------------------------------------------------------------

-- crear Tabla: Metodologia
---------------------------------------------------------------------------------------------
CREATE TABLE Metodologia (
    id_metodologia INT NOT NULL, -- id_metodologia INT PRIMARY KEY,
    metodologia VARCHAR(100) NOT NULL
);


---------------------------------------------------------------------------------------------

-- crear Tabla: AreaConocimiento
---------------------------------------------------------------------------------------------
CREATE TABLE AreaConocimiento (
    id_area_conocimiento INT NOT NULL, -- id_area_conocimiento INT PRIMARY KEY,
    area_conocimiento VARCHAR(100) NOT NULL
);


--crear tabla: Programa

CREATE TABLE Programa (
    id_programa INT NOT NULL, -- id_programa INT PRIMARY KEY,
    programa VARCHAR(100) NOT NULL
);

--crear tabla: Estudiante

CREATE TABLE Estudiante (

id_estudiante INT NOT NULL, -- id_estudiante INT PRIMARY KEY,
estudiante VARCHAR(100) NOT NULL
);

--crear tabla: Genero

CREATE TABLE Genero (

id_genero INT NOT NULL, -- id_genero INT PRIMARY KEY,
  genero VARCHAR(100) NOT NULL
);

--crear tabla: Estudiante_Programa

CREATE TABLE Estudiante_Programa (

id_estudiante_programa INT NOT NULL,
id_estudiante INT NOT NULL,
id_programa INT NOT NULL
);

--crear tabla: Institucion_Departamento

CREATE TABLE Institucion_Departamento (

id_institucion_departamento INT NOT NULL,
id_institucion INT NOT NULL,
id_departamento INT NOT NULL
);

--crear tabla: Institucion_Municipio

CREATE TABLE Institucion_Municipio (

id_institucion_municipio INT NOT NULL,
id_institucion INT NOT NULL,
id_municipio INT NOT NULL
);

--crear tabla: Institucion_Programa

CREATE TABLE Institucion_Programa (

id_institucion_programa INT NOT NULL,
id_institucion INT NOT NULL,
id_programa INT NOT NULL
);

--crear tabla: Programa_Area_conocimiento

CREATE TABLE Programa_Area_conocimiento (

id_programa_area_conocimiento INT NOT NULL,
id_area_conocimiento INT NOT NULL,
id_programa INT NOT NULL
);


