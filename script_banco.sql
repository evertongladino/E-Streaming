-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema eduflix
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `eduflix` ;

-- -----------------------------------------------------
-- Schema eduflix
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eduflix` DEFAULT CHARACTER SET utf8 ;
USE `eduflix` ;

-- -----------------------------------------------------
-- Table `eduflix`.`tb_disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_disciplina` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_disciplina` (
  `idt_disciplina` INT NOT NULL,
  `nme_disciplina` VARCHAR(80) NOT NULL,
  `sts_disciplina` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` DATE NOT NULL,
  `sem_disciplina` INT(2) NOT NULL,
  PRIMARY KEY (`idt_disciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_assunto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_assunto` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_assunto` (
  `idt_assunto` INT NOT NULL,
  `txt_tema_assunto` TEXT NOT NULL,
  `cod_disciplina` INT NOT NULL,
  `dta_insercao` DATE NOT NULL,
  `sts_assunto` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_assunto`),
  INDEX `fk_atividades_disciplina1_idx` (`cod_disciplina` ASC),
  CONSTRAINT `fk_atividades_disciplina1`
    FOREIGN KEY (`cod_disciplina`)
    REFERENCES `eduflix`.`tb_disciplina` (`idt_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_mult_escolha`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_mult_escolha` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_mult_escolha` (
  `txt_enunciado` TEXT NOT NULL,
  `cod_assunto` INT NOT NULL,
  `sts_mult_escolha` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `idt_mult_escolha` INT NOT NULL AUTO_INCREMENT,
  `ord_mult_escolha` INT NOT NULL,
  `dta_insercao` DATE NOT NULL,
  `vlr_questao` VARCHAR(45) NOT NULL COMMENT '\n',
  INDEX `fk_mult_escolha_atividades1_idx` (`cod_assunto` ASC),
  PRIMARY KEY (`idt_mult_escolha`),
  CONSTRAINT `fk_mult_escolha_atividades1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `eduflix`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_v_f`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_v_f` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_v_f` (
  `cod_assunto` INT NOT NULL,
  `sts_v_f` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `idt_vf` INT NOT NULL AUTO_INCREMENT,
  `txt_enunciado` TEXT NOT NULL,
  `ord_v_f` INT NOT NULL,
  `dta_insercao` DATE NOT NULL,
  INDEX `fk_V_F_atividades1_idx` (`cod_assunto` ASC),
  PRIMARY KEY (`idt_vf`),
  CONSTRAINT `fk_V_F_atividades1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `eduflix`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_completar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_completar` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_completar` (
  `txt_enunciado` TEXT NOT NULL,
  `cod_assunto` INT NOT NULL,
  `sts_completar` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `idt_completar` INT NOT NULL AUTO_INCREMENT,
  `ord_completar` INT NOT NULL,
  `qtd_campos` INT NOT NULL,
  `txt_frase` TEXT NOT NULL,
  `dta_insercao` DATE NOT NULL,
  INDEX `fk_completar_atividades1_idx` (`cod_assunto` ASC),
  PRIMARY KEY (`idt_completar`),
  CONSTRAINT `fk_completar_atividades1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `eduflix`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_somatorio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_somatorio` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_somatorio` (
  `idt_somatorio` INT NOT NULL AUTO_INCREMENT,
  `txt_enunciado` TEXT NOT NULL,
  `cod_assunto` INT NOT NULL,
  `sts_somatorio` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `soma` INT NOT NULL,
  `ord_somatorio` INT NOT NULL,
  `dta_insercao` DATE NOT NULL,
  INDEX `fk_somatorio_atividades1_idx` (`cod_assunto` ASC),
  PRIMARY KEY (`idt_somatorio`),
  CONSTRAINT `fk_somatorio_atividades1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `eduflix`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_usuario` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_usuario` (
  `idt_usuario` INT NOT NULL AUTO_INCREMENT,
  `cpf_usuario` VARCHAR(11) NOT NULL,
  `nme_usuario` VARCHAR(80) NOT NULL,
  `eml_usuario` VARCHAR(80) NOT NULL,
  `pwd_usuario` VARCHAR(128) NOT NULL,
  `tpo_usuario` CHAR(1) NOT NULL COMMENT 'Tipos: Aluno:0, Professor:1, Coordenador de curso:2, Coordenador de faculdade:3, Coordenador da instituição:4.\n',
  `dta_insercao` DATE NOT NULL,
  `sts_usuario` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `lgn_especial` VARCHAR(20) NULL COMMENT 'Esse campo determina se um usuário possui mais permissões para alterar configurações no sistema(campo para marcar no cadastro).',
  `tel_usuario` INT NOT NULL,
  PRIMARY KEY (`idt_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_instituicao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_instituicao` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_instituicao` (
  `idt_instituicao` INT NOT NULL AUTO_INCREMENT,
  `cnpj_instituicao` VARCHAR(18) NOT NULL,
  `nme_instituicao` VARCHAR(80) NOT NULL,
  `end_instituicao` VARCHAR(100) NOT NULL,
  `cep_instituicao` VARCHAR(10) NOT NULL,
  `tel_instituicao_1` INT NOT NULL,
  `tel_instituicao_2` INT NULL,
  `eml_instituicao` VARCHAR(80) NOT NULL,
  `url_instituicao` VARCHAR(80) NULL,
  `dta_insercao` DATE NOT NULL,
  `sts_instituicao` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `razao_social` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idt_instituicao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_faculdade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_faculdade` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_faculdade` (
  `idt_faculdade` INT NOT NULL AUTO_INCREMENT,
  `nme_faculdade` VARCHAR(45) NOT NULL,
  `cod_instituicao` INT NOT NULL,
  `sts_faculdade` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` DATE NOT NULL,
  PRIMARY KEY (`idt_faculdade`),
  INDEX `fk_faculdade_instituicao1_idx` (`cod_instituicao` ASC),
  CONSTRAINT `fk_faculdade_instituicao1`
    FOREIGN KEY (`cod_instituicao`)
    REFERENCES `eduflix`.`tb_instituicao` (`idt_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_tipo_midia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_tipo_midia` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_tipo_midia` (
  `idt_tipo_midia` INT NOT NULL AUTO_INCREMENT,
  `tpo_midia` CHAR(1) NOT NULL COMMENT '0 = Texto; 1 = Vídeo; 2 = Áudio; 3 = Imagem.',
  `sts_tipo_midia` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_tipo_midia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_midia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_midia` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_midia` (
  `idt_midia` INT NOT NULL,
  `txt_caminho` TEXT NOT NULL,
  `cod_tipo_midia` INT NOT NULL,
  `sts_midia` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` DATE NOT NULL,
  PRIMARY KEY (`idt_midia`),
  INDEX `fk_media_tipo_media1_idx` (`cod_tipo_midia` ASC),
  CONSTRAINT `fk_media_tipo_media1`
    FOREIGN KEY (`cod_tipo_midia`)
    REFERENCES `eduflix`.`tb_tipo_midia` (`idt_tipo_midia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_curso` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_curso` (
  `idt_curso` INT NOT NULL,
  `nme_curso` VARCHAR(80) NOT NULL,
  `sts_curso` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `cod_faculdade` INT NOT NULL,
  `dta_insercao` DATE NOT NULL,
  PRIMARY KEY (`idt_curso`),
  INDEX `fk_curso_faculdade1_idx` (`cod_faculdade` ASC),
  CONSTRAINT `fk_curso_faculdade1`
    FOREIGN KEY (`cod_faculdade`)
    REFERENCES `eduflix`.`tb_faculdade` (`idt_faculdade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`ta_usuario_faculdade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`ta_usuario_faculdade` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`ta_usuario_faculdade` (
  `cod_usuario` INT NOT NULL,
  `cod_faculdade` INT NOT NULL,
  `sts_usuario_faculdade` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  INDEX `fk_usuario_has_faculdade_faculdade1_idx` (`cod_faculdade` ASC),
  INDEX `fk_usuario_has_faculdade_usuario1_idx` (`cod_usuario` ASC),
  CONSTRAINT `fk_usuario_has_faculdade_usuario1`
    FOREIGN KEY (`cod_usuario`)
    REFERENCES `eduflix`.`tb_usuario` (`idt_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_faculdade_faculdade1`
    FOREIGN KEY (`cod_faculdade`)
    REFERENCES `eduflix`.`tb_faculdade` (`idt_faculdade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`ta_usuario_cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`ta_usuario_cursos` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`ta_usuario_cursos` (
  `cod_curso` INT NOT NULL,
  `cod_usuario` INT NOT NULL,
  `sts_usuario_cursos` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  `dta_insercao` DATE NOT NULL,
  INDEX `fk_curso_has_usuario_usuario1_idx` (`cod_usuario` ASC),
  INDEX `fk_curso_has_usuario_curso1_idx` (`cod_curso` ASC),
  CONSTRAINT `fk_curso_has_usuario_curso1`
    FOREIGN KEY (`cod_curso`)
    REFERENCES `eduflix`.`tb_curso` (`idt_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_has_usuario_usuario1`
    FOREIGN KEY (`cod_usuario`)
    REFERENCES `eduflix`.`tb_usuario` (`idt_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`ta_disciplina_cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`ta_disciplina_cursos` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`ta_disciplina_cursos` (
  `cod_disciplina` INT NOT NULL,
  `cod_curso` INT NOT NULL,
  `sts_disciplina_cursos` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  INDEX `fk_disciplina_has_curso_curso1_idx` (`cod_curso` ASC),
  INDEX `fk_disciplina_has_curso_disciplina1_idx` (`cod_disciplina` ASC),
  CONSTRAINT `fk_disciplina_has_curso_disciplina1`
    FOREIGN KEY (`cod_disciplina`)
    REFERENCES `eduflix`.`tb_disciplina` (`idt_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplina_has_curso_curso1`
    FOREIGN KEY (`cod_curso`)
    REFERENCES `eduflix`.`tb_curso` (`idt_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`ta_assunto_midia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`ta_assunto_midia` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`ta_assunto_midia` (
  `idt_questao` INT NOT NULL,
  `cod_assunto` INT NOT NULL,
  `cod_midia` INT NOT NULL,
  `sts_assunto_midia` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_questao`, `cod_assunto`, `cod_midia`),
  INDEX `fk_atividades_has_media_media1_idx` (`cod_midia` ASC),
  INDEX `fk_atividades_has_media_atividades1_idx` (`idt_questao` ASC, `cod_assunto` ASC),
  CONSTRAINT `fk_atividades_has_media_atividades1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `eduflix`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atividades_has_media_media1`
    FOREIGN KEY (`cod_midia`)
    REFERENCES `eduflix`.`tb_midia` (`idt_midia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_mult_alternativas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_mult_alternativas` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_mult_alternativas` (
  `idt_alternativas` INT NOT NULL AUTO_INCREMENT,
  `txt_item` TEXT NOT NULL,
  `correto` TINYINT(1) NOT NULL COMMENT '1= certo\n0= errado',
  `cod_mult_escolha` INT NOT NULL,
  `sts_mult_alternativas` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_alternativas`),
  INDEX `fk_mult_alternativas_mult_escolha1_idx` (`cod_mult_escolha` ASC),
  CONSTRAINT `fk_mult_alternativas_mult_escolha1`
    FOREIGN KEY (`cod_mult_escolha`)
    REFERENCES `eduflix`.`tb_mult_escolha` (`idt_mult_escolha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_v_f_alternativas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_v_f_alternativas` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_v_f_alternativas` (
  `idt_v_f_alternativas` INT NOT NULL AUTO_INCREMENT,
  `txt_item` TEXT NOT NULL,
  `vlr_v_f` TINYINT(1) NOT NULL COMMENT '1=v\n0=f',
  `cod_v_f` INT NOT NULL,
  `sts_v_f_alternativas` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_v_f_alternativas`),
  INDEX `fk_V_F_alternativas_V_F1_idx` (`cod_v_f` ASC),
  CONSTRAINT `fk_V_F_alternativas_V_F1`
    FOREIGN KEY (`cod_v_f`)
    REFERENCES `eduflix`.`tb_v_f` (`idt_vf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_somatorio_alternativas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_somatorio_alternativas` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_somatorio_alternativas` (
  `idt_somatorio_alternativas` INT NOT NULL AUTO_INCREMENT,
  `txt_item` TEXT NOT NULL,
  `vlr_somatorio_alternativas` INT NOT NULL,
  `cod_somatorio` INT NOT NULL,
  `sts_somatorio_alternativas` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_somatorio_alternativas`),
  INDEX `fk_somatorio_alternativas_somatorio1_idx` (`cod_somatorio` ASC),
  CONSTRAINT `fk_somatorio_alternativas_somatorio1`
    FOREIGN KEY (`cod_somatorio`)
    REFERENCES `eduflix`.`tb_somatorio` (`idt_somatorio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_completar_alternativas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_completar_alternativas` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_completar_alternativas` (
  `idt_completar_alternativas` INT NOT NULL AUTO_INCREMENT,
  `ord_completar_alternativas` INT NOT NULL COMMENT 'Ordem das palavras na frase',
  `txt_palavra` TEXT NOT NULL,
  `cod_completar` INT NOT NULL,
  `sts_completar_alternativas` TINYINT(1) NOT NULL COMMENT 'True = Ativo; False = Inativo.',
  PRIMARY KEY (`idt_completar_alternativas`),
  INDEX `fk_completar_alternativas_completar1_idx` (`cod_completar` ASC),
  CONSTRAINT `fk_completar_alternativas_completar1`
    FOREIGN KEY (`cod_completar`)
    REFERENCES `eduflix`.`tb_completar` (`idt_completar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eduflix`.`tb_notas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eduflix`.`tb_notas` ;

CREATE TABLE IF NOT EXISTS `eduflix`.`tb_notas` (
  `cod_usuario` INT NOT NULL,
  `cod_assunto` INT NOT NULL,
  `nota` FLOAT NOT NULL,
  INDEX `fk_table1_tb_usuario1_idx` (`cod_usuario` ASC),
  INDEX `fk_tb_notas_tb_assunto1_idx` (`cod_assunto` ASC),
  PRIMARY KEY (`cod_usuario`, `cod_assunto`),
  CONSTRAINT `fk_table1_tb_usuario1`
    FOREIGN KEY (`cod_usuario`)
    REFERENCES `eduflix`.`tb_usuario` (`idt_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_notas_tb_assunto1`
    FOREIGN KEY (`cod_assunto`)
    REFERENCES `eduflix`.`tb_assunto` (`idt_assunto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `eduflix`.`tb_disciplina`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (1, 'Portugues', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (2, 'Matematica', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (3, 'Sociologia', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (4, 'Etica I', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (5, 'Etica II', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (6, 'Algebra', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (7, 'Calculo I', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (8, 'Calculo II', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (9, 'Fisica I', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (10, 'Fisica II', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (11, 'Desenvolvimento web', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (12, 'LTP I', 1, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (13, 'LTP II', 1, DEFAULT, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `eduflix`.`tb_assunto`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`) VALUES (1, 'V ou F', 1, DEFAULT, 1);
INSERT INTO `eduflix`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`) VALUES (2, 'Dissertativa', 1, DEFAULT, 1);
INSERT INTO `eduflix`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`) VALUES (3, 'ligar_pontos', 3, DEFAULT, 1);
INSERT INTO `eduflix`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`) VALUES (4, 'somatorio', 3, DEFAULT, 1);
INSERT INTO `eduflix`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`) VALUES (5, 'mult_escolha', 4, DEFAULT, 1);
INSERT INTO `eduflix`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`) VALUES (6, 'Completar', 4, DEFAULT, 1);
INSERT INTO `eduflix`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`) VALUES (7, 'ler_codigo', 5, DEFAULT, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `eduflix`.`tb_v_f`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`tb_v_f` (`cod_assunto`, `sts_v_f`, `idt_vf`, `txt_enunciado`, `ord_v_f`, `dta_insercao`) VALUES (1, 1, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_v_f` (`cod_assunto`, `sts_v_f`, `idt_vf`, `txt_enunciado`, `ord_v_f`, `dta_insercao`) VALUES (1, 1, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `eduflix`.`tb_completar`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`tb_completar` (`txt_enunciado`, `cod_assunto`, `sts_completar`, `idt_completar`, `ord_completar`, `qtd_campos`, `txt_frase`, `dta_insercao`) VALUES ('Nos braços da mãe', 2, 1, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_completar` (`txt_enunciado`, `cod_assunto`, `sts_completar`, `idt_completar`, `ord_completar`, `qtd_campos`, `txt_frase`, `dta_insercao`) VALUES ('vai cair na rua', 2, 1, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `eduflix`.`tb_somatorio`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`tb_somatorio` (`idt_somatorio`, `txt_enunciado`, `cod_assunto`, `sts_somatorio`, `soma`, `ord_somatorio`, `dta_insercao`) VALUES (1, 'Qual é a metade de 2 mais 2?', 2, 1, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO `eduflix`.`tb_somatorio` (`idt_somatorio`, `txt_enunciado`, `cod_assunto`, `sts_somatorio`, `soma`, `ord_somatorio`, `dta_insercao`) VALUES (2, 'O que pato faz?', 2, 1, DEFAULT, DEFAULT, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `eduflix`.`tb_usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (1, '21485255', 'Bigo Bago', 'Bigo_bugao@gmail.com', '123', '0', DEFAULT, 1, NULL, DEFAULT);
INSERT INTO `eduflix`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (2, '21554821', 'Bugão', 'Bugao@gmail.com', '132', '0', DEFAULT, 1, NULL, DEFAULT);
INSERT INTO `eduflix`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (3, '10256461', 'Foina', 'Foina_ak47@hotmail.com', '1354', '2', DEFAULT, 1, NULL, DEFAULT);
INSERT INTO `eduflix`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (4, '20051618', 'Hiragi', 'Hiragi@Hiragi.hiragi', '5611', '1', DEFAULT, 1, NULL, DEFAULT);
INSERT INTO `eduflix`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (5, '12516051', 'Lucio Pires', 'Pires.1@gmail.com', '58216', '3', DEFAULT, 1, NULL, DEFAULT);
INSERT INTO `eduflix`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (6, '51561751', 'Matheus Doido', 'com.gmail@Matheus', '512', '4', DEFAULT, 1, NULL, DEFAULT);
INSERT INTO `eduflix`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (7, '51897581', 'Nojera', 'Nojerao@gerao.com', '9877', '1', DEFAULT, 1, NULL, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `eduflix`.`tb_instituicao`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`tb_instituicao` (`idt_instituicao`, `cnpj_instituicao`, `nme_instituicao`, `end_instituicao`, `cep_instituicao`, `tel_instituicao_1`, `tel_instituicao_2`, `eml_instituicao`, `url_instituicao`, `dta_insercao`, `sts_instituicao`, `razao_social`) VALUES (1, '98374637264', 'Escola feliz', 'area especial 02', '72750014', 61987348377, 619849338274, 'escolafeliz@gmail.com', 'www.escolafeliz.com', DEFAULT, 1, DEFAULT);
INSERT INTO `eduflix`.`tb_instituicao` (`idt_instituicao`, `cnpj_instituicao`, `nme_instituicao`, `end_instituicao`, `cep_instituicao`, `tel_instituicao_1`, `tel_instituicao_2`, `eml_instituicao`, `url_instituicao`, `dta_insercao`, `sts_instituicao`, `razao_social`) VALUES (2, '64738274639', 'EScola triste', 'area especial 04', '72749813', 61986472748, 61304932184, 'escolatriste@pro.br', 'www.escolatriste.pro.br', DEFAULT, 1, DEFAULT);
INSERT INTO `eduflix`.`tb_instituicao` (`idt_instituicao`, `cnpj_instituicao`, `nme_instituicao`, `end_instituicao`, `cep_instituicao`, `tel_instituicao_1`, `tel_instituicao_2`, `eml_instituicao`, `url_instituicao`, `dta_insercao`, `sts_instituicao`, `razao_social`) VALUES (3, '51861456145', 'Escola Geromel', 'SQS rua 03', '72715016', 6130296648, 61304897516, 'EscolaGeromel@gmail.com', 'www.escolaGeromel@Gerominho.br', DEFAULT, 1, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `eduflix`.`tb_faculdade`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`) VALUES (1, 'FATECS', 1, 1, DEFAULT);
INSERT INTO `eduflix`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`) VALUES (2, 'FAZGAYS', 2, 1, DEFAULT);
INSERT INTO `eduflix`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`) VALUES (3, 'TPQP', 3, 1, DEFAULT);
INSERT INTO `eduflix`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`) VALUES (4, 'CPM22', 1, 1, DEFAULT);
INSERT INTO `eduflix`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`) VALUES (5, 'NX0', 2, 1, DEFAULT);
INSERT INTO `eduflix`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`) VALUES (6, 'SS', 3, 1, DEFAULT);
INSERT INTO `eduflix`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`) VALUES (7, 'BIGO', 1, 1, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `eduflix`.`tb_curso`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`) VALUES (1, 'Ciencia da Computação', 1, 1, DEFAULT);
INSERT INTO `eduflix`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`) VALUES (2, 'Arquitetura', 1, 2, DEFAULT);
INSERT INTO `eduflix`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`) VALUES (3, 'Design de Interiores', 1, 2, DEFAULT);
INSERT INTO `eduflix`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`) VALUES (4, 'Direito', 1, 5, DEFAULT);
INSERT INTO `eduflix`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`) VALUES (5, 'Física', 1, 4, DEFAULT);
INSERT INTO `eduflix`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`) VALUES (6, 'Sociologia', 1, 3, DEFAULT);
INSERT INTO `eduflix`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`) VALUES (7, 'Engenharia Civíl', 1, 5, DEFAULT);
INSERT INTO `eduflix`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`) VALUES (8, 'Engenharia Química', 1, 7, DEFAULT);
INSERT INTO `eduflix`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`) VALUES (9, 'Engenharia Economica', 1, 7, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `eduflix`.`ta_usuario_faculdade`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (1, 1, 1);
INSERT INTO `eduflix`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (2, 1, 1);
INSERT INTO `eduflix`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (3, 2, 1);
INSERT INTO `eduflix`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (4, 2, 1);
INSERT INTO `eduflix`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (5, 3, 1);
INSERT INTO `eduflix`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (6, 3, 1);
INSERT INTO `eduflix`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (7, 4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `eduflix`.`ta_usuario_cursos`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (1, 1, 1, DEFAULT);
INSERT INTO `eduflix`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (2, 2, 1, DEFAULT);
INSERT INTO `eduflix`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (3, 2, 1, DEFAULT);
INSERT INTO `eduflix`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (4, 2, 1, DEFAULT);
INSERT INTO `eduflix`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (5, 2, 1, DEFAULT);
INSERT INTO `eduflix`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (6, 2, 1, DEFAULT);
INSERT INTO `eduflix`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (7, 1, 1, DEFAULT);
INSERT INTO `eduflix`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (8, 1, 1, DEFAULT);
INSERT INTO `eduflix`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (9, 1, 1, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `eduflix`.`ta_disciplina_cursos`
-- -----------------------------------------------------
START TRANSACTION;
USE `eduflix`;
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (1, 1, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (2, 2, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (3, 3, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (4, 4, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (5, 5, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (6, 6, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (7, 7, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (8, 8, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (9, 9, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (10, 2, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (11, 1, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (12, 3, 1);
INSERT INTO `eduflix`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (13, 4, 1);

COMMIT;

