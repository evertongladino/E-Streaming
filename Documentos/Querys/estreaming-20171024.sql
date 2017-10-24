CREATE DATABASE  IF NOT EXISTS `estreaming` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `estreaming`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: estreaming
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `ta_assunto_midia`
--

DROP TABLE IF EXISTS `ta_assunto_midia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ta_assunto_midia` (
  `cod_assunto` int(11) NOT NULL,
  `cod_midia` int(11) NOT NULL,
  `sts_assunto_midia` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`cod_assunto`,`cod_midia`),
  KEY `fk_atividades_has_media_media1_idx` (`cod_midia`),
  KEY `fk_atividades_has_media_atividades1_idx` (`cod_assunto`),
  KEY `fk_atividades_has_media_atividades1_idx1` (`cod_assunto`),
  CONSTRAINT `fk_atividades_has_media_atividades1` FOREIGN KEY (`cod_assunto`) REFERENCES `tb_assunto` (`idt_assunto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividades_has_media_media1` FOREIGN KEY (`cod_midia`) REFERENCES `tb_midia` (`idt_midia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_assunto_midia`
--

LOCK TABLES `ta_assunto_midia` WRITE;
/*!40000 ALTER TABLE `ta_assunto_midia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ta_assunto_midia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_disciplina_cursos`
--

DROP TABLE IF EXISTS `ta_disciplina_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ta_disciplina_cursos` (
  `cod_disciplina` int(11) NOT NULL,
  `cod_curso` int(11) NOT NULL,
  `sts_disciplina_cursos` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`cod_disciplina`,`cod_curso`),
  KEY `fk_disciplina_has_curso_curso1_idx` (`cod_curso`),
  KEY `fk_disciplina_has_curso_disciplina1_idx` (`cod_disciplina`),
  CONSTRAINT `fk_disciplina_has_curso_curso1` FOREIGN KEY (`cod_curso`) REFERENCES `tb_curso` (`idt_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplina_has_curso_disciplina1` FOREIGN KEY (`cod_disciplina`) REFERENCES `tb_disciplina` (`idt_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_disciplina_cursos`
--

LOCK TABLES `ta_disciplina_cursos` WRITE;
/*!40000 ALTER TABLE `ta_disciplina_cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ta_disciplina_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_usuario_cursos`
--

DROP TABLE IF EXISTS `ta_usuario_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ta_usuario_cursos` (
  `cod_curso` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `sts_usuario_cursos` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` datetime NOT NULL,
  PRIMARY KEY (`cod_curso`,`cod_usuario`),
  KEY `fk_curso_has_usuario_usuario1_idx` (`cod_usuario`),
  KEY `fk_curso_has_usuario_curso1_idx` (`cod_curso`),
  CONSTRAINT `fk_curso_has_usuario_curso1` FOREIGN KEY (`cod_curso`) REFERENCES `tb_curso` (`idt_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_has_usuario_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `tb_usuario` (`idt_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_usuario_cursos`
--

LOCK TABLES `ta_usuario_cursos` WRITE;
/*!40000 ALTER TABLE `ta_usuario_cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ta_usuario_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_usuario_faculdade`
--

DROP TABLE IF EXISTS `ta_usuario_faculdade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ta_usuario_faculdade` (
  `cod_usuario` int(11) NOT NULL,
  `cod_faculdade` int(11) NOT NULL,
  `sts_usuario_faculdade` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`cod_usuario`,`cod_faculdade`),
  KEY `fk_usuario_has_faculdade_faculdade1_idx` (`cod_faculdade`),
  KEY `fk_usuario_has_faculdade_usuario1_idx` (`cod_usuario`),
  CONSTRAINT `fk_usuario_has_faculdade_faculdade1` FOREIGN KEY (`cod_faculdade`) REFERENCES `tb_faculdade` (`idt_faculdade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_faculdade_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `tb_usuario` (`idt_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_usuario_faculdade`
--

LOCK TABLES `ta_usuario_faculdade` WRITE;
/*!40000 ALTER TABLE `ta_usuario_faculdade` DISABLE KEYS */;
/*!40000 ALTER TABLE `ta_usuario_faculdade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_assunto`
--

DROP TABLE IF EXISTS `tb_assunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_assunto` (
  `idt_assunto` int(11) NOT NULL,
  `txt_tema_assunto` text NOT NULL,
  `cod_disciplina` int(11) NOT NULL,
  `dta_insercao` datetime NOT NULL,
  `sts_assunto` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `cod_usuario_criador` int(11) NOT NULL,
  `qtd_atividades` int(3) NOT NULL COMMENT 'Total de atividades no assunto',
  PRIMARY KEY (`idt_assunto`),
  KEY `fk_atividades_disciplina1_idx` (`cod_disciplina`),
  CONSTRAINT `fk_atividades_disciplina1` FOREIGN KEY (`cod_disciplina`) REFERENCES `tb_disciplina` (`idt_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_assunto`
--

LOCK TABLES `tb_assunto` WRITE;
/*!40000 ALTER TABLE `tb_assunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_assunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_completar`
--

DROP TABLE IF EXISTS `tb_completar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_completar` (
  `txt_enunciado` text NOT NULL,
  `cod_assunto` int(11) NOT NULL,
  `sts_completar` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `idt_completar` int(11) NOT NULL AUTO_INCREMENT,
  `ord_completar` int(11) NOT NULL,
  `qtd_campos` int(11) NOT NULL,
  `txt_frase` text NOT NULL,
  `dta_insercao` datetime NOT NULL,
  `cod_tipo_questao` int(11) NOT NULL,
  `flg_finalizada` char(1) NOT NULL,
  PRIMARY KEY (`idt_completar`),
  KEY `fk_completar_atividades1_idx` (`cod_assunto`),
  KEY `fk_tb_completar_tb_tipo_questao1_idx` (`cod_tipo_questao`),
  CONSTRAINT `fk_completar_atividades1` FOREIGN KEY (`cod_assunto`) REFERENCES `tb_assunto` (`idt_assunto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_completar_tb_tipo_questao1` FOREIGN KEY (`cod_tipo_questao`) REFERENCES `tb_tipo_questao` (`idt_tipo_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_completar`
--

LOCK TABLES `tb_completar` WRITE;
/*!40000 ALTER TABLE `tb_completar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_completar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_completar_alternativas`
--

DROP TABLE IF EXISTS `tb_completar_alternativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_completar_alternativas` (
  `idt_completar_alternativas` int(11) NOT NULL AUTO_INCREMENT,
  `ord_completar_alternativas` int(11) NOT NULL COMMENT 'Ordem das palavras na frase',
  `txt_palavra` text NOT NULL,
  `cod_completar` int(11) NOT NULL,
  `sts_completar_alternativas` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_completar_alternativas`),
  KEY `fk_completar_alternativas_completar1_idx` (`cod_completar`),
  CONSTRAINT `fk_completar_alternativas_completar1` FOREIGN KEY (`cod_completar`) REFERENCES `tb_completar` (`idt_completar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_completar_alternativas`
--

LOCK TABLES `tb_completar_alternativas` WRITE;
/*!40000 ALTER TABLE `tb_completar_alternativas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_completar_alternativas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_curso`
--

DROP TABLE IF EXISTS `tb_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_curso` (
  `idt_curso` int(11) NOT NULL,
  `nme_curso` varchar(80) NOT NULL,
  `sts_curso` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `cod_faculdade` int(11) NOT NULL,
  `dta_insercao` datetime NOT NULL,
  `qtd_semestres` int(2) NOT NULL,
  `cod_usuario_coordenador` varchar(45) NOT NULL,
  PRIMARY KEY (`idt_curso`),
  KEY `fk_curso_faculdade1_idx` (`cod_faculdade`),
  CONSTRAINT `fk_curso_faculdade1` FOREIGN KEY (`cod_faculdade`) REFERENCES `tb_faculdade` (`idt_faculdade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso`
--

LOCK TABLES `tb_curso` WRITE;
/*!40000 ALTER TABLE `tb_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_disciplina`
--

DROP TABLE IF EXISTS `tb_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_disciplina` (
  `idt_disciplina` int(11) NOT NULL,
  `nme_disciplina` varchar(80) NOT NULL,
  `sts_disciplina` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` datetime NOT NULL,
  `sem_disciplina` int(2) NOT NULL,
  PRIMARY KEY (`idt_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disciplina`
--

LOCK TABLES `tb_disciplina` WRITE;
/*!40000 ALTER TABLE `tb_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_faculdade`
--

DROP TABLE IF EXISTS `tb_faculdade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_faculdade` (
  `idt_faculdade` int(11) NOT NULL AUTO_INCREMENT,
  `nme_faculdade` varchar(45) NOT NULL,
  `cod_instituicao` int(11) NOT NULL,
  `sts_faculdade` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` datetime NOT NULL,
  `cod_usuario_admin` varchar(45) NOT NULL,
  PRIMARY KEY (`idt_faculdade`),
  KEY `fk_faculdade_instituicao1_idx` (`cod_instituicao`),
  CONSTRAINT `fk_faculdade_instituicao1` FOREIGN KEY (`cod_instituicao`) REFERENCES `tb_instituicao` (`idt_instituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_faculdade`
--

LOCK TABLES `tb_faculdade` WRITE;
/*!40000 ALTER TABLE `tb_faculdade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_faculdade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_instituicao`
--

DROP TABLE IF EXISTS `tb_instituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_instituicao` (
  `idt_instituicao` int(11) NOT NULL AUTO_INCREMENT,
  `cnpj_instituicao` varchar(18) NOT NULL,
  `nme_instituicao` varchar(80) NOT NULL,
  `end_instituicao` varchar(100) NOT NULL,
  `cep_instituicao` varchar(10) NOT NULL,
  `tel_instituicao_1` varchar(11) NOT NULL,
  `tel_instituicao_2` varchar(11) DEFAULT NULL,
  `eml_instituicao` varchar(80) NOT NULL,
  `url_instituicao` varchar(80) DEFAULT NULL,
  `dta_insercao` datetime NOT NULL,
  `sts_instituicao` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `razao_social` varchar(100) NOT NULL,
  PRIMARY KEY (`idt_instituicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_instituicao`
--

LOCK TABLES `tb_instituicao` WRITE;
/*!40000 ALTER TABLE `tb_instituicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_instituicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_midia`
--

DROP TABLE IF EXISTS `tb_midia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_midia` (
  `idt_midia` int(11) NOT NULL,
  `txt_caminho` text NOT NULL,
  `cod_tipo_midia` int(11) NOT NULL,
  `sts_midia` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` datetime NOT NULL,
  PRIMARY KEY (`idt_midia`),
  KEY `fk_media_tipo_media1_idx` (`cod_tipo_midia`),
  CONSTRAINT `fk_media_tipo_media1` FOREIGN KEY (`cod_tipo_midia`) REFERENCES `tb_tipo_midia` (`idt_tipo_midia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_midia`
--

LOCK TABLES `tb_midia` WRITE;
/*!40000 ALTER TABLE `tb_midia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_midia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mult_alternativas`
--

DROP TABLE IF EXISTS `tb_mult_alternativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mult_alternativas` (
  `idt_alternativas` int(11) NOT NULL AUTO_INCREMENT,
  `txt_item` text NOT NULL,
  `correto` tinyint(1) NOT NULL COMMENT '1= certo\n0= errado',
  `cod_mult_escolha` int(11) NOT NULL,
  `sts_mult_alternativas` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_alternativas`),
  KEY `fk_mult_alternativas_mult_escolha1_idx` (`cod_mult_escolha`),
  CONSTRAINT `fk_mult_alternativas_mult_escolha1` FOREIGN KEY (`cod_mult_escolha`) REFERENCES `tb_mult_escolha` (`idt_mult_escolha`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mult_alternativas`
--

LOCK TABLES `tb_mult_alternativas` WRITE;
/*!40000 ALTER TABLE `tb_mult_alternativas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mult_alternativas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mult_escolha`
--

DROP TABLE IF EXISTS `tb_mult_escolha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mult_escolha` (
  `txt_enunciado` text NOT NULL,
  `cod_assunto` int(11) NOT NULL,
  `sts_mult_escolha` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `idt_mult_escolha` int(11) NOT NULL AUTO_INCREMENT,
  `ord_mult_escolha` int(11) NOT NULL,
  `dta_insercao` datetime NOT NULL,
  `vlr_questao` varchar(45) NOT NULL COMMENT '\n',
  `cod_tipo_questao` int(11) NOT NULL,
  `flg_finalizada` char(1) NOT NULL,
  PRIMARY KEY (`idt_mult_escolha`),
  KEY `fk_mult_escolha_atividades1_idx` (`cod_assunto`),
  KEY `fk_tb_mult_escolha_tb_tipo_questao1_idx` (`cod_tipo_questao`),
  CONSTRAINT `fk_mult_escolha_atividades1` FOREIGN KEY (`cod_assunto`) REFERENCES `tb_assunto` (`idt_assunto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_mult_escolha_tb_tipo_questao1` FOREIGN KEY (`cod_tipo_questao`) REFERENCES `tb_tipo_questao` (`idt_tipo_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mult_escolha`
--

LOCK TABLES `tb_mult_escolha` WRITE;
/*!40000 ALTER TABLE `tb_mult_escolha` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mult_escolha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_notas`
--

DROP TABLE IF EXISTS `tb_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_notas` (
  `cod_usuario` int(11) NOT NULL,
  `cod_assunto` int(11) NOT NULL,
  `nota` float NOT NULL,
  PRIMARY KEY (`cod_usuario`,`cod_assunto`),
  KEY `fk_table1_tb_usuario1_idx` (`cod_usuario`),
  KEY `fk_tb_notas_tb_assunto1_idx` (`cod_assunto`),
  CONSTRAINT `fk_table1_tb_usuario1` FOREIGN KEY (`cod_usuario`) REFERENCES `tb_usuario` (`idt_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_notas_tb_assunto1` FOREIGN KEY (`cod_assunto`) REFERENCES `tb_assunto` (`idt_assunto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_notas`
--

LOCK TABLES `tb_notas` WRITE;
/*!40000 ALTER TABLE `tb_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_somatorio`
--

DROP TABLE IF EXISTS `tb_somatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_somatorio` (
  `idt_somatorio` int(11) NOT NULL AUTO_INCREMENT,
  `txt_enunciado` text NOT NULL,
  `cod_assunto` int(11) NOT NULL,
  `sts_somatorio` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `soma` int(11) NOT NULL,
  `ord_somatorio` int(11) NOT NULL,
  `dta_insercao` datetime NOT NULL,
  `cod_tipo_questao` int(11) NOT NULL,
  `flg_finalizada` char(1) NOT NULL,
  PRIMARY KEY (`idt_somatorio`),
  KEY `fk_somatorio_atividades1_idx` (`cod_assunto`),
  KEY `fk_tb_somatorio_tb_tipo_questao1_idx` (`cod_tipo_questao`),
  CONSTRAINT `fk_somatorio_atividades1` FOREIGN KEY (`cod_assunto`) REFERENCES `tb_assunto` (`idt_assunto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_somatorio_tb_tipo_questao1` FOREIGN KEY (`cod_tipo_questao`) REFERENCES `tb_tipo_questao` (`idt_tipo_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_somatorio`
--

LOCK TABLES `tb_somatorio` WRITE;
/*!40000 ALTER TABLE `tb_somatorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_somatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_somatorio_alternativas`
--

DROP TABLE IF EXISTS `tb_somatorio_alternativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_somatorio_alternativas` (
  `idt_somatorio_alternativas` int(11) NOT NULL AUTO_INCREMENT,
  `txt_item` text NOT NULL,
  `vlr_somatorio_alternativas` int(11) NOT NULL,
  `cod_somatorio` int(11) NOT NULL,
  `sts_somatorio_alternativas` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_somatorio_alternativas`),
  KEY `fk_somatorio_alternativas_somatorio1_idx` (`cod_somatorio`),
  CONSTRAINT `fk_somatorio_alternativas_somatorio1` FOREIGN KEY (`cod_somatorio`) REFERENCES `tb_somatorio` (`idt_somatorio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_somatorio_alternativas`
--

LOCK TABLES `tb_somatorio_alternativas` WRITE;
/*!40000 ALTER TABLE `tb_somatorio_alternativas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_somatorio_alternativas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_midia`
--

DROP TABLE IF EXISTS `tb_tipo_midia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipo_midia` (
  `idt_tipo_midia` int(11) NOT NULL AUTO_INCREMENT,
  `tpo_midia` char(1) NOT NULL COMMENT '0 = Texto; 1 = Vídeo; 2 = Áudio; 3 = Imagem.',
  `sts_tipo_midia` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_tipo_midia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_midia`
--

LOCK TABLES `tb_tipo_midia` WRITE;
/*!40000 ALTER TABLE `tb_tipo_midia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_midia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_questao`
--

DROP TABLE IF EXISTS `tb_tipo_questao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipo_questao` (
  `idt_tipo_questao` int(11) NOT NULL AUTO_INCREMENT,
  `nme_tipo_questao` varchar(100) NOT NULL COMMENT 'V_F = 1\nmult_escolha = 2\ncompletar = 3\nsomatorio = 4',
  PRIMARY KEY (`idt_tipo_questao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_questao`
--

LOCK TABLES `tb_tipo_questao` WRITE;
/*!40000 ALTER TABLE `tb_tipo_questao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_questao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario` (
  `idt_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cpf_usuario` varchar(11) NOT NULL,
  `nme_usuario` varchar(80) NOT NULL,
  `eml_usuario` varchar(80) NOT NULL,
  `pwd_usuario` varchar(128) NOT NULL,
  `tpo_usuario` char(1) NOT NULL COMMENT 'Tipos: Aluno:0, Professor:1, Coordenador de curso:2, Coordenador de faculdade:3, Coordenador da instituição:4.\n',
  `dta_insercao` datetime NOT NULL,
  `sts_usuario` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `lgn_especial` varchar(20) DEFAULT NULL COMMENT 'Esse campo determina se um usuário possui mais permissões para alterar configurações no sistema(campo para marcar no cadastro).',
  `tel_usuario` int(11) NOT NULL,
  PRIMARY KEY (`idt_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (2,'234234343','Prof. Teste','teste@teste.com','202cb962ac59075b964b07152d234b70','1','2017-10-22 21:31:49',1,'1',11111111),(9,'11111111111','Fulano de Tal','a@a.com','202cb962ac59075b964b07152d234b70','4','2017-10-22 19:17:29',1,NULL,40028922);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_v_f`
--

DROP TABLE IF EXISTS `tb_v_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_v_f` (
  `cod_assunto` int(11) NOT NULL,
  `sts_v_f` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `idt_vf` int(11) NOT NULL AUTO_INCREMENT,
  `txt_enunciado` text NOT NULL,
  `ord_v_f` int(11) NOT NULL,
  `dta_insercao` datetime NOT NULL,
  `cod_tipo_questao` int(11) NOT NULL,
  `flg_finalizada` char(1) NOT NULL,
  PRIMARY KEY (`idt_vf`),
  KEY `fk_V_F_atividades1_idx` (`cod_assunto`),
  KEY `fk_tb_v_f_tb_tipo_questao1_idx` (`cod_tipo_questao`),
  CONSTRAINT `fk_V_F_atividades1` FOREIGN KEY (`cod_assunto`) REFERENCES `tb_assunto` (`idt_assunto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_v_f_tb_tipo_questao1` FOREIGN KEY (`cod_tipo_questao`) REFERENCES `tb_tipo_questao` (`idt_tipo_questao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_v_f`
--

LOCK TABLES `tb_v_f` WRITE;
/*!40000 ALTER TABLE `tb_v_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_v_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_v_f_alternativas`
--

DROP TABLE IF EXISTS `tb_v_f_alternativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_v_f_alternativas` (
  `idt_v_f_alternativas` int(11) NOT NULL AUTO_INCREMENT,
  `txt_item` text NOT NULL,
  `vlr_v_f` tinyint(1) NOT NULL COMMENT '1=v\n0=f',
  `cod_v_f` int(11) NOT NULL,
  `sts_v_f_alternativas` tinyint(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_v_f_alternativas`),
  KEY `fk_V_F_alternativas_V_F1_idx` (`cod_v_f`),
  CONSTRAINT `fk_V_F_alternativas_V_F1` FOREIGN KEY (`cod_v_f`) REFERENCES `tb_v_f` (`idt_vf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_v_f_alternativas`
--

LOCK TABLES `tb_v_f_alternativas` WRITE;
/*!40000 ALTER TABLE `tb_v_f_alternativas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_v_f_alternativas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-24 18:02:21
