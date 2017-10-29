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



CREATE TABLE `users` (  `user_name` varchar(255) NOT NULL,  `email_addr` varchar(255) DEFAULT NULL,  `first_name` varchar(255) DEFAULT NULL,  `last_name` varchar(255) DEFAULT NULL,  `user_pass` varchar(255) DEFAULT NULL,  `user_picture` varchar(250) DEFAULT NULL,  `user_bio` varchar(250) DEFAULT NULL,  `user_movies` int(11) DEFAULT '0',  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `user_friends` (  `user_name` varchar(255) NOT NULL,  `friend_user_name` varchar(255) NOT NULL,  PRIMARY KEY (`user_name`,`friend_user_name`),  CONSTRAINT `user_friends_users_user_name_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `user_movies` (  `user_name` varchar(255) NOT NULL,  `movie_id` int(11) NOT NULL,  `movie_plot` varchar(2000) DEFAULT NULL,  `movie_date` varchar(10) DEFAULT NULL,  `movie_poster` varchar(100) DEFAULT NULL,  `movie_title` varchar(100) DEFAULT NULL,  PRIMARY KEY (`user_name`,`movie_id`),
  CONSTRAINT `user_movies_users_user_name_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `user_roles` (  `user_name` varchar(15) NOT NULL,  `role_name` varchar(15) NOT NULL,  PRIMARY KEY (`user_name`,`role_name`),  CONSTRAINT `user_roles_users_user_name_fk` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('11','1@1.com','11','11','11111','','',0),('11111','111@111.com','111','111','11111','abc','11111 bio',0),('12345','email@email.com','12345','12345','12345','','this is my bio for 12345',15),('54321','1@1.com','54321','54321','54321',NULL,NULL,0),('777','77@g.com','777','777','777777','','',0),('99999','2@2.com','Layton','Emerson','99999','','this is my bio',0),('aa','aa@aa.com','aa','aa','aaaaa','https://www.thesun.co.uk/wp-content/uploads/2017/08/nintchdbpict000000897878.jpg?strip=all&quality=100&w=960',NULL,0),('aaa','a@a.com','aa','aa','aaaaa','https://www.thesun.co.uk/wp-content/uploads/2017/08/nintchdbpict000000897878.jpg?strip=all&quality=100&w=960',NULL,0),('HP','it@gmail.com','Hocus','Pocus','yuppers','https://pbs.twimg.com/media/Cv8xTEwWcAEW1k3.jpg','blah blah blah blah... I don\'t say that',0),('laytonemerson','laytonemerson@gmail.com','Layton','Emerson','12345',NULL,NULL,0),('lilbitknits','danielilbitknits@gmail.com','Danie','Emerson','shorty02',NULL,NULL,0),('zzz','zzz@zzz.com','zzzzz','zzz','zzzzz','',NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `user_friends` WRITE;
/*!40000 ALTER TABLE `user_friends` DISABLE KEYS */;
INSERT INTO `user_friends` VALUES ('11111','aa'),('11111','HP'),('12345','11'),('12345','11111'),('12345','54321'),('12345','777'),('12345','99999'),('12345','aa'),('12345','aaa'),('12345','lilbitknits'),('12345','zzz'),('HP','12345'),('HP','777');
/*!40000 ALTER TABLE `user_friends` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `user_movies` WRITE;
/*!40000 ALTER TABLE `user_movies` DISABLE KEYS */;
INSERT INTO `user_movies` VALUES ('12345',239,'Two musicians witness a mob hit and struggle to find a way out of the city before they are found by the gangsters. Their only opportunity is to join an all-girl band as they leave on a tour. To make their getaway they must first disguise themselves as women, then keep their identities secret and deal with the problems this brings - such as an attractive bandmate and a very determined suitor.','1959-03-18','/pxc9EFCMYkItESpqqrI783yl8Gh.jpg','Some Like It Hot'),('12345',2800,'Sarah Huttinger\'s return home with her fiance convinces her that the sedate, proper, country-club lifestyle of her family isn\'t for her ? and that maybe the Huttinger family isn\'t even hers ? as she uncovers secrets that suggest the Huttingers are neither sedate nor proper.','2005-12-23','/6Hj5mFf1nv6gsYhGpz0xetPGYbg.jpg','Rumor Has It...'),('12345',10050,'When Berke Landers, a popular high school basketball star, gets dumped by his life-long girlfriend, Allison, he soon begins to lose it. But with the help of his best friend Felix\'s sister Kelly, he follows his ex into the school\'s spring musical. Thus ensues a love triangle loosely based upon Shakespeare\'s \"A Midsummer Night\'s Dream\", where Berke is only to find himself getting over Allison and beginning to fall for Kelly.','2001-03-08','/7EeNtzBjB0PJoW6RbaK3rvNrrkz.jpg','Get Over It'),('12345',10115,'Haley is a naturally gifted athlete but, with her social behavior, the teen seems intent on squandering her abilities. After a final brush with the law, a judge sentences her to an elite gymnastics academy run by a legendary, hard-nosed coach. Once there, Haley\'s rebellious attitude wins her both friends and enemies.','2006-04-21','/8EgxN4HcI0KUWuL6Qn1PG432Wsv.jpg','Stick It'),('12345',10439,'After 300 years of slumber, three sister witches are accidentally resurrected in Salem on Halloween night, and it us up to three kids and their newfound feline friend to put an end to the witches\' reign of terror once and for all.','1993-07-16','/4boIuVTbEYv9pynSj99jK5EezfA.jpg','Hocus Pocus'),('12345',10647,'Like some other kids, 12-year-old Trevor McKinney believed in the goodness of human nature. Like many other kids, he was determined to change the world for the better. Unlike most other kids, he succeeded.','2000-10-12','/l5diVKdxKMUkn4jOAxASbbGtSl1.jpg','Pay It Forward'),('12345',16791,'A Psammead is \'It\', an ancient, irritable, ugly sand fairy, which five children find one day in a gravel pit. As a reward for finding him, It grants the children one wish a day, the results of which will last until sunset.','2004-10-15','/8pwS9DSeAfNKeXC6ssTEHjxDH94.jpg','Five Children and It'),('12345',22798,'In Bodeen, Texas, Land Of The Dragon, an indie-rock loving misfit finds a way of dealing with her small-town misery after she discovers a roller derby league in nearby Austin.','2009-09-13','/At7kxW4HK54kALuD9qDhFgsxkKM.jpg','Whip It'),('12345',31232,'After a warehouse fire, museum director Groof and assistant Pimm find everything destroyed, only one statue withstood the fire mysteriously undamaged. Suddenly Groof is lying dead on the ground, killed by the statue? Pimm finds out that the cursed statue has been created by Rabbi Loew in 16th century and will withstand every human attempt to destroy it. Pimm decides to use it to his own advantage.','1966-03-17','/xbJE4J3hrXVomT9VEKAPnQ4tjoa.jpg','It!'),('12345',50546,'A plastic surgeon, romancing a much younger schoolteacher, enlists his loyal assistant to pretend to be his soon to be ex-wife, in order to cover up a careless lie. When more lies backfire, the assistant\'s kids become involved, and everyone heads off for a weekend in Hawaii that will change all their lives.','2011-02-10','/4sJDqzBaqBprkEy0aLjIGl7TrHx.jpg','Just Go with It'),('12345',82690,'Wreck-It Ralph is the 9-foot-tall, 643-pound villain of an arcade video game named Fix-It Felix Jr., in which the game\'s titular hero fixes buildings that Ralph destroys. Wanting to prove he can be a good guy and not just a villain, Ralph escapes his game and lands in Hero\'s Duty, a first-person shooter where he helps the game\'s hero battle against alien invaders. He later enters Sugar Rush, a kart racing game set on tracks made of candies, cookies and other sweets. There, Ralph meets Vanellope von Schweetz who has learned that her game is faced with a dire threat that could affect the entire arcade, and one that Ralph may have inadvertently started.','2012-11-01','/93FsllrXXWncp7BQYTdOU1XMRXo.jpg','Wreck-It Ralph'),('12345',270303,'For 19-year-old Jay, fall should be about school, boys and weekends out at the lake. But a seemingly innocent physical encounter turns sour and gives her the inescapable sense that someone, or something, is following her. Faced with this burden, Jay and her teenage friends must find a way to escape the horror that seems to be only a few steps behind.','2015-02-04','/4MrwJZr0R9LbyOgZqwLNmtzzxbu.jpg','It Follows'),('12345',346364,'In a small town in Maine, seven children known as The Losers Club come face to face with life problems, bullies and a monster that takes the shape of a clown called Pennywise.','2017-09-05','/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg','It'),('12345',395991,'Members of the Granite Mountain Hotshots battle deadly wildfires to save an Arizona town.','2017-10-19','/lC7WdUNLOJI3sllaDGNdFy2GT8g.jpg','Only the Brave'),('12345',418078,'Secure within a desolate home as an unnatural threat terrorizes the world, a man has established a tenuous domestic order with his wife and son, but this will soon be put to test when a desperate young family arrives seeking refuge.','2017-06-09','/h9VOirT4dKXzVyVzZZxPfAghmRV.jpg','It Comes at Night');
/*!40000 ALTER TABLE `user_movies` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES ('11','user'),('11111','user'),('12345','user'),('54321','user'),('777','user'),('99999','user'),('aa','user'),('aaa','user'),('HP','user'),('laytonemerson','user'),('lilbitknits','user'),('zzz','user');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;




/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-28 17:41:10
