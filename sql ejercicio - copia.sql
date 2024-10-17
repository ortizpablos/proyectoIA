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

create table movil (
documento_movil int  not null,
telefono_movil int not null,
);

select * from movil;

insert into movil
select documento, telefono_movil
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
drop column ciudad, profesion 











