-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oneconnectiong2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `oneconnectiong2` ;

-- -----------------------------------------------------
-- Schema oneconnectiong2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oneconnectiong2` DEFAULT CHARACTER SET utf8mb4 ;
USE `oneconnectiong2` ;

-- -----------------------------------------------------
-- Table `oneconnectiong2`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oneconnectiong2`.`user` ;

CREATE TABLE IF NOT EXISTS `oneconnectiong2`.`user` (
  `us_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `us_login` VARCHAR(60) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NULL,
  `us_pwd` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NULL COMMENT 'bin case sensitive',
  `us_email` VARCHAR(150) NULL,
  `us_active` TINYINT UNSIGNED NULL,
  `us_uniq_id` VARCHAR(40) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NULL,
  PRIMARY KEY (`us_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `us_login_UNIQUE` ON `oneconnectiong2`.`user` (`us_login` ASC) VISIBLE;

CREATE UNIQUE INDEX `us_email_UNIQUE` ON `oneconnectiong2`.`user` (`us_email` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `oneconnectiong2`.`article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oneconnectiong2`.`article` ;

CREATE TABLE IF NOT EXISTS `oneconnectiong2`.`article` (
  `ar_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ar_title` VARCHAR(180) NOT NULL,
  `ar_text` TEXT NOT NULL,
  `ar_datetime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `ar_is_published` TINYINT UNSIGNED NOT NULL,
  `user_us_id` INT UNSIGNED NULL,
  PRIMARY KEY (`ar_id`),
  CONSTRAINT `fk_article_user1`
    FOREIGN KEY (`user_us_id`)
    REFERENCES `oneconnectiong2`.`user` (`us_id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_article_user1_idx` ON `oneconnectiong2`.`article` (`user_us_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `oneconnectiong2`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oneconnectiong2`.`category` ;

CREATE TABLE IF NOT EXISTS `oneconnectiong2`.`category` (
  `cg_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cg_name` VARCHAR(50) NOT NULL,
  `cg_desc` VARCHAR(600) NULL DEFAULT NULL,
  `cg_visibility` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`cg_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `oneconnectiong2`.`category_has_article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oneconnectiong2`.`category_has_article` ;

CREATE TABLE IF NOT EXISTS `oneconnectiong2`.`category_has_article` (
  `category_cg_id` INT UNSIGNED NOT NULL,
  `article_ar_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`category_cg_id`, `article_ar_id`),
  CONSTRAINT `fk_category_has_article_category`
    FOREIGN KEY (`category_cg_id`)
    REFERENCES `oneconnectiong2`.`category` (`cg_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_article_article1`
    FOREIGN KEY (`article_ar_id`)
    REFERENCES `oneconnectiong2`.`article` (`ar_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_category_has_article_article1_idx` ON `oneconnectiong2`.`category_has_article` (`article_ar_id` ASC) VISIBLE;

CREATE INDEX `fk_category_has_article_category_idx` ON `oneconnectiong2`.`category_has_article` (`category_cg_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
