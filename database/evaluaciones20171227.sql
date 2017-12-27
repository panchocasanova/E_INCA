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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RUT` varchar(45) DEFAULT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `PATERNO` varchar(60) DEFAULT NULL,
  `MATERNO` varchar(60) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'14174626K','Francisco Javier','Casanova','H.','12345'),(2,'admin','Administrador',NULL,NULL,'admin');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alternativa`
--

DROP TABLE IF EXISTS `alternativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alternativa` (
  `ID` int(5) NOT NULL,
  `ID_PREGUNTA` int(5) DEFAULT NULL,
  `DESC_ALTERNATIVA` varchar(2000) DEFAULT NULL,
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
INSERT INTO `alternativa` VALUES (1,1,'Control de los antibióticos y técnica de aseo ambiental.'),(2,1,'Higiene de manos y aislamiento de pacientes.'),(3,1,'Técnica aséptica.'),(4,3,'Los asociados a procedimientos invasivos.'),(5,3,'Los factores propios del paciente.'),(6,3,'	La calidad del aire al interior del centro asistencial.'),(7,4,'Agente.'),(8,4,'Mecanismo de infección.'),(9,4,'Hospedero susceptible.'),(10,4,'Puerta de salida y de entrada.'),(11,4,'Reservorio.'),(12,4,'Vía de transmisión'),(13,7,'Sin un programa de IAAS tienden a aumentar las infecciones.'),(14,7,'Sin un programa de IAAS se prolongan los dias superando los 10 dias de estadía hospitalaria, produciendo una mortalidad de hasta 20% eb algunos síndromes clínicos.'),(15,7,'La prevención es de costo-beneficio favorable.'),(16,13,'Control de los antibióticos y técnica de aseo ambiental.'),(17,13,'Higiene de manos y aislamiento de pacientes.'),(18,13,'Técnica aséptica.'),(19,15,'Los asociados a procedimientos invasivos.'),(20,15,'Los factores propios del paciente.'),(21,15,'La calidad del aire al interior del centro asistencial.'),(22,16,'Agente'),(23,16,'Mecanismo de infección'),(24,16,' Hospedero susceptible'),(25,16,'Puerta de salida y de entrada'),(26,16,'Reservorio'),(27,16,'Vía de transmisión'),(28,17,'Sin un programa de IAAS tienden a aumentar las infecciones.'),(29,17,'Sin un programa de IAAS se prolongan los días superando los 10 días de estadía hospitalaria, produciendo una mortalidad de hasta 20% en algunos síndromes clínicos'),(30,17,'La prevención es de costo-beneficio favorable.'),(31,23,'El sitio de inserción del catéter vascular.'),(32,23,'Las conexiones (como llaves de tres pasos entre otras) del circuito.'),(33,23,'La conexión del circuito con el matraz de fluido.'),(34,26,'La etapa de lavado permite la eliminación de la materia orgánica visible antes de exponer el dispositivo médico al método de esterilización o desinfección de alto nivel.'),(35,26,'La etapa de inspección permite identificar material dañado o con residuos que no deben pasar a la etapa de esterilización o desinfección de alto nivel.'),(36,26,'Si falla la etapa de lavado y de inspección respecto a la presencia de materia orgánica del material, el resultado del proceso de esterilización o desinfección de alto nivel no se afectará si la exposición posterior a los métodos de desinfección o esterilización son correctamente ejecutados.'),(37,26,'La estandarización de estas etapas no es relevante para el éxito de ambos procesos. La verificación de la limpieza generalmente se hace por medio de la inspección visual en un ambiente bien iluminado, utilizando una lupa.');
/*!40000 ALTER TABLE `alternativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruccion`
--

DROP TABLE IF EXISTS `instruccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruccion` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `ID_PRUEBA` int(10) DEFAULT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_prueba_idx` (`ID_PRUEBA`),
  CONSTRAINT `fk_prueba_instruc` FOREIGN KEY (`ID_PRUEBA`) REFERENCES `prueba` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruccion`
--

LOCK TABLES `instruccion` WRITE;
/*!40000 ALTER TABLE `instruccion` DISABLE KEYS */;
INSERT INTO `instruccion` VALUES (1,1,'La evaluación cuenta con dos Ítems: I Selección múltiple (2 puntos cada respuesta correcta) y II Verdadero y falso (1 punto cada respuesta correcta).'),(2,1,'Lee atentamente cada una de las preguntas y responde seleccionando la alternativa correcta.'),(3,1,'Al finalizar el control, respondiendo todas las preguntas, tienes la opción de revisar tus respuestas antes de hacer el envío definitivo del control.'),(4,1,'Para confirmar el envío de tus respuestas presiona el botón \"Finalizar\" ubicado en la parte inferior del cuestionario.'),(5,1,'Luego de enviar tus respuestas, podrás visualizar tu calificación.'),(6,2,'La evaluación cuenta con dos Ítems: I Selección múltiple (2 puntos cada respuesta correcta) y II Verdadero y falso (1 punto cada respuesta correcta).'),(7,2,'Lee atentamente cada una de las preguntas y responde seleccionando la alternativa correcta.'),(8,2,'Al finalizar el control, respondiendo todas las preguntas, tienes la opción de revisar tus respuestas antes de hacer el envío definitivo del control.'),(9,2,'Para confirmar el envío de tus respuestas presiona el botón \"Finalizar\" ubicado en la parte inferior del cuestionario.\r'),(10,2,'Luego de enviar tus respuestas, podrás visualizar tu calificación.'),(11,1,'La duracion de esta evaluacion es de 2 horas. se le avisara 20 y 5 minutos antes de terminar el tiempo asignado.'),(12,1,'El tiempo comienza desde que presionas el botón \"SIGUIENTE\".'),(13,1,'Una vez que ingresa a la evaluación, no puede cerrar la ventana de su navegador, ya que no podrá acceder nuevamente y se evaluará solo las alternativas o respuestas que completó.'),(14,2,'La duracion de esta evaluacion es de 2 horas. se le avisara 20 y 5 minutos antes de terminar el tiempo asignado.'),(15,2,'El tiempo comienza desde que presionas el botón \"SIGUIENTE\".'),(16,2,'Una vez que ingresa a la evaluación, no puede cerrar la ventana de su navegador, ya que no podrá acceder nuevamente y se evaluará solo las alternativas o respuestas que completó.');
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
  `PREGUNTA` varchar(500) NOT NULL COMMENT 'descripcion de la pregunta para el usuario',
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
INSERT INTO `pregunta` VALUES (1,1,'En las precauciones estándares, se comprenden los siguientes aspectos:',2,'1',1,0),(2,1,'De las siguientes descripciones, indique cuál NO se considera IAAS:',2,'0',1,0),(3,1,'¿Cuál o cuáles de los factores de riesgo se consideran importantes para el desarrollo de una IAAS?',2,'1',1,0),(4,1,'¿Cuáles son los elementos que conforman la Cadena de transmisión?',2,'1',1,0),(5,1,'¿Cual de las medidas se aplican en condiciones de aislamiento por gotitas por ejemplo para influenza?',1,'0',2,1),(6,1,'¿Cuáles de las siguientes medidas de prevención de pinchazos y cortes deben cumplirse durante el procedimiento de punción venosa con jeringas y agujas desechables?',1,'0',2,1),(7,1,'Las IAAS son un problema de Salud Pública en Chile, lo que amerita un programa de intervención, porque:',2,'1',1,0),(8,1,'En la infección del tracto urinario en los hospitales, el principal factor de riesgo relacionado con la atención en salud es:',2,'0',1,0),(9,1,'Para el procedimiento de instalacion de catéter urinario indique cuales de los componentes de la técnica aséptica corresponde aplicar.',1,'0',2,1),(10,1,'Respecto a la prevención de infecciones de heridas operatoria corresponde aplicar.',1,'0',2,1),(11,1,'Respecto al manejo de antisépticos y desinfectantes corresponde aplicar.',1,'0',2,1),(12,1,'Respecto al proceso de esterilización corresponde aplicar.',1,'0',2,1),(13,2,'En las precauciones estándares, se comprenden los siguientes aspectos:',2,'1',3,0),(14,2,'De las siguientes descripciones, indique cuál NO se considera IAAS:',2,'0',3,0),(15,2,'¿Cuál o cuáles de los factores de riesgo se consideran importantes para el desarrollo de una IAAS?',2,'1',3,0),(16,2,'¿Cuáles son los elementos que conforman la Cadena de transmisión?',2,'1',3,0),(17,2,'Las IAAS son un problema de Salud Pública en Chile, lo que amerita un programa de intervención, porque:',2,'1',3,0),(18,2,'La principal responsabilidad en la prevención de IAAS por parte del equipo de salud, está relacionada con:',2,'0',3,0),(19,2,'El uso de técnica aséptica en la ejecución de procedimientos clínicos tales como: instalación de catéter urinario, catéter venoso o intubación traqueal, actúa en el siguiente eslabón de la cadena de transmisión.',2,'0',3,0),(20,2,'El uso de precauciones de contacto y otros tipos de aislamientos de microorganismos actúa en el siguiente eslabón de la cadena de transmisión:',2,'0',3,0),(21,2,'La compensación de patologías crónicas, cesación del hábito tabáquico y optimización del estado nutricional, son intervenciones que actúan en el siguiente eslabón de la cadena de transmisión:',2,'0',3,0),(22,2,'En la infección del tracto urinario en los hospitales, el principal factor de riesgo relacionado con la atención en salud es:',2,'0',3,0),(23,2,'Con respecto a la infección del torrente sanguíneo (bacteremia/septicemia) asociada a catéter vascular, la puerta de entrada de los agentes puede ser:',2,'1',3,0),(24,2,'Con respecto a la prevención de la neumonía asociada a ventilación mecánica, ¿Cuál de las siguientes NO es una vía de introducción de microorganismos en el aparato respiratorio?:',2,'0',3,0),(25,2,'Sobre el rol de los desechos clínicos en las IAAS, ¿cuál de las siguientes afirmaciones es VERDADERA?',2,'0',3,0),(26,2,'Respecto al proceso de esterilización ¿Cuál o cuáles de las siguientes características es (son) VERDADERA(S) respecto a las etapas de lavado e inspección en los procesos de desinfección de alto nivel ',2,'1',3,0),(27,2,'¿Cuáles de las medidas se aplican en condiciones de aislamiento en transmisión por vía aérea por ejemplo tuberculosis pulmonar bacilifera?',1,'0',4,1),(28,2,'¿Cuáles de las siguientes medidas de prevención de pinchazos y cortes deben cumplirse durante el procedimiento de punción venosa con jeringa y aguja desechables?',1,'0',4,1),(29,2,'Respecto a la prevención de IAAS en un paciente con sonda Foley corresponde aplicar.',1,'0',4,1),(30,2,'Respecto a la prevención de Neumonías asociadas a ventilación mecánica corresponde aplicar.',1,'0',4,1),(31,2,'Respecto a la prevención de infecciones del sistema nervioso central corresponde aplicar.',1,'0',4,1),(32,2,'Respecto a la prevención de infecciones de herida operatoria corresponde aplicar.',1,'0',4,1),(33,2,'Respecto al proceso de esterilización corresponde aplicar.',1,'0',4,1);
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
  `FECHA_INICIO` datetime DEFAULT NULL,
  `FECHA_TERMINO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='identifica la evaluación que los usuarios realizaran';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba`
--

LOCK TABLES `prueba` WRITE;
/*!40000 ALTER TABLE `prueba` DISABLE KEYS */;
INSERT INTO `prueba` VALUES (1,'INFECCIONES ASOCIADAS A LA ATENCIÓN DE SALUD.',60,42,'A través de este instrumento de evaluación, mediremos los aprendizajes logrados orientados al cumplimiento a los objetivos del curso.','2017-12-21 08:00:00','2017-12-27 00:00:00'),(2,'INFECCIONES ASOCIADAS A LA ATENCIÓN DE SALUD PROFESIONALES.',60,61,'A través de este instrumento de evaluación, mediremos los aprendizajes logrados orientados al cumplimiento a los objetivos del curso.','2017-12-21 08:00:00','2017-12-27 00:00:00');
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
  `RESPUESTA` varchar(1000) NOT NULL COMMENT 'descripcion de la respuesta',
  `VALOR` varchar(2) DEFAULT NULL COMMENT 'indica si la respuesta el correcta o no. V para verdadero, F para Falso. 1 para correcto, 0 para para incorrecto. ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='respuestas asginadas a cada pregunta segun el id';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` VALUES (1,'Solo I.','0'),(2,'Solo III.','0'),(3,'Solo I y II.','0'),(4,'Solo II y III','1'),(5,'I, II y III.','0'),(6,'Paciente que cursa un cuadro infeccioso al 10° día de hospitalización. La incubación del cuadro es de 7 días.','0'),(7,'Infección en un recién nacido de bajo peso al 5°día de hospitalización.','0'),(8,'Colonización con microorganismo multiresistente en paciente hospitalizado.','1'),(9,'Infección de un implante traumatológico en un paciente de alta reciente.','0'),(10,'Personal de salud infectado por virus Hanta contraído al interior del recinto hospitalario.','0'),(11,'Solo I.','0'),(12,'Solo II.','0'),(13,'Solo I y II.','1'),(14,'Solo I y III.','0'),(15,'I, II y III.','0'),(16,'I, III, V y VI','0'),(17,'II, III, IV y VI','0'),(18,'I, II, IV, V y VI','0'),(19,'I, III, IV, V y VI','1'),(20,'Habitacion individual o compartida con personas con la misma infección','V'),(21,'Separación de camas de más de un metro','V'),(22,'Uso de mascarilla de tipo qirúrgico','V'),(23,'Uso de mascarilla Nº 95','F'),(24,'Evitar que la punta de la aguja apunte al cuerpo del personal','V'),(25,'Recapsular agujas inmediatamente despues de su uso','F'),(26,'Desinfectar material cortopunzante antes de su eliminacion','F'),(27,'Eliminar agujas sin recapsular en recipientes impermeables resistentes a punciones','V'),(28,'Doblar o quebrar material cortopunzante antes de su eliminacion','F'),(29,'Mantener el recipiente para desecho de agujas inmediatamente contiguo al sitio de uso de estas','V'),(30,'Solo I.','0'),(31,'Solo III.','0'),(32,'Solo II y III.','0'),(33,'Solo I y III.','0'),(34,'I, II y III.','1'),(35,'La edad del paciente.','0'),(36,'Sexo femenino.','0'),(37,'Uso de catéter urinario.','1'),(38,'La realización de cistoscopías.','0'),(39,'La hospitalización en una unidad de pacientes críticos. ','0'),(40,'Higiene de manos','V'),(41,'Preparación previa de la piel','V'),(42,'Uso de guantes estériles','V'),(43,'Uso de delantal estéril','V'),(44,'Uso de campo estéril','V'),(45,'Uso de material estéril','V'),(46,'Uso de mascarilla de tipo qurúrgico.','V'),(47,'Aseo preoperatorio de la piel.','V'),(48,'Mantener 7 - 8 personas por pabellón.','V'),(49,'Lavado qirúrgico de manos.','V'),(50,'Utilizar material estéril.','V'),(51,'Realizar curación previa al alta.','V'),(52,'Una vez abierta la clorhexidina tópica eliminar posterior a los 30 dias. ','F'),(53,'Una vez abierto el alcohol gel eliminar posterior a los 6 meses.','F'),(54,'El cloro se inactiva frente a materia orgánica.','V'),(55,'La solución del cloro diluido tiene una duracion máxima de 24 horas.','V'),(56,'El lavado de los materiales y equipos se realizan de forma automatizada y manual','V'),(57,'El óxido de etileno es un agente químico con alto poder microbicida','V'),(58,'Los estantes donde se almacena material, son de uso exclusivo para material estéril','V'),(59,'Los artículos pierden su esterilidad cuando el empaque perdió su indemnidad.','V'),(60,'Solo I.','0'),(61,'Solo III.','0'),(62,'Solo I y II.','0'),(63,'Solo II y III','1'),(64,'I, II y III.','0'),(65,'Paciente que cursa un cuadro infeccioso al día 10 de hospitalización. La incubación del cuadro es de 7 días.','0'),(66,'Infección en un recién nacido de bajo peso al día 5 de hospitalización.','0'),(67,'Colonización con microorganismo multiresistente en paciente hospitalizado.','1'),(68,'Infección de un implante traumatológico en un paciente de alta reciente.','0'),(69,'Personal de salud infectado por virus Hanta contraído al interior del recinto hospitalario.','0'),(70,'Solo I.','0'),(71,'Solo II.','0'),(72,'Solo I y II.','1'),(73,'Solo I y III.','0'),(74,'I, II y III.','0'),(75,'I, III, V y VI.','0'),(76,'II, III, IV y VI.','0'),(77,'I, II, IV, V y VI.','0'),(78,'I, III, IV, V y VI.','1'),(79,'Solo I.','0'),(80,'Solo III.','0'),(81,'Solo II y III.','0'),(82,'Solo I y III.','0'),(83,'I, II y III.','1'),(84,'La eliminación de desechos hospitalarios.','0'),(85,'Las superficies ambientales en general.','0'),(86,'Los factores de riesgo del huésped.','0'),(87,'Los procedimientos de atención clínica.','1'),(88,'No tienen mayor responsabilidad, ya que las IAAS son impredecibles y no evitables.','0'),(89,'Agente.','0'),(90,'Puerta de salida.','0'),(91,'Vías de transmisión.','0'),(92,'Puerta de entrada.','1'),(93,'Hospedero susceptible.','0'),(94,'Reservorio.','0'),(95,'Puerta de salida.','0'),(96,'Vías de transmisión.','1'),(97,'Puerta de entrada.','0'),(98,'Hospedero susceptible.','0'),(99,'Reservorio.','0'),(100,'Vías de transmisión.','0'),(101,'Agente infeccioso.','0'),(102,'Puerta de entrada','0'),(103,'Hospedero susceptible.','1'),(104,'La edad del paciente.','0'),(105,'Sexo femenino.','0'),(106,'Uso de catéter urinario.','1'),(107,'La realización de cistoscopías.','0'),(108,'La hospitalización en una unidad de pacientes críticos.','0'),(109,'Solo I.','0'),(110,'I y II.','0'),(111,'II y III.','0'),(112,'I y III.','0'),(113,'I, II y III','1'),(114,'Reflujo de condensado en el sistema de tuberías del ventilador hacia la vía aérea.','0'),(115,'Falla de los filtros HEPA del sistema de aire de las unidades de cuidados intensivos.','1'),(116,'Aspiración de microorganismos de la orofaringe colonizada o de la colonización del “cuff “del tubo endotraqueal.','0'),(117,'Contaminación de la sonda de aspiración utilizada en el manejo de secreciones bronquiales.','0'),(118,'Contaminación por arrastre durante el procedimiento de intubación endotraqueal.','0'),(119,'La basura de los centros asistenciales presenta un mayor riesgo sanitario para la comunidad que la generada en desechos domiciliarios.','0'),(120,'Las principales actividades de prevención de infecciones por accidentes cortopunzantes con desechos clínicos deben desarrollarse en la etapa de manipulación de la basura fuera del establecimiento de salud.','0'),(121,'Los desechos hospitalarios son especialmente peligrosos pues contienen sangre de pacientes de alto riesgo de portar patógenos virales, a diferencia de los desechos domésticos.','0'),(122,'La incineración de deshechos sanitarios es la práctica más efectiva en la prevención de infecciones en la población general.','0'),(123,'El riesgo de seroconversión post exposición a accidente ocupacional con un fluido contaminado es mayor para virus hepatitis B y virus hepatitis C que para VIH.','1'),(124,'Solo I','0'),(125,'Solo II y III','0'),(126,'Solo III y IV','0'),(127,'Solo I y II','1'),(128,'I, II y III','0'),(129,'Habitación individual o compartida con personas con la misma infección','V'),(130,'Separación de las camas de más de un metro','F'),(131,'Uso de mascarilla de tipo quirúrgica','F'),(132,'Uso de mascarilla Nª95','V'),(133,'Evitar que la punta de las agujas apunte al cuerpo del personal.','V'),(134,'Recapsular agujas inmediatamente después de su uso.','F'),(135,'Desinfectar material cortopunzante antes de su eliminación.','F'),(136,'Eliminar agujas sin recapsular en recipientes impermeables resistentes a punciones.','V'),(137,'Doblar o quebrar material cortopunzante antes de su eliminación.','F'),(138,'Mantener el recipiente para desecho de agujas inmediatamente contiguo al sitio de uso de estas.','V'),(139,'Mantener el sistema de drenaje urinario en circuito cerrado.','V'),(140,'Mantener la sonda Foley con fijación efectiva que evite desplazamientos del catéter.','V'),(141,'Durante la medición de orina, la válvula de la bolsa recolectora no debe tomar contacto con el receptáculo. ','V'),(142,'Mantener un flujo de orina sin obstrucción.','V'),(143,'Posición del paciente entre 30 - 45 grados','V'),(144,'Aseo bucal con antiséptico.','V'),(145,'Mantener circuito cerrado.','V'),(146,'Evaluar estado general y piel del niño.','V'),(147,'Evaluar exámenes preoperatorios recientes (Que descarten posible foco distal)','V'),(148,'No rasurar cuero cabelludo-Preparación cutánea ','V'),(149,'Personal entrenado (cirujano con experiencia) ','V'),(150,'Limitar personal dentro del pabellón. ','V'),(151,'Aplicar profilaxis antimicrobiana antes de la incisión.','V'),(152,'Aseo preoperatorio de la piel. ','V'),(153,'Mantener 7-8 personas por pabellón.','V'),(154,'Lavado quirúrgico de manos.','V'),(155,'Utilizar material estéril.','V'),(156,'Realizar curación previa al alta.','V'),(157,'El lavado de los materiales y equipos se realiza de forma automatizada y manual','V'),(158,'El Óxido de Etileno es un agente químico con alto poder microbicida','V'),(159,'Los estantes donde se almacena material, son de uso exclusivo para material estéril ','V'),(160,'Los artículos pierden su esterilidad cuando el empaque perdió su indemnidad.','V'),(161,'Los materiales estériles deben estar ordenados por fecha de vencimiento.','V');
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
INSERT INTO `respuesta_pregunta` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(2,10),(3,11),(3,12),(3,13),(3,14),(3,15),(4,16),(4,17),(4,18),(4,19),(5,20),(5,21),(5,22),(5,23),(6,24),(6,25),(6,26),(6,27),(6,28),(6,29),(7,30),(7,31),(7,32),(7,33),(7,34),(8,35),(8,36),(8,37),(8,38),(8,39),(9,40),(9,41),(9,42),(9,43),(9,44),(9,45),(9,46),(10,47),(10,48),(10,49),(10,50),(10,51),(11,52),(11,53),(11,54),(11,55),(12,56),(12,57),(12,58),(12,59),(13,60),(13,61),(13,62),(13,63),(13,64),(14,65),(14,66),(14,67),(14,68),(14,69),(15,70),(15,71),(15,72),(15,73),(15,74),(16,75),(16,76),(16,77),(16,78),(17,79),(17,80),(17,81),(17,82),(17,83),(18,84),(18,85),(18,86),(18,87),(18,88),(19,89),(19,90),(19,91),(19,92),(19,93),(20,94),(20,95),(20,96),(20,97),(20,98),(21,99),(21,100),(21,101),(21,102),(21,103),(22,104),(22,105),(22,106),(22,107),(22,108),(23,109),(23,110),(23,111),(23,112),(23,113),(24,114),(24,115),(24,116),(24,117),(24,118),(25,119),(25,120),(25,121),(25,122),(25,123),(26,124),(26,125),(26,126),(26,127),(26,128),(27,129),(27,130),(27,131),(27,132),(28,133),(28,134),(28,135),(28,136),(28,137),(28,138),(29,139),(29,140),(29,141),(29,142),(30,143),(30,144),(30,145),(31,146),(31,147),(31,148),(31,149),(31,150),(31,151),(32,152),(32,153),(32,154),(32,155),(32,156),(33,157),(33,158),(33,159),(33,160),(33,161);
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
  `UNIDAD` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  PRIMARY KEY (`RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('103910056','BRISA','CONTRERAS','RIOS','TENS','ESTERILIZACIÓN','10056'),('123630327','MARTA','LAGOS','MORA','TENS','ESTERILIZACIÓN','30327'),('14174626K','FRANCISCO JAVIER','HUIRCALEO','CASANOVA','INGENIERO','INFORMATICA','4626K'),('144947185','JOHANNA','ESPINOZA','MATTA','TENS','ALIMENTACIÓN','47185'),('150694019','JONATHAN','URRUTIA','LORENS','INGENIERO','SD OPERACIONES','94019'),('160767707','ROCIO','ZÚÑIGA','ESTRADA','TENS','EMERGENCIA','67707'),('162797557','FELIPE','FUENTES','MUÑOZ','TENS','RAYOS','97557'),('16666456K','CECILIA','FUENTES','CORTESI','TENS','NC ADULTO','6456K'),('169201889','ELÍAS','DIAZ','TOLOZA','TENS','ESTERILIZACIÓN','01889'),('173789769','FABIÁN','AULESTIA','MUÑOZ','TENS','ESTERILIZACIÓN','89769'),('175066292','KARLA','TAPIA','SAAVEDRA','TENS','NC ADULTO','66292'),('17840492K','JERRÍN','URRA','FUENTES','TENS','NC ADULTO','0492K'),('178806181','ESTANISLAO','OJEDA','PÉREZ','TENS','NC ADULTO','06181'),('179570289','DIEGO','MIRANDA','DIAZ','KINESIOLOGO','KINESIOLOGÍA','70289'),('179717506','PAMELA','RIVEROS','RIVEROS','TENS','NC ADULTO','17506'),('180605428','GONZALO','SANDOVAL','MIRANDA','TENS','ESTERILIZACIÓN','05428'),('185695379','CONSUELO','ALVAREZ','CASTILLO','TEC. MÉDICO','PABELLÓN','95379'),('65755564','CARLOS','MATURANA','MUÑOZ','TENS','NC ADULTO','55564'),('7106493K','MARIA','SALAS','SALGADO','TENS','RAYOS','6493K'),('82854495','ALEXANDRA','SUAZO','MONTECINOS','TENS','NC ADULTO','54495'),('90075225','LUIS ALBERTO','MARTINEZ','MENARES','TENS','RAYOS','75225');
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
INSERT INTO `usuario_prueba` VALUES ('103910056',1,32,5.21429,'2017-12-22 08:41:41','2017-12-22 08:41:41'),('123630327',1,38,6.28571,'2017-12-24 23:24:08','2017-12-24 23:24:08'),('14174626K',1,15,3.19048,'2017-12-26 11:10:08','2017-12-26 11:10:08'),('14174626K',2,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('144947185',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('150694019',2,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('160767707',1,35,5.75,'2017-12-21 09:43:08','2017-12-21 09:43:08'),('162797557',1,28,4.5,'2017-12-26 10:02:38','2017-12-26 10:02:38'),('16666456K',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('169201889',1,33,5.39286,'2017-12-24 12:50:03','2017-12-24 12:50:03'),('173789769',1,31,5.03571,'2017-12-22 17:49:49','2017-12-22 17:49:49'),('175066292',1,39,6.46429,'2017-12-23 00:49:43','2017-12-23 00:49:43'),('17840492K',1,29,4.67857,'2017-12-23 01:38:21','2017-12-23 01:38:21'),('178806181',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('179570289',2,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('179717506',1,36,5.92857,'2017-12-23 01:21:37','2017-12-23 01:21:37'),('180605428',1,32,5.21429,'2017-12-23 20:26:49','2017-12-23 20:26:49'),('185695379',1,39,6.46429,'2017-12-26 09:49:37','2017-12-26 09:49:37'),('65755564',1,32,5.21429,'2017-12-23 21:56:17','2017-12-23 21:56:17'),('7106493K',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('82854495',1,36,5.92857,'2017-12-26 01:41:35','2017-12-26 01:41:35'),('90075225',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00');
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
INSERT INTO `usuario_respuesta` VALUES ('103910056',1,4,NULL,'2017-12-22 08:46:53'),('103910056',2,10,NULL,'2017-12-22 08:49:45'),('103910056',3,11,NULL,'2017-12-22 08:54:01'),('103910056',4,19,NULL,'2017-12-22 09:01:12'),('103910056',5,20,'V','2017-12-22 09:05:24'),('103910056',5,21,'V','2017-12-22 09:05:33'),('103910056',5,22,'F','2017-12-22 09:05:49'),('103910056',5,23,'V','2017-12-22 09:05:53'),('103910056',6,24,'V','2017-12-22 09:02:42'),('103910056',6,25,'F','2017-12-22 09:03:03'),('103910056',6,26,'F','2017-12-22 09:03:11'),('103910056',6,27,'V','2017-12-22 09:03:20'),('103910056',6,28,'F','2017-12-22 09:03:32'),('103910056',6,29,'V','2017-12-22 09:03:41'),('103910056',7,34,NULL,'2017-12-22 08:45:41'),('103910056',8,37,NULL,'2017-12-22 08:52:35'),('103910056',9,40,'V','2017-12-22 09:06:37'),('103910056',9,41,'F','2017-12-22 09:10:54'),('103910056',9,42,'V','2017-12-22 09:07:08'),('103910056',9,43,'F','2017-12-22 09:07:19'),('103910056',9,44,'V','2017-12-22 09:07:24'),('103910056',9,45,'V','2017-12-22 09:07:27'),('103910056',9,46,'F','2017-12-22 09:07:33'),('103910056',10,47,'V','2017-12-22 09:04:27'),('103910056',10,48,'F','2017-12-22 09:04:34'),('103910056',10,49,'V','2017-12-22 09:04:42'),('103910056',10,50,'V','2017-12-22 09:04:46'),('103910056',10,51,'V','2017-12-22 09:04:52'),('103910056',11,52,'F','2017-12-22 09:14:50'),('103910056',11,53,'F','2017-12-22 09:15:01'),('103910056',11,54,'V','2017-12-22 09:15:12'),('103910056',11,55,'V','2017-12-22 09:16:39'),('103910056',12,56,'V','2017-12-22 09:11:38'),('103910056',12,57,'V','2017-12-22 09:11:44'),('103910056',12,58,'V','2017-12-22 09:11:50'),('103910056',12,59,'V','2017-12-22 09:12:08'),('123630327',1,4,NULL,'2017-12-25 00:14:52'),('123630327',2,7,NULL,'2017-12-24 23:51:07'),('123630327',3,13,NULL,'2017-12-24 23:27:28'),('123630327',4,19,NULL,'2017-12-24 23:44:12'),('123630327',5,20,'V','2017-12-24 23:53:01'),('123630327',5,21,'V','2017-12-24 23:53:10'),('123630327',5,22,'V','2017-12-24 23:54:52'),('123630327',5,23,'F','2017-12-24 23:55:30'),('123630327',6,24,'V','2017-12-24 23:58:13'),('123630327',6,25,'F','2017-12-24 23:58:22'),('123630327',6,26,'F','2017-12-24 23:58:35'),('123630327',6,27,'V','2017-12-24 23:59:01'),('123630327',6,28,'F','2017-12-24 23:59:12'),('123630327',6,29,'V','2017-12-24 23:59:21'),('123630327',7,34,NULL,'2017-12-24 23:48:02'),('123630327',8,37,NULL,'2017-12-24 23:33:08'),('123630327',9,40,'V','2017-12-25 00:02:10'),('123630327',9,41,'V','2017-12-25 00:02:20'),('123630327',9,42,'V','2017-12-25 00:02:27'),('123630327',9,43,'V','2017-12-25 00:02:40'),('123630327',9,44,'V','2017-12-25 00:02:45'),('123630327',9,45,'V','2017-12-25 00:02:52'),('123630327',9,46,'F','2017-12-25 00:04:14'),('123630327',10,47,'V','2017-12-24 23:55:44'),('123630327',10,48,'F','2017-12-25 00:06:21'),('123630327',10,49,'V','2017-12-24 23:56:22'),('123630327',10,50,'V','2017-12-24 23:57:37'),('123630327',10,51,'V','2017-12-24 23:57:53'),('123630327',11,52,'F','2017-12-25 00:00:26'),('123630327',11,53,'F','2017-12-25 00:00:48'),('123630327',11,54,'V','2017-12-25 00:00:59'),('123630327',11,55,'V','2017-12-25 00:01:06'),('123630327',12,56,'V','2017-12-24 23:51:59'),('123630327',12,57,'V','2017-12-24 23:52:08'),('123630327',12,58,'V','2017-12-24 23:52:35'),('123630327',12,59,'V','2017-12-24 23:52:43'),('14174626K',1,4,NULL,'2017-12-26 11:01:53'),('14174626K',2,8,NULL,'2017-12-26 11:05:59'),('14174626K',3,13,NULL,'2017-12-26 11:10:12'),('14174626K',4,19,NULL,'2017-12-26 11:10:15'),('14174626K',5,20,'V','2017-12-22 15:44:59'),('14174626K',5,21,'V','2017-12-22 15:45:00'),('14174626K',5,22,'V','2017-12-22 15:45:01'),('14174626K',5,23,'F','2017-12-22 15:45:07'),('14174626K',6,24,'V','2017-12-26 11:06:14'),('14174626K',6,25,'V','2017-12-26 11:06:16'),('14174626K',6,26,'V','2017-12-26 11:06:16'),('14174626K',6,27,'V','2017-12-26 11:06:17'),('14174626K',6,28,'V','2017-12-26 11:06:18'),('14174626K',6,29,'V','2017-12-26 11:06:20'),('14174626K',7,33,NULL,'2017-12-26 11:10:17'),('14174626K',7,34,NULL,'2017-12-22 15:24:18'),('14174626K',8,37,NULL,'2017-12-22 15:24:49'),('14174626K',8,38,NULL,'2017-12-26 11:10:18'),('14174626K',9,40,'V','2017-12-21 08:05:47'),('14174626K',9,41,'V','2017-12-22 15:45:43'),('14174626K',9,42,'F','2017-12-21 08:05:48'),('14174626K',9,43,'V','2017-12-22 15:45:45'),('14174626K',9,44,'V','2017-12-22 15:45:46'),('14174626K',9,45,'V','2017-12-22 15:45:47'),('14174626K',9,46,'V','2017-12-22 15:45:48'),('14174626K',10,47,'V','2017-12-26 11:06:21'),('14174626K',10,48,'V','2017-12-22 15:46:04'),('14174626K',10,49,'V','2017-12-22 15:46:05'),('14174626K',10,50,'V','2017-12-22 15:46:06'),('14174626K',10,51,'V','2017-12-22 15:46:07'),('14174626K',11,52,'F','2017-12-22 15:55:46'),('14174626K',11,53,'F','2017-12-22 15:55:47'),('14174626K',11,54,'V','2017-12-22 15:55:48'),('14174626K',11,55,'V','2017-12-22 15:55:49'),('14174626K',12,56,'V','2017-12-26 11:06:08'),('14174626K',12,57,'V','2017-12-26 11:06:10'),('14174626K',12,58,'V','2017-12-26 11:06:11'),('14174626K',12,59,'V','2017-12-26 11:06:13'),('14174626K',13,63,NULL,'2017-12-20 11:21:48'),('14174626K',14,67,NULL,'2017-12-20 11:22:42'),('14174626K',15,72,NULL,'2017-12-20 11:23:23'),('14174626K',16,78,NULL,'2017-12-20 11:24:04'),('14174626K',17,83,NULL,'2017-12-20 11:25:09'),('14174626K',18,87,NULL,'2017-12-20 11:25:52'),('14174626K',19,92,NULL,'2017-12-20 11:29:52'),('14174626K',20,96,NULL,'2017-12-20 11:37:55'),('14174626K',21,103,NULL,'2017-12-20 11:38:46'),('14174626K',22,106,NULL,'2017-12-20 11:39:14'),('14174626K',23,113,NULL,'2017-12-20 11:39:46'),('14174626K',24,115,NULL,'2017-12-20 11:40:24'),('14174626K',25,123,NULL,'2017-12-20 11:41:00'),('14174626K',26,127,NULL,'2017-12-20 11:41:21'),('14174626K',27,129,'V','2017-12-20 11:44:10'),('14174626K',27,130,'F','2017-12-20 11:44:14'),('14174626K',27,131,'F','2017-12-20 11:44:17'),('14174626K',27,132,'V','2017-12-20 11:44:20'),('14174626K',28,133,'V','2017-12-20 11:44:35'),('14174626K',28,134,'F','2017-12-20 11:44:45'),('14174626K',28,135,'F','2017-12-20 11:44:46'),('14174626K',28,136,'V','2017-12-20 11:44:51'),('14174626K',28,137,'F','2017-12-20 11:44:54'),('14174626K',28,138,'V','2017-12-20 11:44:56'),('14174626K',29,139,'V','2017-12-20 11:43:33'),('14174626K',29,140,'V','2017-12-20 11:43:36'),('14174626K',29,141,'V','2017-12-20 11:43:40'),('14174626K',29,142,'V','2017-12-20 11:43:47'),('14174626K',30,143,'V','2017-12-20 11:45:34'),('14174626K',30,144,'V','2017-12-20 11:45:40'),('14174626K',30,145,'V','2017-12-20 11:45:42'),('14174626K',31,146,'V','2017-12-20 11:43:00'),('14174626K',31,147,'V','2017-12-20 11:43:05'),('14174626K',31,148,'V','2017-12-20 11:43:07'),('14174626K',31,149,'V','2017-12-20 11:43:07'),('14174626K',31,150,'V','2017-12-20 11:43:08'),('14174626K',31,151,'V','2017-12-20 11:43:09'),('14174626K',32,152,'V','2017-12-20 11:42:37'),('14174626K',32,153,'V','2017-12-20 11:42:39'),('14174626K',32,154,'V','2017-12-20 11:42:40'),('14174626K',32,155,'V','2017-12-20 11:42:41'),('14174626K',32,156,'V','2017-12-20 11:42:42'),('14174626K',33,157,'V','2017-12-20 11:45:12'),('14174626K',33,158,'V','2017-12-20 11:45:15'),('14174626K',33,159,'V','2017-12-20 11:45:16'),('14174626K',33,160,'V','2017-12-20 11:45:16'),('14174626K',33,161,'V','2017-12-20 11:45:17'),('160767707',1,4,NULL,'2017-12-21 09:47:59'),('160767707',2,10,NULL,'2017-12-21 09:46:02'),('160767707',3,13,NULL,'2017-12-21 09:51:07'),('160767707',4,19,NULL,'2017-12-21 09:50:18'),('160767707',5,20,'V','2017-12-21 09:54:33'),('160767707',5,21,'V','2017-12-21 09:54:35'),('160767707',5,22,'V','2017-12-21 09:54:55'),('160767707',5,23,'F','2017-12-21 09:54:58'),('160767707',6,24,'V','2017-12-21 10:01:12'),('160767707',6,25,'F','2017-12-21 10:01:20'),('160767707',6,26,'V','2017-12-21 10:01:23'),('160767707',6,27,'V','2017-12-21 10:01:28'),('160767707',6,28,'F','2017-12-21 10:01:33'),('160767707',6,29,'V','2017-12-21 10:01:41'),('160767707',7,34,NULL,'2017-12-21 09:46:58'),('160767707',8,38,NULL,'2017-12-21 09:46:41'),('160767707',9,40,'V','2017-12-21 09:56:11'),('160767707',9,41,'V','2017-12-21 09:56:15'),('160767707',9,42,'V','2017-12-21 09:56:17'),('160767707',9,43,'F','2017-12-21 09:57:53'),('160767707',9,44,'V','2017-12-21 09:57:54'),('160767707',9,45,'V','2017-12-21 09:57:57'),('160767707',9,46,'F','2017-12-21 09:59:02'),('160767707',10,47,'V','2017-12-21 09:59:07'),('160767707',10,48,'V','2017-12-21 09:59:12'),('160767707',10,49,'V','2017-12-21 09:59:16'),('160767707',10,50,'V','2017-12-21 09:59:26'),('160767707',10,51,'V','2017-12-21 09:59:28'),('160767707',11,52,'F','2017-12-21 09:52:30'),('160767707',11,53,'F','2017-12-21 09:52:36'),('160767707',11,54,'V','2017-12-21 09:52:39'),('160767707',11,55,'V','2017-12-21 09:53:28'),('160767707',12,56,'V','2017-12-21 09:59:35'),('160767707',12,57,'V','2017-12-21 10:00:17'),('160767707',12,58,'V','2017-12-21 10:00:56'),('160767707',12,59,'V','2017-12-21 10:01:02'),('162797557',1,4,NULL,'2017-12-26 10:07:17'),('162797557',2,10,NULL,'2017-12-26 10:04:10'),('162797557',3,11,NULL,'2017-12-26 10:09:18'),('162797557',4,18,NULL,'2017-12-26 10:05:50'),('162797557',5,20,'V','2017-12-26 10:12:00'),('162797557',5,21,'V','2017-12-26 10:12:03'),('162797557',5,22,'V','2017-12-26 10:12:04'),('162797557',5,23,'V','2017-12-26 10:12:10'),('162797557',6,24,'V','2017-12-26 10:13:10'),('162797557',6,25,'F','2017-12-26 10:13:12'),('162797557',6,26,'V','2017-12-26 10:13:25'),('162797557',6,27,'V','2017-12-26 10:13:38'),('162797557',6,28,'F','2017-12-26 10:13:36'),('162797557',6,29,'V','2017-12-26 10:13:41'),('162797557',7,33,NULL,'2017-12-26 10:10:34'),('162797557',8,37,NULL,'2017-12-26 10:08:16'),('162797557',9,40,'V','2017-12-26 10:12:44'),('162797557',9,41,'V','2017-12-26 10:12:47'),('162797557',9,42,'V','2017-12-26 10:12:50'),('162797557',9,43,'F','2017-12-26 10:12:54'),('162797557',9,44,'V','2017-12-26 10:12:56'),('162797557',9,45,'V','2017-12-26 10:12:58'),('162797557',9,46,'V','2017-12-26 10:13:01'),('162797557',10,47,'V','2017-12-26 10:11:16'),('162797557',10,48,'F','2017-12-26 10:11:32'),('162797557',10,49,'V','2017-12-26 10:11:38'),('162797557',10,50,'V','2017-12-26 10:11:48'),('162797557',10,51,'V','2017-12-26 10:11:52'),('162797557',11,52,'V','2017-12-26 10:12:23'),('162797557',11,53,'V','2017-12-26 10:12:25'),('162797557',11,54,'V','2017-12-26 10:12:29'),('162797557',11,55,'V','2017-12-26 10:12:35'),('162797557',12,56,'V','2017-12-26 10:13:48'),('162797557',12,57,'V','2017-12-26 10:13:52'),('162797557',12,58,'V','2017-12-26 10:13:56'),('162797557',12,59,'V','2017-12-26 10:13:59'),('169201889',1,5,NULL,'2017-12-24 13:03:58'),('169201889',2,9,NULL,'2017-12-24 12:52:51'),('169201889',3,15,NULL,'2017-12-24 13:07:04'),('169201889',4,19,NULL,'2017-12-24 12:55:20'),('169201889',5,20,'V','2017-12-24 12:57:32'),('169201889',5,21,'V','2017-12-24 12:57:14'),('169201889',5,22,'F','2017-12-24 12:57:22'),('169201889',5,23,'V','2017-12-24 12:57:24'),('169201889',6,24,'V','2017-12-24 13:00:40'),('169201889',6,25,'F','2017-12-24 13:00:44'),('169201889',6,26,'F','2017-12-24 13:00:50'),('169201889',6,27,'V','2017-12-24 13:00:57'),('169201889',6,28,'F','2017-12-24 13:01:02'),('169201889',6,29,'V','2017-12-24 13:01:12'),('169201889',7,34,NULL,'2017-12-24 12:53:37'),('169201889',8,37,NULL,'2017-12-24 12:51:35'),('169201889',9,40,'V','2017-12-24 12:57:48'),('169201889',9,41,'V','2017-12-24 12:57:50'),('169201889',9,42,'V','2017-12-24 12:57:54'),('169201889',9,43,'V','2017-12-24 12:58:04'),('169201889',9,44,'V','2017-12-24 12:58:05'),('169201889',9,45,'V','2017-12-24 12:58:10'),('169201889',9,46,'V','2017-12-24 12:58:12'),('169201889',10,47,'V','2017-12-24 12:58:29'),('169201889',10,48,'V','2017-12-24 12:59:00'),('169201889',10,49,'V','2017-12-24 12:58:38'),('169201889',10,50,'V','2017-12-24 12:58:42'),('169201889',10,51,'V','2017-12-24 12:58:47'),('169201889',11,52,'V','2017-12-24 12:59:47'),('169201889',11,53,'F','2017-12-24 13:00:21'),('169201889',11,54,'V','2017-12-24 12:59:58'),('169201889',11,55,'V','2017-12-24 13:00:17'),('169201889',12,56,'V','2017-12-24 12:59:08'),('169201889',12,57,'V','2017-12-24 12:59:20'),('169201889',12,58,'V','2017-12-24 12:59:31'),('169201889',12,59,'V','2017-12-24 12:59:37'),('173789769',1,4,NULL,'2017-12-22 17:56:05'),('173789769',2,10,NULL,'2017-12-22 17:55:00'),('173789769',3,13,NULL,'2017-12-22 18:00:17'),('173789769',4,19,NULL,'2017-12-22 18:03:29'),('173789769',5,20,'V','2017-12-22 18:13:07'),('173789769',5,21,'V','2017-12-22 18:11:03'),('173789769',5,22,'F','2017-12-22 18:11:00'),('173789769',5,23,'V','2017-12-22 18:10:48'),('173789769',6,24,'V','2017-12-22 18:19:47'),('173789769',6,25,'F','2017-12-22 18:20:29'),('173789769',6,26,'F','2017-12-22 18:20:33'),('173789769',6,27,'V','2017-12-22 18:20:41'),('173789769',6,28,'F','2017-12-22 18:20:47'),('173789769',6,29,'V','2017-12-22 18:20:57'),('173789769',7,34,NULL,'2017-12-22 17:52:11'),('173789769',8,37,NULL,'2017-12-22 18:06:01'),('173789769',9,40,'V','2017-12-22 18:09:09'),('173789769',9,41,'V','2017-12-22 18:09:13'),('173789769',9,42,'V','2017-12-22 18:09:16'),('173789769',9,43,'F','2017-12-22 18:09:25'),('173789769',9,44,'V','2017-12-22 18:09:38'),('173789769',9,45,'V','2017-12-22 18:10:00'),('173789769',9,46,'F','2017-12-22 18:10:03'),('173789769',10,47,'V','2017-12-22 18:18:21'),('173789769',10,48,'F','2017-12-22 18:19:15'),('173789769',10,49,'V','2017-12-22 18:19:19'),('173789769',10,50,'V','2017-12-22 18:19:22'),('173789769',10,51,'V','2017-12-22 18:19:27'),('173789769',11,52,'V','2017-12-22 18:22:47'),('173789769',11,53,'V','2017-12-22 18:24:41'),('173789769',11,54,'F','2017-12-22 18:24:11'),('173789769',11,55,'F','2017-12-22 18:23:23'),('173789769',12,56,'V','2017-12-22 18:14:08'),('173789769',12,57,'V','2017-12-22 18:14:37'),('173789769',12,58,'V','2017-12-22 18:14:46'),('173789769',12,59,'V','2017-12-22 18:15:27'),('175066292',1,4,NULL,'2017-12-23 00:58:49'),('175066292',2,8,NULL,'2017-12-23 00:56:50'),('175066292',3,13,NULL,'2017-12-23 00:55:32'),('175066292',4,19,NULL,'2017-12-23 00:55:04'),('175066292',5,20,'V','2017-12-23 01:03:57'),('175066292',5,21,'V','2017-12-23 01:04:06'),('175066292',5,22,'V','2017-12-23 01:04:10'),('175066292',5,23,'F','2017-12-23 01:04:17'),('175066292',6,24,'V','2017-12-23 01:05:28'),('175066292',6,25,'F','2017-12-23 01:05:33'),('175066292',6,26,'F','2017-12-23 01:05:37'),('175066292',6,27,'V','2017-12-23 01:05:43'),('175066292',6,28,'F','2017-12-23 01:05:47'),('175066292',6,29,'V','2017-12-23 01:05:57'),('175066292',7,34,NULL,'2017-12-23 01:18:18'),('175066292',8,37,NULL,'2017-12-23 00:52:54'),('175066292',9,40,'V','2017-12-23 01:01:48'),('175066292',9,41,'V','2017-12-23 01:01:52'),('175066292',9,42,'V','2017-12-23 01:01:55'),('175066292',9,43,'F','2017-12-23 01:02:00'),('175066292',9,44,'V','2017-12-23 01:02:03'),('175066292',9,45,'V','2017-12-23 01:02:05'),('175066292',9,46,'F','2017-12-23 01:02:09'),('175066292',10,47,'V','2017-12-23 01:02:29'),('175066292',10,48,'F','2017-12-23 01:02:57'),('175066292',10,49,'V','2017-12-23 01:03:04'),('175066292',10,50,'V','2017-12-23 01:03:06'),('175066292',10,51,'V','2017-12-23 01:03:10'),('175066292',11,52,'F','2017-12-23 00:59:48'),('175066292',11,53,'F','2017-12-23 01:01:22'),('175066292',11,54,'V','2017-12-23 01:01:06'),('175066292',11,55,'V','2017-12-23 00:59:25'),('175066292',12,56,'V','2017-12-23 01:04:39'),('175066292',12,57,'V','2017-12-23 01:04:52'),('175066292',12,58,'V','2017-12-23 01:05:04'),('175066292',12,59,'V','2017-12-23 01:05:10'),('17840492K',1,4,NULL,'2017-12-23 01:52:08'),('17840492K',2,10,NULL,'2017-12-23 01:49:31'),('17840492K',3,15,NULL,'2017-12-23 02:04:12'),('17840492K',4,18,NULL,'2017-12-23 01:47:10'),('17840492K',5,20,'V','2017-12-23 02:11:50'),('17840492K',5,21,'V','2017-12-23 02:10:05'),('17840492K',5,22,'F','2017-12-23 02:10:27'),('17840492K',5,23,'V','2017-12-23 02:10:25'),('17840492K',6,24,'V','2017-12-23 01:57:11'),('17840492K',6,25,'V','2017-12-23 01:57:19'),('17840492K',6,26,'F','2017-12-23 01:57:41'),('17840492K',6,27,'V','2017-12-23 01:57:46'),('17840492K',6,28,'F','2017-12-23 01:57:51'),('17840492K',6,29,'V','2017-12-23 01:58:08'),('17840492K',7,34,NULL,'2017-12-23 01:56:30'),('17840492K',8,37,NULL,'2017-12-23 01:41:22'),('17840492K',9,40,'V','2017-12-23 02:16:24'),('17840492K',9,41,'V','2017-12-23 02:16:29'),('17840492K',9,42,'V','2017-12-23 02:16:34'),('17840492K',9,43,'F','2017-12-23 02:16:42'),('17840492K',9,44,'V','2017-12-23 02:16:44'),('17840492K',9,45,'V','2017-12-23 02:16:47'),('17840492K',9,46,'F','2017-12-23 02:16:51'),('17840492K',10,47,'V','2017-12-23 01:58:21'),('17840492K',10,48,'V','2017-12-23 01:58:48'),('17840492K',10,49,'V','2017-12-23 01:58:58'),('17840492K',10,50,'V','2017-12-23 01:59:07'),('17840492K',10,51,'V','2017-12-23 01:59:40'),('17840492K',11,52,'V','2017-12-23 02:20:04'),('17840492K',11,53,'V','2017-12-23 02:20:18'),('17840492K',11,54,'V','2017-12-23 02:20:37'),('17840492K',11,55,'V','2017-12-23 02:21:28'),('17840492K',12,56,'V','2017-12-23 02:12:40'),('17840492K',12,57,'V','2017-12-23 02:13:47'),('17840492K',12,58,'V','2017-12-23 02:14:01'),('17840492K',12,59,'V','2017-12-23 02:14:56'),('179717506',1,4,NULL,'2017-12-23 01:22:01'),('179717506',2,8,NULL,'2017-12-23 01:24:16'),('179717506',3,13,NULL,'2017-12-23 01:24:10'),('179717506',4,18,NULL,'2017-12-23 01:21:58'),('179717506',5,20,'F','2017-12-23 01:26:30'),('179717506',5,21,'V','2017-12-23 01:26:32'),('179717506',5,22,'V','2017-12-23 01:26:34'),('179717506',5,23,'F','2017-12-23 01:26:36'),('179717506',6,24,'V','2017-12-23 01:24:44'),('179717506',6,25,'F','2017-12-23 01:24:47'),('179717506',6,26,'F','2017-12-23 01:24:50'),('179717506',6,27,'V','2017-12-23 01:24:55'),('179717506',6,28,'F','2017-12-23 01:24:59'),('179717506',6,29,'V','2017-12-23 01:25:03'),('179717506',7,34,NULL,'2017-12-23 01:23:50'),('179717506',8,37,NULL,'2017-12-23 01:22:04'),('179717506',9,40,'V','2017-12-23 01:25:59'),('179717506',9,41,'V','2017-12-23 01:26:01'),('179717506',9,42,'V','2017-12-23 01:26:05'),('179717506',9,43,'F','2017-12-23 01:26:07'),('179717506',9,44,'V','2017-12-23 01:26:10'),('179717506',9,45,'V','2017-12-23 01:26:19'),('179717506',9,46,'F','2017-12-23 01:26:22'),('179717506',10,47,'V','2017-12-23 01:24:29'),('179717506',10,48,'F','2017-12-23 01:22:19'),('179717506',10,49,'V','2017-12-23 01:22:20'),('179717506',10,50,'V','2017-12-23 01:22:22'),('179717506',10,51,'V','2017-12-23 01:22:31'),('179717506',11,52,'F','2017-12-23 01:25:09'),('179717506',11,53,'F','2017-12-23 01:25:13'),('179717506',11,54,'V','2017-12-23 01:25:16'),('179717506',11,55,'V','2017-12-23 01:25:19'),('179717506',12,56,'V','2017-12-23 01:25:28'),('179717506',12,57,'V','2017-12-23 01:25:42'),('179717506',12,58,'V','2017-12-23 01:25:48'),('179717506',12,59,'V','2017-12-23 01:25:51'),('180605428',1,4,NULL,'2017-12-23 20:37:08'),('180605428',2,10,NULL,'2017-12-23 20:34:50'),('180605428',3,13,NULL,'2017-12-23 21:01:24'),('180605428',4,19,NULL,'2017-12-23 20:36:50'),('180605428',5,20,'V','2017-12-23 20:54:18'),('180605428',5,21,'V','2017-12-23 20:54:25'),('180605428',5,22,'F','2017-12-23 20:54:39'),('180605428',5,23,'V','2017-12-23 20:54:44'),('180605428',6,24,'V','2017-12-23 20:50:01'),('180605428',6,25,'F','2017-12-23 20:50:07'),('180605428',6,26,'F','2017-12-23 20:50:24'),('180605428',6,27,'V','2017-12-23 20:50:42'),('180605428',6,28,'F','2017-12-23 20:50:52'),('180605428',6,29,'V','2017-12-23 20:51:06'),('180605428',7,33,NULL,'2017-12-23 20:30:52'),('180605428',8,37,NULL,'2017-12-23 20:30:01'),('180605428',9,40,'V','2017-12-23 20:55:12'),('180605428',9,41,'F','2017-12-23 20:55:37'),('180605428',9,42,'V','2017-12-23 20:55:23'),('180605428',9,43,'F','2017-12-23 20:55:56'),('180605428',9,44,'V','2017-12-23 20:56:02'),('180605428',9,45,'V','2017-12-23 20:56:05'),('180605428',9,46,'F','2017-12-23 20:56:11'),('180605428',10,47,'V','2017-12-23 20:53:13'),('180605428',10,48,'V','2017-12-23 20:53:23'),('180605428',10,49,'V','2017-12-23 20:53:27'),('180605428',10,50,'V','2017-12-23 20:53:31'),('180605428',10,51,'V','2017-12-23 20:53:43'),('180605428',11,52,'F','2017-12-23 20:46:07'),('180605428',11,53,'F','2017-12-23 20:46:34'),('180605428',11,54,'V','2017-12-23 20:47:37'),('180605428',11,55,'V','2017-12-23 20:49:08'),('180605428',12,56,'V','2017-12-23 20:51:19'),('180605428',12,57,'F','2017-12-23 20:52:40'),('180605428',12,58,'V','2017-12-23 20:52:48'),('180605428',12,59,'V','2017-12-23 20:52:57'),('185695379',1,4,NULL,'2017-12-26 09:51:36'),('185695379',2,8,NULL,'2017-12-26 09:52:12'),('185695379',3,11,NULL,'2017-12-26 09:51:57'),('185695379',4,19,NULL,'2017-12-26 09:51:13'),('185695379',5,20,'V','2017-12-26 09:59:44'),('185695379',5,21,'V','2017-12-26 09:59:55'),('185695379',5,22,'V','2017-12-26 10:00:07'),('185695379',5,23,'F','2017-12-26 10:00:09'),('185695379',6,24,'V','2017-12-26 09:53:49'),('185695379',6,25,'F','2017-12-26 09:53:55'),('185695379',6,26,'F','2017-12-26 09:54:26'),('185695379',6,27,'V','2017-12-26 09:54:37'),('185695379',6,28,'F','2017-12-26 09:54:44'),('185695379',6,29,'V','2017-12-26 09:54:52'),('185695379',7,34,NULL,'2017-12-26 09:53:27'),('185695379',8,37,NULL,'2017-12-26 09:52:43'),('185695379',9,40,'V','2017-12-26 09:57:09'),('185695379',9,41,'V','2017-12-26 09:57:14'),('185695379',9,42,'V','2017-12-26 09:57:16'),('185695379',9,43,'F','2017-12-26 09:57:29'),('185695379',9,44,'V','2017-12-26 09:57:31'),('185695379',9,45,'V','2017-12-26 09:57:33'),('185695379',9,46,'V','2017-12-26 09:57:35'),('185695379',10,47,'V','2017-12-26 09:58:59'),('185695379',10,48,'V','2017-12-26 09:59:04'),('185695379',10,49,'V','2017-12-26 09:59:06'),('185695379',10,50,'V','2017-12-26 09:59:12'),('185695379',10,51,'V','2017-12-26 09:59:16'),('185695379',11,52,'F','2017-12-26 09:55:17'),('185695379',11,53,'F','2017-12-26 09:55:35'),('185695379',11,54,'V','2017-12-26 09:55:40'),('185695379',11,55,'V','2017-12-26 09:56:06'),('185695379',12,56,'V','2017-12-26 09:56:20'),('185695379',12,57,'V','2017-12-26 09:56:51'),('185695379',12,58,'V','2017-12-26 09:56:54'),('185695379',12,59,'V','2017-12-26 09:56:57'),('65755564',1,4,NULL,'2017-12-23 22:06:04'),('65755564',2,10,NULL,'2017-12-23 22:18:45'),('65755564',3,13,NULL,'2017-12-23 22:10:10'),('65755564',4,19,NULL,'2017-12-23 22:14:49'),('65755564',5,20,'V','2017-12-23 22:33:44'),('65755564',5,21,'V','2017-12-23 22:33:49'),('65755564',5,22,'F','2017-12-23 22:34:02'),('65755564',5,23,'V','2017-12-23 22:34:07'),('65755564',6,24,'V','2017-12-23 22:35:49'),('65755564',6,25,'F','2017-12-23 22:35:53'),('65755564',6,26,'F','2017-12-23 22:35:57'),('65755564',6,27,'V','2017-12-23 22:36:03'),('65755564',6,28,'F','2017-12-23 22:36:08'),('65755564',6,29,'V','2017-12-23 22:36:18'),('65755564',7,32,NULL,'2017-12-23 22:15:38'),('65755564',8,37,NULL,'2017-12-23 22:01:34'),('65755564',9,40,'V','2017-12-23 22:34:17'),('65755564',9,41,'F','2017-12-23 22:34:22'),('65755564',9,42,'V','2017-12-23 22:34:26'),('65755564',9,43,'F','2017-12-23 22:34:33'),('65755564',9,44,'V','2017-12-23 22:34:37'),('65755564',9,45,'V','2017-12-23 22:34:41'),('65755564',9,46,'F','2017-12-23 22:34:53'),('65755564',10,47,'V','2017-12-23 22:32:17'),('65755564',10,48,'F','2017-12-23 22:32:30'),('65755564',10,49,'V','2017-12-23 22:32:35'),('65755564',10,50,'V','2017-12-23 22:32:39'),('65755564',10,51,'V','2017-12-23 22:32:47'),('65755564',11,52,'F','2017-12-23 22:25:56'),('65755564',11,53,'F','2017-12-23 22:26:12'),('65755564',11,54,'V','2017-12-23 22:39:50'),('65755564',11,55,'V','2017-12-23 22:30:48'),('65755564',12,56,'V','2017-12-23 22:19:22'),('65755564',12,57,'V','2017-12-23 22:22:38'),('65755564',12,58,'V','2017-12-23 22:24:46'),('65755564',12,59,'V','2017-12-23 22:24:57'),('82854495',1,4,NULL,'2017-12-26 01:53:52'),('82854495',2,7,NULL,'2017-12-26 01:57:55'),('82854495',3,13,NULL,'2017-12-26 02:00:43'),('82854495',4,19,NULL,'2017-12-26 02:21:50'),('82854495',5,20,'V','2017-12-26 02:04:55'),('82854495',5,21,'V','2017-12-26 02:04:45'),('82854495',5,22,'F','2017-12-26 02:03:27'),('82854495',5,23,'V','2017-12-26 02:03:22'),('82854495',6,24,'V','2017-12-26 02:17:24'),('82854495',6,25,'F','2017-12-26 02:17:32'),('82854495',6,26,'F','2017-12-26 02:17:40'),('82854495',6,27,'V','2017-12-26 02:17:53'),('82854495',6,28,'F','2017-12-26 02:17:58'),('82854495',6,29,'V','2017-12-26 02:18:09'),('82854495',7,34,NULL,'2017-12-26 02:19:52'),('82854495',8,37,NULL,'2017-12-26 02:02:28'),('82854495',9,40,'V','2017-12-26 02:16:35'),('82854495',9,41,'V','2017-12-26 02:16:39'),('82854495',9,42,'V','2017-12-26 02:16:43'),('82854495',9,43,'F','2017-12-26 02:16:47'),('82854495',9,44,'V','2017-12-26 02:16:52'),('82854495',9,45,'V','2017-12-26 02:16:55'),('82854495',9,46,'F','2017-12-26 02:16:59'),('82854495',10,47,'V','2017-12-26 02:08:25'),('82854495',10,48,'V','2017-12-26 02:11:46'),('82854495',10,49,'V','2017-12-26 02:11:53'),('82854495',10,50,'V','2017-12-26 02:09:24'),('82854495',10,51,'V','2017-12-26 02:09:27'),('82854495',11,52,'F','2017-12-26 02:05:56'),('82854495',11,53,'F','2017-12-26 02:06:02'),('82854495',11,54,'V','2017-12-26 02:07:57'),('82854495',11,55,'V','2017-12-26 02:08:11'),('82854495',12,56,'V','2017-12-26 02:13:06'),('82854495',12,57,'V','2017-12-26 02:16:09'),('82854495',12,58,'V','2017-12-26 02:16:17'),('82854495',12,59,'V','2017-12-26 02:16:23');
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

-- Dump completed on 2017-12-27 16:44:51
