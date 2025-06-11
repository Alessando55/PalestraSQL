MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`EVENTO_t`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EVENTO_t` (
  `idEVENTO` INT NOT NULL,
  `Data` DATETIME NULL,
  `Attività` VARCHAR(45) NULL,
  PRIMARY KEY (`idEVENTO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SEGRETARIO_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SEGRETARIO_T` (
  `idSEGRETARIO` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Cognome` VARCHAR(45) NULL,
  `Costo` VARCHAR(45) NULL,
  PRIMARY KEY (`idSEGRETARIO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BAR_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BAR_T` (
  `idBAR` INT NOT NULL,
  `Data` DATE NULL,
  `Ricavi` FLOAT NULL,
  PRIMARY KEY (`idBAR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ALLENATORE_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ALLENATORE_T` (
  `idALLENATORE` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Cognome` VARCHAR(45) NULL,
  `Specializzazione` VARCHAR(45) NULL,
  PRIMARY KEY (`idALLENATORE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROGRAMMA_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROGRAMMA_T` (
  `idPROGRAMMA` INT NOT NULL,
  `SchedaAllenamento` VARCHAR(100) NULL,
  `SchedaAlimentazione` VARCHAR(100) NULL,
  `ALLENATORE_T_idALLENATORE` INT NOT NULL,
  PRIMARY KEY (`idPROGRAMMA`),
  INDEX `fk_PROGRAMMA_T_ALLENATORE_T1_idx` (`ALLENATORE_T_idALLENATORE` ASC) VISIBLE,
  CONSTRAINT `fk_PROGRAMMA_T_ALLENATORE_T1`
    FOREIGN KEY (`ALLENATORE_T_idALLENATORE`)
    REFERENCES `mydb`.`ALLENATORE_T` (`idALLENATORE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SERVIZIO_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SERVIZIO_T` (
  `idSERVIZIO` INT NOT NULL,
  `Costo` INT NULL,
  `Orario` DATETIME NULL,
  PRIMARY KEY (`idSERVIZIO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EVENTO_t_has_SEGRETARIO_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EVENTO_t_has_SEGRETARIO_T` (
  `EVENTO_t_idEVENTO` INT NOT NULL,
  `SEGRETARIO_T_idSEGRETARIO` INT NOT NULL,
  PRIMARY KEY (`EVENTO_t_idEVENTO`, `SEGRETARIO_T_idSEGRETARIO`),
  INDEX `fk_EVENTO_t_has_SEGRETARIO_T_SEGRETARIO_T1_idx` (`SEGRETARIO_T_idSEGRETARIO` ASC) VISIBLE,
  INDEX `fk_EVENTO_t_has_SEGRETARIO_T_EVENTO_t_idx` (`EVENTO_t_idEVENTO` ASC) VISIBLE,
  CONSTRAINT `fk_EVENTO_t_has_SEGRETARIO_T_EVENTO_t`
    FOREIGN KEY (`EVENTO_t_idEVENTO`)
    REFERENCES `mydb`.`EVENTO_t` (`idEVENTO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EVENTO_t_has_SEGRETARIO_T_SEGRETARIO_T1`
    FOREIGN KEY (`SEGRETARIO_T_idSEGRETARIO`)
    REFERENCES `mydb`.`SEGRETARIO_T` (`idSEGRETARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PALESTRA_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PALESTRA_T` (
  `SERVIZIO_T_idSERVIZIO` INT NOT NULL,
  PRIMARY KEY (`SERVIZIO_T_idSERVIZIO`),
  INDEX `fk_PALESTRA_T_SERVIZIO_T1_idx` (`SERVIZIO_T_idSERVIZIO` ASC) VISIBLE,
  CONSTRAINT `fk_PALESTRA_T_SERVIZIO_T1`
    FOREIGN KEY (`SERVIZIO_T_idSERVIZIO`)
    REFERENCES `mydb`.`SERVIZIO_T` (`idSERVIZIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MAD_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MAD_T` (
  `SERVIZIO_T_idSERVIZIO` INT NOT NULL,
  PRIMARY KEY (`SERVIZIO_T_idSERVIZIO`),
  INDEX `fk_MAD_T_SERVIZIO_T1_idx` (`SERVIZIO_T_idSERVIZIO` ASC) VISIBLE,
  CONSTRAINT `fk_MAD_T_SERVIZIO_T1`
    FOREIGN KEY (`SERVIZIO_T_idSERVIZIO`)
    REFERENCES `mydb`.`SERVIZIO_T` (`idSERVIZIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CENTRO_BENESSERE_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CENTRO_BENESSERE_T` (
  `SERVIZIO_T_idSERVIZIO` INT NOT NULL,
  PRIMARY KEY (`SERVIZIO_T_idSERVIZIO`),
  INDEX `fk_CENTRO_BENESSERE_T_SERVIZIO_T1_idx` (`SERVIZIO_T_idSERVIZIO` ASC) VISIBLE,
  CONSTRAINT `fk_CENTRO_BENESSERE_T_SERVIZIO_T1`
    FOREIGN KEY (`SERVIZIO_T_idSERVIZIO`)
    REFERENCES `mydb`.`SERVIZIO_T` (`idSERVIZIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DANZA_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DANZA_T` (
  `MAD_T_SERVIZIO_T_idSERVIZIO` INT NOT NULL,
  `TipoDanza` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MAD_T_SERVIZIO_T_idSERVIZIO`, `TipoDanza`),
  INDEX `fk_SCUOLA_DANZA_T_MAD_T1_idx` (`MAD_T_SERVIZIO_T_idSERVIZIO` ASC) VISIBLE,
  CONSTRAINT `fk_SCUOLA_DANZA_T_MAD_T1`
    FOREIGN KEY (`MAD_T_SERVIZIO_T_idSERVIZIO`)
    REFERENCES `mydb`.`MAD_T` (`SERVIZIO_T_idSERVIZIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ALLENAMENTO_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ALLENAMENTO_T` (
  `idTipoAllenamento` VARCHAR(20) NOT NULL,
  `PALESTRA_T_SERVIZIO_T_idSERVIZIO` INT NOT NULL,
  PRIMARY KEY (`idTipoAllenamento`, `PALESTRA_T_SERVIZIO_T_idSERVIZIO`),
  INDEX `fk_ALLENAMENTO_T_PALESTRA_T1_idx` (`PALESTRA_T_SERVIZIO_T_idSERVIZIO` ASC) VISIBLE,
  CONSTRAINT `fk_ALLENAMENTO_T_PALESTRA_T1`
    FOREIGN KEY (`PALESTRA_T_SERVIZIO_T_idSERVIZIO`)
    REFERENCES `mydb`.`PALESTRA_T` (`SERVIZIO_T_idSERVIZIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TRATTAMENTO_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TRATTAMENTO_T` (
  `idTipoTrattamento` VARCHAR(20) NOT NULL,
  `CENTRO_BENESSERE_T_SERVIZIO_T_idSERVIZIO` INT NOT NULL,
  PRIMARY KEY (`idTipoTrattamento`, `CENTRO_BENESSERE_T_SERVIZIO_T_idSERVIZIO`),
  INDEX `fk_TRATTAMENTO_T_CENTRO_BENESSERE_T1_idx` (`CENTRO_BENESSERE_T_SERVIZIO_T_idSERVIZIO` ASC) VISIBLE,
  CONSTRAINT `fk_TRATTAMENTO_T_CENTRO_BENESSERE_T1`
    FOREIGN KEY (`CENTRO_BENESSERE_T_SERVIZIO_T_idSERVIZIO`)
    REFERENCES `mydb`.`CENTRO_BENESSERE_T` (`SERVIZIO_T_idSERVIZIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ATLETA_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ATLETA_T` (
  `idCredenzialiA` VARCHAR(20) NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Cognome` VARCHAR(45) NULL,
  `Profilo` VARCHAR(45) NULL,
  `Sesso` VARCHAR(45) NULL,
  `Età` INT NULL,
  `BAR_T_idBAR` INT NULL,
  `ALLENATORE_T_idALLENATORE` INT NULL,
  PRIMARY KEY (`idCredenzialiA`),
  INDEX `fk_ATLETA_T_BAR_T1_idx` (`BAR_T_idBAR` ASC) VISIBLE,
  INDEX `fk_ATLETA_T_ALLENATORE_T1_idx` (`ALLENATORE_T_idALLENATORE` ASC) VISIBLE,
  CONSTRAINT `fk_ATLETA_T_BAR_T1`
    FOREIGN KEY (`BAR_T_idBAR`)
    REFERENCES `mydb`.`BAR_T` (`idBAR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ATLETA_T_ALLENATORE_T1`
    FOREIGN KEY (`ALLENATORE_T_idALLENATORE`)
    REFERENCES `mydb`.`ALLENATORE_T` (`idALLENATORE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SEGRETARIO_T_has_ATLETA_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SEGRETARIO_T_has_ATLETA_T` (
  `SEGRETARIO_T_idSEGRETARIO` INT NOT NULL,
  `ATLETA_T_idCredenzialiA` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`SEGRETARIO_T_idSEGRETARIO`, `ATLETA_T_idCredenzialiA`),
  INDEX `fk_SEGRETARIO_T_has_ATLETA_T_ATLETA_T1_idx` (`ATLETA_T_idCredenzialiA` ASC) VISIBLE,
  INDEX `fk_SEGRETARIO_T_has_ATLETA_T_SEGRETARIO_T1_idx` (`SEGRETARIO_T_idSEGRETARIO` ASC) VISIBLE,
  CONSTRAINT `fk_SEGRETARIO_T_has_ATLETA_T_SEGRETARIO_T1`
    FOREIGN KEY (`SEGRETARIO_T_idSEGRETARIO`)
    REFERENCES `mydb`.`SEGRETARIO_T` (`idSEGRETARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SEGRETARIO_T_has_ATLETA_T_ATLETA_T1`
    FOREIGN KEY (`ATLETA_T_idCredenzialiA`)
    REFERENCES `mydb`.`ATLETA_T` (`idCredenzialiA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SERVIZIO_T_has_ATLETA_T`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SERVIZIO_T_has_ATLETA_T` (
  `SERVIZIO_T_idSERVIZIO` INT NOT NULL,
  `ATLETA_T_idCredenzialiA` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`SERVIZIO_T_idSERVIZIO`, `ATLETA_T_idCredenzialiA`),
  INDEX `fk_SERVIZIO_T_has_ATLETA_T_ATLETA_T1_idx` (`ATLETA_T_idCredenzialiA` ASC) VISIBLE,
  INDEX `fk_SERVIZIO_T_has_ATLETA_T_SERVIZIO_T1_idx` (`SERVIZIO_T_idSERVIZIO` ASC) VISIBLE,
  CONSTRAINT `fk_SERVIZIO_T_has_ATLETA_T_SERVIZIO_T1`
    FOREIGN KEY (`SERVIZIO_T_idSERVIZIO`)
    REFERENCES `mydb`.`SERVIZIO_T` (`idSERVIZIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SERVIZIO_T_has_ATLETA_T_ATLETA_T1`
    FOREIGN KEY (`ATLETA_T_idCredenzialiA`)
    REFERENCES `mydb`.`ATLETA_T` (`idCredenzialiA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
