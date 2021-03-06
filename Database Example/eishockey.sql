-- MySQL Script generated by MySQL Workbench
-- Mon Apr  4 13:34:03 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema eishockey
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eishockey
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eishockey` DEFAULT CHARACTER SET utf8 ;
USE `eishockey` ;

-- -----------------------------------------------------
-- Table `eishockey`.`Tournament`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eishockey`.`Tournament` ;

CREATE TABLE IF NOT EXISTS `eishockey`.`Tournament` (
  `id` INT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eishockey`.`Group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eishockey`.`Group` ;

CREATE TABLE IF NOT EXISTS `eishockey`.`Group` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Tournament_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Group_Tournament_idx` (`Tournament_id` ASC),
  CONSTRAINT `fk_Group_Tournament`
    FOREIGN KEY (`Tournament_id`)
    REFERENCES `eishockey`.`Tournament` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eishockey`.`Team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eishockey`.`Team` ;

CREATE TABLE IF NOT EXISTS `eishockey`.`Team` (
  `ID` INT NULL AUTO_INCREMENT,
  `Group_ID` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `total_points` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Team_Group1_idx` (`Group_ID` ASC),
  CONSTRAINT `fk_Team_Group`
    FOREIGN KEY (`Group_ID`)
    REFERENCES `eishockey`.`Group` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eishockey`.`Player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eishockey`.`Player` ;

CREATE TABLE IF NOT EXISTS `eishockey`.`Player` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Team_ID` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `position` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_Player_Team1_idx` (`Team_ID` ASC),
  CONSTRAINT `fk_Player_Team1`
    FOREIGN KEY (`Team_ID`)
    REFERENCES `eishockey`.`Team` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eishockey`.`Referee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eishockey`.`Referee` ;

CREATE TABLE IF NOT EXISTS `eishockey`.`Referee` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eishockey`.`Match_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eishockey`.`Match_type` ;

CREATE TABLE IF NOT EXISTS `eishockey`.`Match_type` (
  `id` INT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eishockey`.`Match`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eishockey`.`Match` ;

CREATE TABLE IF NOT EXISTS `eishockey`.`Match` (
  `ID` INT NULL AUTO_INCREMENT,
  `Match_type_id` INT NOT NULL,
  `team_visitor_id` INT NOT NULL,
  `team_home_id` INT NOT NULL,
  `Tournament_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Match_Match_type1_idx` (`Match_type_id` ASC),
  INDEX `fk_Match_Team_visitor_id_idx` (`team_visitor_id` ASC),
  INDEX `fk_Match_Team_home_id_idx` (`team_home_id` ASC),
  INDEX `fk_Match_Tournament1_idx` (`Tournament_id` ASC),
  CONSTRAINT `fk_Match_Match_type1`
    FOREIGN KEY (`Match_type_id`)
    REFERENCES `eishockey`.`Match_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Match_Team_visitor_id`
    FOREIGN KEY (`team_visitor_id`)
    REFERENCES `eishockey`.`Team` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Match_Team_home_id`
    FOREIGN KEY (`team_home_id`)
    REFERENCES `eishockey`.`Team` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Match_Tournament1`
    FOREIGN KEY (`Tournament_id`)
    REFERENCES `eishockey`.`Tournament` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eishockey`.`Match_has_Referee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eishockey`.`Match_has_Referee` ;

CREATE TABLE IF NOT EXISTS `eishockey`.`Match_has_Referee` (
  `id` INT NULL AUTO_INCREMENT,
  `Match_ID` INT NOT NULL,
  `Referee_ID` INT NOT NULL,
  `Position` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Match_has_Referee_Referee1_idx` (`Referee_ID` ASC),
  INDEX `fk_Match_has_Referee_Match1_idx` (`Match_ID` ASC),
  CONSTRAINT `fk_Match_has_Referee_Match1`
    FOREIGN KEY (`Match_ID`)
    REFERENCES `eishockey`.`Match` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Match_has_Referee_Referee1`
    FOREIGN KEY (`Referee_ID`)
    REFERENCES `eishockey`.`Referee` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eishockey`.`Team_Match_Result`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eishockey`.`Team_Match_Result` ;

CREATE TABLE IF NOT EXISTS `eishockey`.`Team_Match_Result` (
  `id` INT NULL AUTO_INCREMENT,
  `Team_ID` INT NOT NULL,
  `Match_ID` INT NOT NULL,
  `was_overtime` TINYINT NULL,
  `goals_scored` INT NULL,
  `goals_received` INT NULL,
  `win` TINYINT NULL,
  INDEX `fk_Team_has_Match_Match1_idx` (`Match_ID` ASC),
  INDEX `fk_Team_has_Match_Team1_idx` (`Team_ID` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Team_has_Match_Team1`
    FOREIGN KEY (`Team_ID`)
    REFERENCES `eishockey`.`Team` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Team_has_Match_Match1`
    FOREIGN KEY (`Match_ID`)
    REFERENCES `eishockey`.`Match` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eishockey`.`Match_Player_Statistics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eishockey`.`Match_Player_Statistics` ;

CREATE TABLE IF NOT EXISTS `eishockey`.`Match_Player_Statistics` (
  `id` INT NULL AUTO_INCREMENT,
  `Match_ID` INT NOT NULL,
  `Player_ID` INT NOT NULL,
  `goals` INT NULL,
  `penalty_minutes` INT NULL,
  INDEX `fk_Match_has_Player_Player1_idx` (`Player_ID` ASC),
  INDEX `fk_Match_has_Player_Match1_idx` (`Match_ID` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Match_has_Player_Match1`
    FOREIGN KEY (`Match_ID`)
    REFERENCES `eishockey`.`Match` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Match_has_Player_Player1`
    FOREIGN KEY (`Player_ID`)
    REFERENCES `eishockey`.`Player` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
