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
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (1, 'Arquitetura de Sistemas Distribuídos', 1, '2006-04-12 13:47:36', 7);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (2, 'Desenvolvimento WEB', 1, '2006-04-12 13:47:36', 5);
INSERT INTO `estreaming`.`tb_disciplina` (`idt_disciplina`, `nme_disciplina`, `sts_disciplina`, `dta_insercao`, `sem_disciplina`) VALUES (3, 'Direito Canônico', 1, '2006-04-12 13:47:36', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_assunto`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (1, 'O texto é sobre uma parada louca. O bagulho é doido', 1, '2006-04-12 13:47:36', 1, 1, 10);
INSERT INTO `estreaming`.`tb_assunto` (`idt_assunto`, `txt_tema_assunto`, `cod_disciplina`, `dta_insercao`, `sts_assunto`, `cod_usuario_criador`, `qtd_atividades`) VALUES (2, 'Texto de teste para testar os testes do texto.', 2, '2006-04-12 13:47:36', 1, 1, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_instituicao`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_instituicao` (`idt_instituicao`, `cnpj_instituicao`, `nme_instituicao`, `end_instituicao`, `cep_instituicao`, `tel_instituicao_1`, `tel_instituicao_2`, `eml_instituicao`, `url_instituicao`, `dta_insercao`, `sts_instituicao`, `razao_social`) VALUES (1, '43243246000134', 'UniCEUB', 'SHCES 707/907 norte', '72333434', '65456456', '54646456', 'uniceub@uniceub.br', 'https://www.uniceub.br', '2006-04-12 13:47:36', 1, 'UniCEUB');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_faculdade`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`, `cod_usuario_admin`) VALUES (1, 'FATECS', 1, 1, '2006-04-12 13:47:36', '1');
INSERT INTO `estreaming`.`tb_faculdade` (`idt_faculdade`, `nme_faculdade`, `cod_instituicao`, `sts_faculdade`, `dta_insercao`, `cod_usuario_admin`) VALUES (2, 'FACES', 1, 1, '2006-04-12 13:47:36', '2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_curso`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`, `qtd_semestres`, `cod_usuario_coordenador`) VALUES (1, 'Ciência da Computação', 1, 1, '2006-04-12 13:47:36', 8, '1');
INSERT INTO `estreaming`.`tb_curso` (`idt_curso`, `nme_curso`, `sts_curso`, `cod_faculdade`, `dta_insercao`, `qtd_semestres`, `cod_usuario_coordenador`) VALUES (2, 'Direito', 1, 2, '2006-04-12 13:47:36', 10, '2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`ta_disciplina_cursos`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (1, 1, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (2, 1, 1);
INSERT INTO `estreaming`.`ta_disciplina_cursos` (`cod_disciplina`, `cod_curso`, `sts_disciplina_cursos`) VALUES (3, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (1, '09090909090', 'Teste', 'a@a.com', '123', '4', '2006-04-12 13:47:36', 1, '1', 44344434);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (2, '25225252525', 'Jonilson', 'teste@teste.com', '123', '4', '2006-04-12 13:47:36', 1, '1', 34343434);
INSERT INTO `estreaming`.`tb_usuario` (`idt_usuario`, `cpf_usuario`, `nme_usuario`, `eml_usuario`, `pwd_usuario`, `tpo_usuario`, `dta_insercao`, `sts_usuario`, `lgn_especial`, `tel_usuario`) VALUES (3, '09650605965', 'Aluno', 'a.luno@teste.com', '123', '4', '2006-04-12 13:47:36', 1, '1', 65465655);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`ta_usuario_cursos`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`ta_usuario_cursos` (`cod_curso`, `cod_usuario`, `sts_usuario_cursos`, `dta_insercao`) VALUES (1, 3, 1, '2006-04-12 13:47:36');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`ta_usuario_faculdade`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`ta_usuario_faculdade` (`cod_usuario`, `cod_faculdade`, `sts_usuario_faculdade`) VALUES (3, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_tipo_questao`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`, `nme_tipo_questao`) VALUES (1, 'Múltipla Escolha');
INSERT INTO `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`, `nme_tipo_questao`) VALUES (2, 'Verdadeiro ou Falso');
INSERT INTO `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`, `nme_tipo_questao`) VALUES (3, 'Completar');
INSERT INTO `estreaming`.`tb_tipo_questao` (`idt_tipo_questao`, `nme_tipo_questao`) VALUES (4, 'Somatório');

COMMIT;


-- -----------------------------------------------------
-- Data for table `estreaming`.`tb_notas`
-- -----------------------------------------------------
START TRANSACTION;
USE `estreaming`;
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (3, 1, 8);
INSERT INTO `estreaming`.`tb_notas` (`cod_usuario`, `cod_assunto`, `nota`) VALUES (3, 2, 5);

COMMIT;

