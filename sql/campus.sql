/*
SQLyog Ultimate v11.24 (64 bit)
MySQL - 5.7.19-log : Database - campus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`campus` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `campus`;

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin_user_idx` (`userid`),
  CONSTRAINT `fk_admin_user` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_admin` */

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `infoid` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `commenttime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user_idx` (`userid`),
  KEY `fk_comment_info_idx` (`infoid`),
  CONSTRAINT `fk_comment_info` FOREIGN KEY (`infoid`) REFERENCES `t_helpinfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_comment` */

/*Table structure for table `t_helpinfo` */

DROP TABLE IF EXISTS `t_helpinfo`;

CREATE TABLE `t_helpinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `crettime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timeout` bigint(20) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` varchar(45) NOT NULL,
  `tip` varchar(45) NOT NULL,
  `imgpath` varchar(45) NOT NULL,
  `reward` varchar(45) NOT NULL,
  `t_helpinfocol` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_helpinfo_user_idx` (`userid`),
  CONSTRAINT `fk_helpinfo_user` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_helpinfo` */

/*Table structure for table `t_helpstate` */

DROP TABLE IF EXISTS `t_helpstate`;

CREATE TABLE `t_helpstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `infoid` int(11) NOT NULL,
  `timeout` tinyint(4) NOT NULL,
  `received` tinyint(4) NOT NULL,
  `receiverid` int(11) DEFAULT NULL,
  `achieved` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_helpstate_helpinfo_idx` (`infoid`),
  KEY `fk__idx` (`receiverid`),
  CONSTRAINT `fk_helpstate_helpinfo` FOREIGN KEY (`infoid`) REFERENCES `t_helpinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_helpstate_user` FOREIGN KEY (`receiverid`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_helpstate` */

/*Table structure for table `t_notice` */

DROP TABLE IF EXISTS `t_notice`;

CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cretime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creatorid` int(11) DEFAULT NULL,
  `notice` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notice_user_idx` (`creatorid`),
  CONSTRAINT `fk_notice_user` FOREIGN KEY (`creatorid`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_notice` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` int(11) NOT NULL,
  `account` varchar(45) NOT NULL,
  `password0` varchar(45) NOT NULL,
  `oldpassword` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stuid_UNIQUE` (`stuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_user` */

/*Table structure for table `t_usercertif` */

DROP TABLE IF EXISTS `t_usercertif`;

CREATE TABLE `t_usercertif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `state` tinyint(4) NOT NULL,
  `cardpath` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_certif_user_idx` (`userid`),
  CONSTRAINT `fk_certif_user` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_usercertif` */

/*Table structure for table `t_userportrait` */

DROP TABLE IF EXISTS `t_userportrait`;

CREATE TABLE `t_userportrait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `portrait` blob,
  PRIMARY KEY (`id`),
  KEY `fk_port_user_idx` (`userid`),
  CONSTRAINT `fk_port_user` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_userportrait` */

/*Table structure for table `t_userpriminfo` */

DROP TABLE IF EXISTS `t_userpriminfo`;

CREATE TABLE `t_userpriminfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `neckname` varchar(45) DEFAULT NULL,
  `usernmail` varchar(45) DEFAULT NULL,
  `userphone` varchar(45) DEFAULT NULL,
  `sex` enum('M','F') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `qq` varchar(45) DEFAULT NULL,
  `dormnum` int(11) DEFAULT NULL,
  `dormaddr` varchar(45) DEFAULT NULL,
  `homeaddr` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prim_user_idx` (`userid`),
  CONSTRAINT `fk_prim_user` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_userpriminfo` */

/*Table structure for table `t_userquestion` */

DROP TABLE IF EXISTS `t_userquestion`;

CREATE TABLE `t_userquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `question1` varchar(45) DEFAULT NULL,
  `answer1` varchar(45) DEFAULT NULL,
  `question2` varchar(45) DEFAULT NULL,
  `answer2` varchar(45) DEFAULT NULL,
  `question3` varchar(45) DEFAULT NULL,
  `answer3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qustion_user_idx` (`userid`),
  CONSTRAINT `fk_qustion_user` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_userquestion` */

/*Table structure for table `t_usertoken` */

DROP TABLE IF EXISTS `t_usertoken`;

CREATE TABLE `t_usertoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `crettime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_token_user_idx` (`userid`),
  CONSTRAINT `fk_token_user` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_usertoken` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
