-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 22, 2014 at 06:45 AM
-- Server version: 5.5.37-0ubuntu0.13.10.1
-- PHP Version: 5.5.3-1ubuntu2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hotels_rails`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `chkin` date DEFAULT NULL,
  `chkout` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `hotel_id`, `room_id`, `chkin`, `chkout`, `created_at`, `updated_at`) VALUES
(3, 1, 3, 4, '2014-05-01', '2014-05-02', '2014-05-21 19:06:55', '2014-05-21 19:06:55'),
(5, 2, 3, 4, '2014-05-03', '2014-05-04', '2014-05-21 19:38:41', '2014-05-21 19:38:41'),
(6, 2, 3, 5, '2014-05-05', '2014-05-06', '2014-05-21 19:53:23', '2014-05-21 19:53:23'),
(18, 2, 3, 4, '2014-05-09', '2014-05-10', '2014-05-21 20:13:04', '2014-05-21 20:13:04');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `user_name`, `hotel_id`, `room_id`, `comment`, `created_at`, `updated_at`) VALUES
(23, 1, 'mariam1', 3, 4, 'mariam', '2014-05-22 06:01:26', '2014-05-22 06:01:26'),
(24, 2, 'admin', 3, 5, 'admin', '2014-05-22 06:01:53', '2014-05-22 06:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `country`, `city`, `region`, `name`, `address`, `phone`) VALUES
(3, 'Egypt', 'Alex', 'san stefano', 'hotel1', 'ay 7ta', '1234'),
(4, 'Egypt', 'Alex', 'Moharm Bek', 'hotel2', 'ay 7ta', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) DEFAULT NULL,
  `room_price` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `reserved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `hotel_id`, `room_price`, `img`, `reserved`) VALUES
(4, 3, 122, '/assets/room1.jpg', 0),
(5, 3, 123, '/assets/room2.jpg', 0),
(6, 4, 1000, '/assets/room3.jpg', 0),
(7, 4, 123, '/assets/room4.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20140520090642'),
('20140520090716'),
('20140520090804'),
('20140521185450'),
('20140521212127');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `admin`) VALUES
(1, 'mariam1', 'mariam1@yahoo.com', '8ca6342915ac81dd2d3eec49e2098db9', '1234', 0),
(2, 'admin', 'admin@yahoo.com', '8ca6342915ac81dd2d3eec49e2098db9', '1234', 1),
(4, 'mariam2', 'mariam2@yahoo.com', '8ca6342915ac81dd2d3eec49e2098db9', '1234', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
