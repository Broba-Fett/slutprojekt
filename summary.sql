-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 13, 2014 at 12:20 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `summary`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `content` text NOT NULL,
  `summary_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `summary_id` (`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`) VALUES
(16, 'Datorteknik'),
(18, 'Design'),
(1, 'Engelska'),
(12, 'Fysik'),
(7, 'Gränssnitt'),
(11, 'Gymnasiearbete'),
(17, 'Hemkunskap'),
(8, 'Historia'),
(3, 'Idrott'),
(13, 'Kemi'),
(4, 'Matte'),
(5, 'Programmering'),
(10, 'Religion'),
(9, 'Samhällskunskap'),
(2, 'Svenska'),
(15, 'Teknik'),
(14, 'Webbserverprogrammering'),
(6, 'Webbutveckling');

-- --------------------------------------------------------

--
-- Table structure for table `summaries`
--

CREATE TABLE IF NOT EXISTS `summaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `author_name` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(32) NOT NULL,
  `date` datetime NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `subject_id` (`subject_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `summaries`
--

INSERT INTO `summaries` (`id`, `title`, `author_name`, `content`, `image`, `date`, `subject_id`) VALUES
(1, 'snor', 'Leffe', 'älskar snor', '', '2014-05-14 12:52:15', 1),
(2, 'Paragraphs', 'Emil', 'Paragraphs sux', '', '2014-05-14 12:55:45', 1),
(3, 'Springa', 'Anna ', 'Yaaaay', '', '2014-05-14 13:08:22', 3),
(4, 'ArmhÃ¥lor', 'Osbo', 'Mina luktar illa', '', '2014-05-20 12:15:12', 10),
(5, 'Bajs', 'Carl', 'Det Ã¤r gott', '', '2014-05-20 13:27:32', 8),
(6, 'HÃ¥r', 'Leffe', 'Det vÃ¤xer', '', '2014-05-20 20:11:22', 14),
(7, '1', '3', '2', '', '2014-05-27 11:40:35', 17),
(8, 'hejtest', 'angie', 'test', '', '2014-05-27 12:25:20', 18);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
