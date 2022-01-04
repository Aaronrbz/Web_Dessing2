-- MySQL Script generated by MySQL Workbench
-- Fri Mar 12 12:54:43 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Coordenadas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Coordenadas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Coordenadas` (
  `idRutas` INT NOT NULL,
  `Latitud` FLOAT NOT NULL,
  `Longitud` FLOAT NOT NULL,
  PRIMARY KEY (`idRutas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EstadoPedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EstadoPedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`EstadoPedido` (
  `idTipoPedido` INT NOT NULL,
  `Recibido` VARCHAR(45) NULL DEFAULT 'R',
  `Proceso` VARCHAR(45) NULL DEFAULT 'P',
  `Entregado` VARCHAR(45) NULL DEFAULT 'E',
  PRIMARY KEY (`idTipoPedido`),
  CONSTRAINT `Pedidos`
    FOREIGN KEY (`idTipoPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `IdUsuarios` INT NOT NULL,
  `TipoPedido` VARCHAR(1) NOT NULL,
  `Estado_pedido` VARCHAR(1) NOT NULL,
  `Origen` INT NOT NULL,
  `Destino` INT NOT NULL,
  `Pedidocol` VARCHAR(45) NULL,
  PRIMARY KEY (`idPedido`, `IdUsuarios`),
  CONSTRAINT `Usuario`
    FOREIGN KEY (`IdUsuarios`)
    REFERENCES `mydb`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Rutas`
    FOREIGN KEY (`Origen` , `Destino`)
    REFERENCES `mydb`.`Coordenadas` (`idRutas` , `idRutas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Usuario_idx` ON `mydb`.`Pedido` (`IdUsuarios` ASC) VISIBLE;

CREATE INDEX `Rutas_idx` ON `mydb`.`Pedido` (`Origen` ASC, `Destino` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`TipoPedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoPedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TipoPedido` (
  `idTipoPedido` INT NOT NULL,
  `Bebida` VARCHAR(45) NULL DEFAULT 'B',
  `Comida` VARCHAR(45) NULL DEFAULT 'C',
  `Paqueteria` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoPedido`),
  CONSTRAINT `Pedidos`
    FOREIGN KEY (`idTipoPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoUsuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoUsuario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TipoUsuario` (
  `idTipoUsuario` INT NOT NULL,
  `Administrador` VARCHAR(1) NULL DEFAULT 'A',
  `Repartidor` VARCHAR(1) NULL DEFAULT 'R',
  `Cliente` VARCHAR(1) NULL DEFAULT 'C',
  PRIMARY KEY (`idTipoUsuario`),
  CONSTRAINT `Usuariios`
    FOREIGN KEY (`idTipoUsuario`)
    REFERENCES `mydb`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuarios` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `idUsuarios` INT NOT NULL,
  `UserName` VARCHAR(45) NOT NULL,
  `Contrasenia` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
