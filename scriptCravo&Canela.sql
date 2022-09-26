-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cravo_canela
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cravo_canela
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cravo_canela` DEFAULT CHARACTER SET utf8 ;
USE `cravo_canela` ;

-- -----------------------------------------------------
-- Table `cravo_canela`.`perfil_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cravo_canela`.`perfil_cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(20) NOT NULL,
  `telefone` VARCHAR(20) NULL DEFAULT NULL,
  `nome_usuario` VARCHAR(50) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  `data_login` VARCHAR(10) NOT NULL,
  `status_conta` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cravo_canela`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cravo_canela`.`video` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` TEXT NOT NULL,
  `descricao` TEXT NOT NULL,
  `video` TEXT NOT NULL,
  `concluido` TINYINT NOT NULL DEFAULT 0,
  `total_acessos` INT NULL DEFAULT NULL,
  `nota_video` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `cravo_canela`.`historico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cravo_canela`.`historico` (
  `cliente_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  INDEX `fk_cliente_has_video_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_cliente_has_video_cliente_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_video_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `cravo_canela`.`perfil_cliente` (`id`),
  CONSTRAINT `fk_cliente_has_video_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `cravo_canela`.`video` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 47
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
