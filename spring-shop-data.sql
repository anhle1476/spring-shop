-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: spring_shop
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Áo'),(2,'Quần'),(3,'Giày dép'),(4,'Phụ kiện');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metaData`
--

DROP TABLE IF EXISTS `metaData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metaData` (
  `attribute` varchar(45) NOT NULL,
  `value` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metaData`
--

LOCK TABLES `metaData` WRITE;
/*!40000 ALTER TABLE `metaData` DISABLE KEYS */;
INSERT INTO `metaData` VALUES ('bannerImgUrl','shop-resources/img/hero-banner-alt.jpg'),('bannerMessage','PropertyEditors are tied to a data type'),('bannerTitle','lorem ipsum'),('catImg1','shop-resources/img/cat-img-1.jpg'),('catImg2','shop-resources/img/cat-img-2.jpg'),('catImg3','shop-resources/img/cat-img-3.jpg'),('catImg4','shop-resources/img/cat-img-4.jpg');
/*!40000 ALTER TABLE `metaData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderDetails`
--

DROP TABLE IF EXISTS `orderDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderDetails` (
  `idOrder` int NOT NULL,
  `idProduct` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idOrder`,`idProduct`),
  KEY `fk_billDetails_2_idx` (`idProduct`),
  CONSTRAINT `fk_billDetails_2` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderDetails`
--

LOCK TABLES `orderDetails` WRITE;
/*!40000 ALTER TABLE `orderDetails` DISABLE KEYS */;
INSERT INTO `orderDetails` VALUES (2,37,359000,1),(2,39,30700,2),(2,40,386000,3),(2,41,90200,1),(4,18,42000,1),(4,22,766000,1),(4,25,922435,1),(4,37,359000,1),(4,39,30700,2),(5,8,701343,1),(5,13,919000,1),(5,14,656882,1),(5,18,42000,1),(5,30,662000,1),(5,35,602000,1),(6,35,602000,4),(6,36,78900,8),(6,38,297000,4),(6,42,91700,2),(6,43,235000,2),(7,35,602000,1),(7,38,297000,1),(7,42,91700,1);
/*!40000 ALTER TABLE `orderDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `confirmTime` datetime DEFAULT NULL,
  `paidTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,'Nissim Diaz','vudota@mailinator.com','+1 (968) 513-9999','Hic rerum kimochi natus haru','2021-02-28 15:14:22','2021-02-28 15:20:08','2021-02-28 17:15:26'),(4,'Joe Lara Armstrong','viroduj@mailinator.com','+1 (857) 152-5714','Officiis sequi eaque','2021-02-28 16:38:15','2021-02-28 17:16:15',NULL),(5,'Fitzgerald Berry','xirile@mailinator.com','+1 (295) 364-3586','Nisi non eius quibus','2021-02-28 16:39:07','2021-02-28 20:54:05',NULL),(6,'Eric Bates','tyca@mailinator.com','+1 (555) 564-8598','Excepteur hic molest','2021-02-28 22:30:15',NULL,NULL),(7,'Hall Mejia','mocuwyd@mailinator.com','+1 (316) 503-5919','Et ut suscipit sapie','2021-03-01 08:44:15',NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `imgUrl` varchar(255) NOT NULL,
  `details` longtext NOT NULL,
  `idCategory` int NOT NULL,
  `createdDate` date DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `fk_products_1_idx` (`idCategory`),
  CONSTRAINT `fk_products_1` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'áo 1',140000,'https://robohash.org/ao1','ao1',1,'2021-02-24'),(4,'quần 1',300000,'https://robohash.org/quan1','q1',2,'2021-02-24'),(6,'Joel Haynes',892000,'https://robohash.org/giay1','giay1',1,'2021-02-24'),(7,'Amir Morgan',506000,'https://robohash.org/Voluptatemobcaecati','Doloremque amet, qui. Doloremque amet, qui. Doloremque amet, qui.',1,'2021-02-25'),(8,'Eaton Alvarez',701343,'https://robohash.org/Doloremvoluptatem','Deserunt qui sit cum.&nbsp;',4,'2021-02-25'),(12,'Brianna Gay',94000,'https://robohash.org/Brianna','Minim mollitia quis .&nbsp;&nbsp;',3,'2021-02-26'),(13,'Amber Calhoun',919000,'https://robohash.org/Nemo1','Error amet, rerum iu. asc',2,'2021-02-26'),(14,'Cairo Beard',656882,'https://robohash.org/cupiditate ','Nostrud ipsum, moles.&nbsp;',4,'2021-02-26'),(15,'Plato Sexton',360997,'https://robohash.org/asperio','Asperiores exceptu ri.',3,'2021-02-26'),(16,'Idola Pierce',888888,'https://robohash.org/en','Nostrum enim&nbsp; asnisi an.',3,'2021-02-26'),(17,'Kai Henderson',265000,'https://robohash.org/au','Delectus, quaerat no.&nbsp;',1,'2021-02-26'),(18,'Brenda Gomezas as',42000,'https://robohash.org/ex','Odit possimus, imped. as',2,'2021-02-26'),(19,'Sarah Hebert',92300,'https://robohash.org/Oditremdoloremin ','Consec tetur voluptas.',2,'2021-02-26'),(20,'Christian Francis',262245,'https://robohash.org/quia','Sed sed et com modo s.',1,'2021-02-26'),(21,'Leonard Nome',520000,'https://robohash.org/Mollitiavoluptasve','Neces sitatibus volup.',2,'2021-02-26'),(22,'Kane Bentley',766000,'https://robohash.org/incidid','Ape riam labore labor.',2,'2021-02-26'),(23,'Erasmus Morse',775000,'https://robohash.org/cillum','Error officiis moles. as',1,'2021-02-26'),(24,'Keaton Cantrell',650000,'https://robohash.org/aut','Mo llit et porro esse.',3,'2021-02-26'),(25,'Boris Hardin',922435,'https://robohash.org/ascinc','Dist inctio. Non ut e.',2,'2021-02-26'),(26,'Fay Cantu',90600,'https://robohash.org/rtjerjetyj','Aliquid persp iciatis.',4,'2021-02-26'),(27,'Wallace Ortiz',646000,'https://robohash.org/offici','Adip isicing incididu.',3,'2021-02-26'),(28,'Victoria Newton',613453,'https://robohash.org/eos','Unde volup tatum labo.',3,'2021-02-26'),(29,'Odette Collins',294000,'https://robohash.org/nisi','Aut sint de bitis ani.',1,'2021-02-26'),(30,'Cyrus Ferrell',662000,'https://robohash.org/consequaturD','Et fugit, nihil mi ni.',4,'2021-02-26'),(31,'Vernon Gillespie',518000,'https://robohash.org/officiisa','Adipi sicing dolore o.',3,'2021-02-26'),(32,'Roanna Hoffman',533000,'https://robohash.org/molesti','Repre henderit, ducim.',1,'2021-02-26'),(33,'Genevieve Shepard',304000,'https://robohash.org/Sintasv','Reici endis ea optio.',3,'2021-02-26'),(34,'Nasim Booth',84200,'https://robohash.org/laudanti','Ab nos trum cupiditat.',3,'2021-02-26'),(35,'Calista Mcknight',602000,'https://robohash.org/voluptas','Ten etur est ipsam do.',4,'2021-02-27'),(36,'Reese Horne',78900,'https://robohash.org/velit ','Earum reprehe nderit.',1,'2021-02-27'),(37,'Wyatt Pruitt',359000,'https://robohash.org/consequatu','Quis quam voluptas cu.',1,'2021-02-27'),(38,'Rebekah Keith',297000,'https://robohash.org/mofhdg','Eum ratione nisi do . afsdghf af',1,'2021-02-27'),(39,'Maxine Decker',30700,'https://robohash.org/Autveroeiusmodius','Dolor emque earum qua.',1,'2021-02-27'),(40,'Ray Kramer',386000,'https://robohash.org/Reprehenderitadne','Volup tate beatae eos.',3,'2021-02-27'),(41,'Sigourney Barron',90200,'https://robohash.org/laudantium ','Itaque ut in velit o. sdsmgdhh',3,'2021-02-27'),(42,'Marvin Walters',91700,'https://robohash.org/Nemo1asf','Ut sed dolo ribus ess.',2,'2021-02-28'),(43,'Laurel Hall',235000,'https://robohash.org/velitvolup','Cumque labo rum elige.',1,'2021-02-28');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','d033e22ae348aeb5660fc2140aec35850c4da997');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_categoryStats`
--

DROP TABLE IF EXISTS `v_categoryStats`;
/*!50001 DROP VIEW IF EXISTS `v_categoryStats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_categoryStats` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `numberOfProducts`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_orderAndTotalPrice`
--

DROP TABLE IF EXISTS `v_orderAndTotalPrice`;
/*!50001 DROP VIEW IF EXISTS `v_orderAndTotalPrice`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_orderAndTotalPrice` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `address`,
 1 AS `createdTime`,
 1 AS `confirmTime`,
 1 AS `paidTime`,
 1 AS `totalPrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_orderDetailsWithProductInfo`
--

DROP TABLE IF EXISTS `v_orderDetailsWithProductInfo`;
/*!50001 DROP VIEW IF EXISTS `v_orderDetailsWithProductInfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_orderDetailsWithProductInfo` AS SELECT 
 1 AS `idOrder`,
 1 AS `idProduct`,
 1 AS `price`,
 1 AS `quantity`,
 1 AS `nameProduct`,
 1 AS `idCategory`,
 1 AS `nameCategory`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_productDetails`
--

DROP TABLE IF EXISTS `v_productDetails`;
/*!50001 DROP VIEW IF EXISTS `v_productDetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_productDetails` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `price`,
 1 AS `imgUrl`,
 1 AS `details`,
 1 AS `idCategory`,
 1 AS `createdDate`,
 1 AS `nameCategory`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_shopStatistic`
--

DROP TABLE IF EXISTS `v_shopStatistic`;
/*!50001 DROP VIEW IF EXISTS `v_shopStatistic`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_shopStatistic` AS SELECT 
 1 AS `newOrders`,
 1 AS `processingOrders`,
 1 AS `paidOrders`,
 1 AS `totalRevenue`,
 1 AS `totalOrdersValue`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'spring_shop'
--

--
-- Final view structure for view `v_categoryStats`
--

/*!50001 DROP VIEW IF EXISTS `v_categoryStats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dev`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_categoryStats` AS select `c`.`id` AS `id`,`c`.`name` AS `name`,count(`p`.`id`) AS `numberOfProducts` from (`categories` `c` left join `products` `p` on((`p`.`idCategory` = `c`.`id`))) group by `c`.`id` union select `c`.`id` AS `id`,`c`.`name` AS `name`,count(`p`.`id`) AS `numberOfProducts` from (`products` `p` left join `categories` `c` on((`p`.`idCategory` = `c`.`id`))) group by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_orderAndTotalPrice`
--

/*!50001 DROP VIEW IF EXISTS `v_orderAndTotalPrice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dev`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orderAndTotalPrice` AS select `b`.`id` AS `id`,`b`.`name` AS `name`,`b`.`email` AS `email`,`b`.`phone` AS `phone`,`b`.`address` AS `address`,`b`.`createdTime` AS `createdTime`,`b`.`confirmTime` AS `confirmTime`,`b`.`paidTime` AS `paidTime`,sum((`bd`.`price` * `bd`.`quantity`)) AS `totalPrice` from (`orders` `b` join `orderDetails` `bd` on((`b`.`id` = `bd`.`idOrder`))) group by `b`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_orderDetailsWithProductInfo`
--

/*!50001 DROP VIEW IF EXISTS `v_orderDetailsWithProductInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dev`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orderDetailsWithProductInfo` AS select `b`.`idOrder` AS `idOrder`,`b`.`idProduct` AS `idProduct`,`b`.`price` AS `price`,`b`.`quantity` AS `quantity`,`p`.`name` AS `nameProduct`,`p`.`idCategory` AS `idCategory`,`c`.`name` AS `nameCategory` from ((`orderDetails` `b` join `products` `p` on((`b`.`idProduct` = `p`.`id`))) join `categories` `c` on((`p`.`idCategory` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_productDetails`
--

/*!50001 DROP VIEW IF EXISTS `v_productDetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dev`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_productDetails` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,`p`.`price` AS `price`,`p`.`imgUrl` AS `imgUrl`,`p`.`details` AS `details`,`p`.`idCategory` AS `idCategory`,`p`.`createdDate` AS `createdDate`,`c`.`name` AS `nameCategory` from (`products` `p` join `categories` `c` on((`p`.`idCategory` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_shopStatistic`
--

/*!50001 DROP VIEW IF EXISTS `v_shopStatistic`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dev`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_shopStatistic` AS select (select count(`orders`.`id`) from `orders` where (`orders`.`confirmTime` is null)) AS `newOrders`,(select count(`orders`.`id`) from `orders` where ((`orders`.`confirmTime` is not null) and (`orders`.`paidTime` is null))) AS `processingOrders`,(select count(`orders`.`id`) from `orders` where (`orders`.`paidTime` is not null)) AS `paidOrders`,(select sum(`v_orderAndTotalPrice`.`totalPrice`) from `v_orderAndTotalPrice` where (`v_orderAndTotalPrice`.`paidTime` is not null)) AS `totalRevenue`,(select sum(`v_orderAndTotalPrice`.`totalPrice`) from `v_orderAndTotalPrice`) AS `totalOrdersValue` */;
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

-- Dump completed on 2021-03-01  9:24:25
