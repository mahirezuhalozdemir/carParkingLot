CREATE DATABASE `carParkingLot`; 
USE `carParkingLot`;
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`campusTable` (
  `campusId` BIGINT(12) NOT NULL,
  `campusName` VARCHAR(20) NOT NULL,
  `campusBlockCount` INT NOT NULL,
  `managementTable_managementId` BIGINT(12) NOT NULL,
  PRIMARY KEY (`campusId`, `managementTable_managementId`),
  UNIQUE INDEX `campusId_UNIQUE` (`campusId` ASC) VISIBLE,
  INDEX `fk_campusTable_managementTable1_idx` (`managementTable_managementId` ASC) VISIBLE,
  CONSTRAINT `fk_campusTable_managementTable1`
    FOREIGN KEY (`managementTable_managementId`)
    REFERENCES `carparkingdatabase`.`managementTable` (`managementId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`blockTable` (
  `blockId` BIGINT(12) NOT NULL,
  `blockName` VARCHAR(25) NOT NULL,
  `blockFloorCount` INT NOT NULL,
  `campusTable_campusId` INT NOT NULL,
  `parkingattendantTable_parkingattendantId` INT NOT NULL,
  PRIMARY KEY (`blockId`, `parkingattendantTable_parkingattendantId`),
  UNIQUE INDEX `blockId_UNIQUE` (`blockId` ASC) VISIBLE,
  INDEX `fk_blockTable_campusTable_idx` (`campusTable_campusId` ASC) VISIBLE,
  INDEX `fk_blockTable_parkingattendantTable1_idx` (`parkingattendantTable_parkingattendantId` ASC) VISIBLE,
  CONSTRAINT `fk_blockTable_campusTable`
    FOREIGN KEY (`campusTable_campusId`)
    REFERENCES `carparkingdatabase`.`campusTable` (`campusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blockTable_parkingattendantTable1`
    FOREIGN KEY (`parkingattendantTable_parkingattendantId`)
    REFERENCES `carparkingdatabase`.`parkingattendantTable` (`parkingattendantId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`carTable` (
  `carLicenseplate` VARCHAR(10) NOT NULL,
  `carcolor` VARCHAR(15) NOT NULL,
  `carModel` VARCHAR(25) NOT NULL,
  `carBrand` VARCHAR(25) NOT NULL,
  `carIsscuba` BIT(2) NOT NULL,
  `customerTable_customerId` BIGINT(12) NOT NULL,
  PRIMARY KEY (`carLicenseplate`),
  UNIQUE INDEX `carLicenseplate_UNIQUE` (`carLicenseplate` ASC) VISIBLE,
  INDEX `fk_carTable_customerTable1_idx` (`customerTable_customerId` ASC) VISIBLE,
  CONSTRAINT `fk_carTable_customerTable1`
    FOREIGN KEY (`customerTable_customerId`)
    REFERENCES `carparkingdatabase`.`customerTable` (`customerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`managementTable` (
  `managementId` BIGINT(12) NOT NULL,
  `managementName` VARCHAR(45) NULL,
  `managementLastname` VARCHAR(45) NULL,
  `managementPassword` VARCHAR(15) NULL,
  PRIMARY KEY (`managementId`),
  UNIQUE INDEX `managementPassword_UNIQUE` (`managementPassword` ASC) VISIBLE);
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`floorTable` (
  `floorId` BIGINT(12) NOT NULL,
  `floorName` VARCHAR(15) NOT NULL,
  `floorSectionCount` INT NOT NULL,
  `blockTable_blockId` INT NOT NULL,
  PRIMARY KEY (`floorId`),
  UNIQUE INDEX `floorName_UNIQUE` (`floorName` ASC) VISIBLE,
  UNIQUE INDEX `floorId_UNIQUE` (`floorId` ASC) VISIBLE,
  INDEX `fk_floorTable_blockTable1_idx` (`blockTable_blockId` ASC) VISIBLE,
  CONSTRAINT `fk_floorTable_blockTable1`
    FOREIGN KEY (`blockTable_blockId`)
    REFERENCES `carparkingdatabase`.`blockTable` (`blockId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`parkingattendantTable` (
  `parkingattendantId` BIGINT(12) NOT NULL,
  `parkingattendantName` VARCHAR(15) NOT NULL,
  `parkingattendantSurname` VARCHAR(15) NOT NULL,
  `parkingattendantEmail` VARCHAR(15) NULL,
  `parkingattendantAddress` VARCHAR(15) NULL,
  `parkingattendantPassword` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`parkingattendantId`),
  UNIQUE INDEX `parkingattendantId_UNIQUE` (`parkingattendantId` ASC) VISIBLE,
  UNIQUE INDEX `parkingattendantPassword_UNIQUE` (`parkingattendantPassword` ASC) VISIBLE);
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`zoneTable` (
  `zoneId` BIGINT(12) NOT NULL,
  `zoneColor` VARCHAR(15) NOT NULL,
  `sectionTable_sectionId` BIGINT(12) NOT NULL,
  PRIMARY KEY (`zoneId`),
  INDEX `fk_zoneTable_sectionTable1_idx` (`sectionTable_sectionId` ASC) VISIBLE,
  CONSTRAINT `fk_zoneTable_sectionTable1`
    FOREIGN KEY (`sectionTable_sectionId`)
    REFERENCES `carparkingdatabase`.`sectionTable` (`sectionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`sectionTable` (
  `sectionId` BIGINT(12) NOT NULL,
  `sectionName` VARCHAR(15) NOT NULL,
  `sectionColor` VARCHAR(15) NULL,
  `floorTable_floorId` BIGINT(12) NOT NULL,
  `isSuitableforhandicapped` BIT(2) NULL,
  `isSuitableforscuba` BIT(2) NULL,
  PRIMARY KEY (`sectionId`),
  UNIQUE INDEX `sectionId_UNIQUE` (`sectionId` ASC) VISIBLE,
  INDEX `fk_sectionTable_floorTable1_idx` (`floorTable_floorId` ASC) VISIBLE,
  CONSTRAINT `fk_sectionTable_floorTable1`
    FOREIGN KEY (`floorTable_floorId`)
    REFERENCES `carparkingdatabase`.`floorTable` (`floorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`customerTable` (
  `customerId` BIGINT(12) NOT NULL AUTO_INCREMENT,
  `customerName` VARCHAR(15) NOT NULL,
  `customerLastname` VARCHAR(15) NOT NULL,
  `customerPhonenumber` VARCHAR(15) NOT NULL,
  `customerEmail` VARCHAR(15) NOT NULL,
  `customerAddress` VARCHAR(45) NULL,
  `customerRecorddate` DATE NOT NULL,
  PRIMARY KEY (`customerId`),
  UNIQUE INDEX `customerId_UNIQUE` (`customerId` ASC) VISIBLE);
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`ticketTable` (
  `ticketId` BIGINT(12) NOT NULL,
  `customerTable_customerId` BIGINT(12) NOT NULL,
  `zoneTable_zoneId` BIGINT(12) NOT NULL,
  PRIMARY KEY (`ticketId`, `zoneTable_zoneId`),
  INDEX `fk_ticketTable_customerTable1_idx` (`customerTable_customerId` ASC) VISIBLE,
  INDEX `fk_ticketTable_zoneTable1_idx` (`zoneTable_zoneId` ASC) VISIBLE,
  CONSTRAINT `fk_ticketTable_customerTable1`
    FOREIGN KEY (`customerTable_customerId`)
    REFERENCES `carparkingdatabase`.`customerTable` (`customerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticketTable_zoneTable1`
    FOREIGN KEY (`zoneTable_zoneId`)
    REFERENCES `carparkingdatabase`.`zoneTable` (`zoneId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`feeTable` (
  `ticketTable_ticketId` BIGINT(12) NOT NULL,
  `withCard` BIT(2) NULL,
  `withCash` BIT(2) NULL,
  `withParkcard` BIT(2) NULL,
  `hourlyFee` INT NULL,
  `dateFee` INT NULL,
  `monthlyFee` INT NULL,
  PRIMARY KEY (`ticketTable_ticketId`),
  INDEX `fk_paymentMethod_ticketTable1_idx` (`ticketTable_ticketId` ASC) VISIBLE,
  CONSTRAINT `fk_paymentMethod_ticketTable1`
    FOREIGN KEY (`ticketTable_ticketId`)
    REFERENCES `carparkingdatabase`.`ticketTable` (`ticketId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE IF NOT EXISTS `carparkingdatabase`.`isFine` (
  `isFine` BIT(2) NOT NULL,
  `busyStartTime` DATETIME NOT NULL,
  `busyFinishtime` DATETIME NOT NULL,
  `zoneTable_zoneId` BIGINT(12) NOT NULL,
  PRIMARY KEY (`isFine`, `zoneTable_zoneId`),
  INDEX `fk_isFine_zoneTable1_idx` (`zoneTable_zoneId` ASC) VISIBLE,
  CONSTRAINT `fk_isFine_zoneTable1`
    FOREIGN KEY (`zoneTable_zoneId`)
    REFERENCES `carparkingdatabase`.`zoneTable` (`zoneId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);