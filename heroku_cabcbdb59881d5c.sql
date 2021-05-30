/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - heroku_cabcbdb59881d5c
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`heroku_cabcbdb59881d5c` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `heroku_cabcbdb59881d5c`;

/*Table structure for table `ereg` */

DROP TABLE IF EXISTS `ereg`;

CREATE TABLE `ereg` (
  `eid` INT(11) NOT NULL,
  `lid` INT(11) NOT NULL,
  `regdate` VARCHAR(10) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `ereg` */

INSERT  INTO `ereg`(`eid`,`lid`,`regdate`) VALUES 
(10,13,'2021-05-21');

/*Table structure for table `event` */

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `eid` INT(5) NOT NULL AUTO_INCREMENT,
  `ename` VARCHAR(15) NOT NULL,
  `date` DATE NOT NULL,
  `maxno` INT(5) NOT NULL,
  `VENUE` VARCHAR(10) NOT NULL,
  `lastdate` DATE NOT NULL,
  `desc` TEXT NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `event` */

INSERT  INTO `event`(`eid`,`ename`,`date`,`maxno`,`VENUE`,`lastdate`,`desc`) VALUES 
(10,'cricket','2021-05-30',10,'kozhikode','2021-05-25','free registration');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `lid` INT(5) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(25) NOT NULL,
  `PASSWORD` VARCHAR(8) NOT NULL,
  `usertype` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=INNODB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

INSERT  INTO `login`(`lid`,`username`,`PASSWORD`,`usertype`) VALUES 
(1,'admin','12345','admin'),
(13,'isteenisac9@gmail.com','12345','student');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `lid` INT(5) NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  `dob` DATE NOT NULL,
  `dept` VARCHAR(15) NOT NULL,
  `email` VARCHAR(15) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `student` */

INSERT  INTO `student`(`lid`,`name`,`dob`,`dept`,`email`) VALUES 
(13,'ISTEEN ISAC','2000-04-09','COMPUTER','isteenisac9@gma');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
