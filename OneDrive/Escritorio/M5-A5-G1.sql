-- PARTE 1

-- Crear una base de datos
create database aprendizaje5_grupal;
-- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada
create user 'white'@'localhost' IDENTIFIED by '1234';
grant all privileges on aprendizaje5_gupal.* to 'white'@'localhost';
flush privileges;

-- ##############################################################################################################################
use aprendizaje5_grupal;

-- ##############################################################################################################################

-- PARTE 2

-- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).
create table usuarios (
  id_usuario int not null auto_increment PRIMARY key,
  nombre varchar(50) not null,
  apellido varchar(50) not null,
  contraseña varchar(50) not null,
  zona_horaria varchar (50) default 'UTC-3',
  genero enum('Masculino', 'Femenino') not null,
  telefono varchar(20) not null
);
-- tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).
create table ingresos (
  id_ingreso int not null auto_increment primary key,
  id_usuario int not null,
  fecha_hora_ingreso timestamp default current_timestamp,
  foreign key (id_usuario) references usuarios(id_usuario)
);

-- ##############################################################################################################################

-- PARTE 3

-- Modifique el UTC por defecto.Desde UTC-3 a UTC-2.
alter table usuarios
alter column zona_horaria set default 'UTC-2';

-- ##############################################################################################################################

-- PARTE 4

-- Para cada tabla crea 8 registros.

insert into usuarios (nombre, apellido, contraseña, zona_horaria, genero, telefono) values
('Juan', 'García', 'pass123', 'UTC-2', 'Masculino', '5551234'),
('María', 'López', 'abc456', 'UTC-2', 'Femenino', '5555678'),
('Pedro', 'Martínez', 'qwerty', 'UTC-2', 'Masculino', '5554321'),
('Ana', 'Pérez', 'secreto', 'UTC-2', 'Femenino', '5558765'),
('Javier', 'González', '12345678', 'UTC-2', 'Masculino', '5559876'),
('Sara', 'Rodríguez', 'contraseña', 'UTC-2', 'Femenino', '5552468'),
('Luis', 'Fernández', 'clave', 'UTC-2', 'Masculino', '5551357'),
('Laura', 'Gómez', '123abc', 'UTC-2', 'Femenino', '5553691');


insert into ingresos (id_usuario, fecha_hora_ingreso) values 
(1, NOW()),
(2, NOW() - INTERVAL 1 DAY),
(3, NOW() - INTERVAL 2 DAY),
(4, NOW() - INTERVAL 3 DAY),
(5, NOW() - INTERVAL 4 DAY),
(6, NOW() - INTERVAL 5 DAY),
(7, NOW() - INTERVAL 6 DAY),
(8, NOW() - INTERVAL 7 DAY);


-- ##############################################################################################################################

-- PARTE 5: JUSTIFIQUE CADA TIPO DE DATO UTILIZADO ¿ ES EL ¿OPTIMO EN CADA CASO?

-- Para los campos id_usuario, id_ingreso e id_usuario de la tabla ingresos: se ha utilizado el tipo de dato INT para representar valores enteros. Este tipo de dato es adecuado para campos que almacenan identificadores numéricos, como claves primarias o foráneas.

-- Para los campos nombre y apellido: se ha utilizado el tipo de dato VARCHAR(50) para representar cadenas de texto de longitud variable. Este tipo de dato es adecuado para campos que almacenan nombres y apellidos, ya que permiten almacenar una cantidad razonable de caracteres.

-- Para el campo contraseña: se ha utilizado el tipo de dato VARCHAR(50) para almacenar cadenas de texto que representan contraseñas. Aunque en la práctica las contraseñas suelen tener una longitud variable, en este caso se ha utilizado un límite máximo de 50 caracteres.

-- Para el campo zona_horaria: se ha utilizado el tipo de dato VARCHAR(50) para almacenar una cadena de texto que representa la zona horaria del usuario. Este tipo de dato es adecuado para almacenar información de texto libre que no se utiliza para cálculos.

-- Para el campo genero: se ha utilizado el tipo de dato ENUM('Masculino', 'Femenino') para representar valores de género. Este tipo de dato permite establecer una lista de valores permitidos para el campo, lo que ayuda a garantizar que solo se ingresen valores válidos.

-- Para el campo telefono: se ha utilizado el tipo de dato VARCHAR(20) para representar números de teléfono. Aunque en algunos países los números de teléfono pueden tener una longitud mayor, en este caso se ha utilizado un límite máximo de 20 caracteres.

-- Para el campo fecha_hora_ingreso: se ha utilizado el tipo de dato TIMESTAMP para almacenar la fecha y hora de ingreso del usuario en la plataforma. Este tipo de dato almacena la información en un formato específico de fecha y hora que permite realizar cálculos y comparaciones de forma sencilla.

-- ##############################################################################################################################

-- PARTE 6

-- Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono, correo electronico).
create table Contactos (
  id_contacto int not null auto_increment,
  id_usuario int not null,
  numero_telefono varchar(20) not null,
  correo_electronico varchar(50) not null,
  primary key (id_contacto),
  foreign key (id_usuario) references usuarios(id_usuario) on delete cascade
);

-- ##############################################################################################################################

-- PARTE 7

-- Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.

alter table usuarios
modify column telefono varchar (20);

alter table usuarios
add column id_contacto int,
add foreign key (id_contacto) references Contactos(id_contacto) on delete set null;


-- ##############################################################################################################################


























