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
CREATE SCHEMA IF NOT EXISTS `estreaming` DEFAULT CHARACTER SET utf8 ;
USE `estreaming` ;

-- -----------------------------------------------------
-- Table `estreaming`.`tb_disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_disciplina` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_disciplina` (
  `idt_disciplina` INT(11) NOT NULL,
  `nme_disciplina` VARCHAR(80) NOT NULL,
  `sts_disciplina` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` DATETIME NOT NULL,
  `sem_disciplina` INT(2) NOT NULL,
  PRIMARY KEY (`idt_disciplina`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_assunto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_assunto` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_assunto` (
  `idt_assunto` INT(11) NOT NULL,
  `txt_tema_assunto` TEXT NOT NULL,
  `cod_disciplina` INT(11) NOT NULL,
  `dta_insercao` DATETIME NOT NULL,
  `sts_assunto` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `idt_usuario_criador` INT(11) NOT NULL,
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
  `tpo_midia` CHAR(1) NOT NULL COMMENT '0 = Texto; 1 = Vídeo; 2 = Áudio; 3 = Imagem.',
  `sts_tipo_midia` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_tipo_midia`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `estreaming`.`tb_midia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estreaming`.`tb_midia` ;

CREATE TABLE IF NOT EXISTS `estreaming`.`tb_midia` (
  `idt_midia` INT(11) NOT NULL,
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
  `idt_questao` INT(11) NOT NULL,
  `cod_assunto` INT(11) NOT NULL,
  `cod_midia` INT(11) NOT NULL,
  `sts_assunto_midia` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_questao`, `cod_assunto`, `cod_midia`),
  INDEX `fk_atividades_has_media_media1_idx` (`cod_midia` ASC),
  INDEX `fk_atividades_has_media_atividades1_idx` (`idt_questao` ASC, `cod_assunto` ASC),
  INDEX `fk_atividades_has_media_atividades1` (`cod_assunto` ASC),
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
AUTO_INCREMENT = 4
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
  `idt_curso` INT(11) NOT NULL,
  `nme_curso` VARCHAR(80) NOT NULL,
  `sts_curso` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `cod_faculdade` INT(11) NOT NULL,
  `dta_insercao` DATETIME NOT NULL,
  `qtd_semestres` INT(2) NOT NULL,
  `idt_usuario_coordenador` VARCHAR(45) NULL DEFAULT NULL,
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
AUTO_INCREMENT = 8
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
AUTO_INCREMENT = 5
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
AUTO_INCREMENT = 3
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
AUTO_INCREMENT = 3
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
AUTO_INCREMENT = 3
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
AUTO_INCREMENT = 5
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
AUTO_INCREMENT = 3
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
AUTO_INCREMENT = 5
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
AUTO_INCREMENT = 3
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
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
