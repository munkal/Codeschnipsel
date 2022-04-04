-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema snowboard
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema snowboard
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `snowboard` DEFAULT CHARACTER SET utf8 ;
USE `snowboard` ;

-- -----------------------------------------------------
-- Table `snowboard`.`Entlehnstationen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `snowboard`.`Entlehnstationen` (
  `idEntlehnstationen` INT NOT NULL AUTO_INCREMENT,
  `Bezeichnung` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idEntlehnstationen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `snowboard`.`Kunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `snowboard`.`Kunde` (
  `idKunde` INT NOT NULL AUTO_INCREMENT,
  `Vorname` VARCHAR(45) NOT NULL,
  `Nachname` VARCHAR(45) NOT NULL,
  `Titel` VARCHAR(45) NULL,
  `Registrierdatum` DATE NOT NULL,
  `Adresse` VARCHAR(45) NOT NULL,
  `PLZ` INT NOT NULL,
  `Ort` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idKunde`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `snowboard`.`Snowboard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `snowboard`.`Snowboard` (
  `idSnowboard` INT NOT NULL AUTO_INCREMENT,
  `Bezeichnung` VARCHAR(45) NOT NULL,
  `Marke` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSnowboard`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `snowboard`.`Verleihvorgang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `snowboard`.`Verleihvorgang` (
  `idVerleihvorgang` INT NOT NULL AUTO_INCREMENT,
  `Entlehnungszeit` DATETIME(1) NOT NULL,
  `Rueckgabezeit` DATETIME(1) NOT NULL,
  `Kunde_idKunde` INT NOT NULL,
  `Entlehnstationen_idEntlehnstationen` INT NOT NULL,
  `Snowboard_idSnowboard` INT NOT NULL,
  PRIMARY KEY (`idVerleihvorgang`, `Kunde_idKunde`, `Entlehnstationen_idEntlehnstationen`, `Snowboard_idSnowboard`),
   CONSTRAINT `fk_Verleihvorgang_Kunde`
    FOREIGN KEY (`Kunde_idKunde`)
    REFERENCES `snowboard`.`Kunde` (`idKunde`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Verleihvorgang_Entlehnstationen1`
    FOREIGN KEY (`Entlehnstationen_idEntlehnstationen`)
    REFERENCES `snowboard`.`Entlehnstationen` (`idEntlehnstationen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Verleihvorgang_Snowboard1`
    FOREIGN KEY (`Snowboard_idSnowboard`)
    REFERENCES `snowboard`.`Snowboard` (`idSnowboard`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
