CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `computers`
--

DROP TABLE IF EXISTS `computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` text,
  `price_per_hours` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` char(1) DEFAULT NULL,
  `rooms_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_computers_rooms1_idx` (`rooms_id`),
  CONSTRAINT `fk_computers_rooms1` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computers`
--

LOCK TABLES `computers` WRITE;
/*!40000 ALTER TABLE `computers` DISABLE KEYS */;
INSERT INTO `computers` VALUES (1,'Компьютер 1','Игровой компьютер номер 1',100.00,'1',1),(2,'Компьютер 2','Игровой компьютер номер 2',100.00,'1',2),(3,'Компьютер 3','Игровой компьютер номер 3',100.00,'1',3),(4,'Компьютер 4','Игровой компьютер номер 4',100.00,'1',4),(5,'Компьютер 5','Игровой компьютер номер 5',100.00,'1',5),(6,'Компьютер 6','Игровой компьютер номер 6',100.00,'1',6),(7,'Компьютер 7','Игровой компьютер номер 7',100.00,'1',7),(8,'Компьютер 8','Игровой компьютер номер 8',100.00,'1',8),(9,'Компьютер 9','Игровой компьютер номер 9',100.00,'1',9),(10,'Компьютер 10','Игровой компьютер номер 10',100.00,'1',10);
/*!40000 ALTER TABLE `computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `hash_password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surename` varchar(255) DEFAULT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  `description` text,
  `salary_per_hour` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'ivanov','hash1','Иван','Иванов','Иванович','Старший системный администратор',500.00),(2,'petrov','hash2','Петр','Петров','Петрович','Главный инженер по информационной безопасности',600.00),(3,'sidorov','hash3','Сидор','Сидоров','Сидорович','Менеджер по IT-проектам',550.00),(4,'smirnova','hash4','Анна','Смирнова','Игоревна','Системный аналитик',520.00),(5,'vasileva','hash5','Ольга','Васильева','Владимировна','Разработчик программного обеспечения',580.00),(6,'nikolaev','hash6','Николай','Николаев','Николаевич','Технический директор',650.00),(7,'novikova','hash7','Мария','Новикова','Алексеевна','Специалист по поддержке пользователей',450.00),(8,'fedorov','hash8','Федор','Федоров','Федорович','Сетевой администратор',480.00),(9,'alexeev','hash9','Алексей','Алексеев','Алексеевич','Программист',530.00),(10,'kozlov','hash10','Дмитрий','Козлов','Дмитриевич','Веб-разработчик',500.00);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `replenishment` decimal(10,2) DEFAULT NULL,
  `users_id` int NOT NULL,
  `employees_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_users1_idx` (`users_id`),
  KEY `fk_payments_employees1_idx` (`employees_id`),
  CONSTRAINT `fk_payments_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_payments_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,876.63,12,6),(2,695.28,3,6),(3,846.49,4,6),(4,146.60,5,6),(5,193.53,6,6),(6,527.87,7,6),(7,58.74,8,6),(8,710.08,9,6),(9,374.21,10,6),(10,740.78,2,6),(11,581.27,11,6),(16,100.00,3,6),(17,500.00,2,1),(18,500.00,2,1),(19,222.00,2,3),(20,222.00,2,3);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_payment_insert` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
  -- Обновляем баланс пользователя
  UPDATE `mydb`.`users`
  SET balance = balance + NEW.replenishment
  WHERE id = NEW.users_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` text,
  `vip` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Комната 1','Это стандартная комната с высокопроизводительными игровыми ПК.','0'),(2,'Комната 2','Эта комната оснащена передовыми игровыми креслами и периферией.','0'),(3,'VIP Комната 1','Эксклюзивная VIP-комната с первоклассными игровыми установками и приватным лаунжем.','1'),(4,'Комната 3','Просторная комната с множеством экранов для групповых игр.','0'),(5,'VIP Комната 2','Премиальная VIP-комната с персональным обслуживанием и новейшими технологиями.','1'),(6,'Комната 4','Тихая комната для сосредоточенных игровых сессий.','0'),(7,'Комната 5','Комната, оборудованная новейшими технологиями виртуальной реальности.','0'),(8,'VIP Комната 3','Роскошная VIP-комната с индивидуально собранными игровыми установками.','1'),(9,'Комната 6','Комната с эргономичной мебелью и мягким освещением для длительных игровых сессий.','0'),(10,'Комната 7','Комната, предназначенная для тренировки в киберспорте.','0');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  `users_id` int NOT NULL,
  `employees_id` int NOT NULL,
  `computers_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sessions_users_idx` (`users_id`),
  KEY `fk_sessions_computers1_idx` (`computers_id`),
  KEY `fk_sessions_employees1_idx` (`employees_id`),
  CONSTRAINT `fk_sessions_computers1` FOREIGN KEY (`computers_id`) REFERENCES `computers` (`id`),
  CONSTRAINT `fk_sessions_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_sessions_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'2024-06-19 09:49:57',NULL,'2024-06-19',12,3,6),(2,'2024-06-19 09:49:57',NULL,'2024-06-19',3,3,6),(3,'2024-06-19 09:49:57',NULL,'2024-06-19',4,3,6),(4,'2024-06-19 09:49:57',NULL,'2024-06-19',5,3,6),(5,'2024-06-19 09:49:57',NULL,'2024-06-19',6,3,6),(6,'2024-06-19 09:49:57',NULL,'2024-06-19',7,3,6),(7,'2024-06-19 09:49:57',NULL,'2024-06-19',8,3,6),(8,'2024-06-19 09:49:57',NULL,'2024-06-19',9,3,6),(9,'2024-06-19 09:49:57',NULL,'2024-06-19',10,3,6),(10,'2024-06-19 09:49:57',NULL,'2024-06-19',2,3,6),(11,'2024-06-19 09:49:57',NULL,'2024-06-19',11,3,6),(16,'2024-06-20 01:09:20','2024-06-20 02:09:20','2024-06-20',2,2,2);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!50001 DROP VIEW IF EXISTS `user_sessions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_sessions` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `email`,
 1 AS `phone_number`,
 1 AS `balance`,
 1 AS `bonuce_balance`,
 1 AS `session_id`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `date`,
 1 AS `employee_id`,
 1 AS `employee_username`,
 1 AS `computer_id`,
 1 AS `computer_title`,
 1 AS `computer_price_per_hour`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `hash_password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` char(13) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `bonuce_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `passport_series` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `passport_series_UNIQUE` (`passport_series`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'test','test','test','88005553535',1344.00,0.00,NULL),(3,'user1','hash1','user1@example.com','1234567890123',200.00,10.00,'4500123456'),(4,'user2','hash2','user2@example.com','2234567890123',200.00,20.00,'4501234567'),(5,'user3','hash3','user3@example.com','3234567890123',300.00,30.00,'4502345678'),(6,'user4','hash4','user4@example.com','4234567890123',400.00,40.00,'4503456789'),(7,'user5','hash5','user5@example.com','5234567890123',500.00,50.00,'4504567890'),(8,'user6','hash6','user6@example.com','6234567890123',600.00,60.00,'4505678901'),(9,'user7','hash7','user7@example.com','7234567890123',700.00,70.00,'4506789012'),(10,'user8','hash8','user8@example.com','8234567890123',800.00,80.00,'4507890123'),(11,'user9','hash9','user9@example.com','9234567890123',900.00,90.00,'4508901234'),(12,'user10','hash10','user10@example.com','0234567890123',1000.00,100.00,'4509012345');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `get_total_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_balance`(userId INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE totalBalance DECIMAL(10,2);
    DECLARE userBalance DECIMAL(10,2);
    DECLARE userBonusBalance DECIMAL(10,2);

    -- Получаем текущий баланс пользователя
    SELECT balance, bonuce_balance INTO userBalance, userBonusBalance 
    FROM `mydb`.`users` 
    WHERE id = userId;

    -- Рассчитываем общий баланс
    SET totalBalance = userBalance + userBonusBalance;

    -- Возвращаем общий баланс
    RETURN totalBalance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPayment`(IN userId INT, IN employeeId INT, IN amount DECIMAL(10,2))
BEGIN
    DECLARE currentBalance DECIMAL(10,2);
    DECLARE maxLimit DECIMAL(10,2) DEFAULT 10000.00; -- Устанавливаем лимит пополнения

    -- Начало транзакции
    START TRANSACTION;

    -- Получаем текущий баланс пользователя
    SELECT balance INTO currentBalance FROM `mydb`.`users` WHERE id = userId FOR UPDATE;

    -- Проверяем, не превышает ли пополнение лимит
    IF currentBalance + amount <= maxLimit THEN
        -- Вставляем запись в таблицу payments
        INSERT INTO `mydb`.`payments` (`replenishment`, `users_id`, `employees_id`)
        VALUES (amount, userId, employeeId);
        
        -- Фиксируем транзакцию
        COMMIT;
    ELSE
        -- Откатываем транзакцию, если условие не выполнено
        ROLLBACK;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateSession` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateSession`(
    IN userId INT,
    IN employeeId INT,
    IN computerId INT,
    IN sessionDurationHours DECIMAL(5,2)
)
BEGIN
    DECLARE computerPricePerHour DECIMAL(10,2);
    DECLARE userBalance DECIMAL(10,2);
    DECLARE userBonusBalance DECIMAL(10,2);
    DECLARE totalCost DECIMAL(10,2);

    -- Начало транзакции
    START TRANSACTION;

    -- Получаем стоимость компьютера в час
    SELECT price_per_hours INTO computerPricePerHour 
    FROM `mydb`.`computers` 
    WHERE id = computerId 
    FOR UPDATE;

    -- Получаем текущий баланс пользователя
    SELECT balance, bonuce_balance INTO userBalance, userBonusBalance 
    FROM `mydb`.`users` 
    WHERE id = userId 
    FOR UPDATE;

    -- Рассчитываем общую стоимость сессии
    SET totalCost = computerPricePerHour * sessionDurationHours;

    -- Проверяем, достаточно ли средств на счету пользователя
    IF (userBalance + userBonusBalance) >= totalCost THEN
        -- Вставляем новую запись в таблицу sessions
        INSERT INTO `mydb`.`sessions` (`start_time`, `end_time`, `date`, `users_id`, `employees_id`, `computers_id`)
        VALUES (NOW(), NOW() + INTERVAL sessionDurationHours HOUR, CURDATE(), userId, employeeId, computerId);

        -- Сначала списываем с основного баланса
        IF userBalance >= totalCost THEN
            UPDATE `mydb`.`users`
            SET balance = balance - totalCost
            WHERE id = userId;
        ELSE
            -- Списываем с основного баланса все, что можно, и остаток с бонусного баланса
            UPDATE `mydb`.`users`
            SET balance = 0,
                bonuce_balance = bonuce_balance - (totalCost - userBalance)
            WHERE id = userId;
        END IF;

        -- Фиксируем транзакцию
        COMMIT;
    ELSE
        -- Откатываем транзакцию, если недостаточно средств
        ROLLBACK;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `user_sessions`
--

/*!50001 DROP VIEW IF EXISTS `user_sessions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_sessions` AS select `u`.`id` AS `user_id`,`u`.`username` AS `username`,`u`.`email` AS `email`,`u`.`phone_number` AS `phone_number`,`u`.`balance` AS `balance`,`u`.`bonuce_balance` AS `bonuce_balance`,`s`.`id` AS `session_id`,`s`.`start_time` AS `start_time`,`s`.`end_time` AS `end_time`,`s`.`date` AS `date`,`e`.`id` AS `employee_id`,`e`.`username` AS `employee_username`,`c`.`id` AS `computer_id`,`c`.`title` AS `computer_title`,`c`.`price_per_hours` AS `computer_price_per_hour` from (((`users` `u` join `sessions` `s` on((`u`.`id` = `s`.`users_id`))) join `employees` `e` on((`s`.`employees_id` = `e`.`id`))) join `computers` `c` on((`s`.`computers_id` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-20  7:08:02
