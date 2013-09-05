# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.12)
# Database: eat
# Generation Time: 2013-09-05 08:33:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table foods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `foods`;

CREATE TABLE `foods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `menu_id` int(11) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;

INSERT INTO `foods` (`id`, `name`, `menu_id`, `sort`)
VALUES
  (8,'fff',11,1),
  (9,'ggg',11,2),
  (10,'dssss',12,1),
  (11,'ffdfd',12,1),
  (12,'dfdfd',12,1),
  (14,'小炒肉',15,1),
  (15,'回锅肉',15,1),
  (16,'宫爆鸡丁',15,1),
  (17,'小炒肉',16,1),
  (18,'回锅肉',16,1),
  (19,'宫爆鸡丁',16,1),
  (20,'炒南瓜',16,2),
  (21,'西红柿炒鸡蛋',16,2),
  (23,'滕椒鸡',25,1),
  (26,'凉拌白肉',25,1),
  (29,'白菜',25,2),
  (30,'西红柿炒番茄',25,2);

/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `is_box` tinyint(1) NOT NULL DEFAULT '0',
  `desc` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;

INSERT INTO `menus` (`id`, `name`, `is_box`, `desc`)
VALUES
  (21,'热传递',1,'三荤一素'),
  (22,'觅食',1,'一荤一素'),
  (24,'熊猫快餐',1,''),
  (25,'巧味快餐（大圆盒子）',0,''),
  (26,'711凉面',1,'');

/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `is_box` tinyint(1) DEFAULT NULL,
  `mfood` int(11) DEFAULT NULL,
  `vfood` int(11) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `date` varchar(50) DEFAULT '',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `chose` (`menu_id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `ip`, `menu_id`, `is_box`, `mfood`, `vfood`, `desc`, `date`, `updated_at`)
VALUES
  (9,'192.168.2.137',21,1,0,0,'少盐','','2013-09-05 08:06:42'),
  (15,'192.168.2.58',22,1,0,0,NULL,'','2013-09-05 08:21:03'),
  (16,'192.168.2.98',24,1,0,0,'9月6日 口水鸡 徐徐','','2013-09-05 08:06:23'),
  (13,'192.168.2.91',22,1,0,0,NULL,'','2013-09-05 08:10:16');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
