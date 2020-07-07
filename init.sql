/* PELIGRO */
delete from doctores where id>=1;
delete from usuarios where id>=1;
delete from pacientes where id>=1;
delete from signals where id>=1;
delete from servicio_salud where id>=1;
delete from servicio_ocupacion where id>=1;
delete from alergias_pacientes where id>=1;
delete from llamadas where id>=1;
delete from recuperar_pass where id>=1;	
delete from cupones where id>=1;
delete from consultas where id>=1;
delete from hcFiles where id>=1;

drop table pacientes;
drop table usuarios;
drop table sessions;
drop table doctores;
drop table llamadas;
drop table servicio_salud;	
drop table servicio_ocupacion;
drop table alergias_pacientes;
drop table signals;
drop table recuperar_pass;
drop table cupones;
drop table consultas;
/* PELIGRO */

CREATE DATABASE ubimed;
USE ubimed;

SET GLOBAL time_zone = '-5:00';

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `rutaImg` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT './img/avatar.jpg',
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipoDoc` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `genero` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `rh` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pais` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `fechaIngreso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `pacientes` ADD `lugarNacimiento` VARCHAR(50) NOT NULL AFTER `fechaNacimiento`;

ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);
  
ALTER TABLE `pacientes` ADD UNIQUE(`email`);

ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
  
ALTER TABLE `pacientes` ADD `tutor` VARCHAR(100) NOT NULL DEFAULT 'no registro' AFTER `ciudad`, ADD `parentesco` VARCHAR(100) NOT NULL DEFAULT 'no registro' AFTER `tutor`, ADD `tutorCedula` VARCHAR(50) NOT NULL DEFAULT 'no registro' AFTER `parentesco`;
  ALTER TABLE `pacientes` CHANGE `tutor` `nombreTutor` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'no registro';
  ALTER TABLE `pacientes` CHANGE `tutorCedula` `cedulaTutor` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'no registro';
  
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `rol` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechaCrear` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);
  
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


CREATE TABLE `doctores` (
  `id` int(11) NOT NULL,
  `rutaImg` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `profesion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `especialidad` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `tipoDoc` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `genero` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pais` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `rutaCarne` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fechaIngreso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `doctores` ADD `numeroCarne` INT(20) NOT NULL AFTER `rutaCarne`;
ALTER TABLE `doctores` CHANGE `numeroCarne` `numeroCarne` VARCHAR(25) NOT NULL;

ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `doctores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

CREATE TABLE `llamadas` (
  `id` int(11) NOT NULL,
  `profesional` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `paciente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `sesion` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `archivo` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'calling',
  `s` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `llamadas`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `llamadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `listEps` (
  `id` int(11) NOT NULL,
  `eps` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fechaCarga` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `listEps`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `listEps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
  
CREATE TABLE `servicio_salud` (
  `id` int(11) NOT NULL,
  `id_servicio` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipoSalud` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `servicio` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `servicio_salud`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `servicio_salud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
  
CREATE TABLE `servicio_ocupacion` (
  `id` int(11) NOT NULL,
  `id_servicio` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ocupacion` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `servicio_ocupacion`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `servicio_ocupacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `alergias_pacientes` (
  `id` int(11) NOT NULL,
  `id_alergia` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `alergias_pacientes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `alergias_pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `alergias_pacientes` ADD `valida` BOOLEAN NOT NULL DEFAULT TRUE AFTER `descripcion`;

CREATE TABLE `signals` (
  `id` int(11) NOT NULL,
  `doctor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `paciente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'pendiente',
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `signals`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `signals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE signals
	ALTER estado SET DEFAULT 'aprobado';

CREATE TABLE `recuperar_pass` (
  `id` int(11) NOT NULL,
  `pin` int(7) NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `recuperar_pass`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `recuperar_pass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `cupones` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `empresa` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `cupones` ADD `consultas` INT NOT NULL AFTER `empresa`;

ALTER TABLE `cupones`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cupones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL,
  `motivo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fechaConsulta` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `horaConsulta` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `correoPaciente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `correoDoctor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fechaCreacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `consultas` CHANGE `fechaConsulta` `fechaConsulta` DATE NOT NULL;
ALTER TABLE `consultas` CHANGE `horaConsulta` `horaConsulta` TIME NOT NULL;

ALTER TABLE `consultas` ADD `afiliacion` VARCHAR(70) NOT NULL AFTER `estado`, ADD `tipoUser` VARCHAR(20) NOT NULL AFTER `afiliacion`, ADD `autorizacion` VARCHAR(50) NOT NULL AFTER `tipoUser`;

ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

CREATE TABLE `uploads-support` (
  `id` int(11) NOT NULL,
  `id_consulta` int(11) NOT NULL,
  `fileName` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `uploads-support`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `uploads-support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `cie10` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `cie10`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cie10`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
  
CREATE TABLE `hcFiles` (
  `id` int(11) NOT NULL,
  `id_consulta` int(11) NOT NULL,
  `file` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `hcFiles`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `hcFiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
  
ALTER TABLE `hcFiles` ADD `namePdf` VARCHAR(200) NOT NULL AFTER `file`;
  
ALTER TABLE `hcFiles` ADD `doctor` VARCHAR(50) NOT NULL AFTER `id_consulta`, ADD `paciente` VARCHAR(50) NOT NULL AFTER `doctor`;

CREATE TABLE `formulaFiles` (
  `id` int(11) NOT NULL,
  `id_consulta` int(11) NOT NULL,
  `file` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `formulaFiles`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `formulaFiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
  
ALTER TABLE `formulaFiles` ADD `namePdf` VARCHAR(200) NOT NULL AFTER `file`;
  
ALTER TABLE `formulaFiles` ADD `doctor` VARCHAR(50) NOT NULL AFTER `id_consulta`, ADD `paciente` VARCHAR(50) NOT NULL AFTER `doctor`;

CREATE TABLE `consentimiento` (
  `id` int(11) NOT NULL,
  `id_consulta` int(11) NOT NULL,
  `doctor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `paciente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rutaArchivo` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `nombreArchivo` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
COMMIT;

ALTER TABLE `consentimiento` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT, add PRIMARY KEY (`id`);

ALTER TABLE `consentimiento` ADD `estado` VARCHAR(20) NOT NULL DEFAULT 'creado' AFTER `nombreArchivo`;


CREATE TABLE `opiniones` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `opinion` varchar(2000) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `opiniones`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `opiniones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `medicamentos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

  
/* OBTENER INFO */

SELECT * FROM doctores;
SELECT * FROM pacientes;
SELECT * FROM usuarios;
SELECT * FROM sessions;
SELECT * FROM llamadas;
SELECT * FROM servicio_salud;	
SELECT * FROM servicio_ocupacion;
SELECT * FROM alergias_pacientes;
SELECT * FROM signals;
SELECT * FROM recuperar_pass;
SELECT * FROM cupones;
SELECT * FROM consultas;
SELECT * FROM `uploads-support`;
select * from cie10 ORDER BY id DESC;
select * from hcFiles;
select * from formulaFiles;
select * from consentimiento;	

SELECT *
FROM hcFiles
INNER JOIN formulaFiles ON hcFiles.id_consulta = formulaFiles.id_consulta WHERE hcFiles.paciente = formulaFiles.paciente AND hcFiles.paciente = 'u1802833@unimilitar.edu.co';

update hcFiles set file='/appsNode/ubimedServices/src/uploads/hc/hc-27068212-26cv26rika5lylm0.pdf' where id=129;
update consentimiento set nombreArchivo='consentimiento-27068212-70.pdf' where id=90;
update pacientes set cedula=27068212 where id=51;
update usuarios set estado=1 where id>1;
UPDATE signals set estado='aprobado' where id>=23;

