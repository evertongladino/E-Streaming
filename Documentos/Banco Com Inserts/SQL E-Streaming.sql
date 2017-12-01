-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema estreaming
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `estreaming` ;

-- -----------------------------------------------------
-- Schema estreaming
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `estreaming` DEFAULT CHARACTER SET latin1 ;
USE `estreaming` ;

-- -----------------------------------------------------
-- Table `estreaming`.`tb_disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_disciplina` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_disciplina` (
  `idt_disciplina` INT(11) NOT NULL AUTO_INCREMENT,
  `nme_disciplina` VARCHAR(80) NOT NULL,
  `sts_disciplina` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` DATETIME NOT NULL,
  `sem_disciplina` INT(2) NOT NULL,
  PRIMARY KEY (`idt_disciplina`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_assunto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_assunto` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_assunto` (
  `idt_assunto` INT(11) NOT NULL AUTO_INCREMENT,
  `txt_tema_assunto` TEXT NOT NULL,
  `cod_disciplina` INT(11) NOT NULL,
  `dta_insercao` DATETIME NOT NULL,
  `sts_assunto` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `cod_usuario_criador` INT(11) NOT NULL,
  `qtd_atividades` INT(3) NOT NULL COMMENT 'Total de atividades no assunto',
  PRIMARY KEY (`idt_assunto`),
  INDEX `fk_atividades_disciplina1_idx` (`cod_disciplina` ASC),
  CONSTRAINT `fk_atividades_disciplina1`
    FOREIGN KEY (`cod_disciplina`)
    REFERENCES `estreaming`.`tb_disciplina` (`idt_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_tipo_midia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_tipo_midia` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_tipo_midia` (
  `idt_tipo_midia` INT(11) NOT NULL AUTO_INCREMENT,
  `tpo_midia` VARCHAR(20) NOT NULL,
  `sts_tipo_midia` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_tipo_midia`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_midia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_midia` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_midia` (
  `idt_midia` INT(11) NOT NULL AUTO_INCREMENT,
  `txt_caminho` TEXT NOT NULL,
  `cod_tipo_midia` INT(11) NOT NULL,
  `sts_midia` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` DATETIME NOT NULL,
  PRIMARY KEY (`idt_midia`),
  INDEX `fk_media_tipo_media1_idx` (`cod_tipo_midia` ASC),
  CONSTRAINT `fk_media_tipo_media1`
    FOREIGN KEY (`cod_tipo_midia`)
    REFERENCES `estreaming`.`tb_tipo_midia` (`idt_tipo_midia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`ta_assunto_midia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`ta_assunto_midia` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`ta_assunto_midia` (
  `cod_assunto` INT(11) NOT NULL,
  `cod_midia` INT(11) NOT NULL,
  `sts_assunto_midia` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`cod_assunto`, `cod_midia`),
  INDEX `fk_atividades_has_media_media1_idx` (`cod_midia` ASC),
  INDEX `fk_atividades_has_media_atividades1_idx` (`cod_assunto` ASC),
  INDEX `fk_atividades_has_media_atividades1_idx1` (`cod_assunto` ASC),
  CONSTRAINT `fk_atividades_has_media_atividades1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `estreaming`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividades_has_media_media1`
    FOREIGN KEY (`cod_midia`)
    REFERENCES `estreaming`.`tb_midia` (`idt_midia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_instituicao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_instituicao` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_instituicao` (
  `idt_instituicao` INT(11) NOT NULL AUTO_INCREMENT,
  `cnpj_instituicao` VARCHAR(18) NOT NULL,
  `nme_instituicao` VARCHAR(80) NOT NULL,
  `end_instituicao` VARCHAR(100) NOT NULL,
  `cep_instituicao` VARCHAR(10) NOT NULL,
  `tel_instituicao_1` VARCHAR(11) NOT NULL,
  `tel_instituicao_2` VARCHAR(11) NULL DEFAULT NULL,
  `eml_instituicao` VARCHAR(80) NOT NULL,
  `url_instituicao` VARCHAR(80) NULL DEFAULT NULL,
  `dta_insercao` DATETIME NOT NULL,
  `sts_instituicao` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `razao_social` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idt_instituicao`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_faculdade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_faculdade` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_faculdade` (
  `idt_faculdade` INT(11) NOT NULL AUTO_INCREMENT,
  `nme_faculdade` VARCHAR(45) NOT NULL,
  `cod_instituicao` INT(11) NOT NULL,
  `sts_faculdade` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` DATETIME NOT NULL,
  `cod_usuario_admin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idt_faculdade`),
  INDEX `fk_faculdade_instituicao1_idx` (`cod_instituicao` ASC),
  CONSTRAINT `fk_faculdade_instituicao1`
    FOREIGN KEY (`cod_instituicao`)
    REFERENCES `estreaming`.`tb_instituicao` (`idt_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_curso` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_curso` (
  `idt_curso` INT(11) NOT NULL AUTO_INCREMENT,
  `nme_curso` VARCHAR(80) NOT NULL,
  `sts_curso` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `cod_faculdade` INT(11) NOT NULL,
  `dta_insercao` DATETIME NOT NULL,
  `qtd_semestres` INT(2) NOT NULL,
  `cod_usuario_coordenador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idt_curso`),
  INDEX `fk_curso_faculdade1_idx` (`cod_faculdade` ASC),
  CONSTRAINT `fk_curso_faculdade1`
    FOREIGN KEY (`cod_faculdade`)
    REFERENCES `estreaming`.`tb_faculdade` (`idt_faculdade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`ta_disciplina_cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`ta_disciplina_cursos` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`ta_disciplina_cursos` (
  `cod_disciplina` INT(11) NOT NULL,
  `cod_curso` INT(11) NOT NULL,
  `sts_disciplina_cursos` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`cod_disciplina`, `cod_curso`),
  INDEX `fk_disciplina_has_curso_curso1_idx` (`cod_curso` ASC),
  INDEX `fk_disciplina_has_curso_disciplina1_idx` (`cod_disciplina` ASC),
  CONSTRAINT `fk_disciplina_has_curso_curso1`
    FOREIGN KEY (`cod_curso`)
    REFERENCES `estreaming`.`tb_curso` (`idt_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplina_has_curso_disciplina1`
    FOREIGN KEY (`cod_disciplina`)
    REFERENCES `estreaming`.`tb_disciplina` (`idt_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_usuario` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_usuario` (
  `idt_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `cpf_usuario` VARCHAR(11) NOT NULL,
  `nme_usuario` VARCHAR(80) NOT NULL,
  `eml_usuario` VARCHAR(80) NOT NULL,
  `pwd_usuario` VARCHAR(128) NOT NULL,
  `tpo_usuario` CHAR(1) NOT NULL COMMENT 'Tipos: Aluno:0, Professor:1, Coordenador de curso:2, Coordenador de faculdade:3, Coordenador da instituição:4.\n',
  `dta_insercao` DATETIME NOT NULL,
  `sts_usuario` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `lgn_especial` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Esse campo determina se um usuário possui mais permissões para alterar configurações no sistema(campo para marcar no cadastro).',
  `tel_usuario` INT(11) NOT NULL,
  PRIMARY KEY (`idt_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`ta_usuario_cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`ta_usuario_cursos` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`ta_usuario_cursos` (
  `cod_curso` INT(11) NOT NULL,
  `cod_usuario` INT(11) NOT NULL,
  `sts_usuario_cursos` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` DATETIME NOT NULL,
  PRIMARY KEY (`cod_curso`, `cod_usuario`),
  INDEX `fk_curso_has_usuario_usuario1_idx` (`cod_usuario` ASC),
  INDEX `fk_curso_has_usuario_curso1_idx` (`cod_curso` ASC),
  CONSTRAINT `fk_curso_has_usuario_curso1`
    FOREIGN KEY (`cod_curso`)
    REFERENCES `estreaming`.`tb_curso` (`idt_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_has_usuario_usuario1`
    FOREIGN KEY (`cod_usuario`)
    REFERENCES `estreaming`.`tb_usuario` (`idt_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`ta_usuario_faculdade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`ta_usuario_faculdade` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`ta_usuario_faculdade` (
  `cod_usuario` INT(11) NOT NULL,
  `cod_faculdade` INT(11) NOT NULL,
  `sts_usuario_faculdade` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`cod_usuario`, `cod_faculdade`),
  INDEX `fk_usuario_has_faculdade_faculdade1_idx` (`cod_faculdade` ASC),
  INDEX `fk_usuario_has_faculdade_usuario1_idx` (`cod_usuario` ASC),
  CONSTRAINT `fk_usuario_has_faculdade_faculdade1`
    FOREIGN KEY (`cod_faculdade`)
    REFERENCES `estreaming`.`tb_faculdade` (`idt_faculdade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_faculdade_usuario1`
    FOREIGN KEY (`cod_usuario`)
    REFERENCES `estreaming`.`tb_usuario` (`idt_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_tipo_questao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_tipo_questao` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_tipo_questao` (
  `idt_tipo_questao` INT(11) NOT NULL AUTO_INCREMENT,
  `nme_tipo_questao` VARCHAR(100) NOT NULL COMMENT 'V_F = 1\nmult_escolha = 2\ncompletar = 3\nsomatorio = 4',
  PRIMARY KEY (`idt_tipo_questao`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_completar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_completar` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_completar` (
  `txt_enunciado` TEXT NOT NULL,
  `cod_assunto` INT(11) NOT NULL,
  `sts_completar` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `idt_completar` INT(11) NOT NULL AUTO_INCREMENT,
  `ord_completar` INT(11) NOT NULL,
  `qtd_campos` INT(11) NOT NULL,
  `txt_frase` TEXT NOT NULL,
  `dta_insercao` DATETIME NOT NULL,
  `cod_tipo_questao` INT(11) NOT NULL,
  `flg_finalizada` CHAR(1) NOT NULL,
  PRIMARY KEY (`idt_completar`),
  INDEX `fk_completar_atividades1_idx` (`cod_assunto` ASC),
  INDEX `fk_tb_completar_tb_tipo_questao1_idx` (`cod_tipo_questao` ASC),
  CONSTRAINT `fk_completar_atividades1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `estreaming`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_completar_tb_tipo_questao1`
    FOREIGN KEY (`cod_tipo_questao`)
    REFERENCES `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_completar_alternativas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_completar_alternativas` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_completar_alternativas` (
  `idt_completar_alternativas` INT(11) NOT NULL AUTO_INCREMENT,
  `ord_completar_alternativas` INT(11) NOT NULL COMMENT 'Ordem das palavras na frase',
  `txt_palavra` TEXT NOT NULL,
  `cod_completar` INT(11) NOT NULL,
  `sts_completar_alternativas` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_completar_alternativas`),
  INDEX `fk_completar_alternativas_completar1_idx` (`cod_completar` ASC),
  CONSTRAINT `fk_completar_alternativas_completar1`
    FOREIGN KEY (`cod_completar`)
    REFERENCES `estreaming`.`tb_completar` (`idt_completar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_mult_escolha`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_mult_escolha` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_mult_escolha` (
  `txt_enunciado` TEXT NOT NULL,
  `cod_assunto` INT(11) NOT NULL,
  `sts_mult_escolha` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `idt_mult_escolha` INT(11) NOT NULL AUTO_INCREMENT,
  `ord_mult_escolha` INT(11) NOT NULL,
  `dta_insercao` DATETIME NOT NULL,
  `vlr_questao` VARCHAR(45) NOT NULL COMMENT '\n',
  `cod_tipo_questao` INT(11) NOT NULL,
  `flg_finalizada` CHAR(1) NOT NULL,
  PRIMARY KEY (`idt_mult_escolha`),
  INDEX `fk_mult_escolha_atividades1_idx` (`cod_assunto` ASC),
  INDEX `fk_tb_mult_escolha_tb_tipo_questao1_idx` (`cod_tipo_questao` ASC),
  CONSTRAINT `fk_mult_escolha_atividades1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `estreaming`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_mult_escolha_tb_tipo_questao1`
    FOREIGN KEY (`cod_tipo_questao`)
    REFERENCES `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_mult_alternativas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_mult_alternativas` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_mult_alternativas` (
  `idt_alternativas` INT(11) NOT NULL AUTO_INCREMENT,
  `txt_item` TEXT NOT NULL,
  `correto` TINYINT(1) NOT NULL COMMENT '1= certo\n0= errado',
  `cod_mult_escolha` INT(11) NOT NULL,
  `sts_mult_alternativas` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_alternativas`),
  INDEX `fk_mult_alternativas_mult_escolha1_idx` (`cod_mult_escolha` ASC),
  CONSTRAINT `fk_mult_alternativas_mult_escolha1`
    FOREIGN KEY (`cod_mult_escolha`)
    REFERENCES `estreaming`.`tb_mult_escolha` (`idt_mult_escolha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_notas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_notas` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_notas` (
  `cod_usuario` INT(11) NOT NULL,
  `cod_assunto` INT(11) NOT NULL,
  `nota` FLOAT NOT NULL,
  PRIMARY KEY (`cod_usuario`, `cod_assunto`),
  INDEX `fk_table1_tb_usuario1_idx` (`cod_usuario` ASC),
  INDEX `fk_tb_notas_tb_assunto1_idx` (`cod_assunto` ASC),
  CONSTRAINT `fk_table1_tb_usuario1`
    FOREIGN KEY (`cod_usuario`)
    REFERENCES `estreaming`.`tb_usuario` (`idt_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_notas_tb_assunto1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `estreaming`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_somatorio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_somatorio` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_somatorio` (
  `idt_somatorio` INT(11) NOT NULL AUTO_INCREMENT,
  `txt_enunciado` TEXT NOT NULL,
  `cod_assunto` INT(11) NOT NULL,
  `sts_somatorio` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `soma` INT(11) NOT NULL,
  `ord_somatorio` INT(11) NOT NULL,
  `dta_insercao` DATETIME NOT NULL,
  `cod_tipo_questao` INT(11) NOT NULL,
  `flg_finalizada` CHAR(1) NOT NULL,
  PRIMARY KEY (`idt_somatorio`),
  INDEX `fk_somatorio_atividades1_idx` (`cod_assunto` ASC),
  INDEX `fk_tb_somatorio_tb_tipo_questao1_idx` (`cod_tipo_questao` ASC),
  CONSTRAINT `fk_somatorio_atividades1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `estreaming`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_somatorio_tb_tipo_questao1`
    FOREIGN KEY (`cod_tipo_questao`)
    REFERENCES `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_somatorio_alternativas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_somatorio_alternativas` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_somatorio_alternativas` (
  `idt_somatorio_alternativas` INT(11) NOT NULL AUTO_INCREMENT,
  `txt_item` TEXT NOT NULL,
  `vlr_somatorio_alternativas` INT(11) NOT NULL,
  `cod_somatorio` INT(11) NOT NULL,
  `sts_somatorio_alternativas` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_somatorio_alternativas`),
  INDEX `fk_somatorio_alternativas_somatorio1_idx` (`cod_somatorio` ASC),
  CONSTRAINT `fk_somatorio_alternativas_somatorio1`
    FOREIGN KEY (`cod_somatorio`)
    REFERENCES `estreaming`.`tb_somatorio` (`idt_somatorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_v_f`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_v_f` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_v_f` (
  `cod_assunto` INT(11) NOT NULL,
  `sts_v_f` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `idt_vf` INT(11) NOT NULL AUTO_INCREMENT,
  `txt_enunciado` TEXT NOT NULL,
  `ord_v_f` INT(11) NOT NULL,
  `dta_insercao` DATETIME NOT NULL,
  `cod_tipo_questao` INT(11) NOT NULL,
  `flg_finalizada` CHAR(1) NOT NULL,
  PRIMARY KEY (`idt_vf`),
  INDEX `fk_V_F_atividades1_idx` (`cod_assunto` ASC),
  INDEX `fk_tb_v_f_tb_tipo_questao1_idx` (`cod_tipo_questao` ASC),
  CONSTRAINT `fk_V_F_atividades1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `estreaming`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_v_f_tb_tipo_questao1`
    FOREIGN KEY (`cod_tipo_questao`)
    REFERENCES `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_v_f_alternativas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_v_f_alternativas` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_v_f_alternativas` (
  `idt_v_f_alternativas` INT(11) NOT NULL AUTO_INCREMENT,
  `txt_item` TEXT NOT NULL,
  `vlr_v_f` TINYINT(1) NOT NULL COMMENT '1=v\n0=f',
  `cod_v_f` INT(11) NOT NULL,
  `sts_v_f_alternativas` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_v_f_alternativas`),
  INDEX `fk_V_F_alternativas_V_F1_idx` (`cod_v_f` ASC),
  CONSTRAINT `fk_V_F_alternativas_V_F1`
    FOREIGN KEY (`cod_v_f`)
    REFERENCES `estreaming`.`tb_v_f` (`idt_vf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_disciplina`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (1, 'Matematica', 1, '2017-11-28', 1);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (2, 'Portugues', 1, '2017-11-28', 1);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (3, 'Logica Digital', 1, '2017-11-28', 2);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (4, 'Introducao a Economia', 1, '2017-11-28', 2);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (5, 'Resistencia de Materiais', 1, '2017-11-28', 3);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (6, 'Sociologia', 1, '2017-11-28', 3);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (7, 'Etica I', 1, '2017-11-28', 4);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (8, 'Etica II', 1, '2017-11-28', 4);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (9, 'Calculo I', 1, '2017-11-28', 5);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (10, 'Calculo II', 1, '2017-11-28', 5);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (11, 'Calculo III', 1, '2017-11-28', 6);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (12, 'Algebra', 1, '2017-11-28', 7);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (13, 'Filosofia', 1, '2017-11-28', 7);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (14, 'Matematica Nuclear', 1, '2017-11-28', 8);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (15, 'Bomba Caseira', 1, '2017-11-28', 8);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (16, 'Metafetamina', 1, '2017-11-28', 9);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (17, 'Nadologia', 1, '2017-11-28', 10);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (18, 'Codigo Penal', 1, '2017-11-28', 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_assunto`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (1, 'Equacoes', 1, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (2, 'Multiplicacao', 1, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (3, 'Matriz', 12, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (4, 'Gramatica', 2, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (5, 'Derivada', 9, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (6, 'Portas Logicas', 3, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (7, 'Semantica', 2, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (8, 'Cod penal no Brasil', 18, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (9, 'Cod penal historia', 18, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (10, 'Cod penal na exterior', 18, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (11, 'Salatiel', 6, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (12, 'Resistencia do pedreiro', 5, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (13, 'Pedreirologismo', 5, '2017-11-28', 1, 1, 2);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (14, 'Economia Brasileira', 4, '2017-11-28', 1, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_tipo_midia`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_tipo_midia` (`idt_tipo_midia`, `tpo_midia`, `sts_tipo_midia`) VALUES (1, 'MP4', 1);
INSERT INTO `estreaming`.`tb_tipo_midia` (`idt_tipo_midia`, `tpo_midia`, `sts_tipo_midia`) VALUES (2, 'AVI', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_midia`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_midia` (`idt_midia`, `txt_caminho`, `cod_tipo_midia`, `sts_midia`, `dta_insercao`) VALUES (1, 'path/testeMidiaMP4', 1, 1, '2017-11-30');
INSERT INTO `estreaming`.`tb_midia` (`idt_midia`, `txt_caminho`, `cod_tipo_midia`, `sts_midia`, `dta_insercao`) VALUES (2, 'path/testeMidiaMP4', 1, 1, '2017-11-30');
INSERT INTO `estreaming`.`tb_midia` (`idt_midia`, `txt_caminho`, `cod_tipo_midia`, `sts_midia`, `dta_insercao`) VALUES (3, 'path/testeMidiaAVI', 2, 1, '2017-11-30');
INSERT INTO `estreaming`.`tb_midia` (`idt_midia`, `txt_caminho`, `cod_tipo_midia`, `sts_midia`, `dta_insercao`) VALUES (4, 'path/testeMidiaAVI', 2, 1, '2017-11-30');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`ta_assunto_midia`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`ta_assunto_midia` (`cod_assunto`, `cod_midia`, `sts_assunto_midia`) VALUES (1, 1, 1);
INSERT INTO `estreaming`.`ta_assunto_midia` (`cod_assunto`, `cod_midia`, `sts_assunto_midia`) VALUES (2, 2, 1);
INSERT INTO `estreaming`.`ta_assunto_midia` (`cod_assunto`, `cod_midia`, `sts_assunto_midia`) VALUES (3, 3, 1);
INSERT INTO `estreaming`.`ta_assunto_midia` (`cod_assunto`, `cod_midia`, `sts_assunto_midia`) VALUES (4, 4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_instituicao`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_instituicao` (`idt_instituicao`, `cnpj_instituicao`, `nme_instituicao`, `end_instituicao`, `cep_instituicao`, `tel_instituicao_1`, `tel_instituicao_2`, `eml_instituicao`, `url_instituicao`, `dta_insercao`, `sts_instituicao`, `razao_social`) VALUES (1, '06.793.686/0001-00', 'Processus', '707 Asa Sul', '727150-031', '61 30115527', '61 35227488', 'processus@ead.com', 'processus.com.br', '2017-11-28', 1, 'Processus LTDA');
INSERT INTO `estreaming`.`tb_instituicao` (`idt_instituicao`, `cnpj_instituicao`, `nme_instituicao`, `end_instituicao`, `cep_instituicao`, `tel_instituicao_1`, `tel_instituicao_2`, `eml_instituicao`, `url_instituicao`, `dta_insercao`, `sts_instituicao`, `razao_social`) VALUES (2, '43.921.298/0001-85', 'UniCEUB', '908 Asa Norte', '727156-524', '61 35515465', '61 35425142', 'uniceub@uniceub.br', 'uniceub.br', '2017-11-28', 1, 'Centro Universitario de Brasilia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_faculdade`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`, `cod_usuario_admin`) VALUES (1, 'FATECS', 2, 1, '2017-11-28', '1');
INSERT INTO `estreaming`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`, `cod_usuario_admin`) VALUES (2, 'FASSEX', 2, 1, '2017-11-28', '1');
INSERT INTO `estreaming`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`, `cod_usuario_admin`) VALUES (3, 'BRIOCAL', 1, 1, '2017-11-28', '1');
INSERT INTO `estreaming`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`, `cod_usuario_admin`) VALUES (4, 'PROCESS', 1, 1, '2017-11-28', '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_curso`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`, `qtd_semestres`, `cod_usuario_coordenador`) VALUES (1, 'Ciencia da Computacao', 1, 1, '2017-11-28', 8, '1');
INSERT INTO `estreaming`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`, `qtd_semestres`, `cod_usuario_coordenador`) VALUES (2, 'Direito', 1, 2, '2017-11-28', 10, '1');
INSERT INTO `estreaming`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`, `qtd_semestres`, `cod_usuario_coordenador`) VALUES (3, 'Direito', 1, 4, '2017-11-28', 10, '1');
INSERT INTO `estreaming`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`, `qtd_semestres`, `cod_usuario_coordenador`) VALUES (4, 'Letras Portugues', 1, 2, '2017-11-28', 8, '1');
INSERT INTO `estreaming`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`, `qtd_semestres`, `cod_usuario_coordenador`) VALUES (5, 'Letras Espanhol', 1, 4, '2017-11-28', 8, '1');
INSERT INTO `estreaming`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`, `qtd_semestres`, `cod_usuario_coordenador`) VALUES (6, 'Fisica', 1, 1, '2017-11-28', 10, '1');
INSERT INTO `estreaming`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`, `qtd_semestres`, `cod_usuario_coordenador`) VALUES (7, 'Sciologia', 1, 3, '2017-11-28', 8, '1');
INSERT INTO `estreaming`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`, `qtd_semestres`, `cod_usuario_coordenador`) VALUES (8, 'Quimica', 1, 3, '2017-11-28', 10, '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`ta_disciplina_cursos`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (1, 1, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (1, 8, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (1, 6, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (2, 1, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (2, 2, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (2, 3, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (2, 4, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (2, 5, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (2, 6, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (2, 7, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (2, 8, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (3, 1, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (4, 1, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (4, 2, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (4, 3, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (4, 4, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (4, 5, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (4, 6, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (4, 7, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (4, 8, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (5, 8, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (6, 7, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (6, 1, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (6, 2, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (6, 3, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (6, 4, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (6, 5, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (6, 6, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (11, 6, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (13, 7, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (18, 2, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (7, 1, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (7, 2, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (7, 3, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (7, 4, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (7, 5, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (7, 6, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (7, 7, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (7, 8, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (1, '03654125864', 'Admin', 'a@a.com', '123', '6', '2017-11-28', 1, NULL, 6199874);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (2, '79846436017', 'Cleber', 'Cleber@gmail.com', '123', '1', '2017-11-28', 1, NULL, 6199874);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (3, '42963830009', 'Roger', 'Rog@gmail.com', '123', '1', '2017-11-28', 1, NULL, 6199874);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (4, '95640000090', 'Chris', 'Chris@gmail.com', '123', '1', '2017-11-28', 1, NULL, 6199874);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (5, '69685993092', 'Luana', 'Lulu@gmail.com', '123', '1', '2017-11-28', 1, NULL, 6199874);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (6, '93307650092', 'Rabeta', 'Rabetao@gmail.com', '123', '1', '2017-11-28', 1, NULL, 6199874);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (7, '37502568026', 'Chafoso', 'xafoso@gmail.com', '123', '1', '2017-11-28', 1, NULL, 6199874);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (8, '49069464020', 'Luiz', 'luiz@gmail.com', '123', '1', '2017-11-28', 1, NULL, 6199874);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (9, '16641286037', 'Lucio', 'lucio@gmail.com', '123', '1', '2017-11-28', 1, NULL, 6199874);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (10, '60229564046', 'Armalauro', 'armalauro@gmail.com', '123', '1', '2017-11-28', 1, NULL, 6199874);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (11, '92095550072', 'Rodrigo', 'rod.goi@gmail.com', '123', '1', '2017-11-28', 1, NULL, 6199874);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (12, '53188482060', 'Peixonalta', 'peixonalta@gmail.com', '123', '1', '2017-11-28', 1, NULL, 6199874);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`ta_usuario_cursos`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (1, 2, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (1, 3, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (1, 4, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (2, 5, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (2, 6, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (2, 7, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (3, 8, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (3, 9, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (3, 10, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (4, 11, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (4, 12, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (4, 2, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (5, 3, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (5, 4, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (5, 5, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (6, 6, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (6, 7, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (6, 8, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (7, 9, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (7, 10, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (7, 11, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (8, 12, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (8, 2, 1, '2017-11-28');
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (8, 3, 1, '2017-11-28');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`ta_usuario_faculdade`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (2, 1, 1);
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (3, 1, 1);
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (4, 2, 1);
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (5, 2, 1);
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (6, 3, 1);
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (7, 3, 1);
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (8, 4, 1);
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (9, 4, 1);
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (10, 1, 1);
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (11, 2, 1);
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (12, 3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_tipo_questao`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`, `nme_tipo_questao`) VALUES (1, 'V ou F');
INSERT INTO `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`, `nme_tipo_questao`) VALUES (2, 'Multipla Escolha');
INSERT INTO `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`, `nme_tipo_questao`) VALUES (3, 'Completar');
INSERT INTO `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`, `nme_tipo_questao`) VALUES (4, 'Somatorio');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_completar`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_completar` (`txt_enunciado`, `cod_assunto`, `sts_completar`, `idt_completar`, `ord_completar`, `qtd_campos`, `txt_frase`, `dta_insercao`, `cod_tipo_questao`, `flg_finalizada`) VALUES ('Complete a frase', 3, 1, 1, 1, 1, 'Agua mole _____ dura', '2017-11-30', 3, '1');
INSERT INTO `estreaming`.`tb_completar` (`txt_enunciado`, `cod_assunto`, `sts_completar`, `idt_completar`, `ord_completar`, `qtd_campos`, `txt_frase`, `dta_insercao`, `cod_tipo_questao`, `flg_finalizada`) VALUES ('Complete o trecho a seguir', 3, 1, 2, 1, 1, 'Casa de Ferreiro _____ de pau', '2017-11-30', 3, '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_completar_alternativas`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_completar_alternativas` (`idt_completar_alternativas`, `ord_completar_alternativas`, `txt_palavra`, `cod_completar`, `sts_completar_alternativas`) VALUES (1, 1, 'Pedra', 1, 1);
INSERT INTO `estreaming`.`tb_completar_alternativas` (`idt_completar_alternativas`, `ord_completar_alternativas`, `txt_palavra`, `cod_completar`, `sts_completar_alternativas`) VALUES (2, 0, 'Rocha', 1, 1);
INSERT INTO `estreaming`.`tb_completar_alternativas` (`idt_completar_alternativas`, `ord_completar_alternativas`, `txt_palavra`, `cod_completar`, `sts_completar_alternativas`) VALUES (3, 0, 'Vara', 2, 1);
INSERT INTO `estreaming`.`tb_completar_alternativas` (`idt_completar_alternativas`, `ord_completar_alternativas`, `txt_palavra`, `cod_completar`, `sts_completar_alternativas`) VALUES (4, 1, 'Espero', 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_mult_escolha`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_mult_escolha` (`txt_enunciado`, `cod_assunto`, `sts_mult_escolha`, `idt_mult_escolha`, `ord_mult_escolha`, `dta_insercao`, `vlr_questao`, `cod_tipo_questao`, `flg_finalizada`) VALUES ('Marque a correta', 2, 1, 1, 100, '2017-11-30', '1', 2, '1');
INSERT INTO `estreaming`.`tb_mult_escolha` (`txt_enunciado`, `cod_assunto`, `sts_mult_escolha`, `idt_mult_escolha`, `ord_mult_escolha`, `dta_insercao`, `vlr_questao`, `cod_tipo_questao`, `flg_finalizada`) VALUES ('Marque a errada', 2, 1, 2, 100, '2017-11-30', '1', 2, '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_mult_alternativas`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_mult_alternativas` (`idt_alternativas`, `txt_item`, `correto`, `cod_mult_escolha`, `sts_mult_alternativas`) VALUES (1, '5*5=25', 1, 1, 1);
INSERT INTO `estreaming`.`tb_mult_alternativas` (`idt_alternativas`, `txt_item`, `correto`, `cod_mult_escolha`, `sts_mult_alternativas`) VALUES (2, '2*5=11', 0, 1, 1);
INSERT INTO `estreaming`.`tb_mult_alternativas` (`idt_alternativas`, `txt_item`, `correto`, `cod_mult_escolha`, `sts_mult_alternativas`) VALUES (3, '6*3=45', 0, 1, 1);
INSERT INTO `estreaming`.`tb_mult_alternativas` (`idt_alternativas`, `txt_item`, `correto`, `cod_mult_escolha`, `sts_mult_alternativas`) VALUES (4, '2*2=4', 1, 2, 1);
INSERT INTO `estreaming`.`tb_mult_alternativas` (`idt_alternativas`, `txt_item`, `correto`, `cod_mult_escolha`, `sts_mult_alternativas`) VALUES (5, '6518*5=55', 0, 2, 1);
INSERT INTO `estreaming`.`tb_mult_alternativas` (`idt_alternativas`, `txt_item`, `correto`, `cod_mult_escolha`, `sts_mult_alternativas`) VALUES (6, '22*5=65', 0, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_notas`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (2, 1, 5);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (3, 1, 3);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (4, 1, 7);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (5, 2, 8);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (6, 2, 5);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (7, 2, 6);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (8, 3, 2);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (9, 3, 4);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (10, 3, 3);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (11, 4, 5);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (12, 4, 4);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (2, 4, 2);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (3, 5, 4);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (4, 5, 8);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (5, 5, 9);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (6, 6, 7);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (7, 6, 5);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (8, 6, 6);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (9, 7, 9);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (10, 7, 8);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (11, 7, 7);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (12, 8, 8);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (2, 8, 7);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (3, 8, 4);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (4, 9, 5);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (5, 9, 5);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (6, 9, 5);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (7, 10, 5);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (8, 10, 6);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (9, 10, 5);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (10, 11, 4);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (11, 11, 2);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (12, 11, 3);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (2, 12, 9);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (3, 12, 8);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (4, 12, 7);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (5, 13, 8);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (6, 13, 7);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (7, 13, 8);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (8, 14, 9);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (9, 14, 10);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (10, 14, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_somatorio`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_somatorio` (`idt_somatorio`, `txt_enunciado`, `cod_assunto`, `sts_somatorio`, `soma`, `ord_somatorio`, `dta_insercao`, `cod_tipo_questao`, `flg_finalizada`) VALUES (1, 'Some as corretas', 4, 1, 12, 1, '2017-11-30', 4, '1');
INSERT INTO `estreaming`.`tb_somatorio` (`idt_somatorio`, `txt_enunciado`, `cod_assunto`, `sts_somatorio`, `soma`, `ord_somatorio`, `dta_insercao`, `cod_tipo_questao`, `flg_finalizada`) VALUES (2, 'Determine a soma das corretas', 4, 1, 8, 1, '2017-11-30', 4, '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_somatorio_alternativas`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_somatorio_alternativas` (`idt_somatorio_alternativas`, `txt_item`, `vlr_somatorio_alternativas`, `cod_somatorio`, `sts_somatorio_alternativas`) VALUES (1, '2+2=4', 4, 1, 1);
INSERT INTO `estreaming`.`tb_somatorio_alternativas` (`idt_somatorio_alternativas`, `txt_item`, `vlr_somatorio_alternativas`, `cod_somatorio`, `sts_somatorio_alternativas`) VALUES (2, '5+5=10', 8, 1, 1);
INSERT INTO `estreaming`.`tb_somatorio_alternativas` (`idt_somatorio_alternativas`, `txt_item`, `vlr_somatorio_alternativas`, `cod_somatorio`, `sts_somatorio_alternativas`) VALUES (3, '15+8=75', 16, 1, 1);
INSERT INTO `estreaming`.`tb_somatorio_alternativas` (`idt_somatorio_alternativas`, `txt_item`, `vlr_somatorio_alternativas`, `cod_somatorio`, `sts_somatorio_alternativas`) VALUES (4, '7*8=66', 4, 2, 1);
INSERT INTO `estreaming`.`tb_somatorio_alternativas` (`idt_somatorio_alternativas`, `txt_item`, `vlr_somatorio_alternativas`, `cod_somatorio`, `sts_somatorio_alternativas`) VALUES (5, '3*5=15', 8, 2, 1);
INSERT INTO `estreaming`.`tb_somatorio_alternativas` (`idt_somatorio_alternativas`, `txt_item`, `vlr_somatorio_alternativas`, `cod_somatorio`, `sts_somatorio_alternativas`) VALUES (6, '88/4=6', 16, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_v_f`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_v_f` (`cod_assunto`, `sts_v_f`, `idt_vf`, `txt_enunciado`, `ord_v_f`, `dta_insercao`, `cod_tipo_questao`, `flg_finalizada`) VALUES (1, 1, 1, 'Julgue os itens a seguir', 111, '2017-11-30', 1, '1');
INSERT INTO `estreaming`.`tb_v_f` (`cod_assunto`, `sts_v_f`, `idt_vf`, `txt_enunciado`, `ord_v_f`, `dta_insercao`, `cod_tipo_questao`, `flg_finalizada`) VALUES (1, 1, 2, 'Julgue os itens a seguir', 000, '2017-11-30', 1, '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_v_f_alternativas`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_v_f_alternativas` (`idt_v_f_alternativas`, `txt_item`, `vlr_v_f`, `cod_v_f`, `sts_v_f_alternativas`) VALUES (1, '1+1=2', 1, 1, 1);
INSERT INTO `estreaming`.`tb_v_f_alternativas` (`idt_v_f_alternativas`, `txt_item`, `vlr_v_f`, `cod_v_f`, `sts_v_f_alternativas`) VALUES (2, '3+3=6', 1, 1, 1);
INSERT INTO `estreaming`.`tb_v_f_alternativas` (`idt_v_f_alternativas`, `txt_item`, `vlr_v_f`, `cod_v_f`, `sts_v_f_alternativas`) VALUES (3, '7+7=14', 1, 1, 1);
INSERT INTO `estreaming`.`tb_v_f_alternativas` (`idt_v_f_alternativas`, `txt_item`, `vlr_v_f`, `cod_v_f`, `sts_v_f_alternativas`) VALUES (4, '55*6=235', 0, 2, 1);
INSERT INTO `estreaming`.`tb_v_f_alternativas` (`idt_v_f_alternativas`, `txt_item`, `vlr_v_f`, `cod_v_f`, `sts_v_f_alternativas`) VALUES (5, '12*5=654', 0, 2, 1);
INSERT INTO `estreaming`.`tb_v_f_alternativas` (`idt_v_f_alternativas`, `txt_item`, `vlr_v_f`, `cod_v_f`, `sts_v_f_alternativas`) VALUES (6, '4-51=2', 0, 2, 1);

COMMIT;

