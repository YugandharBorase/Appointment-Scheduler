-- Create database if not exists
CREATE DATABASE IF NOT EXISTS `client_schedule`;
USE `client_schedule`;

-- Create table `country`
CREATE TABLE IF NOT EXISTS `country` (
    `countryId` INT PRIMARY KEY,
    `country` VARCHAR(50) NOT NULL,
    `createDate` DATETIME,
    `createdBy` VARCHAR(50),
    `lastUpdate` DATETIME,
    `lastUpdateBy` VARCHAR(50)
);

-- Create table `city`
CREATE TABLE IF NOT EXISTS `city` (
    `cityId` INT PRIMARY KEY,
    `city` VARCHAR(50) NOT NULL,
    `countryId` INT,
    `createDate` DATETIME,
    `createdBy` VARCHAR(50),
    `lastUpdate` DATETIME,
    `lastUpdateBy` VARCHAR(50),
    FOREIGN KEY (`countryId`) REFERENCES `country`(`countryId`)
);

-- Create table `address`
CREATE TABLE IF NOT EXISTS `address` (
    `addressId` INT PRIMARY KEY,
    `address` VARCHAR(100) NOT NULL,
    `address2` VARCHAR(100),
    `cityId` INT,
    `postalCode` VARCHAR(20),
    `phone` VARCHAR(20),
    `createDate` DATETIME,
    `createdBy` VARCHAR(50),
    `lastUpdate` DATETIME,
    `lastUpdateBy` VARCHAR(50),
    FOREIGN KEY (`cityId`) REFERENCES `city`(`cityId`)
);

-- Create table `customer`
CREATE TABLE IF NOT EXISTS `customer` (
    `customerId` INT PRIMARY KEY,
    `customerName` VARCHAR(100) NOT NULL,
    `addressId` INT,
    `active` TINYINT(1),
    `createDate` DATETIME,
    `createdBy` VARCHAR(50),
    `lastUpdate` DATETIME,
    `lastUpdateBy` VARCHAR(50),
    FOREIGN KEY (`addressId`) REFERENCES `address`(`addressId`)
);

-- Create table `user`
CREATE TABLE IF NOT EXISTS `user` (
    `userId` INT PRIMARY KEY,
    `userName` VARCHAR(50) NOT NULL,
    `password` VARCHAR(50) NOT NULL
);

-- Create table `appointment`
CREATE TABLE IF NOT EXISTS `appointment` (
    `appointmentId` INT PRIMARY KEY,
    `customerId` INT,
    `userId` INT,
    `title` VARCHAR(100),
    `description` VARCHAR(255),
    `location` VARCHAR(100),
    `contact` VARCHAR(50),
    `type` VARCHAR(50),
    `url` VARCHAR(255),
    `start` DATETIME,
    `end` DATETIME,
    `createDate` DATETIME,
    `createdBy` VARCHAR(50),
    `lastUpdate` DATETIME,
    `lastUpdateBy` VARCHAR(50),
    FOREIGN KEY (`customerId`) REFERENCES `customer`(`customerId`),
    FOREIGN KEY (`userId`) REFERENCES `user`(`userId`)
);

-- Sample data insertion
INSERT INTO `country` (`countryId`, `country`, `createDate`, `createdBy`, `lastUpdate`, `lastUpdateBy`) VALUES 
(1, 'US', '2023-09-17 00:00:00', 'test', '2023-09-17 00:00:00', 'test'),
(2, 'Canada', '2023-09-17 00:00:00', 'test', '2023-09-17 00:00:00', 'test'),
(3, 'Norway', '2023-09-17 00:00:00', 'test', '2023-09-17 00:00:00', 'test');

INSERT INTO `city` (`cityId`, `city`, `countryId`, `createDate`, `createdBy`, `lastUpdate`, `lastUpdateBy`) VALUES 
(1, 'New York', 1, '2023-09-17 00:00:00', 'test', '2023-09-17 00:00:00', 'test'),
(2, 'Los Angeles', 1, '2023-09-17 00:00:00', 'test', '2023-09-17 00:00:00', 'test'),
(3, 'Toronto', 2, '2023-09-17 00:00:00', 'test', '2023-09-17 00:00:00', 'test'),
(4, 'Vancouver', 2, '2023-09-17 00:00:00', 'test', '2023-09-17 00:00:00', 'test'),
(5, 'Oslo', 3, '2023-09-17 00:00:00', 'test', '2023-09-17 00:00:00', 'test');

INSERT INTO `address` (`addressId`, `address`, `address2`, `cityId`, `postalCode`, `phone`, `createDate`, `createdBy`, `lastUpdate`, `lastUpdateBy`) VALUES 
(1, '123 Main', '', 1, '11111', '555-1212', '2023-09-17 00:00:00', 'test', '2023-09-17 00:00:00', 'test');
