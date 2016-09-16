# SQL Manager 2005 Lite for MySQL 3.7.7.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : disloques


SET FOREIGN_KEY_CHECKS=0;

USE `disloques`;

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
  `recaudador_descripcion` text,
  `recaudador_ultimo_rotacion_numero` int(11) NOT NULL,
  PRIMARY KEY (`id_recaudador`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

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
# Structure for the `rotacion_recaudadores` table : 
#

CREATE TABLE `rotacion_recaudadores` (
  `id_rotacion_recaudador` int(11) NOT NULL AUTO_INCREMENT,
  `reten_id` int(11) NOT NULL,
  `rotacion_id` int(11) NOT NULL,
  `recaudador_id` int(11) NOT NULL,
  `rotacion_numero` int(11) DEFAULT NULL,
  `rotacion_recaudador_plan` enum('plan1','plan2','plan3','plan4') NOT NULL DEFAULT 'plan4',
  `rotacion_recaudador_tipo` enum('lider','operador','volante') NOT NULL DEFAULT 'operador',
  PRIMARY KEY (`id_rotacion_recaudador`)
) ENGINE=InnoDB AUTO_INCREMENT=1378 DEFAULT CHARSET=latin1;

#
# Structure for the `rotaciones` table : 
#

CREATE TABLE `rotaciones` (
  `id_rotacion` int(11) NOT NULL AUTO_INCREMENT,
  `rotacion_numero` int(11) NOT NULL,
  `rotacion_fecha_del` date NOT NULL,
  `rotacion_fecha_al` date NOT NULL,
  `rotacion_fecha_reunion` date NOT NULL,
  PRIMARY KEY (`id_rotacion`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

#
# Data for the `parametros` table  (LIMIT 0,500)
#

INSERT INTO `parametros` (`id_parametro`, `parametro_dias_periodo`, `parametro_dias_anterior_reunion`) VALUES 
  (1,20,7);

COMMIT;

#
# Data for the `recaudadores` table  (LIMIT 0,500)
#

INSERT INTO `recaudadores` (`id_recaudador`, `recaudador_nombres`, `recaudador_apellidos`, `recaudador_descripcion`, `recaudador_ultimo_rotacion_numero`) VALUES 
  (1,'AA','AA','',1),
  (2,'BB','BB','',1),
  (3,'CC','CC','',1),
  (4,'DD','DD','',1),
  (5,'EE','EE','',1),
  (6,'FF','FF','',1),
  (7,'GG','GG','',1),
  (8,'HH','HH','',1),
  (9,'II','II','SDF',1),
  (10,'JJ','JJ','SAFDS',1),
  (11,'KK','KK',NULL,1),
  (12,'LL','LL',NULL,1),
  (13,'MM','MM',NULL,1),
  (14,'NN','NN',NULL,1),
  (15,'OO','OO',NULL,1),
  (16,'PP','PP',NULL,1);

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

#
# Data for the `rotacion_recaudadores` table  (LIMIT 0,500)
#

INSERT INTO `rotacion_recaudadores` (`id_rotacion_recaudador`, `reten_id`, `rotacion_id`, `recaudador_id`, `rotacion_numero`, `rotacion_recaudador_plan`, `rotacion_recaudador_tipo`) VALUES 
  (1314,1,28,1,1,'plan1','operador'),
  (1315,2,28,1,1,'plan4','operador'),
  (1316,3,28,1,1,'plan4','operador'),
  (1317,4,28,1,1,'plan4','operador'),
  (1318,1,28,2,1,'plan4','operador'),
  (1319,2,28,2,1,'plan1','operador'),
  (1320,3,28,2,1,'plan4','operador'),
  (1321,4,28,2,1,'plan4','operador'),
  (1322,1,28,3,1,'plan4','operador'),
  (1323,2,28,3,1,'plan4','operador'),
  (1324,3,28,3,1,'plan1','operador'),
  (1325,4,28,3,1,'plan4','operador'),
  (1326,1,28,4,1,'plan4','operador'),
  (1327,2,28,4,1,'plan4','operador'),
  (1328,3,28,4,1,'plan4','operador'),
  (1329,4,28,4,1,'plan1','operador'),
  (1330,1,28,5,1,'plan2','operador'),
  (1331,2,28,5,1,'plan4','operador'),
  (1332,3,28,5,1,'plan4','operador'),
  (1333,4,28,5,1,'plan4','operador'),
  (1334,1,28,6,1,'plan4','operador'),
  (1335,2,28,6,1,'plan2','operador'),
  (1336,3,28,6,1,'plan4','operador'),
  (1337,4,28,6,1,'plan4','operador'),
  (1338,1,28,7,1,'plan4','operador'),
  (1339,2,28,7,1,'plan4','operador'),
  (1340,3,28,7,1,'plan2','operador'),
  (1341,4,28,7,1,'plan4','operador'),
  (1342,1,28,8,1,'plan4','operador'),
  (1343,2,28,8,1,'plan4','operador'),
  (1344,3,28,8,1,'plan4','operador'),
  (1345,4,28,8,1,'plan2','operador'),
  (1346,1,28,9,1,'plan4','operador'),
  (1347,2,28,9,1,'plan4','operador'),
  (1348,3,28,9,1,'plan4','operador'),
  (1349,4,28,9,1,'plan4','operador'),
  (1350,1,28,10,1,'plan4','operador'),
  (1351,2,28,10,1,'plan4','operador'),
  (1352,3,28,10,1,'plan4','operador'),
  (1353,4,28,10,1,'plan4','operador'),
  (1354,1,28,11,1,'plan4','operador'),
  (1355,2,28,11,1,'plan4','operador'),
  (1356,3,28,11,1,'plan4','operador'),
  (1357,4,28,11,1,'plan4','operador'),
  (1358,1,28,12,1,'plan4','operador'),
  (1359,2,28,12,1,'plan4','operador'),
  (1360,3,28,12,1,'plan4','operador'),
  (1361,4,28,12,1,'plan4','operador'),
  (1362,1,28,13,1,'plan4','operador'),
  (1363,2,28,13,1,'plan4','operador'),
  (1364,3,28,13,1,'plan4','operador'),
  (1365,4,28,13,1,'plan4','operador'),
  (1366,1,28,14,1,'plan4','operador'),
  (1367,2,28,14,1,'plan4','operador'),
  (1368,3,28,14,1,'plan4','operador'),
  (1369,4,28,14,1,'plan4','operador'),
  (1370,1,28,15,1,'plan4','operador'),
  (1371,2,28,15,1,'plan4','operador'),
  (1372,3,28,15,1,'plan4','operador'),
  (1373,4,28,15,1,'plan4','operador'),
  (1374,1,28,16,1,'plan4','operador'),
  (1375,2,28,16,1,'plan4','operador'),
  (1376,3,28,16,1,'plan4','operador'),
  (1377,4,28,16,1,'plan4','operador');

COMMIT;

#
# Data for the `rotaciones` table  (LIMIT 0,500)
#

INSERT INTO `rotaciones` (`id_rotacion`, `rotacion_numero`, `rotacion_fecha_del`, `rotacion_fecha_al`, `rotacion_fecha_reunion`) VALUES 
  (28,1,'2016-07-01','2016-07-20','0000-00-00');

COMMIT;

