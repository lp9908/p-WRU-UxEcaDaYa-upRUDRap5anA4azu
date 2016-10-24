/*
SQLyog Community v12.2.5 (64 bit)
MySQL - 5.7.11 : Database - cinebdd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cinebdd` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cinebdd`;

/*Table structure for table `boleto` */

DROP TABLE IF EXISTS `boleto`;

CREATE TABLE `boleto` (
  `idBoleto` int(11) NOT NULL,
  `idTipoBoleto` int(11) DEFAULT NULL,
  `idPelicula` int(11) DEFAULT NULL,
  `idSala` int(11) DEFAULT NULL,
  `idioma` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `cantidadBoletos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBoleto`),
  KEY `idTipoBoleto` (`idTipoBoleto`),
  KEY `idPelicula` (`idPelicula`,`idSala`,`idioma`,`fecha`,`hora`),
  CONSTRAINT `boleto_ibfk_2` FOREIGN KEY (`idTipoBoleto`) REFERENCES `tipoboleto` (`idTipoBoleto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `boleto_ibfk_3` FOREIGN KEY (`idPelicula`, `idSala`, `idioma`, `fecha`, `hora`) REFERENCES `funcion` (`idPelicula`, `idSala`, `idioma`, `fecha`, `hora`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `boleto` */

/*Table structure for table `empleado` */

DROP TABLE IF EXISTS `empleado`;

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `tipoEmpleado` varchar(20) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `ap` varchar(10) DEFAULT NULL,
  `am` varchar(10) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `empleado` */

insert  into `empleado`(`idEmpleado`,`tipoEmpleado`,`estado`,`nombre`,`ap`,`am`,`email`,`password`) values 
(0,'Gerente',NULL,NULL,NULL,NULL,NULL,NULL),
(1,'DBA',1,'Eva Natalia','Hernández','García','enathg@hotmail.com','nolose'),
(2,'DBA',1,'Jose','Marín','Domínguez','trance9902@gmail.com','menosjorge'),
(3,'DBA',1,'Jorge','Córdova','Cruz','georgecruz@hotmail.com.com','qwerty'),
(4,'DBA',1,'Alberto Alejandro','Ruiz','Astorga','ddufale@gmail.com','ale.2306'),
(5,'Gerente',1,'Alejandra','Alanis','Guerrero','ale_guerreo@gmail.com','alnis9090'),
(6,'Gerente',1,'Jesus Cristian','Aleman','Fuentes','fuentes_cris@hotmai.com','fuentes9090'),
(7,'Gerente',0,'Victor','Amador','Munoz','black_vitor23@hotmail.com','123.black'),
(8,'Gerente',1,'Mario Giovanny','Castella','Guillen','gunsma@gmail.com','knockout'),
(9,'Gerente',0,'Rafael','Claudies','Perez','sianmon@gmail.com','claudies'),
(10,'Gerente',1,'Diana Leticia','Duran','Ortiz','ortiz23duran@gmail.com','Ortiz.Duran'),
(11,'Gerente',1,'Ruben Irving','Flores','García','flores_garcia@gmail.com','flores123'),
(12,'Gerente',1,'Filiberto','Fuentes','Hernández','fili.hernan@outlook.com','filichamp'),
(13,'Gerente',0,'Diego','Garcia','Martinez','dieguito567@yahoo.com','dieguis2345'),
(14,'Gerente',1,'Jose Alejandro','Garcia','Molina','molina0987@hotmail.com','6_molina.-'),
(15,'Gerente',0,'Josimar','Gutierrez','Aviña','gutierrez@hotmail.com','gut4567nu.'),
(16,'Gerente',1,'Francisco Javier','Hernandez','Cervantes','paco.javier@hotmail.com',''),
(34,'',1,'Edgar Augusto','Santiago','Nieves','nieveswer@gmail.com','lkjchvfuds'),
(35,'Gerente',1,'Eduardo','Zamarron','Muñoz','zamarronlalio@hotmail.com','asdfgh'),
(42,'Gerente',1,'Andres','Bautista','Rojas','andresbebesito@yahoo.com','andrewes56'),
(47,'Gerente',1,'Annary','Tech','Cilenne','annceli@gmail.com','cilene6543'),
(55,'Gerente',1,'Vanessa Alejandra','Tenorio','Torres','tenoriovass@gmail.com','vasstenoria'),
(60,'DBA',1,'Alex','Garcia','Vilvhis','euconther@gmail.com','123456'),
(61,'DBA',1,'Osvaldo','Ceron','Gutierrez','ceronOSvaldo@gmail.com','osvi123456.-'),
(65,'DBA',1,'Marco Manuel','Ruiz','Rodriguez','genaeqqq@gmail.com','jihguvbskdnfr'),
(66,'DBA',1,'Julio Cesar','Paz','Huerta','huertpaz@gmail.com','pacecito23as'),
(67,'DBA',1,'Brando Daniel','Perez','Perez','ppdanito@gmail.com','pepinillo'),
(68,'Generente',0,'Cinthya','Tenorio','Tenorio','ttcinthya@gmail.com','cinthyqwerty'),
(69,'Generente',0,'Iris','Cortes','Cortes','irishina@gmail.com','1234.rishiana'),
(70,'Generente',0,'Irais','Mendoza','Cortes','cmirais@gmail.com','cm.asdfg.-'),
(71,'Generente',0,'Alexa','Pienada','Polanco','polancoAlexa@gmail.com','polaca.-09876'),
(72,'Generente',0,'Benajmín','Luna','Benoso','benitobodoque@hotmail.com','nenibeniassi'),
(73,'Generente',0,'Juan Jesus','Gutierrez','Gutierrez','jesgutprgramcion@hotmail.com','jjgutierritoz'),
(79,'Generente',0,'Valry Marissa','Hernández','Cortés','chValeryannna@hotmail.com','mnbvcjustin'),
(82,'Generente',0,'Jeanette','Zariñan','García','j_zarinañna@hotmail.com','zariñan_23456'),
(87,'Generente',0,'Luis','Fuentes','Ruiz','luistodaniel@yahoo.com','lusitodaniel.-qwer'),
(88,'Generente',0,'Cameron','Ramos','Ruiz','camerrr@yahoo.com','camellcigarrete'),
(99,'Generente',0,'Samuel','Tristan','Tinajero','samu_tt@gmail.com','8457_smaue'),
(100,'Generente',0,'Virgilio','Lopez','Perez','vrigislopezito@gmail.com','pervirvir');

/*Table structure for table `funcion` */

DROP TABLE IF EXISTS `funcion`;

CREATE TABLE `funcion` (
  `idPelicula` int(11) NOT NULL,
  `idSala` int(11) NOT NULL,
  `idioma` varchar(10) NOT NULL DEFAULT '',
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `disAsientos` char(25) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idPelicula`,`idSala`,`idioma`,`fecha`,`hora`),
  KEY `idSala` (`idSala`),
  CONSTRAINT `funcion_ibfk_1` FOREIGN KEY (`idPelicula`, `idSala`, `idioma`) REFERENCES `salapelicula` (`idPelicula`, `idSala`, `idioma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `funcion` */

/*Table structure for table `paquete` */

DROP TABLE IF EXISTS `paquete`;

CREATE TABLE `paquete` (
  `idPaquete` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idPaquete`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `paquete` */

insert  into `paquete`(`idPaquete`,`nombre`,`precio`,`estado`) values 
(1,'Combo Amigos',159.5,NULL),
(2,'Combo Nachos',120,1),
(3,'Combo Hotdog',110,1),
(4,'Combo Icee',125,1),
(5,'Combo Cornetto',130,1),
(6,'Combo Super Amigos',150,1),
(7,'Combo Mega',160,1),
(8,'Combo Oreo',110,1),
(9,'Combo Frappe',160,0),
(10,'Combo de Temporada',150,1),
(12,'Combo Crepa',100,1);

/*Table structure for table `paqueteproducto` */

DROP TABLE IF EXISTS `paqueteproducto`;

CREATE TABLE `paqueteproducto` (
  `idProducto` int(11) NOT NULL,
  `idPaquete` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`,`idPaquete`),
  KEY `idPaquete` (`idPaquete`),
  CONSTRAINT `paqueteproducto_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `paqueteproducto_ibfk_2` FOREIGN KEY (`idPaquete`) REFERENCES `paquete` (`idPaquete`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `paqueteproducto` */

/*Table structure for table `pelicula` */

DROP TABLE IF EXISTS `pelicula`;

CREATE TABLE `pelicula` (
  `idPelicula` int(11) NOT NULL,
  `FechaEstreno` date DEFAULT NULL,
  `FecharTermino` date DEFAULT NULL,
  `Clasificacion` varchar(3) DEFAULT NULL,
  `Genero` varchar(10) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Sinopsis` varchar(300) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idPelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pelicula` */

insert  into `pelicula`(`idPelicula`,`FechaEstreno`,`FecharTermino`,`Clasificacion`,`Genero`,`Duracion`,`Sinopsis`,`nombre`,`estado`) values 
(1,'2016-08-12','2016-09-09','A','Terror','02:00:00',' ','Los ilucionistas 2',0),
(2,'2016-08-12','2016-09-09','B','Accion','01:30:00',' ','Cuando las luces se apagan',0),
(3,'2016-08-12','2016-09-09','C','Terror','02:20:00',' ','Mascotas',0),
(4,'2016-08-05','2016-09-30','B','Accion','02:03:00','Se siente bien ser el malo… Formar un equipo integrado por los supervillanos encarcelados más peligrosos del mundo; armarlos con el arsenal más poderoso que el gobierno tiene disponible.','Escuadrón Suicida',1),
(5,'2016-08-12','2016-08-30','A','Documetal','01:27:00',' ','Casafantasmas',0),
(6,'2016-08-12','2016-09-30','B15','Drama','02:19:00',' ','Ben-Hur',0),
(7,'2016-08-12','2016-09-28','B15','Comedia','01:42:00','ME ESTÁS MATANDO SUSANA está basada en la novela Ciudades Desiertas de José Agustín. Nos cuenta con humor el trayecto que Eligio tendrá que librar para recuperar a su mujer.','Me Estás Matando Susana',1),
(8,'2016-08-12','2016-09-28','B','Comedia','01:47:00','','Buscando a dory',0),
(9,'2016-08-19','2016-09-28','B','Drama','02:02:00','Una solitaria ama de casa de mediana edad atiende a un soldado que sufre la enfermedad del sueño, cayendo en alucinaciones que desencadenan en sueños extraños, fantasmas y romances.','Cementerio de Esplendor',0),
(10,'2015-11-30','2015-11-30','C','G3','01:58:00',' ','Iron Man',0),
(11,'2016-08-19','2016-09-11','A','Drama','01:21:00','En 1519, antes de llegar a la capital azteca México-Tenochtitlán, tres conquistadores españoles marchan hacia la cima del volcán Popocatépetl, de más de 5400 metros de altura.','Epitafio',0),
(12,'2016-08-19','2016-09-24','B','Musical','01:28:00','Filmado en vivo en la Nochebuena de 1975 en el Hammersmith Odeon de Londres, éste especial incluye un documental nunca antes visto con imágenes de archivo y entrevistas con los cuatro miembros de la banda.','QUEEN: Night in Bohemia',0),
(13,'2016-08-26','2016-09-08','B','Accion','02:03:00','Paul Greengrass, director de La Supremacía Bourne y Bourne: El Ultimatum, dirige una vez más a Damon en este nuevo capítulo de la saga de Universal Pictures, en donde el letal agente de la CIA regresará desde las sombras.','Jason Bourne',0),
(14,'2016-08-26','2016-09-17','B15','Drama','01:30:00','Miguel y Johnny se conocen desde la infancia. Se dedican a patinar y a pasarla bien. Para ganar dinero fácil y seguir patinando venden su propia sangre a un contacto clandestino. La actividad se convierte en negocio, hasta que una transacción grande no resulta como ellos imaginaban.','Te Prometo Anarquía',0),
(15,'2016-08-26','2016-09-17','B15','Comedia','01:41:00','Amy (Mila Kunis) es una mamá moderna que tiene una vida aparentemente perfecta - un gran matrimonio, hijos aplicados, una hermosa casa y una carrera en ascenso.','El Club de las Madres Rebeldes',0),
(16,'2016-08-26','2016-09-24','A','Drama','01:21:00','Esta emotiva historia nos lleva al encuentro de dos personajes: Luis y Carlitos, que son muy diferentes y a la vez comparten una misma pasión: el fútbol. Por azares del destino estos grandes amigos toman caminos diferentes.','Juego de Héroes',0),
(17,'2016-08-26','2016-10-31','B15','Drama','01:33:00','Franny (Richard Gere), un excéntrico y rico filántropo, interfiere de manera caótica en la vida de una pareja de recién casados, Lucas (Theo James) y Olivia (Dakota Fanning), en un intento por revivir su trágico pasado.','Un Secreto Entre Nosotros',0),
(18,'2016-08-26','2016-09-24','B','Drama','01:34:00','Romain tiene 23 años, quiere ser escritor pero por el momento es vigilante nocturno en un hotel. Su padre tiene 62 años, está retirado y parece importarle todo un bledo. Romain comparte apartamento con un chico de 24 años cuyo único objetivo en la vida es seducir a las mujeres.','Recuerdos',1),
(19,'2016-08-26','2016-09-27','A','Infantil','01:15:00','La muñeca más famosa del mundo, presenta su nueva película llamada Barbie en una Aventura Espacial, la cual se desarrolla en un planeta que está muy lejos de la Tierra. En este filme, BarbieTM y su inseparable mascota, Pupcorn, se divierten en las alturas de un hermoso y lejano mundo.','Barbie en una Aventura',0),
(20,'2016-09-02','2016-09-23','A','Arte','01:30:00','La delgada línea amarilla es el viaje de cinco hombres que son contratados para pintar la linea divisoria de una carretera que conecta dos pueblos de Mexico.','La Delgada Línea Amarilla',1),
(21,'2016-09-02','2016-09-30','S/C','Comedia','01:38:00','Los parranderos hermanos Mike (Adam Devine) y Dave (Zac Efron) ponen un anuncio en internet para encontrar a las acompañantes perfectas (Anna Kendrick, Aubrey Plaza) para la boda hawaiana de su hermana.','Mike y Dave: Los Busca Novias',0),
(22,'2016-09-02','2016-10-07','S/C','Comedia','01:54:00','Basada en una historia real, “Amigos de armas” cuenta la historia de dos amigos de poco más de 20 años de edad (Hill y Teller) que viven en Miami durante la guerra con Irak y se aprovechan de una poco conocida iniciativa del gobierno.','Amigos de Armas',0),
(23,'2016-09-02','2016-09-30','S/C','Comedia','01:27:00','Tom Brand (Kevin Spacey) es un multimillonario en la cumbre de su carrera; pero su estilo de vida adicto al trabajo lo ha desconectado de su familia. Un día, sufre un terrible accidente, y cuando recupera la conciencia, descubre que ha quedado atrapado en el cuerpo del gato.','Mi Papá es un Gato',0),
(24,'2016-09-02','2016-09-24','S/C','Drama','01:58:00','Jesse, es una chica aspirante a modelo que se muda a Los Angeles para cumplir sus sueños, ahí descubrira el terrible y peligroso mundo de la moda, donde despertara la envidia de las demas modelos que intentarán devorarla para robar su belleza y juventud.','El Demonio Neon',0),
(25,'2016-09-02','2016-09-29','S/C','Drama','01:32:00','','Secretos del Alma',0),
(26,'2016-09-09','2016-10-07','S/C','Infantil','01:30:00','En una pequeña y aislada isla del Pacífico Sur, Mak, un guacamayo, y sus amigos viven la vida perfecta bajo el cielo azul, aguas turquesa, y un montón de deliciosas frutas e insectos crujientes. Pero todos los días viven la misma rutina y esto los aburre.','Las Locuras de Robinson Crusoe',0),
(27,'2016-09-09','2016-10-07','S/C','Ficcion','02:00:00','El USS Enterprise, la nave insignia de la Flota Estelar liderada por el capitán James T. Kirk (Chris Pine), vuelve a surcar el universo para asegurarse de la protección de la Tierra y del resto de planetas aliados, en nombre de la Federación Unida de Planetas.','Star Trek: Sin Límites',0),
(28,'2016-09-09','2016-10-08','S/C','Accion','01:39:00','Arthur Bishop (Jason Statham) pensó que había dejado atrás su pasado criminal, pero se encuentra de nuevo con él en el momento en que la mujer de su vida es secuestrada por uno de sus mayores enemigos.','El Especialista',0),
(29,'2016-09-09','2016-09-27','S/C','Terror','01:28:00','Un grupo de amigos asaltan la casa de un hombre rico, y ciego, pensando que lograrán el robo perfecto. Están equivocados.','No Respires',0),
(30,'2016-09-16','2016-10-14','S/C','Infantil','01:42:00','MI AMIGO EL DRAGÓN, una nueva versión de la querida película familiar de Disney, cuenta la aventura de un niño huérfano llamado Pete y su mejor amigo, Elliott, que da la casualidad es un dragón.','Mi Amigo el Dragón',0),
(31,'2016-09-16','2016-10-21','S/C','Comedia','01:40:00','NO MANCHES FRIDA cuenta la divertidísima y entretenida historia de ZEQUI (Omar Chaparro), un ladrón quien tras salir de la cárcel decide regresar a recuperar el dinero robado que enterró su cómplice, en un terreno baldío en el cual ahora han construido el gimnasio en la escuela.','No Manches Frida',0),
(32,'2016-09-16','2016-10-19','S/C','Accion','01:32:00','','Atentados en París',1),
(33,'2016-09-16','2016-10-25','S/C','Infantil','01:40:00','Desesperados por entregar este paquete de puros problemas antes de que el jefe se entere, Junior y su amiga Tulip, la única humana en toda la Montaña de Cigüeñas, deben apurarse a hacer su primera entrega de bebés, en un viaje salvaje y revelador.','Cigueñas',0),
(34,'2016-09-02','2016-09-23','B15','Drama','01:34:00',' ','El plan de Maggie',1),
(35,'2016-08-12','2016-09-16','B15','Terror','01:34:00',' ','Demon Neon',1),
(36,'2016-08-26','2016-09-16','B15','Ficcion','02:15:00',' ','Sobrevivir',1),
(37,'2016-08-26','2016-09-16','B','Ficcion','01:36:00',' ','Sin limite',1),
(38,'2016-08-26','2016-09-30','B15','Terror','01:45:00',' ','No estamos solos',1),
(39,'2016-08-19','2016-09-16','A','Drama','01:35:00',' ','Mañana',1),
(40,'2016-08-26','2016-09-23','B','Drama','01:45:00',' ','Mis mejores dias',1),
(41,'2016-08-26','2016-09-30','B15','Terror','01:55:00',' ','Morgan',1),
(42,'2016-09-16','2016-09-30','B','Drama','02:15:00',' ','El bebe de Brigget Jones',0),
(43,'2016-09-09','2016-09-30','B','Drama','01:38:00',' ','Lo que nunca nos dijimos',0),
(44,'2016-09-09','2016-10-07','B','Ficcion','02:10:00',' ','Un juego sin reglas',0);

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `precioUnitario` float DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `producto` */

insert  into `producto`(`idProducto`,`nombre`,`precioUnitario`,`existencias`,`estado`) values 
(1,'Sabritas',12.5,120,NULL),
(2,'Cocacola Mediana',37,89,1),
(3,'Cocacola Pequena',34,50,1),
(4,'Palomitas Grandes',45,120,1),
(5,'Palomitas Medianas',42,110,1),
(6,'Palomitas Pequenas',38,30,1),
(7,'Nachos Grandes',50,99,1),
(8,'Nachos Medianos',45,80,1),
(9,'Nachos Pequenos',38,40,0),
(10,'Icee Grandes',49,50,1),
(11,'Icee Medianos',40,30,0),
(12,'Icee Pequenos',38,15,1),
(13,'Cerveza Grande',50,50,1),
(14,'Cerveza Mediana',40,30,0),
(15,'Cerveza Pequena',38,15,1),
(16,'Cornetto',30,55,1),
(17,'Agua Ciel 1L',20,60,1),
(18,'Agua Ciel 600ml',15,80,1),
(19,'M&Ms',25,100,1),
(20,'Hotdog Normal',30,25,1),
(21,'Hotdog Especial',38,10,1),
(22,'Cono Helado',15,50,1),
(23,'Cono Helado Oreo',18,75,1),
(24,'Cono Helado Cajeta',18,55,0),
(25,'Crepa Dulce',35,52,1),
(26,'Crepa Dulce 2 Ingredientes',40,25,1),
(27,'Crepa Dulce 3 Ingredientes',45,12,0),
(28,'Crepa Salada',42,51,1),
(29,'Crepa Salada 2 Ingredientes',50,30,1),
(30,'Crepa Salada 3 Ingredientes',53,21,1),
(31,'Pizza Grande',84,85,0),
(32,'Pizza Mediana',62,50,1),
(33,'Pizza Individual',56,98,1),
(34,'Rebanada Pizza',31,68,1),
(35,'Palomitas Caramelo Grandes',49,100,1),
(36,'Palomitas Caramelo Medianas',45,92,1),
(37,'Palomitas Caramelo Pequenas',40,61,1),
(38,'Palomitas Chile Grandes',46,50,1),
(39,'Palomitas Chile Medianas',43,45,1),
(40,'Palomitas Chile Pequenas',39,12,1),
(41,'Palomitas Combinadas Grandes',45,120,1),
(42,'Palomitas Combinadas Medianas',42,110,1),
(43,'Palomitas Combinadas Pequenas',38,30,1),
(44,'Vaso de Temporada Grande',55,146,1),
(45,'Vaso de Temporada Mediano',45,121,1),
(46,'Cubetas de Temporada Grande',65,146,1),
(47,'Cubetas de Temporada Mediano',60,121,1),
(49,'Baguettes',56,72,1),
(50,'Baguettes 2 Ingredientes',62,39,1),
(51,'Baguettes 3 Ingredientes',68,22,0),
(52,'Papas Twister Grandes',39,120,1),
(53,'Papas Twister Medianas',35,110,1),
(54,'Papas Twister Pequenas',32,30,1),
(55,'Hamburguesa Grandes',75,120,0),
(56,'Hamburguesa Medianas',70,110,0),
(57,'Hamburguesa Pequenas',68,30,0),
(58,'Frappe de Arandano',82,89,1),
(59,'Frappe de Zarzamora',85,96,1),
(60,'Frappe de Fresa',81,101,1),
(61,'Frappe de Mango',79,85,1),
(62,'Limonada Harley Quinn',56,132,1),
(63,'Limonada Guason',59,123,1),
(64,'Big Dippers',89,23,1),
(65,'Helado oreo 473ml',49,124,1),
(66,'Paquete de Palomitas Naturales',18,103,1),
(67,'Paquete de Palomitas Mantequilla',18,89,1),
(68,'Paquete de Palomitas Extra Mantequilla',18,75,1),
(69,'Paquete de Palomitas Caramelo',18,59,1),
(70,'Nachos Flamin Hot Grandes',53,99,1),
(71,'Nachos Flamin Hot Medianos',48,80,1),
(72,'Nachos Flamin Hot Pequenos',41,40,1),
(73,'Mordisko',21,60,1),
(74,'Max',18,0,0),
(75,'Magnum',35,106,1),
(76,'Solero',22,68,1),
(77,'Sushi',79,104,1),
(78,'Snacks Boneless',149,10,1),
(79,'Cafe Espresso Sencillo',37,80,1),
(80,'Cafe Espresso Doble',41,65,1),
(81,'Cafe Espresso Cortado Sencillo',40,51,0),
(82,'Cafe Espresso Cortado Doble',44,0,0),
(83,'Cafe Americano',46,15,1),
(84,'Frappe Capuchino',60,85,1),
(85,'Frappe Chocolate',60,25,1),
(86,'Frappe Chocolate Blanco',60,10,1),
(87,'Frappe Carlos V',72,8,1),
(88,'Palomitas Oreo',79,68,1),
(89,'Palomitas M&Ms',79,47,1),
(90,'Hotdog BBQ',73,15,0),
(91,'Gomitas Pandita',25,53,1),
(92,'Gomitas Gusano',25,51,1),
(93,'Gomitas Manzana',25,26,0),
(94,'Cacahuates Enchilados',25,71,1),
(95,'Cacahuates Salados',25,62,1),
(96,'Cacahuates Japoneses',25,56,1),
(97,'Pepitas',25,63,1),
(98,'Pelonazo',29,108,1),
(99,'Nerds Wonka',35,78,0),
(100,'Kazoozles Wonka',42,96,1),
(101,'Skittles',26,51,1),
(102,'Mangos Enchilados',42,32,1),
(103,'Chocolate Hersheys',33,112,1);

/*Table structure for table `sala` */

DROP TABLE IF EXISTS `sala`;

CREATE TABLE `sala` (
  `idSala` int(11) NOT NULL,
  `totalAsientos` int(11) DEFAULT NULL,
  `proyeccion` varchar(10) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`idSala`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sala` */

insert  into `sala`(`idSala`,`totalAsientos`,`proyeccion`,`precio`) values 
(1,30,'2D',45),
(2,30,'2D',45),
(3,30,'3D',65),
(4,30,'IMAX',85),
(5,30,'4D',105);

/*Table structure for table `salapelicula` */

DROP TABLE IF EXISTS `salapelicula`;

CREATE TABLE `salapelicula` (
  `idPelicula` int(11) NOT NULL,
  `idSala` int(11) NOT NULL,
  `idioma` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`idPelicula`,`idSala`,`idioma`),
  KEY `idSala` (`idSala`),
  CONSTRAINT `salapelicula_ibfk_1` FOREIGN KEY (`idPelicula`) REFERENCES `pelicula` (`idPelicula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salapelicula_ibfk_2` FOREIGN KEY (`idSala`) REFERENCES `sala` (`idSala`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `salapelicula` */

/*Table structure for table `ticketalimentos` */

DROP TABLE IF EXISTS `ticketalimentos`;

CREATE TABLE `ticketalimentos` (
  `idTicket` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `total` float DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTicket`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `ticketalimentos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticketalimentos_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ticketalimentos` */

/*Table structure for table `ticketboleto` */

DROP TABLE IF EXISTS `ticketboleto`;

CREATE TABLE `ticketboleto` (
  `idVenta` int(11) NOT NULL,
  `total` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idBoleto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idEmpleado` (`idEmpleado`),
  KEY `idBoleto` (`idBoleto`),
  CONSTRAINT `ticketboleto_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticketboleto_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticketboleto_ibfk_3` FOREIGN KEY (`idBoleto`) REFERENCES `boleto` (`idBoleto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ticketboleto` */

/*Table structure for table `ticketpaquete` */

DROP TABLE IF EXISTS `ticketpaquete`;

CREATE TABLE `ticketpaquete` (
  `idTicket` int(11) NOT NULL,
  `idPaquete` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTicket`,`idPaquete`),
  KEY `idPaquete` (`idPaquete`),
  CONSTRAINT `ticketpaquete_ibfk_1` FOREIGN KEY (`idTicket`) REFERENCES `ticketalimentos` (`idTicket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticketpaquete_ibfk_2` FOREIGN KEY (`idPaquete`) REFERENCES `paquete` (`idPaquete`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ticketpaquete` */

/*Table structure for table `ticketproducto` */

DROP TABLE IF EXISTS `ticketproducto`;

CREATE TABLE `ticketproducto` (
  `idTicket` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTicket`,`idProducto`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `ticketproducto_ibfk_1` FOREIGN KEY (`idTicket`) REFERENCES `ticketalimentos` (`idTicket`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticketproducto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ticketproducto` */

/*Table structure for table `tipoboleto` */

DROP TABLE IF EXISTS `tipoboleto`;

CREATE TABLE `tipoboleto` (
  `idTipoBoleto` int(11) NOT NULL,
  `descuento` float DEFAULT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idTipoBoleto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipoboleto` */

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `tipoUsuario` varchar(15) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `ap` varchar(20) DEFAULT NULL,
  `am` varchar(20) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`idUsuario`,`tipoUsuario`,`password`,`nombre`,`ap`,`am`,`estado`,`email`) values 
(1,'Black','123456','Hamurabi','Ramírez','Olvera',1,'olvera@gmail.com'),
(2,'Fanático Club','blancoJ','Jorge Arturo','Córdova','Cruz',1,'cordova@live.com.mx'),
(3,'Fan','456tom','Tomás José','Acosta','Canto',1,'tomojos@hotmail.com'),
(4,'Golden','456art','Arturo','Campos','Cruz',1,'campcruz@yahoo.com.mx'),
(5,'Silver','irma23','Irma','Aguilar','Dorantes',1,'dorAg@gmail.com'),
(6,'Super Fanático','blanco','María Ofelia','Aguilar','Lemus',1,'mararg@hotmail.com'),
(7,'Cine Club','fred123','Fredy Francisco','Aguilar','Pérez',1,'paco12@yahoo.com.mx'),
(8,'Super Fanático','blanco','Adolfo','Aldrete','Vargas',1,'25_adolf@gmail.com'),
(9,'Super Fanático','ver234','Verónica','Álvarez','Martínez',1,'vero9012@gmail.com'),
(10,'Black','blan123','Joaquín Hugo','Arrona','Paredes',1,'paredes@hotmail.com'),
(11,'Black','alo123','Alondra','Delgadillo','López',1,'alondel90@live.com.mx'),
(12,'Black','alex890','Alejandro','Díaz','Sánchez',1,'alexDiaz@live.com.mx'),
(13,'Fan','joseDom','José Marín','Domínguez','Rojas',1,'jose56mar@yahoo.com.mx'),
(14,'Cine Club','dor900','Samuel','Dorantes','Alba',1,'sam34@gmail.com'),
(15,'Black','blanco','Arturo','Euclides','Cruz',1,'cordova@hotmail.com'),
(16,'Cine Club','savage','Armando','Barba','Trejo',1,'barrabas@yahoo.com.mx'),
(17,'Fanático Club','red','Jessica','Bautista','Gómez',1,'princess45@hotmail.com'),
(18,'Fanático Club','nigger','Pilar','Bravo','Lizardi',1,'pilyio2@live.com.mx'),
(19,'Super Fanático','isa123','Isaac','Fernández','López',1,'fernand@live.com.mx'),
(20,'Super Fanático','123isa','Ana Isabel','Flores','Vega',1,'flores98a@gmail.com'),
(21,'Fan','hida','Marco','Bueno','Casado',1,'leon23@hotmail.com'),
(22,'Fanático Club','b435','Alejandro','Estrada','Cruz',1,'elalez@yahoo.com.mx'),
(23,'Cine Club','bythem','Perla','Estrada','Jimenez',1,'perlis@live.com.mx'),
(24,'Fan','12345','Hector','Estrella','Roa',1,'thestar@live.com.mx'),
(25,'Golden','blanco','Tizoc','Etzentzonztli','Weismann',1,'aztecarioca@live.com.mx'),
(26,'Fanático Club','key','Gonzálo','Galicia','Palma',1,'cordenadagali@live.com.mx'),
(27,'Black','goldey56','Vicente','Gálvez','Estudrillo',1,'vvges@gmail.com'),
(28,'Cine Club','raae3','Ana','Garcia','Ibarbo',1,'annie32@gmail.com'),
(29,'Golden','btw','Georgina','Gutiérrez','Melendez',1,'gggut2@hotmail.com'),
(30,'Super Fanático','cinefan333','Alan','Hernández','Peña',1,'themaster@live.com.mx'),
(31,'Super Fanático','4567','Natalia','Hernández','García',1,'lovedogs@yahoo.com.mx'),
(32,'Fan','blanhis','Jose','Hernández','Cruz',1,'eljose@yahoo.com.mx'),
(33,'Black','catorceconletra','Eva','Hidalgo','Ibarrruena',1,'eeva@hotmail.com'),
(34,'Cine Club','sshan45','Oscar','Huerta','Del cerro',1,'agrioscar@gmail.com'),
(35,'Cine Club','environ','Ximena','Hoyos','Naranjo',1,'ximexime@gmail.com'),
(36,'Cine Club','lolo','Armando','Jasso','Tena',1,'ssoyceleste@yahoo.com.mx'),
(37,'Cine Club','blanc','Paulina','Jara','Tinoco',1,'jaraaa@gmail.com.mx'),
(38,'Golden','themiz','Dana','Jaramillo','Gómez',1,'themistic@hotmail.com'),
(39,'Golden','5555','Argenis','Juárez','Juárez',1,'argentina21@hotmail.com'),
(40,'Black','negro','Omara','Juárez','Soto',1,'ilovejustin@live.com.mx'),
(41,'Fan','astri77','Astrid','Juárez','Zamarripa',1,'ajzamarri@live.com.mx'),
(42,'Super Fanático','Hugolo','Eddie','Lara','Castro',1,'ellara@yahoo.com.mx'),
(43,'Super Fanático','berde244','Raquel','Lara','Cruz',1,'laraque@gmail.com'),
(44,'Silver','1234567432','Linaloe','Laso','Fernandez',1,'linalaso@yahoo.com.mx'),
(45,'Fanático Club','trfgh','Edgar','López','Aguirre',1,'edgar@live.com.mx'),
(46,'Cine Club','hyuig3','Nes','López','Cruz',1,'coraz@yahoo.com.mx'),
(47,'Cine Club','lasedes','Ines','Lugo','Estrada',1,'encbin@hotmail.com'),
(48,'Fan','arm123','Armando','Martínez','Zavala',1,'armZav@hotmail.com'),
(49,'Black','zac123','Abel','Mejía','Alba',1,'isamej@yahoo.com.mx'),
(50,'Golden','950201','Giselle','Nuñez','López',1,'gisse03@live.com.mx'),
(51,'Silver','mar234','Marisol','Sánchez','Cardoso',1,'maaar12@gmail.com'),
(52,'Silver','456can','Nicéforo','Cantú','Garza',1,'cantuNice@hotmail.com'),
(53,'Fanático Club','chongSa','Jorge Santiago','Chong','Gutiérrez',1,'chong97@hotmail.com'),
(54,'Fanático Club','123456','Roberto','De La Fuente','Guerra',1,'guerraFu@live.com.mx'),
(55,'Fanático Club','charlie','Carlos','Estrada','Esquivel',1,'escharlie@yahoo.com.mx'),
(56,'Black','nav123','Óscar Horacio','Escobedo','Návar',1,'navar12@yahoo.com.mx'),
(57,'Golden','0195era','Carlos Luis','Erazo','Bernal',1,'erazo95@gmail.com'),
(58,'Golden','fer9501','Ángel Virgilio','Ferreira','Centeno',1,'ferr_1995@live.com.mx'),
(59,'Super Fanático','1997mena','Carlos Porfirio','Fuentes','Mena',1,'mena_14@hotmail.com'),
(60,'Fan','blanco','José','Ibañez','Saez',1,'ibañez23@hotmail.com'),
(61,'Super Fanático','1234we','Gilberto','Morales','Cruz',1,'gil1995@live.com.mx'),
(62,'Cine Club','natiLau','Laura','Natividad','Nuñez',1,'lau2000@yahoo.com.mx'),
(63,'Super Fanático','123omar','Omar','Quiñonez','Álvarez',1,'omar123@hotmail.com'),
(64,'Golden','quintana9','Alexis','Quintanilla','Quintanilla',1,'quintana45@yahoo.com.mx'),
(65,'Super Fanático','gaby345','Gabriela','Robles','Cruz',1,'gabs1992@gmail.com'),
(66,'Super Fanático','ast123','Alberto Alejandro','Ruiz','Astorga',1,'astorga23@hotmail.com'),
(67,'Fan','aloo16','Alondra','Remo','García',1,'alooHa@yahoo.com.mx'),
(68,'Fanático Club','romu65','Rómulo','Salas','Arzate',1,'romu56@gmail.com'),
(69,'Silver','joack2505','Joaquín Misael','Jiménez','Arzate',1,'joaquin25@hotmail.com'),
(70,'Black','emmm78','Emiliano','Jurado','Razo',1,'jurado1992@hotmail.com'),
(71,'Black','jose123','José','Olvera','Aldana',1,'aldana18@gmail.com'),
(72,'Fanático Club','oca123','Alberto','Oca','Montes',1,'albert23@gmail.com'),
(73,'Black','mir890','Mirna','Pérez','Pérez',1,'mirperez@live.com.mx'),
(74,'Fanático Club','mar567','María','Peredo','Ramírez',1,'marPer@live.com.mx'),
(75,'Golden','galis1712','Gala Samara','Zavala','Chávez',1,'gala17hotmail.com'),
(76,'Super Fanático','saidlu','Osvaldo Said','Muñoz','Hernández',1,'said.1u@hotmail.com'),
(77,'Golden','b1234','Itzel','Durán','Rodriguez',1,'itzi_94@live.com.mx'),
(78,'Fan','asgf67','Emiliano','García','Andalón',1,'emi_gar@hotmail.com'),
(79,'Fanático Club','esda23','Arturo','Campos','García',1,'campos_gar@yahoo.com.mx'),
(80,'Black','123890','Eloisa','Córdova','Cruz',1,'elo_123@gmail.com'),
(81,'Fanático Club','car123','Ximena','Solis','Teniente',1,'solisten@live.com.mx'),
(82,'Black','simple1','Mara','López','Samaniego',0,'maraLop@hotmail.com'),
(83,'Silver','dogfunny','Carlos','Bustamante','Cruz',0,'charlie@live.com.mx'),
(84,'Golden','123456','Euler','Hernández','Contreras',0,'euler_cont@yahoo.com.mx'),
(85,'Silver','101010','Arturo','García','García',0,'gar_gar@live.com.mx'),
(86,'Silver','awe123','Samara','Gutiérrez','Mora',0,'sam_123@yahoo.com.mx'),
(87,'Fan','78koala','Alan','Mora','Molina',0,'alan_mol@hotmail.com'),
(88,'Black','25051l','Eva','Flores','Salas',0,'eva_salas@gmail.com'),
(89,'Super Fanático','runner12','Gerardo','Lira','Cáliz',1,'gerard@gmail.com'),
(90,'Black','horse95','Diego','Zapata','Vélez',0,'zap_vel@hotmail.com'),
(91,'Super Fanático','andy678','Sandy','Córdova','García',1,'sandy_55@live.com.mx'),
(92,'Black','qwe456','Misael','Teniente','Hernández',0,'teniente12@live.com.mx'),
(93,'Golden','48596a','Abel','Hernández','Razo',0,'abel_razo@hotmail.com'),
(94,'Golden','bar890','Bárbara','Hernández','García',0,'arabrab@live.com.mx'),
(95,'Fan','eva123','Evangelina','Toledo','Olivares',0,'eva_oli@live.com.mx'),
(96,'Fanático Club','84265er','Erick','Torres','Gómez',1,'erick_gom@yahoo.com.mx'),
(97,'Fan','159357','Pilar','Vega','Del Pilar',0,'pili1995@hotmail.com'),
(98,'Golden','master12','Ulises','Vélez','Saldaña',0,'u_saldaña@yahoo.com.mx'),
(99,'Black','star12','África','Zamora','Campos',0,'africa25@gmail.com'),
(100,'Black','lore123','Lorena','Zarate','Bustamante',0,'loreZar@hotmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
