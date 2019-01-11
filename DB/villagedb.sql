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
  `role` VARCHAR(45) NOT NULL DEFAULT 'standard',
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

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `villagedb`;
INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `role`) VALUES (1, 'admin', 'password', 'admin@admin.com', 'admin');
INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `role`) VALUES (2, 'supervolunteer', 'password', 'genericemail@email.com', DEFAULT);
INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `role`) VALUES (3, 'okayvolunteer', 'password', 'okayemail@gmail.com', DEFAULT);
INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `role`) VALUES (4, 'thebestvolunteer', 'password', 'bestemail@gmail.com', DEFAULT);
INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `role`) VALUES (5, 'ivolunteer', 'password', 'iemail@email.com', DEFAULT);
INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `role`) VALUES (6, 'beastmodevolunteer', 'password', 'beastemail@email.com', DEFAULT);
INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `role`) VALUES (7, 'sometimesvolunteer', 'password', 'sometimesemail@email.com', DEFAULT);
INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `role`) VALUES (8, 'crazyvolunteer', 'password', 'crazyemail@gmail.com', DEFAULT);
INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `role`) VALUES (9, 'indianajones', 'password', 'indiemail@email.com', DEFAULT);
INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `role`) VALUES (10, 'georgewashington', 'password', 'president@email.com', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `villagedb`;
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip`) VALUES (1, '42 Wallaby Way', NULL, 'Denver', 'Colorado', '80222');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip`) VALUES (2, '456 For Loop Circle', NULL, 'Denver', 'Colorado', '80222');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip`) VALUES (3, '345 If Statement Ave', NULL, 'Denver', 'Colorado', '80222');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip`) VALUES (4, '888 TeaPot Error Street', NULL, 'Denver', 'Colorado', '80222');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip`) VALUES (5, '987 Stack Over Flow Street', NULL, 'Denver', 'Colorado', '80222');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip`) VALUES (6, '654 Throws Exception Way', NULL, 'Denver', 'Colorado', '80222');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip`) VALUES (7, '234 Java Street', NULL, 'Denver', 'Colorado', '80222');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip`) VALUES (8, '30 Garbage Collection Ave', NULL, 'Denver', 'Colorado', '80222');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip`) VALUES (9, '8080 Port Street', NULL, 'Denver', 'Colorado', '80222');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip`) VALUES (10, '404 Compiler Error BLVD', NULL, 'Denver', 'Colorado', '80222');

COMMIT;


-- -----------------------------------------------------
-- Data for table `volunteer`
-- -----------------------------------------------------
START TRANSACTION;
USE `villagedb`;
INSERT INTO `volunteer` (`user_id`, `phone_number`, `dob`, `address_id`, `first_name`, `last_name`, `picture_url`, `about`) VALUES (1, '303-867-5309', '1900-01-01', 1, 'Nuclear', 'Panda', NULL, 'Bombs and Bambo');
INSERT INTO `volunteer` (`user_id`, `phone_number`, `dob`, `address_id`, `first_name`, `last_name`, `picture_url`, `about`) VALUES (2, '123-456-7890', '1999-01-23', 2, 'Bob', 'Ross', NULL, 'Painting and stuff');
INSERT INTO `volunteer` (`user_id`, `phone_number`, `dob`, `address_id`, `first_name`, `last_name`, `picture_url`, `about`) VALUES (3, '456-677-3332', '1967-03-05', 3, 'Harry', 'Potter', NULL, 'Wizard and stuff');
INSERT INTO `volunteer` (`user_id`, `phone_number`, `dob`, `address_id`, `first_name`, `last_name`, `picture_url`, `about`) VALUES (4, '345-676-3321', '1954-06-30', 4, 'Jackie', 'Chan', NULL, 'Karate and funny stuff');
INSERT INTO `volunteer` (`user_id`, `phone_number`, `dob`, `address_id`, `first_name`, `last_name`, `picture_url`, `about`) VALUES (5, '344-556-3233', '1987-05-22', 5, 'Andre', 'Giant', NULL, 'Giant and stuff');
INSERT INTO `volunteer` (`user_id`, `phone_number`, `dob`, `address_id`, `first_name`, `last_name`, `picture_url`, `about`) VALUES (6, '342-667-3232', '1980-04-29', 6, 'Miles', 'Davis', NULL, 'Stuff stuff');
INSERT INTO `volunteer` (`user_id`, `phone_number`, `dob`, `address_id`, `first_name`, `last_name`, `picture_url`, `about`) VALUES (7, '707-453-2344', '1975-07-13', 7, 'Randy', 'Savage', NULL, 'Wrestling and stuff');
INSERT INTO `volunteer` (`user_id`, `phone_number`, `dob`, `address_id`, `first_name`, `last_name`, `picture_url`, `about`) VALUES (8, '453-235-2466', '1978-10-24', 8, 'Betty', 'White', NULL, 'Funny and stuff (also old)');
INSERT INTO `volunteer` (`user_id`, `phone_number`, `dob`, `address_id`, `first_name`, `last_name`, `picture_url`, `about`) VALUES (9, '342-343-2356', '1988-12-25', 9, 'George', 'Costanza', NULL, 'Weird and funny stuff');
INSERT INTO `volunteer` (`user_id`, `phone_number`, `dob`, `address_id`, `first_name`, `last_name`, `picture_url`, `about`) VALUES (10, '342-645-3223', '1732-02-22', 10, 'George', 'Washington', NULL, 'President and stuff');

COMMIT;


-- -----------------------------------------------------
-- Data for table `project`
-- -----------------------------------------------------
START TRANSACTION;
USE `villagedb`;
INSERT INTO `project` (`id`, `title`, `owner_id`, `active`, `start_date`, `end_date`, `description`, `address_id`, `start_time`, `hours_needed`, `volunteers_needed`) VALUES (1, 'TP Steves House', 1, 1, '2019-01-18', '2019-01-18', 'TP Everywhere on and around Steves house.', 5, '20:00:00', 6, 6);
INSERT INTO `project` (`id`, `title`, `owner_id`, `active`, `start_date`, `end_date`, `description`, `address_id`, `start_time`, `hours_needed`, `volunteers_needed`) VALUES (2, 'Clean up a Park', 2, 1, '2019-02-01', '2019-02-02', 'Pick up trash, pull weeds, remove graffiti, etc', 1, '08:00:00', 50, 10);
INSERT INTO `project` (`id`, `title`, `owner_id`, `active`, `start_date`, `end_date`, `description`, `address_id`, `start_time`, `hours_needed`, `volunteers_needed`) VALUES (3, 'Build a Community TreeHouse', 4, 1, '2019-04-01', '2019-04-04', 'Build a Tree House in the Park', 7, '08:00:00', 100, 10);
INSERT INTO `project` (`id`, `title`, `owner_id`, `active`, `start_date`, `end_date`, `description`, `address_id`, `start_time`, `hours_needed`, `volunteers_needed`) VALUES (4, 'Food Bank for Homeless', 7, 1, '2019-03-20', '2019-03-20', 'Bring food and hand it out', 3, '17:00:00', 20, 10);
INSERT INTO `project` (`id`, `title`, `owner_id`, `active`, `start_date`, `end_date`, `description`, `address_id`, `start_time`, `hours_needed`, `volunteers_needed`) VALUES (5, 'Save The World', 10, 1, '2019-01-18', '2020-01-01', 'Stop Lex Luthor from Winning. End: World Hunger, War, and Global Warming. Clean up the oceans and save the turtles', NULL, NULL, 1000000, 1000000);
INSERT INTO `project` (`id`, `title`, `owner_id`, `active`, `start_date`, `end_date`, `description`, `address_id`, `start_time`, `hours_needed`, `volunteers_needed`) VALUES (6, 'Tear down the Berlin Wall', 8, 0, '1991-11-01', '1991-11-10', 'Tear Down this Wall!', 1, '08:00:00', 10000, 1000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_volunteer`
-- -----------------------------------------------------
START TRANSACTION;
USE `villagedb`;
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (1, 1, NULL, 1);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (2, 1, NULL, 1);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (3, 1, NULL, 1);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (4, 1, NULL, 1);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (5, 1, NULL, 1);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (6, 1, NULL, 1);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (1, 2, NULL, 2);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (2, 2, NULL, 7);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (3, 2, NULL, 5);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (7, 2, NULL, 3);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (10, 3, NULL, 2);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (8, 3, NULL, 4);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (5, 3, NULL, 6);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (2, 3, NULL, 3);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (4, 3, NULL, 10);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (7, 4, NULL, 2);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (3, 4, NULL, 2);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (4, 4, NULL, 1);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (2, 4, NULL, 2);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (6, 4, NULL, 1);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (5, 4, NULL, 2);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (10, 5, NULL, 1000);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (3, 5, NULL, 10);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (1, 5, NULL, 1000);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (8, 5, NULL, 10);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (7, 5, NULL, 30);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (5, 5, NULL, 30);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (8, 6, NULL, 20);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (7, 6, NULL, 10);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (1, 6, NULL, 40);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (10, 6, NULL, 33);
INSERT INTO `project_volunteer` (`volunteer_id`, `project_id`, `hours_actual`, `hours_pledged`) VALUES (2, 6, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `villagedb`;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1, 'Clean Up', 'Clean Up Stuff');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (2, 'Build', 'Construct Some Stuff');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (3, 'Demolition', 'Destroy Some Stuff');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (4, 'Distribution ', 'Hand out Food, Clothes, Supplies, ETC.');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (6, 'Other', 'Anything');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (5, 'Landscape', 'Landscaping stuff');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category_project`
-- -----------------------------------------------------
START TRANSACTION;
USE `villagedb`;
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (5, 1);
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (6, 2);
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (1, 2);
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (1, 3);
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (4, 4);
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (1, 5);
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (2, 5);
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (4, 5);
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (5, 5);
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (6, 5);
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (1, 6);
INSERT INTO `category_project` (`category_id`, `project_id`) VALUES (3, 6);

COMMIT;

