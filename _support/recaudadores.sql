# SQL Manager 2005 Lite for MySQL 3.7.7.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : disloques


SET FOREIGN_KEY_CHECKS=0;

USE `disloques`;

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
  (1,'ELOY','ACOSTA LEDEZMA','',1),
  (2,'JHONNY','AMURRIO MERCADO','',1),
  (3,'LIZZETH','ARONI HUARACHI','',1),
  (4,'RICHARD HENRRY','AYALA GUZMAN','',1),
  (5,'RAMIRO ODON','BALLESTEROS MIRANDA','',1),
  (6,'ROBERTO CARLOS','CANAVIRI VILLCA','',1),
  (7,'JOHNY','CAYOLA LAMAS','',1),
  (8,'RUTH','CHOQUE CORI','',1),
  (9,'VICTOR HUGO','COCA TOLEDO','',1),
  (10,'LUIS ALBERTO','COCA AGREDA','',1),
  (11,'OLIMPIA','COPATITI NINA','',1),
  (12,'JENNY KAREN','CORDOVA CANEDO','',1),
  (13,'NELSON','CORNEJO GUTIERREZ','',1),
  (14,'EFRAIN','CRUZ GERONIMO','',1),
  (15,'JAVIER GONZALO','DURAN COSSIO','',1),
  (16,'JHOSEMAR','ELIAS LOPEZ','',1),
  (17,'JUAN CARLOS','GARVIZU ALELUYA','',1),
  (18,'HECTOR','GOMEZ ALMANZA','',1),
  (19,'MAURICIO','HERBAS GUTIERREZ','',1),
  (20,'DAMIAN','IGNACIO MARCANI','',1),
  (21,'MAURICIO','LAFUENTE GARCIA','',1),
  (22,'JOSUE ELMER','MARCA ROMERO','',1),
  (23,'ANGEL','MARTINEZ RAMIREZ','',1),
  (24,'IVET','MARZANA GALARZA','',1),
  (25,'MARIBEL','MEDRANO JAILLITA','',1),
  (26,'SABINO','MOLINA ROMERO','',1),
  (27,'MATEO','NINA VADILLO','',1),
  (28,'CELSO','NINANCURO QUISPE','',1),
  (29,'GRISBERT','OVANDO APAZA','',1),
  (30,'JORGE','POZADAS MARCA','',1),
  (31,'ARIEL','QUINTEROS FLORES','',1),
  (32,'HEIDY','QUINTEROS QUINTEROS','',1),
  (33,'NORA','RAMIREZ VARGAS','',1);

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

INSERT INTO `rotacion_recaudadores` (`id_rotacion_recaudador`, `reten_id`, `rotacion_id`, `recaudador_id`, `rotacion_recaudador_plan`, `rotacion_recaudador_tipo`, `rotacion_recaudador_fecha_del`, `rotacion_recaudador_fecha_al`) VALUES 
  (803,1,6,1,'plan1','operador','2016-07-01','2016-07-20'),
  (804,2,6,1,'descanso','operador','2016-07-01','2016-07-20'),
  (805,3,6,1,'descanso','operador','2016-07-01','2016-07-20'),
  (806,4,6,1,'descanso','operador','2016-07-01','2016-07-20'),
  (807,1,6,2,'descanso','operador','2016-07-01','2016-07-20'),
  (808,2,6,2,'plan2','operador','2016-07-01','2016-07-20'),
  (809,3,6,2,'descanso','operador','2016-07-01','2016-07-20'),
  (810,4,6,2,'descanso','operador','2016-07-01','2016-07-20'),
  (811,1,6,3,'descanso','operador','2016-07-01','2016-07-20'),
  (812,2,6,3,'descanso','operador','2016-07-01','2016-07-20'),
  (813,3,6,3,'plan1','operador','2016-07-01','2016-07-20'),
  (814,4,6,3,'descanso','operador','2016-07-01','2016-07-20'),
  (815,1,6,4,'descanso','operador','2016-07-01','2016-07-20'),
  (816,2,6,4,'descanso','operador','2016-07-01','2016-07-20'),
  (817,3,6,4,'descanso','operador','2016-07-01','2016-07-20'),
  (818,4,6,4,'plan2','operador','2016-07-01','2016-07-20'),
  (819,1,6,5,'plan1','operador','2016-07-01','2016-07-20'),
  (820,2,6,5,'descanso','operador','2016-07-01','2016-07-20'),
  (821,3,6,5,'descanso','operador','2016-07-01','2016-07-20'),
  (822,4,6,5,'descanso','operador','2016-07-01','2016-07-20'),
  (823,1,6,6,'descanso','operador','2016-07-01','2016-07-20'),
  (824,2,6,6,'plan2','operador','2016-07-01','2016-07-20'),
  (825,3,6,6,'descanso','operador','2016-07-01','2016-07-20'),
  (826,4,6,6,'descanso','operador','2016-07-01','2016-07-20'),
  (827,1,6,7,'descanso','operador','2016-07-01','2016-07-20'),
  (828,2,6,7,'descanso','operador','2016-07-01','2016-07-20'),
  (829,3,6,7,'plan1','operador','2016-07-01','2016-07-20'),
  (830,4,6,7,'descanso','operador','2016-07-01','2016-07-20'),
  (831,1,6,8,'descanso','operador','2016-07-01','2016-07-20'),
  (832,2,6,8,'descanso','operador','2016-07-01','2016-07-20'),
  (833,3,6,8,'descanso','operador','2016-07-01','2016-07-20'),
  (834,4,6,8,'plan2','operador','2016-07-01','2016-07-20'),
  (835,1,6,9,'descanso','operador','2016-07-01','2016-07-20'),
  (836,2,6,9,'descanso','operador','2016-07-01','2016-07-20'),
  (837,3,6,9,'descanso','operador','2016-07-01','2016-07-20'),
  (838,4,6,9,'descanso','operador','2016-07-01','2016-07-20'),
  (839,1,6,10,'descanso','operador','2016-07-01','2016-07-20'),
  (840,2,6,10,'descanso','operador','2016-07-01','2016-07-20'),
  (841,3,6,10,'descanso','operador','2016-07-01','2016-07-20'),
  (842,4,6,10,'descanso','operador','2016-07-01','2016-07-20'),
  (843,1,6,11,'descanso','operador','2016-07-01','2016-07-20'),
  (844,2,6,11,'descanso','operador','2016-07-01','2016-07-20'),
  (845,3,6,11,'descanso','operador','2016-07-01','2016-07-20'),
  (846,4,6,11,'descanso','operador','2016-07-01','2016-07-20'),
  (847,1,6,12,'descanso','operador','2016-07-01','2016-07-20'),
  (848,2,6,12,'descanso','operador','2016-07-01','2016-07-20'),
  (849,3,6,12,'descanso','operador','2016-07-01','2016-07-20'),
  (850,4,6,12,'descanso','operador','2016-07-01','2016-07-20'),
  (851,1,6,13,'descanso','operador','2016-07-01','2016-07-20'),
  (852,2,6,13,'descanso','operador','2016-07-01','2016-07-20'),
  (853,3,6,13,'descanso','operador','2016-07-01','2016-07-20'),
  (854,4,6,13,'descanso','operador','2016-07-01','2016-07-20'),
  (855,1,6,14,'descanso','operador','2016-07-01','2016-07-20'),
  (856,2,6,14,'descanso','operador','2016-07-01','2016-07-20'),
  (857,3,6,14,'descanso','operador','2016-07-01','2016-07-20'),
  (858,4,6,14,'descanso','operador','2016-07-01','2016-07-20'),
  (859,1,6,15,'descanso','operador','2016-07-01','2016-07-20'),
  (860,2,6,15,'descanso','operador','2016-07-01','2016-07-20'),
  (861,3,6,15,'descanso','operador','2016-07-01','2016-07-20'),
  (862,4,6,15,'descanso','operador','2016-07-01','2016-07-20'),
  (863,1,6,16,'descanso','operador','2016-07-01','2016-07-20'),
  (864,2,6,16,'descanso','operador','2016-07-01','2016-07-20'),
  (865,3,6,16,'descanso','operador','2016-07-01','2016-07-20'),
  (866,4,6,16,'descanso','operador','2016-07-01','2016-07-20'),
  (867,1,6,17,'descanso','operador','2016-07-01','2016-07-20'),
  (868,2,6,17,'descanso','operador','2016-07-01','2016-07-20'),
  (869,3,6,17,'descanso','operador','2016-07-01','2016-07-20'),
  (870,4,6,17,'descanso','operador','2016-07-01','2016-07-20'),
  (871,1,6,18,'descanso','operador','2016-07-01','2016-07-20'),
  (872,2,6,18,'descanso','operador','2016-07-01','2016-07-20'),
  (873,3,6,18,'descanso','operador','2016-07-01','2016-07-20'),
  (874,4,6,18,'descanso','operador','2016-07-01','2016-07-20'),
  (875,1,6,19,'descanso','operador','2016-07-01','2016-07-20'),
  (876,2,6,19,'descanso','operador','2016-07-01','2016-07-20'),
  (877,3,6,19,'descanso','operador','2016-07-01','2016-07-20'),
  (878,4,6,19,'descanso','operador','2016-07-01','2016-07-20'),
  (879,1,6,20,'descanso','operador','2016-07-01','2016-07-20'),
  (880,2,6,20,'descanso','operador','2016-07-01','2016-07-20'),
  (881,3,6,20,'descanso','operador','2016-07-01','2016-07-20'),
  (882,4,6,20,'descanso','operador','2016-07-01','2016-07-20'),
  (883,1,6,21,'descanso','operador','2016-07-01','2016-07-20'),
  (884,2,6,21,'descanso','operador','2016-07-01','2016-07-20'),
  (885,3,6,21,'descanso','operador','2016-07-01','2016-07-20'),
  (886,4,6,21,'descanso','operador','2016-07-01','2016-07-20'),
  (887,1,6,22,'descanso','operador','2016-07-01','2016-07-20'),
  (888,2,6,22,'descanso','operador','2016-07-01','2016-07-20'),
  (889,3,6,22,'descanso','operador','2016-07-01','2016-07-20'),
  (890,4,6,22,'descanso','operador','2016-07-01','2016-07-20'),
  (891,1,6,23,'descanso','operador','2016-07-01','2016-07-20'),
  (892,2,6,23,'descanso','operador','2016-07-01','2016-07-20'),
  (893,3,6,23,'descanso','operador','2016-07-01','2016-07-20'),
  (894,4,6,23,'descanso','operador','2016-07-01','2016-07-20'),
  (895,1,6,24,'descanso','operador','2016-07-01','2016-07-20'),
  (896,2,6,24,'descanso','operador','2016-07-01','2016-07-20'),
  (897,3,6,24,'descanso','operador','2016-07-01','2016-07-20'),
  (898,4,6,24,'descanso','operador','2016-07-01','2016-07-20'),
  (899,1,6,25,'descanso','operador','2016-07-01','2016-07-20'),
  (900,2,6,25,'descanso','operador','2016-07-01','2016-07-20'),
  (901,3,6,25,'descanso','operador','2016-07-01','2016-07-20'),
  (902,4,6,25,'descanso','operador','2016-07-01','2016-07-20'),
  (903,1,6,26,'descanso','operador','2016-07-01','2016-07-20'),
  (904,2,6,26,'descanso','operador','2016-07-01','2016-07-20'),
  (905,3,6,26,'descanso','operador','2016-07-01','2016-07-20'),
  (906,4,6,26,'descanso','operador','2016-07-01','2016-07-20'),
  (907,1,6,27,'descanso','operador','2016-07-01','2016-07-20'),
  (908,2,6,27,'descanso','operador','2016-07-01','2016-07-20'),
  (909,3,6,27,'descanso','operador','2016-07-01','2016-07-20'),
  (910,4,6,27,'descanso','operador','2016-07-01','2016-07-20'),
  (911,1,6,28,'descanso','operador','2016-07-01','2016-07-20'),
  (912,2,6,28,'descanso','operador','2016-07-01','2016-07-20'),
  (913,3,6,28,'descanso','operador','2016-07-01','2016-07-20'),
  (914,4,6,28,'descanso','operador','2016-07-01','2016-07-20'),
  (915,1,6,29,'descanso','operador','2016-07-01','2016-07-20'),
  (916,2,6,29,'descanso','operador','2016-07-01','2016-07-20'),
  (917,3,6,29,'descanso','operador','2016-07-01','2016-07-20'),
  (918,4,6,29,'descanso','operador','2016-07-01','2016-07-20'),
  (919,1,6,30,'descanso','operador','2016-07-01','2016-07-20'),
  (920,2,6,30,'descanso','operador','2016-07-01','2016-07-20'),
  (921,3,6,30,'descanso','operador','2016-07-01','2016-07-20'),
  (922,4,6,30,'descanso','operador','2016-07-01','2016-07-20'),
  (923,1,6,31,'descanso','operador','2016-07-01','2016-07-20'),
  (924,2,6,31,'descanso','operador','2016-07-01','2016-07-20'),
  (925,3,6,31,'descanso','operador','2016-07-01','2016-07-20'),
  (926,4,6,31,'descanso','operador','2016-07-01','2016-07-20'),
  (927,1,6,32,'descanso','operador','2016-07-01','2016-07-20'),
  (928,2,6,32,'descanso','operador','2016-07-01','2016-07-20'),
  (929,3,6,32,'descanso','operador','2016-07-01','2016-07-20'),
  (930,4,6,32,'descanso','operador','2016-07-01','2016-07-20'),
  (931,1,6,33,'descanso','operador','2016-07-01','2016-07-20'),
  (932,2,6,33,'descanso','operador','2016-07-01','2016-07-20'),
  (933,3,6,33,'descanso','operador','2016-07-01','2016-07-20'),
  (934,4,6,33,'descanso','operador','2016-07-01','2016-07-20');

COMMIT;

#
# Data for the `rotaciones` table  (LIMIT 0,500)
#

INSERT INTO `rotaciones` (`id_rotacion`, `rotacion_numero`, `rotacion_fecha_del`, `rotacion_fecha_al`, `rotacion_fecha_reunion`) VALUES 
  (6,1,'2016-07-01','2016-07-20','0000-00-00'),
  (7,2,'2016-07-21','2016-07-31','0000-00-00'),
  (8,3,'2016-07-01','2016-07-20','0000-00-00');

COMMIT;

