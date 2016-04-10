# SQL Manager 2005 Lite for MySQL 3.7.7.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : disloques


SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `disloques`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE `disloques`;

#
# Structure for the `disloque_recaudadores` table : 
#

CREATE TABLE `disloque_recaudadores` (
  `id_disloque_recaudador` int(11) NOT NULL AUTO_INCREMENT,
  `reten_id` int(11) NOT NULL,
  `disloque_id` int(11) NOT NULL,
  `recaudador_id` int(11) NOT NULL,
  `disloque_recaudador_tipo` enum('lider','recaudador','volante') NOT NULL,
  `disloque_recaudador_fecha_del` date NOT NULL,
  `disloque_recaudador_fecha_al` date NOT NULL,
  PRIMARY KEY (`id_disloque_recaudador`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

#
# Structure for the `disloques` table : 
#

CREATE TABLE `disloques` (
  `id_disloque` int(11) NOT NULL AUTO_INCREMENT,
  `disloque_numero` int(11) NOT NULL,
  `disloque_periodo` int(11) NOT NULL,
  `disloque_fecha_del` date NOT NULL,
  `disloque_fecha_al` date NOT NULL,
  `disloque_fecha_reunion` date NOT NULL,
  PRIMARY KEY (`id_disloque`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Structure for the `parametros` table : 
#

CREATE TABLE `parametros` (
  `id_parametro` int(11) NOT NULL AUTO_INCREMENT,
  `parametro_dias_periodo` int(11) NOT NULL,
  `parametro_dias_anterior_reunion` int(11) NOT NULL,
  PRIMARY KEY (`id_parametro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Structure for the `recaudadores` table : 
#

CREATE TABLE `recaudadores` (
  `id_recaudador` int(11) NOT NULL AUTO_INCREMENT,
  `recaudador_nombres` text NOT NULL,
  `recaudador_apellidos` text NOT NULL,
  `recaudador_descripcion` text NOT NULL,
  `recaudador_ultimo_disloque_numero` int(11) NOT NULL,
  PRIMARY KEY (`id_recaudador`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

#
# Structure for the `retenes` table : 
#

CREATE TABLE `retenes` (
  `id_reten` int(11) NOT NULL AUTO_INCREMENT,
  `reten_nombre` text NOT NULL,
  `reten_recaudadores_requeridos` int(11) NOT NULL,
  `reten_estado` enum('activo','inactivo') NOT NULL,
  PRIMARY KEY (`id_reten`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

#
# Data for the `disloque_recaudadores` table  (LIMIT 0,500)
#

INSERT INTO `disloque_recaudadores` (`id_disloque_recaudador`, `reten_id`, `disloque_id`, `recaudador_id`, `disloque_recaudador_tipo`, `disloque_recaudador_fecha_del`, `disloque_recaudador_fecha_al`) VALUES 
  (49,1,5,1,'lider','2016-04-10','2016-04-20'),
  (50,1,5,2,'lider','2016-04-10','2016-04-20'),
  (51,1,5,3,'lider','2016-04-10','2016-04-20'),
  (52,2,5,4,'lider','2016-04-10','2016-04-20'),
  (53,3,5,5,'lider','2016-04-10','2016-04-20'),
  (54,3,5,6,'lider','2016-04-10','2016-04-20'),
  (55,3,5,7,'lider','2016-04-10','2016-04-20'),
  (56,3,5,8,'lider','2016-04-10','2016-04-20'),
  (57,4,5,9,'lider','2016-04-10','2016-04-20'),
  (58,4,5,10,'lider','2016-04-10','2016-04-20'),
  (59,4,5,11,'lider','2016-04-10','2016-04-20'),
  (60,4,5,12,'lider','2016-04-10','2016-04-20');

COMMIT;

#
# Data for the `disloques` table  (LIMIT 0,500)
#

INSERT INTO `disloques` (`id_disloque`, `disloque_numero`, `disloque_periodo`, `disloque_fecha_del`, `disloque_fecha_al`, `disloque_fecha_reunion`) VALUES 
  (5,1,0,'2016-04-10','2016-04-20','0000-00-00');

COMMIT;

#
# Data for the `parametros` table  (LIMIT 0,500)
#

INSERT INTO `parametros` (`id_parametro`, `parametro_dias_periodo`, `parametro_dias_anterior_reunion`) VALUES 
  (1,20,7);

COMMIT;

#
# Data for the `recaudadores` table  (LIMIT 0,500)
#

INSERT INTO `recaudadores` (`id_recaudador`, `recaudador_nombres`, `recaudador_apellidos`, `recaudador_descripcion`, `recaudador_ultimo_disloque_numero`) VALUES 
  (1,'ELOY','ACOSTA LEDEZMA','',0),
  (2,'JHONNY','AMURRIO MERCADO','',0),
  (3,'LIZZETH','ARONI HUARACHI','',0),
  (4,'RICHARD HENRRY','AYALA GUZMAN','',0),
  (5,'RAMIRO ODON','BALLESTEROS MIRANDA','',0),
  (6,'ROBERTO CARLOS','CANAVIRI VILLCA','',0),
  (7,'JOHNY','CAYOLA LAMAS','',0),
  (8,'RUTH','CHOQUE CORI','',0),
  (9,'VICTOR HUGO','COCA TOLEDO','',0),
  (10,'LUIS ALBERTO','COCA AGREDA','',0),
  (11,'OLIMPIA','COPATITI NINA','',0),
  (12,'JENNY KAREN','CORDOVA CANEDO','',0),
  (13,'NELSON','CORNEJO GUTIERREZ','',0),
  (14,'EFRAIN','CRUZ GERONIMO','',0),
  (15,'JAVIER GONZALO','DURAN COSSIO','',0),
  (16,'JHOSEMAR','ELIAS LOPEZ','',0),
  (17,'JUAN CARLOS','GARVIZU ALELUYA','',0),
  (18,'HECTOR','GOMEZ ALMANZA','',0),
  (19,'MAURICIO','HERBAS GUTIERREZ','',0),
  (20,'DAMIAN','IGNACIO MARCANI','',0),
  (21,'MAURICIO','LAFUENTE GARCIA','',0),
  (22,'JOSUE ELMER','MARCA ROMERO','',0),
  (23,'ANGEL','MARTINEZ RAMIREZ','',0),
  (24,'IVET','MARZANA GALARZA','',0),
  (25,'MARIBEL','MEDRANO JAILLITA','',0),
  (26,'SABINO','MOLINA ROMERO','',0),
  (27,'MATEO','NINA VADILLO','',0),
  (28,'CELSO','NINANCURO QUISPE','',0),
  (29,'GRISBERT','OVANDO APAZA','',0),
  (30,'JORGE','POZADAS MARCA','',0),
  (31,'ARIEL','QUINTEROS FLORES','',0),
  (32,'HEIDY','QUINTEROS QUINTEROS','',0),
  (33,'NORA','RAMIREZ VARGAS','',0);

COMMIT;

#
# Data for the `retenes` table  (LIMIT 0,500)
#

INSERT INTO `retenes` (`id_reten`, `reten_nombre`, `reten_recaudadores_requeridos`, `reten_estado`) VALUES 
  (1,'ARANI',3,'activo'),
  (2,'LOBO RANCHO',1,'activo'),
  (3,'PARACAYA',4,'activo'),
  (4,'EPIZANA',4,'activo'),
  (5,'AIQUILE',2,'inactivo'),
  (6,'PUENTE ARCE',2,'inactivo'),
  (7,'BULO BULO',5,'inactivo'),
  (8,'EL CASTILLO',1,'inactivo'),
  (9,'IVIRGARZAMA',5,'inactivo'),
  (10,'PADRESAMA',4,'inactivo'),
  (11,'KM 10',5,'inactivo'),
  (12,'AGUIRRE',5,'inactivo'),
  (13,'HUAYLLANI',6,'inactivo'),
  (14,'SUTICOLLO',7,'inactivo'),
  (15,'CONFITAL',5,'inactivo'),
  (16,'COLCAPIRHUA',8,'inactivo');

COMMIT;

