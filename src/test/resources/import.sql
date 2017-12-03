-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: smdb
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user_friends`
--

DROP TABLE IF EXISTS `user_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
DROP TABLE IF EXISTS `user_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;


CREATE TABLE `users` (  `user_name` varchar(255) NOT NULL,  `email_addr` varchar(255) DEFAULT NULL,  `first_name` varchar(255) DEFAULT NULL,  `last_name` varchar(255) DEFAULT NULL,  `user_pass` varchar(255) DEFAULT NULL,  `user_picture` varchar(250) DEFAULT NULL,  `user_bio` varchar(250) DEFAULT NULL,  `user_movies` int(11) DEFAULT '0',  PRIMARY KEY (`user_name`)) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
CREATE TABLE `user_roles` (  `user_name` varchar(15) NOT NULL,  `role_name` varchar(15) NOT NULL,  PRIMARY KEY (`user_name`,`role_name`),  CONSTRAINT `user_roles_users_user_name_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
CREATE TABLE `user_friends` (  `user_name` varchar(255) NOT NULL,  `friend_user_name` varchar(255) NOT NULL,  PRIMARY KEY (`user_name`,`friend_user_name`),  CONSTRAINT `user_friends_users_user_name_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
CREATE TABLE `user_movies` (  `user_name` varchar(255) NOT NULL,  `movie_id` int(11) NOT NULL,  `movie_plot` varchar(2000) DEFAULT NULL,  `movie_date` varchar(10) DEFAULT NULL,  `movie_poster` varchar(100) DEFAULT NULL,  `movie_title` varchar(100) DEFAULT NULL,  PRIMARY KEY (`user_name`,`movie_id`),  CONSTRAINT `user_movies_users_user_name_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;




LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('12345','laytonemerson@gmail.com','Layton','Emerson','12345','','safgsfasdfasdfsdaf',0),('jamie','jamie.kruser@gmail.com','Jamie','Kruser','12345','','Lame',1),('laytonemerson1','11@11.com','11','11','12345','','',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES ('12345','user'),('jamie','user'),('laytonemerson1','user');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `user_friends` WRITE;
/*!40000 ALTER TABLE `user_friends` DISABLE KEYS */;
INSERT INTO `user_friends` VALUES ('12345','jamie'),('12345','laytonemerson');
/*!40000 ALTER TABLE `user_friends` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `user_movies` WRITE;
/*!40000 ALTER TABLE `user_movies` DISABLE KEYS */;
INSERT INTO `user_movies` VALUES ('jamie',280,'Nearly 10 years have passed since Sarah Connor was targeted for termination by a cyborg from the future. Now her son, John, the future leader of the resistance, is the target for a newer, more deadly terminator. Once again, the resistance has managed to send a protector back to attempt to save John and his mother Sarah.','1991-07-01','/2y4dmgWYRMYXdD1UyJVcn2HSd1D.jpg','Terminator 2: Judgment Day'),('jamie',999,'plot 999','2017-12-03','poster 999','title 999');
/*!40000 ALTER TABLE `user_movies` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-03  9:43:44
