CREATE DATABASE IF NOT EXISTS`LIPDUBTRAVEL`;
USE `LIPDUBTRAVEL`;
CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`FLIGHT`(
	`flightId` VARCHAR(10),
    `flightFrom` VARCHAR(50),
    `flightTo` VARCHAR(50),
    `timeFrom` TIME,
    `timeTo` TIME,
    `flightStatus` BOOLEAN,
    `flightType` VARCHAR(50),
    PRIMARY KEY (`flightId`)
);
CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`CABIN` (
  `cabinId` VARCHAR(10) NOT NULL,
  `cabinName` VARCHAR(50) NOT NULL,
  `cabinStatus` BOOLEAN,
  PRIMARY KEY (`cabinId`)
  );

CREATE TABLE IF NOT EXISTS `FLIGHTCABIN` (
	`flightCabinId` VARCHAR(10),
	`flightId` VARCHAR(10),
	`cabinId` VARCHAR(10),
    `price` FLOAT CHECK (`price` > 0),
	FOREIGN KEY (`flightId`) REFERENCES `FLIGHT`(`flightId`),
    FOREIGN KEY (`cabinId`) REFERENCES `CABIN`(`cabinId`),
    PRIMARY KEY (`flightCabinId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`HOTEL` (
	`hotelId` VARCHAR(10) NOT NULL,
    `hotelName` VARCHAR(100) NOT NULL,
    `city` VARCHAR(50) NOT NULL,
    `descriptions` TEXT,
    `price` float NOT NULL CHECK (`price` > 0),
	`image` TEXT, 
    `hotelStatus` BOOLEAN,
    PRIMARY KEY (`hotelId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`SERVICE` (
	`serviceId` VARCHAR(10) NOT NULL,
    `serviceName` VARCHAR(100) NOT NULL,
    `descriptions` TEXT,
    `serviceStatus` BOOLEAN,
    `price` FLOAT CHECK (`price` > 0),
    PRIMARY KEY (`serviceId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`HOTELSERVICE` (
	`hotelServiceId` VARCHAR(10),
	`hotelId` VARCHAR(10),
    `serviceId` VARCHAR(10),
    `price` FLOAT CHECK (`price` > 0),
    FOREIGN KEY (`hotelId`) REFERENCES `HOTEL`(`hotelId`),
    FOREIGN KEY (`serviceId`) REFERENCES `SERVICE`(`serviceId`),
    PRIMARY KEY (`hotelServiceId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`CAR` (
	`carId` VARCHAR(10) NOT NULL,
    `carName` VARCHAR(100) NOT NULL,
    `descriptions` TEXT,
	`carStatus` BOOLEAN,
    PRIMARY KEY (`carId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`TECH` (
	`techId` VARCHAR(10) NOT NULL,
	`techName` VARCHAR(100) NOT NULL,
    `techStatus` BOOLEAN,
    `value` TEXT,
    PRIMARY KEY (`techId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`CARTECH` (
	`carTechId` VARCHAR(10),
	`carId` VARCHAR(10),
    `techId` VARCHAR(10),
    `price` FLOAT CHECK (`price` > 0),
    FOREIGN KEY (`carId`) REFERENCES `CAR`(`carId`),
    FOREIGN KEY (`techId`) REFERENCES `TECH`(`techId`),
    PRIMARY KEY (`carTechId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`CRUISE` (
	`cruiseId` VARCHAR(10) NOT NULL,
    `cruiseName` VARCHAR(100) NOT NULL,
    `descriptions` TEXT,
    `cruiseStatus` BOOLEAN,
    PRIMARY KEY (`cruiseId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`CABINSEA` (
	`cabinId` VARCHAR(10) NOT NULL,
    `cabinName` VARCHAR(100) NOT NULL,
    `cabinStatus` BOOLEAN,
    PRIMARY KEY (`cabinId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`CRUISECABIN` (
	`cruiseCabinId` VARCHAR(10),
	`cruiseId` VARCHAR(10),
    `cabinId` VARCHAR(10),
    `price` FLOAT NOT NULL CHECK(`price` > 0),
    FOREIGN KEY (`cruiseId`) REFERENCES `CRUISE`(`cruiseId`),
    FOREIGN KEY (`cabinId`) REFERENCES `CABINSEA`(`cabinId`),
	PRIMARY KEY (`cruiseCabinId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`USER` (
	`userId` VARCHAR(10) NOT NULL,
    `userName` VARCHAR(100) NOT NULL,
    `userSex` VARCHAR(10) NOT NULL,
    `userAddress` VARCHAR(100) NOT NULL,
    `userEmail` TEXT NOT NULL,
    `userPassword` TEXT NOT NULL,
    `userStatus` BOOLEAN,
    PRIMARY KEY (`userId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`ORDER` (
	`orderId` VARCHAR(10) NOT NULL,
    `userId` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`orderId`),
    FOREIGN KEY (`userId`) REFERENCES `USER`(`userId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`ORDERHOTEL` (
	`orderHotelId` INT AUTO_INCREMENT,
	`orderId` VARCHAR(10),
    `hotelServiceId` VARCHAR(10),
    FOREIGN KEY (`orderId`) REFERENCES `ORDER`(`orderId`),
	FOREIGN KEY (`hotelServiceId`) REFERENCES `HOTELSERVICE`(`hotelServiceId`),
    PRIMARY KEY (`orderHotelId`) 
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`ORDERCAR` (
	`orderCarId` INT AUTO_INCREMENT,
	`orderId` VARCHAR(10),
    `carTechId` VARCHAR(10),
	FOREIGN KEY (`orderId`) REFERENCES `ORDER`(`orderId`),
    FOREIGN KEY (`carId`) REFERENCES `CAR`(`carId`),
    PRIMARY KEY (`orderCarId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`ORDERFLIGHT` (
	`orderFlightId` INT AUTO_INCREMENT,
	`orderId` VARCHAR(10),
    `flighCabintId` VARCHAR(10),
    FOREIGN KEY (`orderId`) REFERENCES `ORDER`(`orderId`),
    FOREIGN KEY (`flightId`) REFERENCES `FLIGHT`(`flightId`),
    PRIMARY KEY (`orderFlightId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`ORDERCRUISE` (
	`orderCruiseId` INT AUTO_INCREMENT,
	`orderId` VARCHAR(10),
    `cruiseId` VARCHAR(10),
    FOREIGN KEY (`orderId`) REFERENCES `ORDER`(`orderId`),
    FOREIGN KEY (`cruiseId`) REFERENCES `CRUISE`(`cruiseId`),
    PRIMARY KEY (`orderCruiseId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`BLOG` (
	`blogId` VARCHAR(10) NOT NULL,
    `blogName` VARCHAR(100) NOT NULL,
    `blogContent` TEXT,
    `dateCreated` DATE,
    `blogStatus` BOOLEAN,
    PRIMARY KEY (`blogId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`COMMENT` (
	`commentId` VARCHAR(10) NOT NULL,
    `blogId` VARCHAR(10),
    `userId` VARCHAR(10),
    `commentContent` TEXT,
    `dateCreated` DATE,
    `parentId` VARCHAR(10),
    PRIMARY KEY (`commentId`),
    FOREIGN KEY (`blogId`) REFERENCES `BLOG`(`blogId`),
    FOREIGN KEY (`userId`) REFERENCES `USER`(`userId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`BANNER` (
	`bannerId` VARCHAR(10) NOT NULL,
    `bannerName` VARCHAR(100) NOT NULL,
    `bannerImage` TEXT,
    `title` VARCHAR(100),
    `bannerLink` TEXT,
    PRIMARY KEY (`bannerId`)
);

CREATE TABLE IF NOT EXISTS `LIPDUBTRAVEL`.`SETTING` (
	`email` TEXT NOT NULL,
    `phoneNumber` INT NOT NULL CHECK(`phoneNumber` > 0),
    `logo` TEXT,
    `settingId` VARCHAR(10),
    PRIMARY KEY (`settingId`),
    `value` TEXT
);