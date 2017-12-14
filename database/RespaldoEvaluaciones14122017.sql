-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: evaluaciones
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alternativa`
--

DROP TABLE IF EXISTS `alternativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alternativa` (
  `ID` int(5) NOT NULL,
  `ID_PREGUNTA` int(5) DEFAULT NULL,
  `DESC_ALTERNATIVA` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_alter_pregunta_idx` (`ID_PREGUNTA`),
  CONSTRAINT `fk_alter_pregunta` FOREIGN KEY (`ID_PREGUNTA`) REFERENCES `pregunta` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternativa`
--

LOCK TABLES `alternativa` WRITE;
/*!40000 ALTER TABLE `alternativa` DISABLE KEYS */;
INSERT INTO `alternativa` VALUES (0,NULL,NULL),(1,1,'Control de los antibióticos y técnica de aseo ambiental.'),(2,1,'Higiene de manos y aislamiento de pacientes.'),(3,1,'Técnica aséptica.'),(4,3,'Los asociados a procedimientos invasivos.'),(5,3,'Los factores propios del paciente.'),(6,3,'	La calidad del aire al interior del centro asistencial.'),(7,4,'Agente.'),(8,4,'Mecanismo de infección.'),(9,4,'Hospedero susceptible.'),(10,4,'Puerta de salida y de entrada.'),(11,4,'Reservorio.'),(12,4,'Vía de transmisión'),(13,7,'Sin un programa de IAAS tienden a aumentar las infecciones.'),(14,7,'Sin un programa de IAAS se prolongan los dias superando los 10 dias de estadía hospitalaria, produciendo una mortalidad de hasta 20% eb algunos síndromes clínicos.'),(15,7,'La prevención es de costo-beneficio favorable.');
/*!40000 ALTER TABLE `alternativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruccion`
--

DROP TABLE IF EXISTS `instruccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruccion` (
  `ID` int(5) NOT NULL,
  `ID_PRUEBA` int(10) DEFAULT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_prueba_idx` (`ID_PRUEBA`),
  CONSTRAINT `fk_prueba_instruc` FOREIGN KEY (`ID_PRUEBA`) REFERENCES `prueba` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruccion`
--

LOCK TABLES `instruccion` WRITE;
/*!40000 ALTER TABLE `instruccion` DISABLE KEYS */;
INSERT INTO `instruccion` VALUES (1,1,'La evaluación cuenta con dos Ítems: I Selección múltiple (2 puntos cada respuesta correcta) y II Verdadero y falso (1 punto cada respuesta correcta).'),(2,1,'Lee atentamente cada una de las preguntas y responde seleccionando la alternativa correcta.'),(3,1,'Al finalizar el control, respondiendo todas las preguntas, tienes la opción de revisar tus respuestas antes de hacer el envío definitivo del control.'),(4,1,'Para confirmar el envío de tus respuestas presiona el botón \"Finalizar\" ubicado en la parte inferior del cuestionario.'),(5,1,'Luego de enviar tus respuestas, podrás visualizar tu calificación.'),(6,2,'La evaluación cuenta con dos Ítems: I Selección múltiple (2 puntos cada respuesta correcta) y II Verdadero y falso (1 punto cada respuesta correcta).'),(7,2,'Lee atentamente cada una de las preguntas y responde seleccionando la alternativa correcta.'),(8,2,'Al finalizar el control, respondiendo todas las preguntas, tienes la opción de revisar tus respuestas antes de hacer el envío definitivo del control.'),(9,2,'Para confirmar el envío de tus respuestas presiona el botón \"Finalizar\" ubicado en la parte inferior del cuestionario.\r'),(10,2,'Luego de enviar tus respuestas, podrás visualizar tu calificación.');
/*!40000 ALTER TABLE `instruccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `ID` int(5) NOT NULL,
  `DESC_ITEM` varchar(500) DEFAULT NULL,
  `ID_PRUEBA` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_prueba_item_idx` (`ID_PRUEBA`),
  CONSTRAINT `fk_prueba_item` FOREIGN KEY (`ID_PRUEBA`) REFERENCES `prueba` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'ITEM DE SELECCIÓN MULTIPLE. MARQUE EN UN CIRCULO LA ALTERNATIVA CORRECTA, SOLO UNA ES LA RESPUESTA CORRECTA.  (2 PTOS. C/U).',1),(2,'ITEM DE VERDADERO Y FALSO. Mencione Verdadero (SI) o Falso (NO) en cada una de los siguientes enunciados. (1 PTO. C/U).',1),(3,'ITEM DE SELECCIÓN MULTIPLE. MARQUE EN UN CIRCULO LA ALTERNATIVA CORRECTA, SOLO UNA ES LA RESPUESTA CORRECTA.  (2 PTOS. C/U)',2),(4,'ITEM DE VERDADERO Y FALSO. Mencione Verdadero (SI) o Falso (NO) en cada una de los siguientes enunciados (1 PTO. C/U)',2);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `ID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'id que identifica a la pregunta de una prueba determinada',
  `ID_PRUEBA` int(5) NOT NULL COMMENT 'representa a la prueba que esta destinada la pregunta',
  `PREGUNTA` varchar(200) NOT NULL COMMENT 'descripcion de la pregunta para el usuario',
  `PUNTAJE` int(5) NOT NULL COMMENT 'puntaje asignado a la pregunta',
  `ALTERNATIVA` varchar(1) DEFAULT NULL COMMENT 'si valor es 0, la pregunta no tiene alternativas, si valor es 1, la pregunta tiene alternativas.',
  `ID_ITEM` int(5) DEFAULT NULL,
  `VOF` int(1) DEFAULT NULL COMMENT 'Indica si la pregunta es verdadero o falso. ',
  PRIMARY KEY (`ID`),
  KEY `pregunta_prueba_fk_idx` (`ID_PRUEBA`),
  KEY `fk_item_pregunta_idx` (`ID_ITEM`),
  CONSTRAINT `fk_item_pregunta` FOREIGN KEY (`ID_ITEM`) REFERENCES `item` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pregunta_prueba_fk` FOREIGN KEY (`ID_PRUEBA`) REFERENCES `prueba` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='tabla de preguntas para cada prueba que se realice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,1,'En las precauciones estándares, se comprenden los siguientes aspectos:',2,'1',1,0),(2,1,'De las siguientes descripciones, indique cuál NO se considera IAAS:',2,'0',1,0),(3,1,'¿Cuál o cuáles de los factores de riesgo se consideran importantes para el desarrollo de una IAAS?',2,'1',1,0),(4,1,'¿Cuáles son los elementos que conforman la Cadena de transmisión?',2,'1',1,0),(5,1,'¿Cual de las medidas se aplican en condiciones de aislamiento por gotitas por ejemplo para influenza?',1,'0',2,1),(6,1,'¿Cuáles de las siguientes medidas de prevención de pinchazos y cortes deben cumplirse durante el procedimiento de punción venosa con jeringas y agujas desechables?',1,'0',2,1),(7,1,'Las IAAS son un problema de Salud Pública en Chile, lo que amerita un programa de intervención, porque:',2,'1',1,0),(8,1,'En la infección del tracto urinario en los hospitales, el principal factor de riesgo relacionado con la atención en salud es:',2,'0',1,0),(9,1,'Para el procedimiento de instalacion de catéter urinario indique cuales de los componentes de la técnica aséptica corresponde aplicar.',1,'0',2,1),(10,1,'Respecto a la prevención de infecciones de heridas operatoria corresponde aplicar.',1,'0',2,1),(11,1,'Respecto al manejo de antisépticos y desinfectantes corresponde aplicar.',1,'0',2,1),(12,1,'Respecto al proceso de esterilización corresponde aplicar.',1,'0',2,1),(13,2,'En las precauciones estándares, se comprenden los siguientes aspectos:',2,'1',3,0),(14,2,'De las siguientes descripciones, indique cuál NO se considera IAAS:',2,'0',3,0),(15,2,'¿Cuál o cuáles de los factores de riesgo se consideran importantes para el desarrollo de una IAAS?',2,'1',3,0),(16,2,'¿Cuáles son los elementos que conforman la Cadena de transmisión?',2,'1',3,0),(17,2,'Las IAAS son un problema de Salud Pública en Chile, lo que amerita un programa de intervención, porque:',2,'1',3,0),(18,2,'La principal responsabilidad en la prevención de IAAS por parte del equipo de salud, está relacionada con:',2,'0',3,0),(19,2,'El uso de técnica aséptica en la ejecución de procedimientos clínicos tales como: instalación de catéter urinario, catéter venoso o intubación traqueal, actúa en el siguiente eslabón de la cadena de t',2,'0',3,0),(20,2,'El uso de precauciones de contacto y otros tipos de aislamientos de microorganismos actúa en el siguiente eslabón de la cadena de transmisión:',2,'0',3,0),(21,2,'La compensación de patologías crónicas, cesación del hábito tabáquico y optimización del estado nutricional, son intervenciones que actúan en el siguiente eslabón de la cadena de transmisión:',2,'0',3,0),(22,2,'En la infección del tracto urinario en los hospitales, el principal factor de riesgo relacionado con la atención en salud es:',2,'0',3,0),(23,2,'Con respecto a la infección del torrente sanguíneo (bacteremia/septicemia) asociada a catéter vascular, la puerta de entrada de los agentes puede ser:',2,'1',3,0),(24,2,'Con respecto a la prevención de la neumonía asociada a ventilación mecánica, ¿Cuál de las siguientes NO es una vía de introducción de microorganismos en el aparato respiratorio?:',2,'0',3,0),(25,2,'Sobre el rol de los desechos clínicos en las IAAS, ¿cuál de las siguientes afirmaciones es VERDADERA?',2,'0',3,0),(26,2,'Respecto al proceso de esterilización ¿Cuál o cuáles de las siguientes características es (son) VERDADERA(S) respecto a las etapas de lavado e inspección en los procesos de desinfección de alto nivel ',2,'1',3,0),(27,2,'¿Cuáles de las medidas se aplican en condiciones de aislamiento en transmisión por vía aérea por ejemplo tuberculosis pulmonar bacilifera?',1,'0',4,1),(28,2,'¿Cuáles de las siguientes medidas de prevención de pinchazos y cortes deben cumplirse durante el procedimiento de punción venosa con jeringa y aguja desechables?',1,'0',4,1),(29,2,'Respecto a la prevención de IAAS en un paciente con sonda Foley corresponde aplicar.',1,'0',4,1),(30,2,'Respecto a la prevención de Neumonías asociadas a ventilación mecánica corresponde aplicar.',1,'0',4,1),(31,2,'Respecto a la prevención de infecciones del sistema nervioso central corresponde aplicar.',1,'0',4,1),(32,2,'Respecto a la prevención de infecciones de herida operatoria corresponde aplicar.',1,'0',4,1),(33,2,'Respecto al proceso de esterilización corresponde aplicar.',1,'0',4,1);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba`
--

DROP TABLE IF EXISTS `prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prueba` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id de la evaluacion',
  `NOMBRE_PRUEBA` varchar(1000) NOT NULL COMMENT 'nombre de la evaluacion',
  `EXIGENCIA` int(3) DEFAULT NULL,
  `PUNTAJE_MAXIMO` int(5) DEFAULT NULL,
  `DESCRIPCION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='identifica la evaluación que los usuarios realizaran';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba`
--

LOCK TABLES `prueba` WRITE;
/*!40000 ALTER TABLE `prueba` DISABLE KEYS */;
INSERT INTO `prueba` VALUES (1,'INFECCIONES ASOCIADAS A LA ATENCIÓN DE SALUD I',60,42,'A través de este instrumento de evaluación, mediremos los aprendizajes logrados orientados al cumplimiento a los objetivos del curso.'),(2,'INFECCIONES ASOCIADAS A LA ATENCIÓN DE SALUD II',60,61,'A través de este instrumento de evaluación, mediremos los aprendizajes logrados orientados al cumplimiento a los objetivos del curso.');
/*!40000 ALTER TABLE `prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta` (
  `ID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'id que identifica a la respuesta',
  `RESPUESTA` varchar(500) NOT NULL COMMENT 'descripcion de la respuesta',
  `VALOR` varchar(2) DEFAULT NULL COMMENT 'indica si la respuesta el correcta o no. V para verdadero, F para Falso. 1 para correcto, 0 para para incorrecto. ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='respuestas asginadas a cada pregunta segun el id';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` VALUES (1,'Solo I.','0'),(2,'Solo III.','0'),(3,'Solo I y II.','0'),(4,'Solo II y III','1'),(5,'I, II y III.','0'),(6,'Paciente que cursa un cuadro infeccioso al 10° día de hospitalización. La incubación del cuadro es de 7 días.','0'),(7,'Infección en un recién nacido de bajo peso al 5°día de hospitalización.','0'),(8,'Colonización con microorganismo multiresistente en paciente hospitalizado.','1'),(9,'Infección de un implante traumatológico en un paciente de alta reciente.','0'),(10,'Personal de salud infectado por virus Hanta contraído al interior del recinto hospitalario.','0'),(11,'Solo I.','0'),(12,'Solo II.','0'),(13,'Solo I y II.','1'),(14,'Solo I y III.','0'),(15,'I, II y III.','0'),(16,'I, III, V y VI','0'),(17,'II, III, IV y VI','0'),(18,'I, II, IV, V y VI','0'),(19,'I, III, IV, V y VI','1'),(20,'Habitacion individual o compartida con personas con la misma infección','V'),(21,'Separación de camas de más de un metro','V'),(22,'Uso de mascarilla de tipo qirúrgico','V'),(23,'Uso de mascarilla Nº 95','F'),(24,'Evitar que la punta de la aguja apunte al cuerpo del personal','V'),(25,'Recapsular agujas inmediatamente despues de su uso','F'),(26,'Desinfectar material cortopunzante antes de su eliminacion','F'),(27,'Eliminar agujas sin recapsular en recipientes impermeables resistentes a punciones','V'),(28,'Doblar o quebrar material cortopunzante antes de su eliminacion','F'),(29,'Mantener el recipiente para desecho de agujas inmediatamente contiguo al sitio de uso de estas','V'),(30,'Solo I.','0'),(31,'Solo III.','0'),(32,'Solo II y III.','0'),(33,'Solo I y III.','0'),(34,'I, II y III.','1'),(35,'La edad del paciente.','0'),(36,'Sexo femenino.','0'),(37,'Uso de catéter urinario.','1'),(38,'La realización de cistoscopías.','0'),(39,'La hospitalización en una unidad de pacientes críticos. ','0'),(40,'Higiene de manos','V'),(41,'Preparación previa de la piel','V'),(42,'Uso de guantes estériles','V'),(43,'Uso de delantal estéril','V'),(44,'Uso de campo estéril','V'),(45,'Uso de material estéril','V'),(46,'Uso de mascarilla de tipo qurúrgico.','V'),(47,'Aseo preoperatorio de la piel.','V'),(48,'Mantener 7 - 8 personas por pabellón.','V'),(49,'Lavado qirúrgico de manos.','V'),(50,'Utilizar material estéril.','V'),(51,'Realizar curación previa al alta.','V'),(52,'Una vez abierta la clorhexidina tópica eliminar posterior a los 30 dias. ','F'),(53,'Una vez abierto el alcohol gel eliminar posterior a los 6 meses.','F'),(54,'El cloro se inactiva frente a materia orgánica.','V'),(55,'La solución del cloro diluido tiene una duracion máxima de 24 horas.','V'),(56,'El lavado de los materiales y equipos se realizan de forma automatizada y manual','V'),(57,'El óxido de etileno es un agente químico con alto poder microbicida','V'),(58,'Los estantes donde se almacena material, son de uso exclusivo para material estéril','V'),(59,'Los artículos pierden su esterilidad cuando el empaque perdió su indemnidad.','V');
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_pregunta`
--

DROP TABLE IF EXISTS `respuesta_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta_pregunta` (
  `ID_PREGUNTA` int(5) NOT NULL,
  `ID_RESPUESTA` int(5) NOT NULL,
  PRIMARY KEY (`ID_PREGUNTA`,`ID_RESPUESTA`),
  KEY `fk_preguntas_pruebas_has_respuestas_pruebas_respuestas_prue_idx` (`ID_RESPUESTA`),
  KEY `fk_preguntas_pruebas_has_respuestas_pruebas_preguntas_prueb_idx` (`ID_PREGUNTA`),
  CONSTRAINT `fk_preguntas_pruebas_has_respuestas_pruebas_preguntas_pruebas1` FOREIGN KEY (`ID_PREGUNTA`) REFERENCES `pregunta` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_preguntas_pruebas_has_respuestas_pruebas_respuestas_pruebas1` FOREIGN KEY (`ID_RESPUESTA`) REFERENCES `respuesta` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_pregunta`
--

LOCK TABLES `respuesta_pregunta` WRITE;
/*!40000 ALTER TABLE `respuesta_pregunta` DISABLE KEYS */;
INSERT INTO `respuesta_pregunta` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(2,10),(3,11),(3,12),(3,13),(3,14),(3,15),(4,16),(4,17),(4,18),(4,19),(5,20),(5,21),(5,22),(5,23),(6,24),(6,25),(6,26),(6,27),(6,28),(6,29),(7,30),(7,31),(7,32),(7,33),(7,34),(8,35),(8,36),(8,37),(8,38),(8,39),(9,40),(9,41),(9,42),(9,43),(9,44),(9,45),(9,46),(10,47),(10,48),(10,49),(10,50),(10,51),(11,52),(11,53),(11,54),(11,55),(12,56),(12,57),(12,58),(12,59);
/*!40000 ALTER TABLE `respuesta_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `RUT` varchar(15) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `MATERNO` varchar(100) NOT NULL,
  `PATERNO` varchar(100) NOT NULL,
  `CARGO` varchar(100) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  PRIMARY KEY (`RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('14174626K','FRANCISCO JAVIER','HUIRCALEO','CASANOVA','INFORMATICA','12345');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_prueba`
--

DROP TABLE IF EXISTS `usuario_prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_prueba` (
  `RUT` varchar(15) NOT NULL COMMENT 'rut de usuario que dio la evaluacion',
  `ID_PRUEBA` int(5) NOT NULL COMMENT 'evaluacion asignada al usuario',
  `PUNTAJE` int(5) NOT NULL COMMENT 'puntaje total que obtuvo el usuario en la evaluacion finalizada',
  `NOTA` float NOT NULL COMMENT 'nota que obtuvo el usuario en la evaluacion',
  `FECHA_INICIO` datetime NOT NULL COMMENT 'fecha y hora en la cual inicio la evaluacion el usuario',
  `FECHA_TERMINO` datetime NOT NULL COMMENT 'fecha y hora en la que termino la evaluacion el usuario',
  PRIMARY KEY (`RUT`,`ID_PRUEBA`),
  KEY `fk_prueba_idx` (`ID_PRUEBA`),
  CONSTRAINT `fk_prueba` FOREIGN KEY (`ID_PRUEBA`) REFERENCES `prueba` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rut` FOREIGN KEY (`RUT`) REFERENCES `usuario` (`RUT`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabla diseñada para ver las notas y puntajes del usuario en ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_prueba`
--

LOCK TABLES `usuario_prueba` WRITE;
/*!40000 ALTER TABLE `usuario_prueba` DISABLE KEYS */;
INSERT INTO `usuario_prueba` VALUES ('14174626K',1,0,0,'2017-12-14 16:27:02','2017-12-14 16:09:18'),('14174626K',2,0,0,'2017-12-14 16:32:56','2017-12-14 15:33:36');
/*!40000 ALTER TABLE `usuario_prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_respuesta`
--

DROP TABLE IF EXISTS `usuario_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_respuesta` (
  `RUT` varchar(15) NOT NULL,
  `ID_PREGUNTA` int(5) NOT NULL,
  `ID_RESPUESTA` int(5) NOT NULL,
  `VOF` varchar(1) DEFAULT NULL COMMENT 'Indica el valor que respondio el usuario en las alternativas de verdadero o falso.',
  `FECHA` datetime NOT NULL,
  PRIMARY KEY (`RUT`,`ID_PREGUNTA`,`ID_RESPUESTA`),
  KEY `fk_preguntas_idx` (`ID_PREGUNTA`),
  KEY `fk_user_resp_idx` (`ID_RESPUESTA`),
  CONSTRAINT `fk_preguntas` FOREIGN KEY (`ID_PREGUNTA`) REFERENCES `pregunta` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_resp` FOREIGN KEY (`ID_RESPUESTA`) REFERENCES `respuesta` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hora y fecha respuestas del usuario de la prueba';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_respuesta`
--

LOCK TABLES `usuario_respuesta` WRITE;
/*!40000 ALTER TABLE `usuario_respuesta` DISABLE KEYS */;
INSERT INTO `usuario_respuesta` VALUES ('14174626K',1,4,NULL,'2017-12-13 15:01:51'),('14174626K',2,8,NULL,'2017-12-13 15:01:09'),('14174626K',3,13,NULL,'2017-12-13 15:02:03'),('14174626K',4,17,NULL,'2017-12-13 17:27:31'),('14174626K',5,20,'V','2017-12-13 15:04:29'),('14174626K',5,21,'V','2017-12-13 15:04:30'),('14174626K',5,22,'V','2017-12-13 15:04:31'),('14174626K',5,23,'F','2017-12-13 15:04:32'),('14174626K',6,24,'V','2017-12-13 15:04:45'),('14174626K',6,25,'F','2017-12-13 15:04:48'),('14174626K',6,26,'F','2017-12-13 15:04:49'),('14174626K',6,27,'V','2017-12-13 15:04:52'),('14174626K',6,28,'F','2017-12-13 15:04:55'),('14174626K',6,29,'V','2017-12-13 15:04:57'),('14174626K',7,34,NULL,'2017-12-13 15:01:36'),('14174626K',8,37,NULL,'2017-12-13 15:01:27'),('14174626K',9,40,'V','2017-12-13 15:03:30'),('14174626K',9,41,'V','2017-12-13 15:03:30'),('14174626K',9,42,'V','2017-12-13 15:03:31'),('14174626K',9,43,'V','2017-12-13 15:03:33'),('14174626K',9,44,'V','2017-12-13 15:03:34'),('14174626K',9,45,'V','2017-12-13 15:03:35'),('14174626K',9,46,'V','2017-12-13 15:03:37'),('14174626K',10,47,'V','2017-12-13 15:03:06'),('14174626K',10,48,'V','2017-12-13 15:03:07'),('14174626K',10,49,'V','2017-12-13 15:03:08'),('14174626K',10,50,'V','2017-12-13 15:03:10'),('14174626K',10,51,'V','2017-12-13 15:03:11'),('14174626K',11,52,'F','2017-12-13 15:02:42'),('14174626K',11,53,'F','2017-12-13 15:02:43'),('14174626K',11,54,'V','2017-12-13 15:02:45'),('14174626K',11,55,'V','2017-12-13 15:02:46'),('14174626K',12,56,'V','2017-12-13 15:04:00'),('14174626K',12,57,'V','2017-12-13 15:04:01'),('14174626K',12,58,'V','2017-12-13 15:04:01'),('14174626K',12,59,'V','2017-12-13 15:04:02');
/*!40000 ALTER TABLE `usuario_respuesta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14 16:41:43
