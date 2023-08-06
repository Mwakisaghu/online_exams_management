-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: online_exams_management
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `students_id` int NOT NULL,
  `exams_id` int NOT NULL,
  `question_id` int NOT NULL,
  `multiple_choices_id` int NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `fk_answers_multiple_choices_id` (`multiple_choices_id`),
  KEY `index_answers_exams_id` (`exams_id`),
  KEY `index_answers_question_id` (`question_id`),
  KEY `index_answers_students_id` (`students_id`),
  CONSTRAINT `fk_answers_exams_id` FOREIGN KEY (`exams_id`) REFERENCES `exams` (`exams_id`),
  CONSTRAINT `fk_answers_multiple_choices_id` FOREIGN KEY (`multiple_choices_id`) REFERENCES `multiple_choices` (`multiple_choices_id`),
  CONSTRAINT `fk_answers_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `fk_answers_students_id` FOREIGN KEY (`students_id`) REFERENCES `students` (`students_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `exams_id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(20) NOT NULL,
  `created_by_id` int NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`exams_id`),
  UNIQUE KEY `index_exams_exam_name` (`exam_name`),
  KEY `index_exams_created_by_id` (`created_by_id`),
  CONSTRAINT `fk_exams_created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_dashboard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `minimum_score` decimal(10,0) DEFAULT NULL,
  `maximum_score` decimal(10,0) DEFAULT NULL,
  `grade` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `index_grades_grade` (`grade`),
  KEY `index_grades_grade_id` (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multiple_choices`
--

DROP TABLE IF EXISTS `multiple_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiple_choices` (
  `multiple_choices_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `multiple_choice_text` longtext NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`multiple_choices_id`),
  KEY `index_multiple_choices_question_id` (`question_id`),
  CONSTRAINT `fk_multiple_choices_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `exams_id` int NOT NULL,
  `question_set` varchar(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `index_questions_exams_id` (`exams_id`),
  CONSTRAINT `fk_questions_exams_id` FOREIGN KEY (`exams_id`) REFERENCES `exams` (`exams_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `score_card`
--

DROP TABLE IF EXISTS `score_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_card` (
  `score_card_id` int NOT NULL AUTO_INCREMENT,
  `students_id` int NOT NULL,
  `exams_id` int NOT NULL,
  `score` decimal(10,0) DEFAULT NULL,
  `grade_id` int DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`score_card_id`),
  KEY `index_score_card_exams_id` (`exams_id`),
  KEY `index_score_card_grade_id` (`grade_id`),
  KEY `index_score_card_students_id` (`students_id`),
  CONSTRAINT `fk_score_card_exams_id` FOREIGN KEY (`exams_id`) REFERENCES `exams` (`exams_id`),
  CONSTRAINT `fk_score_card_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`),
  CONSTRAINT `fk_score_card_students_id` FOREIGN KEY (`students_id`) REFERENCES `students` (`students_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `students_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`students_id`),
  KEY `index_students_students_id` (`students_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teachers_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`teachers_id`),
  KEY `index_teachers_first_name` (`first_name`),
  KEY `index_teachers_surname` (`surname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_dashboard`
--

DROP TABLE IF EXISTS `users_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_dashboard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_as` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_dashboard_pk2` (`username`),
  KEY `index_users_dashboard_login_as` (`login_as`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-06 14:41:14
