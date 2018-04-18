/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.1.45-community : Database - restaurant
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`restaurant` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `restaurant`;

/*Table structure for table `billtable` */

DROP TABLE IF EXISTS `billtable`;

CREATE TABLE `billtable` (
  `ProductName` varchar(200) DEFAULT NULL,
  `ProductPrice` float DEFAULT NULL,
  `Quantity` int(10) DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  KEY `Id` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `employe` */

DROP TABLE IF EXISTS `employe`;

CREATE TABLE `employe` (
  `EmployeId` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeName` varchar(100) NOT NULL,
  `EAddress` varchar(300) NOT NULL,
  `ECellNum` varchar(12) NOT NULL,
  `EEmail` varchar(50) NOT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  KEY `EmployeId` (`EmployeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `ProductId` varchar(20) NOT NULL,
  `ProductName` varchar(200) NOT NULL,
  `ProductPrice` float NOT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `purchase` */

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
  `PurchaseId` int(20) NOT NULL AUTO_INCREMENT,
  `PDate` date DEFAULT NULL,
  `BillNumber` varchar(50) DEFAULT NULL,
  `ShopName` varchar(200) DEFAULT NULL,
  `GoodsPrice` double DEFAULT NULL,
  `TaxAmount` double DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  KEY `PurchaseId` (`PurchaseId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `selling` */

DROP TABLE IF EXISTS `selling`;

CREATE TABLE `selling` (
  `BillNumber` int(10) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `SellAmount` float NOT NULL,
  PRIMARY KEY (`BillNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tax` */

DROP TABLE IF EXISTS `tax`;

CREATE TABLE `tax` (
  `TaxValue` float NOT NULL,
  `Discount` float NOT NULL,
  `UserName` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `totalsell` */

DROP TABLE IF EXISTS `totalsell`;

CREATE TABLE `totalsell` (
  `CustomerName` varchar(50) NOT NULL,
  `BillAmount` float NOT NULL,
  `BillDate` date DEFAULT NULL,
  `Month` varchar(20) NOT NULL,
  `Year` varchar(20) NOT NULL,
  `BillId` int(10) NOT NULL AUTO_INCREMENT,
  `MonthYear` varchar(100) NOT NULL,
  `BillNumber` varchar(100) DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  KEY `BillId` (`BillId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `UserId` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(20) NOT NULL,
  `PassWord` varchar(20) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `MobileNumber` decimal(10,0) NOT NULL,
  `Emailid` varchar(30) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
