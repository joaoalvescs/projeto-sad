<<<<<<< HEAD
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dw_cinema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dw_cinema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dw_cinema` DEFAULT CHARACTER SET utf8 ;
USE `dw_cinema` ;

-- -----------------------------------------------------
-- Table `dw_cinema`.`FATO_PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_cinema`.`FATO_PRODUTO` (
  `id_prod` INT NOT NULL,
  `cod_prod` INT NOT NULL,
  `nm_prod` VARCHAR(45) NULL,
  `qtd_prod` VARCHAR(45) NULL,
  `valor_prod` DECIMAL(10,2) NULL,
  `id_end` INT NOT NULL,
  `id_tem` INT NOT NULL,
  `id_tip` INT NOT NULL,
  `id_pag` INT NOT NULL,
  `id_cli` INT NOT NULL,
  `id_pla` INT NOT NULL,
  `id_cin` INT NOT NULL,
  PRIMARY KEY (`id_prod`, `id_end`, `id_tem`, `id_tip`, `id_pag`, `id_cli`, `id_pla`, `id_cin`),
  UNIQUE INDEX `id_produto_UNIQUE` (`id_prod` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_ENDERECO_idx` (`id_end` ASC),
  UNIQUE INDEX `Id_end_UNIQUE` (`id_end` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_TEMPO1_idx` (`id_tem` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_TIPO_PRODUTO1_idx` (`id_tip` ASC),
  UNIQUE INDEX `id_tem_UNIQUE` (`id_tem` ASC),
  UNIQUE INDEX `id_tip_UNIQUE` (`id_tip` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_PAGAMENTO1_idx` (`id_pag` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_CLIENTE1_idx` (`id_cli` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_PLATAFORMA1_idx` (`id_pla` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_CINEMA1_idx` (`id_cin` ASC),
  CONSTRAINT `fk_FATO_PRODUTO_DIM_ENDERECO`
    FOREIGN KEY (`id_end`)
    REFERENCES `dw_cinema`.`DIM_ENDERECO_CLIENTE` (`id_end`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_TEMPO1`
    FOREIGN KEY (`id_tem`)
    REFERENCES `dw_cinema`.`DIM_TEMPO` (`id_tem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_TIPO_PRODUTO1`
    FOREIGN KEY (`id_tip`)
    REFERENCES `dw_cinema`.`DIM_TIPO_PRODUTO` (`id_tip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_PAGAMENTO1`
    FOREIGN KEY (`id_pag`)
    REFERENCES `dw_cinema`.`DIM_PAGAMENTO` (`id_pag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_CLIENTE1`
    FOREIGN KEY (`id_cli`)
    REFERENCES `dw_cinema`.`DIM_CLIENTE` (`id_cli`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_PLATAFORMA1`
    FOREIGN KEY (`id_pla`)
    REFERENCES `dw_cinema`.`DIM_PLATAFORMA` (`id_pla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_CINEMA1`
    FOREIGN KEY (`id_cin`)
    REFERENCES `dw_cinema`.`DIM_CINEMA` (`id_cin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_cinema`.`DIM_TEMPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_cinema`.`DIM_TEMPO` (
  `id_tem` INT NOT NULL,
  `cod_tem` VARCHAR(45) NOT NULL,
  `Dia` SMALLINT(100) NOT NULL,
  `Mes` SMALLINT(100) NOT NULL,
  `Ano` SMALLINT(100) NOT NULL,
  `NomeMes` VARCHAR(20) NOT NULL,
  `Trimestre` SMALLINT(100) NOT NULL,
  `Turno` VARCHAR(15) NOT NULL,
  `Data` DATETIME NOT NULL,
  `Nivel` VARCHAR(8) NOT NULL,
  `DiaSemana` VARCHAR(25) NOT NULL,
  `Feriado` CHAR(3) NOT NULL,
  `Diautil` CHAR(3) NOT NULL,
  `FimSemana` VARCHAR(45) NOT NULL,
  `Quinzeza` SMALLINT(100) NOT NULL,
  `FimMes` CHAR(3) NOT NULL,
  `NomeTrimestre` VARCHAR(20) NOT NULL,
  `Semestre` SMALLINT(100) NOT NULL,
  `NomeSemestre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_tem`),
  UNIQUE INDEX `id_tempo_UNIQUE` (`id_tem` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_cinema`.`DIM_CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_cinema`.`DIM_CLIENTE` (
  `id_cli` INT NOT NULL,
  `cod_cli` INT NOT NULL,
  `nm_cli` VARCHAR(45) NULL,
  `sbr_cli` VARCHAR(45) NULL,
  `dt_cli` DATE NULL,
  PRIMARY KEY (`id_cli`),
  UNIQUE INDEX `id_cliente_UNIQUE` (`id_cli` ASC))
=======
-- -----------------------------------------------------
-- Table dw_cinema.FATO_PRODUTO
-- -----------------------------------------------------
CREATE TABLE  dw_cinema.FATO_PRODUTO (
  id_prod INT NOT NULL,
  cod_prod INT NOT NULL,
  nm_prod VARCHAR(45) NULL,
  qtd_prod VARCHAR(45) NULL,
  valor_prod DECIMAL(10,2) NULL,
  id_end INT NOT NULL,
  id_tem INT NOT NULL,
  id_tip INT NOT NULL,
  id_pag INT NOT NULL,
  id_cli INT NOT NULL,
  id_pla INT NOT NULL,
  id_cin INT NOT NULL,
  PRIMARY KEY (id_prod, id_end, id_tem, id_tip, id_pag, id_cli, id_pla, id_cin),
  UNIQUE INDEX id_produto_UNIQUE (id_prod ASC),
  INDEX fk_FATO_PRODUTO_DIM_ENDERECO_idx (id_end ASC),
  UNIQUE INDEX Id_end_UNIQUE (id_end ASC),
  INDEX fk_FATO_PRODUTO_DIM_TEMPO1_idx (id_tem ASC),
  INDEX fk_FATO_PRODUTO_DIM_TIPO_PRODUTO1_idx (id_tip ASC),
  UNIQUE INDEX id_tem_UNIQUE (id_tem ASC),
  UNIQUE INDEX id_tip_UNIQUE (id_tip ASC),
  INDEX fk_FATO_PRODUTO_DIM_PAGAMENTO1_idx (id_pag ASC),
  INDEX fk_FATO_PRODUTO_DIM_CLIENTE1_idx (id_cli ASC),
  INDEX fk_FATO_PRODUTO_DIM_PLATAFORMA1_idx (id_pla ASC),
  INDEX fk_FATO_PRODUTO_DIM_CINEMA1_idx (id_cin ASC),
  CONSTRAINT fk_FATO_PRODUTO_DIM_ENDERECO
    FOREIGN KEY (id_end)
    REFERENCES dw_cinema.DIM_ENDERECO_CLIENTE (id_end)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_TEMPO1
    FOREIGN KEY (id_tem)
    REFERENCES dw_cinema.DIM_TEMPO (id_tem)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_TIPO_PRODUTO1
    FOREIGN KEY (id_tip)
    REFERENCES dw_cinema.DIM_TIPO_PRODUTO (id_tip)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_PAGAMENTO1
    FOREIGN KEY (id_pag)
    REFERENCES dw_cinema.DIM_PAGAMENTO (id_pag)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_CLIENTE1
    FOREIGN KEY (id_cli)
    REFERENCES dw_cinema.DIM_CLIENTE (id_cli)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_PLATAFORMA1
    FOREIGN KEY (id_pla)
    REFERENCES dw_cinema.DIM_PLATAFORMA (id_pla)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_CINEMA1
    FOREIGN KEY (id_cin)
    REFERENCES dw_cinema.DIM_CINEMA (id_cin)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Table dw_cinema.DIM_TEMPO
-- -----------------------------------------------------
CREATE TABLE DIM_TEMPO (
  id_tem INT NOT NULL,
  cod_tem VARCHAR(45) NOT NULL,
  Dia SMALLINT(100) NOT NULL,
  Mes SMALLINT(100) NOT NULL,
  Ano SMALLINT(100) NOT NULL,
  NomeMes VARCHAR(20) NOT NULL,
  Trimestre SMALLINT(100) NOT NULL,
  Turno VARCHAR(15) NOT NULL,
  Data DATETIME NOT NULL,
  Nivel VARCHAR(8) NOT NULL,
  DiaSemana VARCHAR(25) NOT NULL,
  Feriado CHAR(3) NOT NULL,
  Diautil CHAR(3) NOT NULL,
  FimSemana VARCHAR(45) NOT NULL,
  Quinzeza SMALLINT(100) NOT NULL,
  FimMes CHAR(3) NOT NULL,
  NomeTrimestre VARCHAR(20) NOT NULL,
  Semestre SMALLINT(100) NOT NULL,
  NomeSemestre VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_tem))

-- -----------------------------------------------------
-- Table dw_cinema.DIM_CLIENTE
-- -----------------------------------------------------
CREATE TABLE DIM_CLIENTE (
  id_cli INT NOT NULL,
  cod_cli INT NOT NULL,
  nm_cli VARCHAR(45) NULL,
  sbr_cli VARCHAR(45) NULL,
  dt_cli DATE NULL,
  PRIMARY KEY (id_cli),
  UNIQUE INDEX id_cliente_UNIQUE (id_cli ASC))
>>>>>>> 5dc9a7607b2757a9f58aa5e61234de7806eb7b50
ENGINE = InnoDB;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `dw_cinema`.`DIM_ENDERECO_CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_cinema`.`DIM_ENDERECO_CLIENTE` (
  `id_end` INT NOT NULL,
  `cod_end` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `cep` VARCHAR(15) NULL,
  PRIMARY KEY (`id_end`),
  UNIQUE INDEX `id_endereco_UNIQUE` (`id_end` ASC))
=======
-- Table dw_cinema.DIM_ENDERECO_CLIENTE
-- -----------------------------------------------------
CREATE TABLE DIM_ENDERECO_CLIENTE (
  id_end INT NOT NULL,
  cod_end VARCHAR(45) NOT NULL,
  rua VARCHAR(45) NULL,
  numero VARCHAR(45) NULL,
  cidade VARCHAR(45) NULL,
  bairro VARCHAR(45) NULL,
  estado VARCHAR(45) NULL,
  cep VARCHAR(15) NULL,
  PRIMARY KEY (id_end),
  UNIQUE INDEX id_endereco_UNIQUE (id_end ASC))
>>>>>>> 5dc9a7607b2757a9f58aa5e61234de7806eb7b50
ENGINE = InnoDB;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `dw_cinema`.`DIM_PLATAFORMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_cinema`.`DIM_PLATAFORMA` (
  `id_pla` INT NOT NULL,
  `cod_pla` INT NOT NULL,
  `tipo_pla` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pla`),
  UNIQUE INDEX `id_plataforma_UNIQUE` (`id_pla` ASC))
=======
-- Table dw_cinema.DIM_PLATAFORMA
-- -----------------------------------------------------
CREATE TABLE  DIM_PLATAFORMA (
  id_pla INT NOT NULL,
  cod_pla INT NOT NULL,
  tipo_pla VARCHAR(45) NULL,
  PRIMARY KEY (id_pla),
  UNIQUE INDEX id_plataforma_UNIQUE (id_pla ASC))
>>>>>>> 5dc9a7607b2757a9f58aa5e61234de7806eb7b50
ENGINE = InnoDB;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `dw_cinema`.`DIM_TIPO_PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_cinema`.`DIM_TIPO_PRODUTO` (
  `id_tip` INT NOT NULL,
  `cod_tip` VARCHAR(45) NOT NULL,
  `tipo_tip` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tip`),
  UNIQUE INDEX `id_tempo_UNIQUE` (`id_tip` ASC))
=======
-- Table dw_cinema.DIM_TIPO_PRODUTO
-- -----------------------------------------------------
CREATE TABLE DIM_TIPO_PRODUTO (
  id_tip INT NOT NULL,
  cod_tip VARCHAR(45) NOT NULL,
  tipo_tip VARCHAR(45) NULL,
  PRIMARY KEY (id_tip),
  UNIQUE INDEX id_tempo_UNIQUE (id_tip ASC))
>>>>>>> 5dc9a7607b2757a9f58aa5e61234de7806eb7b50
ENGINE = InnoDB;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `dw_cinema`.`DIM_PAGAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_cinema`.`DIM_PAGAMENTO` (
  `id_pag` INT NOT NULL,
  `cod_pag` INT NOT NULL,
  `tipo_pag` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pag`),
  UNIQUE INDEX `id_pagamento_UNIQUE` (`id_pag` ASC))
=======
-- Table dw_cinema.DIM_PAGAMENTO
-- -----------------------------------------------------
CREATE TABLE  DIM_PAGAMENTO (
  id_pag INT NOT NULL,
  cod_pag INT NOT NULL,
  tipo_pag VARCHAR(45) NULL,
  PRIMARY KEY (id_pag),
  UNIQUE INDEX id_pagamento_UNIQUE (id_pag ASC))
>>>>>>> 5dc9a7607b2757a9f58aa5e61234de7806eb7b50
ENGINE = InnoDB;


-- -----------------------------------------------------
<<<<<<< HEAD
-- Table `dw_cinema`.`DIM_CINEMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_cinema`.`DIM_CINEMA` (
  `id_cin` INT NOT NULL,
  `nome_cin` VARCHAR(45) NOT NULL,
  `desc_cin` VARCHAR(100) NULL,
  PRIMARY KEY (`id_cin`));


-- -----------------------------------------------------
-- Table `dw_cinema`.`FATO_PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_cinema`.`FATO_PRODUTO` (
  `id_prod` INT NOT NULL,
  `cod_prod` INT NOT NULL,
  `nm_prod` VARCHAR(45) NULL,
  `qtd_prod` VARCHAR(45) NULL,
  `valor_prod` DECIMAL(10,2) NULL,
  `id_end` INT NOT NULL,
  `id_tem` INT NOT NULL,
  `id_tip` INT NOT NULL,
  `id_pag` INT NOT NULL,
  `id_cli` INT NOT NULL,
  `id_pla` INT NOT NULL,
  `id_cin` INT NOT NULL,
  PRIMARY KEY (`id_prod`, `id_end`, `id_tem`, `id_tip`, `id_pag`, `id_cli`, `id_pla`, `id_cin`),
  UNIQUE INDEX `id_produto_UNIQUE` (`id_prod` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_ENDERECO_idx` (`id_end` ASC),
  UNIQUE INDEX `Id_end_UNIQUE` (`id_end` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_TEMPO1_idx` (`id_tem` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_TIPO_PRODUTO1_idx` (`id_tip` ASC),
  UNIQUE INDEX `id_tem_UNIQUE` (`id_tem` ASC),
  UNIQUE INDEX `id_tip_UNIQUE` (`id_tip` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_PAGAMENTO1_idx` (`id_pag` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_CLIENTE1_idx` (`id_cli` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_PLATAFORMA1_idx` (`id_pla` ASC),
  INDEX `fk_FATO_PRODUTO_DIM_CINEMA1_idx` (`id_cin` ASC),
  CONSTRAINT `fk_FATO_PRODUTO_DIM_ENDERECO`
    FOREIGN KEY (`id_end`)
    REFERENCES `dw_cinema`.`DIM_ENDERECO_CLIENTE` (`id_end`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_TEMPO1`
    FOREIGN KEY (`id_tem`)
    REFERENCES `dw_cinema`.`DIM_TEMPO` (`id_tem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_TIPO_PRODUTO1`
    FOREIGN KEY (`id_tip`)
    REFERENCES `dw_cinema`.`DIM_TIPO_PRODUTO` (`id_tip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_PAGAMENTO1`
    FOREIGN KEY (`id_pag`)
    REFERENCES `dw_cinema`.`DIM_PAGAMENTO` (`id_pag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_CLIENTE1`
    FOREIGN KEY (`id_cli`)
    REFERENCES `dw_cinema`.`DIM_CLIENTE` (`id_cli`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_PLATAFORMA1`
    FOREIGN KEY (`id_pla`)
    REFERENCES `dw_cinema`.`DIM_PLATAFORMA` (`id_pla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_PRODUTO_DIM_CINEMA1`
    FOREIGN KEY (`id_cin`)
    REFERENCES `dw_cinema`.`DIM_CINEMA` (`id_cin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
=======
-- Table dw_cinema.DIM_CINEMA
-- -----------------------------------------------------
CREATE TABLE DIM_CINEMA (
  id_cin INT NOT NULL,
  nome_cin VARCHAR(45) NOT NULL,
  desc_cin VARCHAR(100) NULL,
  PRIMARY KEY (id_cin));


-- -----------------------------------------------------
-- Table dw_cinema.FATO_PRODUTO
-- -----------------------------------------------------
CREATE TABLE  FATO_PRODUTO (
  id_prod INT NOT NULL,
  cod_prod INT NOT NULL,
  nm_prod VARCHAR(45) NULL,
  qtd_prod VARCHAR(45) NULL,
  valor_prod DECIMAL(10,2) NULL,
  id_end INT NOT NULL,
  id_tem INT NOT NULL,
  id_tip INT NOT NULL,
  id_pag INT NOT NULL,
  id_cli INT NOT NULL,
  id_pla INT NOT NULL,
  id_cin INT NOT NULL,
  PRIMARY KEY (id_prod, id_end, id_tem, id_tip, id_pag, id_cli, id_pla, id_cin),
  UNIQUE INDEX id_produto_UNIQUE (id_prod ASC),
  INDEX fk_FATO_PRODUTO_DIM_ENDERECO_idx (id_end ASC),
  UNIQUE INDEX Id_end_UNIQUE (id_end ASC),
  INDEX fk_FATO_PRODUTO_DIM_TEMPO1_idx (id_tem ASC),
  INDEX fk_FATO_PRODUTO_DIM_TIPO_PRODUTO1_idx (id_tip ASC),
  UNIQUE INDEX id_tem_UNIQUE (id_tem ASC),
  UNIQUE INDEX id_tip_UNIQUE (id_tip ASC),
  INDEX fk_FATO_PRODUTO_DIM_PAGAMENTO1_idx (id_pag ASC),
  INDEX fk_FATO_PRODUTO_DIM_CLIENTE1_idx (id_cli ASC),
  INDEX fk_FATO_PRODUTO_DIM_PLATAFORMA1_idx (id_pla ASC),
  INDEX fk_FATO_PRODUTO_DIM_CINEMA1_idx (id_cin ASC),
  CONSTRAINT fk_FATO_PRODUTO_DIM_ENDERECO
    FOREIGN KEY (id_end)
    REFERENCES dw_cinema.DIM_ENDERECO_CLIENTE (id_end)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_TEMPO1
    FOREIGN KEY (id_tem)
    REFERENCES dw_cinema.DIM_TEMPO (id_tem)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_TIPO_PRODUTO1
    FOREIGN KEY (id_tip)
    REFERENCES dw_cinema.DIM_TIPO_PRODUTO (id_tip)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_PAGAMENTO1
    FOREIGN KEY (id_pag)
    REFERENCES dw_cinema.DIM_PAGAMENTO (id_pag)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_CLIENTE1
    FOREIGN KEY (id_cli)
    REFERENCES dw_cinema.DIM_CLIENTE (id_cli)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_PLATAFORMA1
    FOREIGN KEY (id_pla)
    REFERENCES dw_cinema.DIM_PLATAFORMA (id_pla)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_FATO_PRODUTO_DIM_CINEMA1
    FOREIGN KEY (id_cin)
    REFERENCES dw_cinema.DIM_CINEMA (id_cin)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
>>>>>>> 5dc9a7607b2757a9f58aa5e61234de7806eb7b50
