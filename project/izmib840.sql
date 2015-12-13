-- phpMyAdmin SQL Dump
-- version 4.0.10.11
-- http://www.phpmyadmin.net
--
-- Host: mysql.itn.liu.se
-- Generation Time: Dec 13, 2015 at 12:03 PM
-- Server version: 5.5.44-0ubuntu0.12.04.1
-- PHP Version: 5.3.10-1ubuntu3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `izmib840`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad`
--

CREATE TABLE IF NOT EXISTS `ad` (
  `user_name` varchar(10) CHARACTER SET latin1 NOT NULL,
  `post_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `pic` text CHARACTER SET latin1 NOT NULL,
  `date_added` date NOT NULL,
  `category` text CHARACTER SET latin1 NOT NULL,
  `item_location` text CHARACTER SET latin1 NOT NULL,
  `title` text CHARACTER SET latin1 NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad`
--

INSERT INTO `ad` (`user_name`, `post_id`, `description`, `pic`, `date_added`, `category`, `item_location`, `title`, `price`) VALUES
('Krkan', 'ad1', 'Selling some tires.', 'dack.jpg', '2015-12-04', 'Car', 'Linkoping', 'A title', 1000),
('user2', 'ad1450004407', 'Nice sofa for sale, very soft.', '1450004407.jpg', '2015-12-13', 'Furniture', 'London', 'Sofa', 600),
('Krkan', 'ad2', 'Selling my old car, runs great!', 'citroen.jpg', '2015-11-29', 'Car', 'Norrkoping', 'Old Citroen', 12000),
('Krkan', 'ad3', 'Selling and old bed.', 'sang.jpg', '2015-11-29', 'Furniture', 'Norrkoping', 'Old bed for sale', 300);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_name` varchar(10) CHARACTER SET latin1 NOT NULL,
  `name` text CHARACTER SET latin1 NOT NULL,
  `lname` text CHARACTER SET latin1 NOT NULL,
  `password` text CHARACTER SET latin1 NOT NULL,
  `email` text CHARACTER SET latin1 NOT NULL,
  `date_of_reg` date NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_name`, `name`, `lname`, `password`, `email`, `date_of_reg`, `is_admin`) VALUES
('Krkan', 'Izmir', 'Ibrahimovic', 'spass098', 'fakemail@provider.com', '2015-11-28', 1),
('user1', 'Peter', 'Karlsson', 'password', 'p.karlsson@gmail.com', '2015-12-06', 0),
('user2', 'Sven', 'Eklund', 'password', 's.ekulund@mail.com', '2015-12-13', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
