-- MySQL Script generated by MySQL Workbench
-- Mon Jun 19 22:26:06 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bd_trabajofinal
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bd_trabajofinal` ;

-- -----------------------------------------------------
-- Schema bd_trabajofinal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_trabajofinal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bd_trabajofinal` ;

-- -----------------------------------------------------
-- Table `bd_trabajofinal`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_trabajofinal`.`categoria` (
  `id_categoria` INT NOT NULL,
  `nombre` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_trabajofinal`.`jurisdiccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_trabajofinal`.`jurisdiccion` (
  `id_jurisdiccion` INT NOT NULL,
  `nombre` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_jurisdiccion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_trabajofinal`.`tipo_normativa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_trabajofinal`.`tipo_normativa` (
  `id_tipo_normativa` INT NOT NULL,
  `nombre` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_normativa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_trabajofinal`.`normativa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_trabajofinal`.`normativa` (
  `num_normativa` INT NOT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `organo_legislativo` VARCHAR(20) NULL DEFAULT NULL,
  `palabra_clave` VARCHAR(50) NULL DEFAULT NULL,
  `id_jurisdiccion` INT NULL DEFAULT NULL,
  `id_tipo_normativa` INT NULL DEFAULT NULL,
  `id_categoria` INT NULL DEFAULT NULL,
  PRIMARY KEY (`num_normativa`),
  CONSTRAINT `normativa_ibfk_1`
    FOREIGN KEY (`id_jurisdiccion`)
    REFERENCES `bd_trabajofinal`.`jurisdiccion` (`id_jurisdiccion`),
  CONSTRAINT `normativa_ibfk_2`
    FOREIGN KEY (`id_tipo_normativa`)
    REFERENCES `bd_trabajofinal`.`tipo_normativa` (`id_tipo_normativa`),
  CONSTRAINT `normativa_ibfk_3`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `bd_trabajofinal`.`categoria` (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `id_jurisdiccion` ON `bd_trabajofinal`.`normativa` (`id_jurisdiccion` ASC) VISIBLE;

CREATE INDEX `id_tipo_normativa` ON `bd_trabajofinal`.`normativa` (`id_tipo_normativa` ASC) VISIBLE;

CREATE INDEX `id_categoria` ON `bd_trabajofinal`.`normativa` (`id_categoria` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
