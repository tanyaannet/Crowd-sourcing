/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - event
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`event` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `event`;

/*Table structure for table `ereg` */

DROP TABLE IF EXISTS `ereg`;

CREATE TABLE `ereg` (
  `eid` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `regdate` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ereg` */

insert  into `ereg`(`eid`,`lid`,`regdate`) values 
(10,13,'2021-05-21');

/*Table structure for table `event` */

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `eid` int(5) NOT NULL AUTO_INCREMENT,
  `ename` varchar(15) NOT NULL,
  `date` date NOT NULL,
  `maxno` int(5) NOT NULL,
  `VENUE` varchar(10) NOT NULL,
  `lastdate` date NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `event` */

insert  into `event`(`eid`,`ename`,`date`,`maxno`,`VENUE`,`lastdate`,`desc`) values 
(10,'cricket','2021-05-30',10,'kozhikode','2021-05-25','free registration');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `lid` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `PASSWORD` varchar(8) NOT NULL,
  `usertype` varchar(10) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`lid`,`username`,`PASSWORD`,`usertype`) values 
(1,'admin','12345','admin'),
(13,'isteenisac9@gmail.com','12345','student');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `lid` int(5) NOT NULL,
  `name` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `dept` varchar(15) NOT NULL,
  `email` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`lid`,`name`,`dob`,`dept`,`email`) values 
(13,'ISTEEN ISAC','2000-04-09','COMPUTER','isteenisac9@gma');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
