create database ejercicio

use ejercicio

create table estudiante (
documento int  not null,
cod_ciudad int not null,
ciudad nvarchar(50) not null,
nombres nvarchar(50) not null,
apellidos nvarchar(50) not null,
telefono_movil int not null,
email nvarchar(50) not null,
genero nvarchar(10) not null,
profesion nvarchar(50) not null
);

insert into estudiante values (1234, 12, 'ibague', 'diego', 'silva', 31234567, 'Dsilva@msn.com', 'm', 'ingeniero');
insert into estudiante values (1234, 12, 'ibague', 'diego', 'silva', 31234567, 'diegosilva@hot.es', 'm', 'ingeniero');
insert into estudiante values (3466, 24, 'espinal', 'andrea', 'amaya', 31345678, 'andreaa@jj.com', 'F', 'arquitecto');
insert into estudiante values (8896, 18, 'cali', 'milena', 'lozano', 31845678, 'mlozano@hot.es', 'f', 'abogado');
insert into estudiante values (4343, 12, 'ibague', 'diego', 'lozano', 30023567, 'diegolozano@yah.es', 'm', 'obrero');
insert into estudiante values (4343, 12, 'ibague', 'diego', 'lozano', 30023567, 'dlozano@yah.es', 'm', 'obrero');
insert into estudiante values (4343, 12, 'ibague', 'diego', 'lozano', 30023567, 'dlozano@yah.es', 'm', 'obrero');
insert into estudiante values (4343, 12, 'ibague', 'diego', 'lozano', 30023567, 'dlozano@yah.es', 'm', 'obrero');

select * from estudiante;

create table personas(
documento_persona int  not null,
cod_ciudad_persona int not null,
ciudad_persona nvarchar(50) not null,
nombres_persona nvarchar(50) not null,
apellidos_persona nvarchar(50) not null,
genero_persona nvarchar(10) not null,
profesion_persona nvarchar(50) not null
);

select * from personas;

insert into personas
select documento, cod_ciudad, ciudad, nombres, apellidos, genero, profesion 
from estudiante;

create table movil(
documento_movil int  not null,
telefono_movil int not null,
);

select * from movil;

insert into movil
select documento, telefono_movil
from estudiante;

create table correo(
documento_correo int  not null,
email nvarchar(50) not null,
);

select * from correo;

insert into correo
select documento, email
from estudiante;


create table ciudades(
cod_ciudad_ciudades int  not null,
ciudad_ciudades nvarchar(50) not null,
);

select * from ciudades;

insert into ciudades
select cod_ciudad_persona, ciudad_persona
from personas;


alter table personas
drop column ciudad_persona, profesion_persona ;

select*
from personas

alter table personas
add cod_profesion_persona int identity(1,1);

alter table personas
drop column cod_profesion_persona

update personas 
set cod_profesion_persona = 10
where documento_persona = 1234

update personas 
set cod_profesion_persona = 01
where documento_persona = 3466

update personas 
set cod_profesion_persona = 08
where documento_persona = 8696

update personas 
set cod_profesion_persona = 20
where documento_persona = 4343

use ejercicio

insert into personas (cod_profesion_persona) values (10);
insert into personas values cod_profesion_persona(01)
insert into personas values cod_profesion_persona(08)
insert into personas values cod_profesion_persona(20)

--- encontrar duplocados CTE Expresion de tablas comunes
WITH DUPAP AS (
	SELECT documento_persona,
	ROW_NUMBER() OVER (PARTITION BY
		documento_persona
		ORDER BY documento_persona ) AS DUPLICADOS
	FROM personas
)
SELECT * FROM DUPAP
WHERE DUPLICADOS > 1

----ELIMINAR DUPLICAODS
WITH DUPAP AS (
	SELECT documento_persona,
	ROW_NUMBER() OVER (PARTITION BY
		documento_persona
		ORDER BY documento_persona ) AS DUPLICADOS
	FROM personas
)
DELETE FROM DUPAP
WHERE DUPLICADOS > 1

create table profesiones (
cod_profesion int  not null,
);

select * from profesiones;

insert into profesiones
select  cod_profesion_persona
from personas;

select*
from personas

alter table profesiones
drop column profesion;

alter table profesiones
add profesion nvarchar(30)  null;

update profesiones
set profesion = 'ingeniero'
where cod_profesion = 1

update profesiones
set profesion = 'arquitecto'
where cod_profesion = 3

update profesiones
set profesion = 'abogado'
where cod_profesion = 4

update profesiones
set profesion = 'obrero'
where cod_profesion = 5








