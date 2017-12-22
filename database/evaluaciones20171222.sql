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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'14174626K','Francisco Javier','Casanova','H.','12345');
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
INSERT INTO `usuario_prueba` VALUES ('103910056',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('123630327',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('14174626K',1,40,6.64286,'2017-12-22 15:23:41','2017-12-22 15:23:41'),('14174626K',2,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('144947185',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('150694019',2,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('160767707',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('162797557',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('16666456K',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('169201889',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('173789769',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('175066292',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('17840492K',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('178806181',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('179570289',2,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('179717506',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('180605428',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('185695379',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('65755564',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('7106493K',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('82854495',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00'),('90075225',1,0,0,'1800-01-01 00:00:00','1800-01-01 00:00:00');
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
INSERT INTO `usuario_respuesta` VALUES ('14174626K',1,4,NULL,'2017-12-22 15:24:34'),('14174626K',2,8,NULL,'2017-12-22 15:24:56'),('14174626K',3,13,NULL,'2017-12-22 15:44:35'),('14174626K',4,19,NULL,'2017-12-22 15:24:07'),('14174626K',5,20,'V','2017-12-22 15:44:59'),('14174626K',5,21,'V','2017-12-22 15:45:00'),('14174626K',5,22,'V','2017-12-22 15:45:01'),('14174626K',5,23,'F','2017-12-22 15:45:07'),('14174626K',6,24,'V','2017-12-22 15:45:17'),('14174626K',6,25,'F','2017-12-22 15:45:18'),('14174626K',6,26,'F','2017-12-22 15:45:19'),('14174626K',6,27,'V','2017-12-22 15:45:22'),('14174626K',6,28,'F','2017-12-22 15:45:25'),('14174626K',6,29,'V','2017-12-22 15:45:28'),('14174626K',7,34,NULL,'2017-12-22 15:24:18'),('14174626K',8,37,NULL,'2017-12-22 15:24:49'),('14174626K',9,40,'V','2017-12-22 15:45:42'),('14174626K',9,41,'V','2017-12-22 15:45:43'),('14174626K',9,42,'V','2017-12-22 15:45:44'),('14174626K',9,43,'V','2017-12-22 15:45:45'),('14174626K',9,44,'V','2017-12-22 15:45:46'),('14174626K',9,45,'V','2017-12-22 15:45:47'),('14174626K',9,46,'V','2017-12-22 15:45:48'),('14174626K',10,47,'V','2017-12-22 15:46:03'),('14174626K',10,48,'V','2017-12-22 15:46:04'),('14174626K',10,49,'V','2017-12-22 15:46:05'),('14174626K',10,50,'V','2017-12-22 15:46:06'),('14174626K',10,51,'V','2017-12-22 15:46:07'),('14174626K',11,52,'F','2017-12-22 15:55:46'),('14174626K',11,53,'F','2017-12-22 15:55:47'),('14174626K',11,54,'V','2017-12-22 15:55:48'),('14174626K',11,55,'V','2017-12-22 15:55:49'),('14174626K',12,56,'V','2017-12-22 15:56:02'),('14174626K',12,57,'V','2017-12-22 15:56:03'),('14174626K',12,58,'F','2017-12-22 15:56:12'),('14174626K',12,59,'F','2017-12-22 15:56:13'),('14174626K',13,63,NULL,'2017-12-20 11:21:48'),('14174626K',14,67,NULL,'2017-12-20 11:22:42'),('14174626K',15,72,NULL,'2017-12-20 11:23:23'),('14174626K',16,78,NULL,'2017-12-20 11:24:04'),('14174626K',17,83,NULL,'2017-12-20 11:25:09'),('14174626K',18,87,NULL,'2017-12-20 11:25:52'),('14174626K',19,92,NULL,'2017-12-20 11:29:52'),('14174626K',20,96,NULL,'2017-12-20 11:37:55'),('14174626K',21,103,NULL,'2017-12-20 11:38:46'),('14174626K',22,106,NULL,'2017-12-20 11:39:14'),('14174626K',23,113,NULL,'2017-12-20 11:39:46'),('14174626K',24,115,NULL,'2017-12-20 11:40:24'),('14174626K',25,123,NULL,'2017-12-20 11:41:00'),('14174626K',26,127,NULL,'2017-12-20 11:41:21'),('14174626K',27,129,'V','2017-12-20 11:44:10'),('14174626K',27,130,'F','2017-12-20 11:44:14'),('14174626K',27,131,'F','2017-12-20 11:44:17'),('14174626K',27,132,'V','2017-12-20 11:44:20'),('14174626K',28,133,'V','2017-12-20 11:44:35'),('14174626K',28,134,'F','2017-12-20 11:44:45'),('14174626K',28,135,'F','2017-12-20 11:44:46'),('14174626K',28,136,'V','2017-12-20 11:44:51'),('14174626K',28,137,'F','2017-12-20 11:44:54'),('14174626K',28,138,'V','2017-12-20 11:44:56'),('14174626K',29,139,'V','2017-12-20 11:43:33'),('14174626K',29,140,'V','2017-12-20 11:43:36'),('14174626K',29,141,'V','2017-12-20 11:43:40'),('14174626K',29,142,'V','2017-12-20 11:43:47'),('14174626K',30,143,'V','2017-12-20 11:45:34'),('14174626K',30,144,'V','2017-12-20 11:45:40'),('14174626K',30,145,'V','2017-12-20 11:45:42'),('14174626K',31,146,'V','2017-12-20 11:43:00'),('14174626K',31,147,'V','2017-12-20 11:43:05'),('14174626K',31,148,'V','2017-12-20 11:43:07'),('14174626K',31,149,'V','2017-12-20 11:43:07'),('14174626K',31,150,'V','2017-12-20 11:43:08'),('14174626K',31,151,'V','2017-12-20 11:43:09'),('14174626K',32,152,'V','2017-12-20 11:42:37'),('14174626K',32,153,'V','2017-12-20 11:42:39'),('14174626K',32,154,'V','2017-12-20 11:42:40'),('14174626K',32,155,'V','2017-12-20 11:42:41'),('14174626K',32,156,'V','2017-12-20 11:42:42'),('14174626K',33,157,'V','2017-12-20 11:45:12'),('14174626K',33,158,'V','2017-12-20 11:45:15'),('14174626K',33,159,'V','2017-12-20 11:45:16'),('14174626K',33,160,'V','2017-12-20 11:45:16'),('14174626K',33,161,'V','2017-12-20 11:45:17');
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

-- Dump completed on 2017-12-22 16:05:51
