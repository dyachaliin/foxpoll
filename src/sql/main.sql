-- MySQL Script generated by MySQL Workbench
-- Thu Dec  2 12:31:04 2021
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
-- Table `mydb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`experts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`experts` ;

CREATE TABLE IF NOT EXISTS `mydb`.`experts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `occupation` VARCHAR(45) NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_experts_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_experts_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`surveys`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`surveys` ;

CREATE TABLE IF NOT EXISTS `mydb`.`surveys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `open` DATETIME NULL,
  `close` DATETIME NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_surveys_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_surveys_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`reports` ;

CREATE TABLE IF NOT EXISTS `mydb`.`reports` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(300) NOT NULL,
  `date` DATETIME NOT NULL,
  `surveys_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reports_surveys1_idx` (`surveys_id` ASC) VISIBLE,
  INDEX `fk_reports_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_reports_surveys1`
    FOREIGN KEY (`surveys_id`)
    REFERENCES `mydb`.`surveys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reports_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`questions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`questions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(300) NOT NULL,
  `type` VARCHAR(45) NULL,
  `surveys_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_questions_surveys_idx` (`surveys_id` ASC) VISIBLE,
  CONSTRAINT `fk_questions_surveys`
    FOREIGN KEY (`surveys_id`)
    REFERENCES `mydb`.`surveys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`responses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`responses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`responses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(300) NOT NULL,
  `questions_id` INT NOT NULL,
  `experts_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_responses_questions1_idx` (`questions_id` ASC) VISIBLE,
  INDEX `fk_responses_experts1_idx` (`experts_id` ASC) VISIBLE,
  CONSTRAINT `fk_responses_questions1`
    FOREIGN KEY (`questions_id`)
    REFERENCES `mydb`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_responses_experts1`
    FOREIGN KEY (`experts_id`)
    REFERENCES `mydb`.`experts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`users` (`id`, `username`, `email`, `password`, `role`) VALUES (DEFAULT, 'jenya', 'yyakovliev02@gmail.com', 'password', analyst);
INSERT INTO `mydb`.`users` (`id`, `username`, `email`, `password`, `role`) VALUES (DEFAULT, 'artem', 'bondarchuk.artem20@gmail.com', 'password', expert);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`surveys`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`surveys` (`id`, `name`, `description`, `open`, `close`, `users_id`) VALUES (DEFAULT, 'Example survey', 'Example survey', '1638440883', '1638450883', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`reports`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`reports` (`id`, `text`, `date`, `surveys_id`, `users_id`) VALUES (DEFAULT, 'We have received 500 responses to the survey, showing that our survey has finished successfully.', '1638440883', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`questions`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`questions` (`id`, `text`, `type`, `surveys_id`) VALUES (DEFAULT, 'How are you?', 'simple_answer', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`responses`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`responses` (`id`, `text`, `questions_id`, `experts_id`) VALUES (DEFAULT, 'I\'m doing good', 1, 2);

COMMIT;

