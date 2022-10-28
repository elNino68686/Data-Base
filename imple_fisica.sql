-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Standinavia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Standinavia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Standinavia` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema Pedro
-- -----------------------------------------------------
USE `Standinavia` ;

-- -----------------------------------------------------
-- Table `Standinavia`.`Morada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Standinavia`.`Morada` (
  `cod_postal` VARCHAR(8) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `localidade` VARCHAR(45) NOT NULL,
  `concelho` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_postal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Standinavia`.`Contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Standinavia`.`Contacto` (
  `telemovel` VARCHAR(9) NOT NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`telemovel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Standinavia`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Standinavia`.`Cliente` (
  `id_Cliente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `morada` VARCHAR(8) NOT NULL,
  `contacto` VARCHAR(9) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  PRIMARY KEY (`id_Cliente`),
  INDEX `morada1_idx` (`morada` ASC) VISIBLE,
  INDEX `contacto1_idx` (`contacto` ASC) VISIBLE,
  CONSTRAINT `morada1`
    FOREIGN KEY (`morada`)
    REFERENCES `Standinavia`.`Morada` (`cod_postal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `contacto111`
    FOREIGN KEY (`contacto`)
    REFERENCES `Standinavia`.`Contacto` (`telemovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Standinavia`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Standinavia`.`Funcionario` (
  `id_Funcionario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `numero_vendas` INT NOT NULL,
  PRIMARY KEY (`id_Funcionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Standinavia`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Standinavia`.`Veiculo` (
  `matricula` VARCHAR(8) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `combustivel` VARCHAR(45) NOT NULL,
  `preco_venda` DECIMAL(9,2) NULL,
  `preco_aluguer` DECIMAL(4,2) NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Standinavia`.`Seguro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Standinavia`.`Seguro` (
  `tipo` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Standinavia`.`Aluguer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Standinavia`.`Aluguer` (
  `id_Aluguer` INT NOT NULL,
  `seguro` VARCHAR(45) NOT NULL,
  `duracao` INT NOT NULL,
  `matricula` VARCHAR(8) NOT NULL,
  `id_Cliente` INT NOT NULL,
  `data_inicial` DATE NOT NULL,
  PRIMARY KEY (`id_Aluguer`),
  INDEX `fk_idVeiculo_idx` (`matricula` ASC) VISIBLE,
  INDEX `fk_idCliente_idx` (`id_Cliente` ASC) VISIBLE,
  INDEX `fk_seguro1_idx` (`seguro` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula1`
    FOREIGN KEY (`matricula`)
    REFERENCES `Standinavia`.`Veiculo` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idCliente1`
    FOREIGN KEY (`id_Cliente`)
    REFERENCES `Standinavia`.`Cliente` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguro1`
    FOREIGN KEY (`seguro`)
    REFERENCES `Standinavia`.`Seguro` (`tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Standinavia`.`Fatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Standinavia`.`Fatura` (
  `id_Fatura` INT NOT NULL,
  `valorTotal` DECIMAL(9,2) NOT NULL,
  `garantia` INT  NULL,
  `data` DATE NOT NULL,
  `idFuncionario_emissor` INT NOT NULL,
  `id_Cliente` INT NOT NULL,
  `matricula` VARCHAR(8) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `id_Aluguer` INT NULL,
  PRIMARY KEY (`id_Fatura`),
  INDEX `fk_idVeiculo_idx` (`matricula` ASC) VISIBLE,
  INDEX `fk_idCliente_idx` (`id_Cliente` ASC) VISIBLE,
  INDEX `fk_idFuncionario_emissor_idx` (`idFuncionario_emissor` ASC) VISIBLE,
  INDEX `fk_idaluguer_idx` (`id_Aluguer` ASC) VISIBLE,
  CONSTRAINT `fk_idFuncionario_emissor`
    FOREIGN KEY (`idFuncionario_emissor`)
    REFERENCES `Standinavia`.`Funcionario` (`id_Funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idCliente`
    FOREIGN KEY (`id_Cliente`)
    REFERENCES `Standinavia`.`Cliente` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula`
    FOREIGN KEY (`matricula`)
    REFERENCES `Standinavia`.`Veiculo` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idaluguer`
    FOREIGN KEY (`id_Aluguer`)
    REFERENCES `Standinavia`.`Aluguer` (`id_Aluguer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
