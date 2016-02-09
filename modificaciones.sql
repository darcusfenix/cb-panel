use capital;

ALTER TABLE `capital`.`ct_pulcera` 
ADD COLUMN `vendedor` INT(10) UNSIGNED NULL AFTER `fecha_activacion`;

ALTER TABLE ct_pulcera
  ADD CONSTRAINT fk_ct_pulcera_ct_vendedor FOREIGN KEY (vendedor) 
  REFERENCES ct_vendedor (id_vendedor) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `capital`.`ct_persona` (
  `id_persona` INT NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `descripcion` TEXT NULL,
  PRIMARY KEY (`id_persona`));


CREATE TABLE `capital`.`ct_duracion` (
  `id_horas` INT NOT NULL,
  `total_horas` INT NOT NULL,
  PRIMARY KEY (`id_horas`));

CREATE TABLE `capital`.`rl_persona_duracion` (
  `id_persona` INT NOT NULL,
  `id_horas` INT NOT NULL);


ALTER TABLE rl_persona_duracion
  ADD CONSTRAINT fk_rl_persona_duracion_ct_persona FOREIGN KEY (id_persona) 
  REFERENCES ct_persona (id_persona) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE rl_persona_duracion
  ADD CONSTRAINT fk_rl_persona_duracion_ct_duracion FOREIGN KEY (id_horas) 
  REFERENCES ct_duracion (id_horas) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE `capital`.`ct_pulcera` 
	ADD COLUMN `costo` INT(10) UNSIGNED NULL AFTER `vendedor`;


CREATE TABLE `capital`.`ct_costo_pulsera` (
  `id_costo_pulsera` INT NOT NULL,
  `precio` FLOAT NOT NULL,
  `id_persona` INT NOT NULL,
  `id_horas` INT NOT NULL,
  PRIMARY KEY (`id_costo_pulsera`));

ALTER TABLE `capital`.`ct_costo_pulsera` 
CHANGE COLUMN `id_costo_pulsera` `id_costo_pulsera` INT(11) UNSIGNED NOT NULL ;

ALTER TABLE ct_costo_pulsera
  ADD CONSTRAINT fk_ct_costo_pulsera_id_persona FOREIGN KEY (id_persona) 
  REFERENCES rl_persona_duracion (id_persona) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ct_costo_pulsera
  ADD CONSTRAINT fk_ct_costo_pulsera_id_horas FOREIGN KEY (id_horas) 
  REFERENCES rl_persona_duracion (id_horas) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE ct_pulcera
  ADD CONSTRAINT fk_ct_pulcera_ct_costo_pulsera FOREIGN KEY (costo) 
  REFERENCES ct_costo_pulsera (id_costo_pulsera) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE `capital`.`ct_duracion` 
CHANGE COLUMN `id_horas` `id_horas` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `capital`.`ct_persona` 
CHANGE COLUMN `id_persona` `id_persona` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `capital`.`ct_costo_pulsera` 
CHANGE COLUMN `id_costo_pulsera` `id_costo_pulsera` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ;

INSERT INTO ct_duracion (total_horas) VALUES(6);
INSERT INTO ct_duracion (total_horas) VALUES(24);
INSERT INTO ct_duracion (total_horas) VALUES(48);

INSERT INTO ct_persona (nombre) VALUES("adulto");
INSERT INTO ct_persona (nombre) VALUES("niño");

INSERT INTO rl_persona_duracion (id_persona, id_horas) VALUES(1,1);
INSERT INTO rl_persona_duracion (id_persona, id_horas) VALUES(1,2);
INSERT INTO rl_persona_duracion (id_persona, id_horas) VALUES(1,3);
INSERT INTO rl_persona_duracion (id_persona, id_horas) VALUES(2,1);
INSERT INTO rl_persona_duracion (id_persona, id_horas) VALUES(2,2);
INSERT INTO rl_persona_duracion (id_persona, id_horas) VALUES(2,3);


INSERT INTO ct_costo_pulsera (precio,id_persona, id_horas) VALUES(65.0,1,1);
INSERT INTO ct_costo_pulsera (precio,id_persona, id_horas) VALUES(90.0,1,2);
INSERT INTO ct_costo_pulsera (precio,id_persona, id_horas) VALUES(125.0,1,3);

INSERT INTO ct_costo_pulsera (precio,id_persona, id_horas) VALUES(130.0,2,1);
INSERT INTO ct_costo_pulsera (precio,id_persona, id_horas) VALUES(180.0,2,2);
INSERT INTO ct_costo_pulsera (precio,id_persona, id_horas) VALUES(250.0,2,3);

ALTER TABLE `capital`.`ct_pulcera` ADD COLUMN `fecha_creacion` date NULL AFTER `costo`;


/* para seguridad */
ALTER TABLE `capital`.`ct_usuario` ADD COLUMN `account_expired` tinyint(1) NULL AFTER `permisos`;
ALTER TABLE `capital`.`ct_usuario` ADD COLUMN `account_locked` tinyint(1) NULL AFTER `account_expired`;
ALTER TABLE `capital`.`ct_usuario` ADD COLUMN `password_expired` tinyint(1) NULL AFTER `account_locked`;

CREATE TABLE `capital`.`ct_role` (
  `id_role` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `authority` VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (`id_role`));


CREATE TABLE `capital`.`rl_user_role` (
  `id_usuario` INT(10) UNSIGNED NOT NULL,
  `id_role` INT(10) UNSIGNED  NOT NULL);

ALTER TABLE rl_user_role
ADD CONSTRAINT fk_rl_usuario_role_usuario FOREIGN KEY (id_usuario)
REFERENCES ct_usuario (id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE rl_user_role
ADD CONSTRAINT fk_rl_usuario_role_role FOREIGN KEY (id_role)
REFERENCES ct_role (id_role) ON UPDATE CASCADE ON DELETE CASCADE;

INSERT INTO ct_role (authority) VALUES("ROLE_ADMIN");
INSERT INTO ct_role (authority) VALUES("ROLE_SOCIO");
INSERT INTO ct_role (authority) VALUES("ROLE_SUCURSAL");
INSERT INTO ct_role (authority) VALUES("ROLE_VENDEDOR");
INSERT INTO ct_role (authority) VALUES("ROLE_ONLINE");

UPDATE ct_usuario set  account_expired = FALSE, account_locked = FALSE , password_expired = FALSE ;
insert into ct_usuario(id_tipo,correo,passwd,activo,account_expired, account_locked, password_expired) VALUES(1,"juan@gmail.com","111",true,false,false,false);

ALTER TABLE `capital`.`ct_pulcera`
CHANGE COLUMN `fecha_creacion` `fecha_creacion` datetime NULL ;

ALTER TABLE `capital`.`ct_duracion`
CHANGE COLUMN `total_horas` `total_horas` VARCHAR(255) NULL ;