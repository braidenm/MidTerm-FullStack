-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema villagedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `villagedb` ;

-- -----------------------------------------------------
-- Schema villagedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `villagedb` DEFAULT CHARACTER SET utf8 ;
USE `villagedb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NULL,
  `street2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `volunteer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `volunteer` ;

CREATE TABLE IF NOT EXISTS `volunteer` (
  `user_id` INT NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `address_id` INT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `picture_url` TEXT NULL,
  `about` TEXT NULL,
  INDEX `fk_to_user_idx` (`user_id` ASC),
  PRIMARY KEY (`user_id`),
  INDEX `fk_to_address_volunteer_idx` (`address_id` ASC),
  CONSTRAINT `fk_to_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_to_address_volunteer`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project` ;

CREATE TABLE IF NOT EXISTS `project` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `owner_id` INT NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  `description` TEXT NULL,
  `address_id` INT NULL,
  `start_time` TIME NULL,
  `hours_needed` INT NULL,
  `volunteers_needed` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_to_project_owner_idx` (`owner_id` ASC),
  INDEX `fk_to_address_project_idx` (`address_id` ASC),
  CONSTRAINT `fk_to_project_owner`
    FOREIGN KEY (`owner_id`)
    REFERENCES `volunteer` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_to_address_project`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_volunteer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_volunteer` ;

CREATE TABLE IF NOT EXISTS `project_volunteer` (
  `volunteer_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  `hours_actual` INT NULL,
  `hours_pledged` INT NULL,
  PRIMARY KEY (`volunteer_id`, `project_id`),
  INDEX `fk_to_project_idx` (`project_id` ASC),
  CONSTRAINT `fk_to_volunteer`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `volunteer` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_to_project`
    FOREIGN KEY (`project_id`)
    REFERENCES `project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category_project` ;

CREATE TABLE IF NOT EXISTS `category_project` (
  `category_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `project_id`),
  INDEX `fk_to_project_from_table_idx` (`project_id` ASC),
  CONSTRAINT `fk_to_category_from_table`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_to_project_from_table`
    FOREIGN KEY (`project_id`)
    REFERENCES `project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS panda1@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'panda1'@'localhost' IDENTIFIED BY 'nuclear';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'panda1'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
