-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2019 at 06:48 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `date_created`, `last_updated`, `type`) VALUES
(11, '2019-07-09 15:02:27.000000', '2019-07-09 15:02:27.000000', 'Now Playing'),
(12, '2019-07-09 15:02:30.000000', '2019-07-09 15:02:30.000000', 'Popular'),
(13, '2019-07-09 15:02:32.000000', '2019-07-09 15:02:32.000000', 'Top Rated'),
(14, '2019-07-09 15:02:34.000000', '2019-07-09 15:02:34.000000', 'Upcoming');

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(27),
(27);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `backdrop_path` varchar(255) DEFAULT NULL,
  `cast` varchar(30000) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `overview` varchar(30000) NOT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id`, `backdrop_path`, `cast`, `date_created`, `director`, `genre`, `last_updated`, `overview`, `poster_path`, `release_date`, `runtime`, `title`) VALUES
(15, '/dihW2yTsvQlust7mSuAqJDtqW7k.jpg', 'Tom Holland, Jake Gyllenhaal, Samuel L. Jackson, Marisa Tomei, Jon Favreau, Zendaya, Jacob Batalon', NULL, 'Jon Watts', 'Action, Adventure, Science Fiction\r\n', '2019-07-09 16:18:36.000000', 'Peter Parker and his friends go on a summer trip to Europe. However, they will hardly be able to rest - Peter will have to agree to help Nick Fury uncover the mystery of creatures that cause natural disasters and destruction throughout the continent.', '/rjbNpRMoVvqHmhmksbokcyCr7wn.jpg', '2019-06-28', 129, 'Spider-Man: Far from Home'),
(19, '/m67smI1IIMmYzCl9axvKNULVKLr.jpg', 'Tom Hanks, Tim Allen, Annie Potts, Joan Cusack, Blake Clark, Keanu Reeves, Wallace Shawn, John Ratzenberger, Jordan Peele, Keegan-Michael Key', '2019-07-09 15:24:05.000000', 'Josh Cooley', 'Adventure, Animation, Comedy, Family', '2019-07-09 15:24:05.000000', 'Woody has always been confident about his place in the world and that his priority is taking care of his kid, whether that\'s Andy or Bonnie. But when Bonnie adds a reluctant new toy called \"Forky\" to her room, a road trip adventure alongside old and new friends will show Woody how big the world can be for a toy.', '/7G9915LfUQ2lVfwMEEhDsn3kT4B.jpg', '2019-06-19', 100, 'Toy Story 4'),
(20, '/bi4jh0Kt0uuZGsGJoUUfqmbrjQg.jpg', 'Zachary Levi, Mark Strong, Asher Angel, Jack Dylan Grazer, Adam Brody', '2019-07-09 15:27:18.000000', 'David F. Sandberg', 'Action, Fantasy, Comedy', '2019-07-09 15:27:18.000000', 'A boy is given the ability to become an adult superhero in times of need with a single magic word.', '/xnopI5Xtky18MPhK40cZAGAOVeV.jpg', '2019-03-23', 132, 'Shazam!'),
(21, '/aQXTw3wIWuFMy0beXRiZ1xVKtcf.jpg', 'Rosa Salazar, Christoph Waltz, Mahershala Ali, Keean Johnson, Jennifer Connelly', '2019-07-09 15:30:09.000000', 'Laeta Kalogridis', 'Action, Science Fiction, Thriller, Adventure', '2019-07-09 15:30:09.000000', 'When Alita awakens with no memory of who she is in a future world she does not recognize, she is taken in by Ido, a compassionate doctor who realizes that somewhere in this abandoned cyborg shell is the heart and soul of a young woman with an extraordinary past.', '/xRWht48C2V8XNfzvPehyClOvDni.jpg', '2019-01-31', 122, 'Alita: Battle Angel '),
(22, '/103d4ObBCWbB6PtOOjZ7C1FSpVl.jpg', 'Jessie Usher, Samuel L. Jackson, Richard Roundtree, Alexandra Shipp, Regina Hall', '2019-07-09 15:32:39.000000', 'Tim Story', 'Action, Crime, Comedy', '2019-07-09 15:32:39.000000', 'JJ, aka John Shaft Jr., may be a cyber security expert with a degree from MIT, but to uncover the truth behind his best friend’s untimely death, he needs an education only his dad can provide. Absent throughout JJ’s youth, the legendary locked-and-loaded John Shaft agrees to help his progeny navigate Harlem’s heroin-infested underbelly.', '/kfZqwGuvEBAysAbCsa0QLKoSYR.jpg', '2019-06-14', 111, 'Shaft '),
(23, '/v4yVTbbl8dE1UP2dWu5CLyaXOku.jpg', 'Mena Massoud, Naomi Scott, Will Smith, Marwan Kenzari, Navid Negahban', '2019-07-09 15:34:46.000000', 'Guy Ritchie', 'Adventure, Fantasy, Romance, Comedy, Family', '2019-07-09 15:34:46.000000', 'A kindhearted street urchin named Aladdin embarks on a magical adventure after finding a lamp that releases a wisecracking genie while a power-hungry Grand Vizier vies for the same lamp that has the power to make their deepest wishes come true.', '/3iYQTLGoy7QnjcUYRJy4YrAgGvp.jpg', '2019-05-22', 130, 'Aladdin'),
(24, '/dBt0DoFfbhOI4ypUfRj1uTq623M.jpg', 'Mckenna Grace, Madison Iseman, Katie Sarife, Patrick Wilson, Vera Farmiga', '2019-07-09 15:37:13.000000', 'Gary Dauberman', 'Horror', '2019-07-09 15:37:13.000000', 'Determined to keep Annabelle from wreaking more havoc, demonologists Ed and Lorraine Warren bring the possessed doll to the locked artifacts room in their home, placing her “safely” behind sacred glass and enlisting a priest’s holy blessing. But an unholy night of horror awaits as Annabelle awakens the evil spirits in the room, who all set their sights on a new target—the Warrens\' ten-year-old daughter, Judy, and her friends.', '/qWsHMrbg9DsBY3bCMk9jyYCRVRs.jpg', '2019-06-26', 106, 'Annabelle Comes Home '),
(26, '/bOGkgRGdhrBYJSLpXaxhXVstddV.jpg', 'Robert Downey Jr., Chris Hemsworth, Chris Evans, Mark Ruffalo, Scarlett Johansson, Benedict Cumberbatch, \r\nTom Holland, Chadwick Boseman, Don Cheadle, Zoe Saldana, Karen Gillan, Elizabeth Olsen, Paul Bettany, Anthony Mackie, Sebastian Stan, Tom Hiddleston, Idris Elba, Danai Gurira, Peter Dinklage, Vin Diesel, Bradley Cooper, Josh Brolin, Chris Pratt, Letitia Wright', '2019-07-09 15:44:01.000000', 'Joe Russo', 'Adventure, Action, Fantasy', '2019-07-09 15:44:01.000000', 'As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.', '/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg', '2018-04-25', 149, 'Avengers: Infinity War ');

-- --------------------------------------------------------

--
-- Table structure for table `movie_categories`
--

CREATE TABLE `movie_categories` (
  `movie_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_categories`
--

INSERT INTO `movie_categories` (`movie_id`, `category_id`) VALUES
(15, 11),
(15, 12),
(15, 14),
(19, 11),
(19, 12),
(20, 11),
(20, 12),
(21, 11),
(21, 12),
(22, 11),
(22, 12),
(22, 13),
(23, 11),
(23, 12),
(24, 11),
(24, 12),
(24, 13),
(24, 14),
(26, 11),
(26, 12),
(26, 13),
(26, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_c2491gxyu6bsjw346i1fgojqf` (`type`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_categories`
--
ALTER TABLE `movie_categories`
  ADD PRIMARY KEY (`movie_id`,`category_id`),
  ADD KEY `FK6qqoi2peb55k4wy1y52in0ssm` (`category_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie_categories`
--
ALTER TABLE `movie_categories`
  ADD CONSTRAINT `FK6qqoi2peb55k4wy1y52in0ssm` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FKrpeexfkaca09w8tnav9k97tef` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
