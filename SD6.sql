-- --------------------------------------------------------
-- Сервер:                       127.0.0.1
-- Версія сервера:               5.5.25 - MySQL Community Server (GPL)
-- ОС сервера:                   Win32
-- HeidiSQL Версія:              9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for superdrive6
CREATE DATABASE IF NOT EXISTS `superdrive6` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `superdrive6`;


-- Dumping structure for таблиця superdrive6.authors
CREATE TABLE IF NOT EXISTS `authors` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `authors` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table superdrive6.authors: ~4 rows (приблизно)
DELETE FROM `authors`;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` (`id`, `authors`) VALUES
	(20, 'Ivanov'),
	(21, 'Petrov'),
	(22, 'Sidorov'),
	(23, 'Velling');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;


-- Dumping structure for таблиця superdrive6.authors_books
CREATE TABLE IF NOT EXISTS `authors_books` (
  `authors_id` tinyint(3) unsigned NOT NULL,
  `books_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`authors_id`,`books_id`),
  KEY `FK_authors_books_books` (`books_id`),
  CONSTRAINT `FK_authors_books_authors` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `FK_authors_books_books` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table superdrive6.authors_books: ~8 rows (приблизно)
DELETE FROM `authors_books`;
/*!40000 ALTER TABLE `authors_books` DISABLE KEYS */;
INSERT INTO `authors_books` (`authors_id`, `books_id`) VALUES
	(20, 32),
	(21, 32),
	(22, 32),
	(20, 33),
	(20, 34),
	(21, 34),
	(23, 35),
	(23, 36);
/*!40000 ALTER TABLE `authors_books` ENABLE KEYS */;


-- Dumping structure for таблиця superdrive6.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `books` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table superdrive6.books: ~5 rows (приблизно)
DELETE FROM `books`;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`id`, `books`) VALUES
	(32, 'PHP'),
	(33, 'CSS'),
	(34, 'JS'),
	(35, 'HTML 5 book'),
	(36, 'Java book');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;


-- Dumping structure for таблиця superdrive6.order
CREATE TABLE IF NOT EXISTS `order` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) unsigned NOT NULL,
  `date` date NOT NULL,
  `amount` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `FK_order_user` (`user_id`),
  CONSTRAINT `FK_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table superdrive6.order: ~12 rows (приблизно)
DELETE FROM `order`;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`id`, `user_id`, `date`, `amount`) VALUES
	(2, 4, '2015-01-21', 14.00),
	(3, 6, '2015-01-21', 40000.00),
	(4, 6, '2015-01-23', 1700.00),
	(5, 3, '2015-01-22', 800.00),
	(6, 1, '2015-02-23', 3006.00),
	(7, 7, '2015-01-21', 15000.00),
	(8, 2, '2015-12-18', 80000.00),
	(9, 11, '2015-12-18', 40000.00),
	(10, 8, '2015-01-22', 1000.00),
	(11, 7, '2015-01-29', 80000.00),
	(12, 9, '2015-01-31', 80000.00),
	(13, 9, '0000-00-00', 15000.00);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


-- Dumping structure for таблиця superdrive6.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `order_id` smallint(5) unsigned NOT NULL,
  `product_id` smallint(5) unsigned NOT NULL,
  `quantity` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `FK__product` (`product_id`),
  CONSTRAINT `FK__order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `FK__product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table superdrive6.order_items: ~15 rows (приблизно)
DELETE FROM `order_items`;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`) VALUES
	(2, 1, 2),
	(2, 8, 1),
	(3, 10, 2),
	(4, 5, 2),
	(4, 6, 1),
	(5, 7, 2),
	(6, 1, 3),
	(6, 6, 2),
	(7, 6, 10),
	(8, 10, 4),
	(9, 10, 2),
	(10, 12, 4),
	(11, 10, 4),
	(12, 10, 4),
	(13, 6, 10);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;


-- Dumping structure for таблиця superdrive6.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(250) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `img` char(100) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table superdrive6.product: ~13 rows (приблизно)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `name`, `description`, `img`, `price`, `total`) VALUES
	(1, 'Cup', '', '0', 2.00, 2),
	(5, 'Glove', '', '0', 100.00, 1),
	(6, 'laptop', '', '0', 1500.00, 6),
	(7, 'smartphone', '', '0', 400.00, 5),
	(8, 'Mouse', '', '0', 10.00, 10),
	(9, 'TV', 'good TV', '0', 1000.00, 1),
	(10, 'iPhone 6', 'cool', '0', 20000.00, 1),
	(12, 'HTC One', 'Blue', '10.jpg', 250.00, 5),
	(13, 'HTC Desire', 'Blue', '10.jpg', 150.00, 5),
	(14, 'Floor', '', '0', 500.00, 3),
	(15, 'CMS', '', '0', 200.00, 1),
	(16, 'hp laptop', '', '0', 500.00, 10),
	(17, 'asus laptop', '', '0', 300.00, 3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


-- Dumping structure for таблиця superdrive6.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `description` char(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table superdrive6.role: ~4 rows (приблизно)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `description`) VALUES
	(1, 'Admin', 'Admin'),
	(3, 'AdvancedUser', 'Discount:5%'),
	(4, 'SuperUser', 'Discount:10%'),
	(5, 'SimpleUser', 'no discount');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Dumping structure for процедура superdrive6.update_order_sum
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_order_sum`(IN `Param1` SMALLINT)
BEGIN
	update `order`, (select order_id, sum(product.price * order_items.quantity) as sumorder from order_items, product 
	where order_items.product_id = product.id	and `order`.id = Param1) as temp
	set amount = temp.sumorder
	where temp.order_id = `order`.id;
END//
DELIMITER ;


-- Dumping structure for таблиця superdrive6.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `login` char(40) DEFAULT NULL,
  `email` char(40) NOT NULL,
  `password` char(40) NOT NULL,
  `skills` set('PHP','Java','CSS') NOT NULL DEFAULT 'CSS',
  `photo` char(50) DEFAULT NULL,
  `role_id` tinyint(3) unsigned NOT NULL DEFAULT '5',
  `is_active` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_user_role` (`role_id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dumping data for table superdrive6.user: ~15 rows (приблизно)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `login`, `email`, `password`, `skills`, `photo`, `role_id`, `is_active`) VALUES
	(1, 'Ivanov Ivan', 'ivan@mail.com', '12345', 'PHP,Java,CSS', '1.gif', 4, '1'),
	(2, 'Petrov Petr', 'new@mail.ru', '12345', 'Java,CSS', '2.gif', 4, '1'),
	(3, 'Mike Tyson', 'tyson@mail.ru', '12345', 'CSS', '3.gif', 4, '1'),
	(4, 'Evander Hollyfield', 'holly@mail.ru', '12345', 'PHP', '4.gif', 3, '1'),
	(5, 'Klichcko', 'kl@mail.ru', '12345', 'CSS', '5.gif', 4, '1'),
	(6, 'Floyd Patterson', 'pat@mail.ru', '12345', 'PHP,CSS', '6.gif', 4, '1'),
	(7, 'Mohammed Ali', 'ali@mail.com', '12345', 'PHP,Java,CSS', '7.gif', 4, '1'),
	(8, 'Igor Vovchanchin', 'vov@mail.com', '12345', 'PHP,Java,CSS', '8.gif', 3, '1'),
	(9, 'Fedor Emeliyanenko', 'fed@mail.com', '12345', 'Java,CSS', '9.gif', 4, '1'),
	(11, 'Mirko Fillipovic', 'mirk@mail.com', '12345', 'PHP,CSS', '10.gif', 4, '1'),
	(12, NULL, 'ivan222@mail.com', '40c5169448af7279279c2b4041455ee4b0ab5cd1', 'CSS', NULL, 5, '1'),
	(13, NULL, 'artem@mail.ru', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'CSS', NULL, 5, '1'),
	(14, NULL, 'art@mail.ru', 'fc1200c7a7aa52109d762a9f005b149abef01479', 'CSS', NULL, 5, '1'),
	(15, NULL, 'art@mail.rui', 'c6a10b79929eddd80cf8473f748c04c8c738e79f', 'CSS', NULL, 5, '1'),
	(16, NULL, 'Artem2@mail.ru', 'fc1200c7a7aa52109d762a9f005b149abef01479', 'CSS', NULL, 5, '1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
