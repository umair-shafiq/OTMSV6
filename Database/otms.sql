-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: otms
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `task_name` varchar(45) NOT NULL,
  `emp_name` varchar(45) NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid_idx` (`task_id`),
  CONSTRAINT `tid` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,'Web Development ','Muhammad Umair','Good                                        \r\n                                    '),(2,9,'Quiz','Ibrahim','very Very Good                                        \r\n                                    '),(3,2,'Assignment#1','Ibrahim','It is a long established fact that a reader will be distracted by the readable content.                                      \r\n                                    '),(4,7,'V','Muhammad Umair','t was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop.                                        \r\n                                    '),(5,10,'Viva','Ibrahim',' Pass                                       \r\n                                    '),(6,11,'Assignment#3','Muhammad Umair',' Your Assignment file is Incorrect Format.                                       \r\n                                    '),(7,18,'CS309','hamza','Pass                                        \r\n                                    '),(8,20,'CS614','Ibrahim','This Quiz is canceled.                  \r\n                                    '),(9,21,'CS607','hamza','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form                                \r\n                                    '),(10,15,'JavaScript','Muhammad Umair','Good                                     \r\n                                    '),(11,15,'JavaScript','Muhammad Umair','V Nice                                        \r\n                                    '),(12,16,'CSS','Abc','Good                                  \r\n                                    '),(13,17,'aaaaa','qwerty','Hello');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `subject` varchar(60) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,18,'Confusion','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form                                         \r\n                                    ','2022-12-08 06:09:41'),(2,18,'Good work','Etiam consequat nulla leo, sit amet aliquam est tempus et. Fusce                                        \r\n                                    ','2022-12-08 06:34:44'),(3,16,'Good work',' Etiam consequat nulla leo, sit amet aliquam est tempus et. Fusce                                       \r\n                                    ','2022-12-08 06:38:10'),(4,18,'ABC','sassassasas                                        \r\n                                    ','2022-12-08 09:43:27'),(5,21,'XYZ','hujdlskdjsoidfskdnsljsaoifm                                        \r\n                                    ','2022-12-08 10:06:37'),(6,21,'ABC','qwertty                                        \r\n                                    ','2022-12-08 10:31:54'),(7,21,'ffffff',' fffff     fffffff                                  \r\n                                    ','2022-12-08 10:45:04'),(8,21,'qwerty','qwertyqwertyqwertyqwerty                                        \r\n                                    ','2022-12-08 12:07:22'),(9,18,'Confusion','I apologize for the confusion. Since you\'re using a for loop to iterate through a list of users and you want to pass the.','2023-01-19 07:39:00');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticeboard`
--

DROP TABLE IF EXISTS `noticeboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticeboard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `notice` varchar(1000) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticeboard`
--

LOCK TABLES `noticeboard` WRITE;
/*!40000 ALTER TABLE `noticeboard` DISABLE KEYS */;
INSERT INTO `noticeboard` VALUES (1,'Exams','                                        \r\n     aaaaaaaaaaaaaaa                               ','2022-09-09 13:29:55'),(4,'Quiz',' Dear student,\r\nThe result of the Quiz has Been Announced.                                       \r\n                                    ','2022-09-24 13:35:16'),(5,'Viva Voice','                                     Dear Student,\r\n The result of the Viva has Been Announced.                                       \r\n                                       \r\n                                    ','2022-10-05 10:13:35'),(6,'Mid Term Result','Dear student, The result of the Quiz has Been Announced. \r\n                                    ','2022-10-12 17:42:38'),(7,'Exams','\r\n                                       \r\n                                    ','2022-12-28 13:26:30'),(8,'Final Term Date Sheet ','Hey members. f you have any questions or concerns \r\n                                       \r\n                                    ','2023-01-12 19:42:49'),(9,'ABC','AbCDEFG','2023-01-17 14:21:28'),(10,'XYZ','XYZYyudddaassas','2023-01-17 14:24:30');
/*!40000 ALTER TABLE `noticeboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `man` int NOT NULL,
  `emp` int NOT NULL,
  `task_id` int NOT NULL,
  `message` varchar(500) NOT NULL,
  `for_user` int NOT NULL,
  `is_read` int DEFAULT '0',
  `is_read_on` datetime DEFAULT NULL,
  `is_read_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `is_pending` int DEFAULT '0',
  `is_completed` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `manfk_idx` (`man`),
  KEY `empfk_idx` (`emp`),
  KEY `taskfk_idx` (`task_id`),
  CONSTRAINT `empfk` FOREIGN KEY (`emp`) REFERENCES `tasks` (`emp_id`),
  CONSTRAINT `manfk` FOREIGN KEY (`man`) REFERENCES `tasks` (`man_id`),
  CONSTRAINT `taskfk` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,8,24,16,'',8,1,'2023-01-10 00:07:47',9,NULL,1,1),(2,8,11,15,'',11,1,'2023-01-11 00:25:15',11,NULL,1,1),(3,8,11,1,'Task has been Assigned to you by manager',11,1,'2023-01-11 00:27:16',11,NULL,1,0),(4,4,25,1,'Task has been Assigned to you by manager',25,1,'2023-01-11 00:27:16',11,NULL,1,0),(8,4,19,1,'Task has been Assigned to you by manager',19,1,'2023-01-11 00:27:16',11,NULL,1,0),(9,4,9,12,'Task has been Assigned to you by manager',9,1,'2023-01-10 00:23:28',9,NULL,1,0),(10,4,11,1,'Task has been Assigned to you by manager',11,1,'2023-01-11 00:27:16',11,NULL,1,0),(11,4,11,1,'Task has been Assigned to you by manager12',11,1,'2023-01-11 00:27:16',11,NULL,1,0),(12,23,19,1,'Task has been Assigned to you by manager12',19,1,'2023-01-11 00:27:16',11,NULL,1,0),(13,23,11,44,'Task has been Assigned to you by manager',11,1,'2023-01-11 00:41:10',11,NULL,1,0),(14,23,27,45,'Task has been Assigned to you by manager',27,0,NULL,NULL,NULL,0,0),(15,23,34,46,'Task has been Assigned to you by manager',34,1,'2023-01-10 00:46:39',34,NULL,1,0),(16,23,34,47,'Task has been Assigned to you by manager',34,1,'2023-01-10 01:00:26',34,NULL,1,0),(17,23,34,48,'Task has been Assigned to you by manager',34,1,'2023-01-10 01:20:54',34,NULL,1,0),(18,23,34,49,'Task has been Assigned to you by manager',34,1,'2023-01-11 01:48:38',34,NULL,1,0),(19,23,34,50,'Task has been Assigned to you by manager',34,1,'2023-01-11 22:31:31',34,NULL,1,0),(20,8,34,51,'Task has been Assigned to you by manager',34,1,'2023-01-11 23:45:23',34,NULL,1,1),(21,4,9,52,'Task has been Assigned to you by manager',9,1,'2023-01-19 15:24:00',9,NULL,1,1);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtask`
--

DROP TABLE IF EXISTS `subtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subtask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `sub_desc` varchar(500) NOT NULL,
  `sub_status` varchar(55) DEFAULT NULL,
  `is_completed` int DEFAULT '0',
  `for_user` int NOT NULL DEFAULT '0',
  `msg` varchar(500) DEFAULT 'Employee Completed SubTask successfully!',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `tid_idx` (`task_id`),
  CONSTRAINT `sub_id` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtask`
--

LOCK TABLES `subtask` WRITE;
/*!40000 ALTER TABLE `subtask` DISABLE KEYS */;
INSERT INTO `subtask` VALUES (1,18,'Question','Abc                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(2,18,'Question#2',' XYZ                                       \r\n                                    ','Complete',1,0,'Employee Completed SubTask successfully!'),(3,18,'Question#3','qwertttd                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(4,18,'Question#4','aaaaaa                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(5,20,'Quiz','aaa                                        \r\n                                    ',NULL,0,0,'Employee Completed SubTask successfully!'),(6,20,'hjhjhja','dsdsdsd                                        \r\n                                    ',NULL,0,0,'Employee Completed SubTask successfully!'),(7,15,'hjkl',' ssssss                                       \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(8,18,'sssssss','fffsfff                                  \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(9,16,'uytr','uytr                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(10,16,'uuuuu','uuuuuu                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(11,17,'Question','Question                                        \r\n                                    ','Pending',0,0,'Employee Completed SubTask successfully!'),(12,17,'Question#4','Question#4                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(13,18,'sas','dss                                    \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(14,18,'hjhjhja',' sssssssss                                       \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(15,18,'ssss','                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(16,18,'ssss','     lll                                   \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(17,17,'sss','   sss                                     \r\n                                    ','Pending',0,0,'Employee Completed SubTask successfully!'),(18,16,'Question','huhuj                                        \r\n                                    ','Complete',1,8,'Employee Completed SubTask successfully!'),(19,16,'hjhjhja','ddddd                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(20,20,'QQQQ',' QQQQQ                                       \r\n                                    ',NULL,0,0,'Employee Completed SubTask successfully!'),(21,18,'Pom','Pom                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(22,16,'Qmbn','Qmbn                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(23,17,'SRS','SRS                                        \r\n                                    ','Pending',0,0,'Employee Completed SubTask successfully!'),(24,17,'DD','DD                                        \r\n                                    ','Pending',0,0,'Employee Completed SubTask successfully!'),(25,20,'Web Dev','Dev                                        \r\n                                    ','Pending',0,0,'Employee Completed SubTask successfully!'),(26,16,'Web Dev','Dev                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(27,21,'Web Dev','qw                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(28,21,'Quiz','asdfgh                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(29,15,'Question','ddsdsdsdsdsdsd                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(30,15,'Web Dev',' WWWWWW                                       \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(31,15,'Quiz','ssssssss                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(32,15,'hjhjhja','dddd                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(33,15,'Assignment Task',' Assignment Task                                       \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(34,15,'ssss','aaaa                                        \r\n                                    ','Complete',0,0,'Employee Completed SubTask successfully!'),(35,16,'Question','Question                                        \r\n                                    ','Complete',1,8,'Employee Completed SubTask successfully!'),(36,16,'ddd','  dsdsdsd                                      \r\n                                    ','Complete',1,8,'Employee Completed SubTask successfully!'),(37,51,'umair','abc','Complete',1,8,'Employee Completed SubTask successfully!'),(38,51,'Question#4','AAA                                        \r\n                                    ','Complete',1,8,'Employee Completed SubTask successfully!'),(39,51,'WD','abc','Complete',1,8,'Employee Completed SubTask successfully!'),(40,51,'Quiz','Q                                        \r\n                                    ','Complete',1,8,'Employee Completed SubTask successfully!'),(41,51,'ssss','sssss                                        \r\n                                    ','Complete',1,8,'Employee Completed SubTask successfully!'),(42,51,'hjhjhja',' fdfdfdf                                       \r\n                                    ','Complete',1,8,'Employee Completed SubTask successfully!'),(43,51,'Assignment Task','AAAAA                                        \r\n                                    ','Complete',1,8,'Employee Completed SubTask successfully!'),(44,51,'Quiz task','Quiz task                                        \r\n                                    ','Complete',1,8,'Employee Completed SubTask successfully!'),(45,21,'Assignment','123','Complete',1,4,'Employee Completed SubTask successfully!'),(46,52,'Question#1','Ans This Question','Complete',1,4,'Employee Completed SubTask successfully!');
/*!40000 ALTER TABLE `subtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_name` varchar(45) NOT NULL,
  `t_description` varchar(500) NOT NULL,
  `t_startDate` varchar(45) NOT NULL,
  `t_endDate` varchar(45) NOT NULL,
  `t_assignBy` varchar(45) NOT NULL,
  `t_status` varchar(45) NOT NULL,
  `emp_id` int NOT NULL,
  `man_id` int NOT NULL,
  `t_priority` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eid_idx` (`emp_id`),
  KEY `mid_idx` (`man_id`),
  CONSTRAINT `eid` FOREIGN KEY (`emp_id`) REFERENCES `users` (`id`),
  CONSTRAINT `mid` FOREIGN KEY (`man_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Web Development ','aaaaaaaaaaa                                        \r\n                                    ','2022-09-07','2022-09-22','','Complete',0,0,0),(2,'Assignment#1','CS619                                                                                \r\n                                    \r\n                                    ','2022-09-13','2022-09-29','','On Hold',0,0,0),(7,'V',' Abcvsdsdsd                                                                               \r\n                                    \r\n                                    ','2022-09-05','2022-09-21','','Fresh',0,0,0),(8,'Abc','dddda                                                                                \r\n                                    \r\n                                    \r\n                                    ','2022-08-31','2022-10-07','','On Hold',0,0,0),(9,'Quiz','CS101                                        \r\n                                    ','2022-09-07','2022-09-30','','Complete',0,0,0),(10,'Viva','gdwdaxsdsdsdsdhsdysdsdvgscdgsfd                                       \r\n                                    ','2022-10-07','2022-11-04','','Fresh',0,0,0),(11,'Assignment#3','                                         CS506                                       \r\n                                    \r\n                                    ','2022-10-07','2022-10-29','','Fresh',0,0,0),(12,'ABC','       ABc                                 \r\n                                    ','2022-10-11','2022-10-27','','On Hold',0,0,0),(13,'XYZ','ssssssss                                        \r\n                                    ','2022-10-05','2022-10-29','','Complete',0,0,0),(14,'QWE','hftsbsudgsujdns                                        \r\n                                    ','2022-10-04','2022-10-27','','On Hold',0,0,0),(15,'JavaScript','                                        Assignment#2                                        \r\n                                    \r\n                                    ','2022-10-26','2022-10-31','Sana','Completed',11,8,0),(16,'CSS','                                                                                 aaaa                                       \r\n                                    \r\n                                    \r\n                                    ','2022-10-01','2022-10-05','Sana','Completed',24,8,1),(17,'aaaaa','               aaaaa                         \r\n                                    ','2022-10-12','2022-10-06','Sana','Fresh',25,8,0),(18,'CS309','                                        Assignment                                    \r\n                                    \r\n                                    ','2022-11-10','2022-11-22','Sana','Completed',9,8,0),(20,'CS614','                                        Quiz                                        \r\n                                    \r\n                                    ','2022-11-15','2022-12-02','Sana','Complete',19,8,0),(21,'CS607','                                        Viva                                      \r\n                                    \r\n                                    ','2022-11-15','2022-12-08','SpArk','Completed',9,4,4),(22,'Digiskills','Virtual University                                        \r\n                                    ','2022-12-15','2022-12-30','SpArk','Fresh',11,4,1),(23,'VA Ass','VA Assignment                                        \r\n                                    ','2022-12-16','2023-01-01','SpArk','Fresh',11,4,5),(24,'VA Quiz','                                        VA Quiz                                        \r\n                                    \r\n                                    ','2022-12-16','2022-12-17','SpArk','Complete',11,4,3),(25,'CS614',' Assign                                       \r\n                                    ','2022-12-06','2022-12-29','Sana','On Hold',11,8,2),(26,'Web Development ','ABC                                        \r\n                                    ','2022-12-05','2022-12-20','Sana','Fresh',11,8,1),(27,'Viva','tHIS viva was very informative.                                        \r\n                                    ','2022-12-16','2022-12-28','SpArk','Fresh',25,4,3),(28,'Test','sssss                                        \r\n                                    ','2022-12-01','2022-12-30','SpArk','Fresh',34,4,2),(29,'Test1',' Test1                                       \r\n                                    ','2022-11-29','2023-01-07','SpArk','On Hold',27,4,1),(30,'Test2','Test2                                        \r\n                                    ','2023-01-05','2023-01-03','SpArk','Fresh',27,4,1),(31,'Test3','Test3                                        \r\n                                    ','2022-11-29','2023-01-05','SpArk','Fresh',19,4,3),(32,'Test5','Test5                                        \r\n                                    ','2022-12-07','2023-01-07','SpArk','Fresh',9,4,1),(33,'Test6','                                        Test5                                        \r\n                                    \r\n                                    ','2022-12-07','2023-01-07','SpArk','Fresh',11,4,1),(34,'XYX',' wuqwysudid                                       \r\n                                    ','2022-12-14','2022-12-22','SpArk','Fresh',9,4,4),(35,'UMAIR SHAFIQ',' sasaas                                       \r\n                                    ','2022-12-07','2022-12-15','SpArk','Fresh',19,4,1),(36,'12345','weqwqwqw                                        \r\n                                    ','2022-12-13','2022-12-29','SpArk','Fresh',11,4,1),(37,'12345','weqwqwqw                                        \r\n                                    ','2022-12-13','2022-12-29','SpArk','Fresh',11,4,1),(38,'AAAAA',' dssdsds                                       \r\n                                    ','2022-12-01','2022-12-26','SpArk','Fresh',25,4,1),(39,'dsd','                                        \r\ngfgr                                    ','2022-12-04','2022-12-21','SpArk','Fresh',11,4,1),(40,'ZWER','ewwwe                                        \r\n                                    ','2022-12-06','2022-12-14','SpArk','Fresh',27,4,1),(41,'sddsdd','sdddssdds                                        \r\n                                    ','2022-12-11','2023-01-03','SpArk','Fresh',34,4,1),(42,'ABC','                                                                                ddsdsdsdsd                                        \r\n                                    \r\n                                    \r\n                                    ','2022-12-13','2022-12-18','xyz','Fresh',27,23,5),(43,'XYZ','sassas                                        \r\n                                    ','2022-12-02','2022-12-29','xyz','Fresh',19,23,1),(44,'sasasa','    assasas                                    \r\n                                    ','2022-12-13','2022-12-28','xyz','Fresh',11,23,1),(45,'CS614','                                        Assignment                                        \r\n                                    \r\n                                    ','2022-12-14','2022-12-02','xyz','On Hold',27,23,4),(46,'Virtual Assitant','Hey! This Task About VA.                                        \r\n                                    ','2023-01-18','2023-02-10','xyz','Fresh',34,23,4),(47,'Database','   Please take a m                                      \r\n                                    \r\n                                    \r\n                                    ','2023-01-11','2023-01-25','xyz','Fresh',34,23,1),(48,'Google','Google                                        \r\n                                    ','2023-01-18','2023-01-24','xyz','Fresh',34,23,1),(49,'Designing','Designing                                        \r\n                                    ','2023-01-11','2023-02-09','xyz','Fresh',34,23,1),(50,'Wordpress','Wordpress                                        \r\n                                    ','2023-01-17','2023-01-31','xyz','Fresh',34,23,5),(51,'C++','C++                                        \r\n                                    ','2023-01-19','2023-02-03','Sana','Completed',34,8,1),(52,'Assignment#1','Asignment#1 haudsada haasoash hsuiashasn ksjiasasn hjsikajsknas adsa.','2023-01-19','2023-01-28','SpArk','Completed',9,4,1);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadfile`
--

DROP TABLE IF EXISTS `uploadfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uploadfile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(45) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `remark` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadfile`
--

LOCK TABLES `uploadfile` WRITE;
/*!40000 ALTER TABLE `uploadfile` DISABLE KEYS */;
INSERT INTO `uploadfile` VALUES (6,'16','my pic.jpg','Pics'),(15,'18','Au.jpeg','Try'),(16,'15','forget design 1.jpg','UI Design'),(17,'15','Class-Diagram-Relationships.png','Class Diagram'),(18,'18','Proforma Invoice.jpg','Activites'),(19,'21','IMG-20230110-WA0004.jpg','Img');
/*!40000 ALTER TABLE `uploadfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) DEFAULT NULL,
  `u_email` varchar(45) DEFAULT NULL,
  `u_dob` varchar(45) DEFAULT NULL,
  `u_gender` varchar(45) DEFAULT NULL,
  `u_password` varchar(45) DEFAULT NULL,
  `u_address` varchar(255) DEFAULT NULL,
  `u_phoneNumber` varchar(255) DEFAULT NULL,
  `u_role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `u_email_UNIQUE` (`u_email`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Umair Shafiq','admin@gmail.com','01/08/2022','m','123','Lahore','123456789','Admin'),(4,'SpArk','spark@gmail.com','2022-08-17','male','456','FSD','123456','Manager'),(6,'Muhammad Ahmad','ma3315037@gmail.com','2022-09-08','male','444','giufik','646','Manager'),(8,'Sana','s@gmail.com','2022-09-17','female','123','Karachi','78787878','Manager'),(9,'Hamza','h@gmail.com','2022-09-22','male','123','Sangla Hill','4451456','Employee'),(11,'Muhammad Umair','ma@gmail.com','2022-09-01','male','444','Ghully Bajwa Ro','03476071016','Employee'),(19,'Ibrahim','i@gmail.com','2022-09-24','male','456','Lahore','78954654','Employee'),(23,'xyz','xyz@gmail.com','2022-10-11','male','123','joph','77777','Manager'),(24,'Abc','abc@gmail.com','2022-10-13','male','aaa','Karachi','789','Employee'),(25,'qwerty','qwerty@gmail.com','4545-05-04','female','888','GHQ','458487847','Employee'),(27,'Sultan','sultan@gmail.com','2022-11-09','male','123','RWP','123456789','Employee'),(34,'Osama Mehdi','osama@gmail.com','2022-12-02','male','123','MBD','789456123','Employee'),(36,'Amina','amina@gmail.com','2023-02-11','female','456','Karachi','789456123','Employee'),(39,'Farhan','farhan@gmail.com','2023-01-18','male','123','Lahore','123456789','Employee'),(41,'Fazal','Fazal@gmail.com','2023-01-11','male','456','Rawalpindi','456123789','Employee'),(42,'Ali Ahmad','aliahmad@gmail.com','2023-01-26','female','123','Lahore','123456789','Manager');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-19 18:24:29
