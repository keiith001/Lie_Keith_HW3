-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 03, 2025 at 02:21 AM
-- Server version: 8.0.35
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bikini_bottom_properties`
--

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `date_built` varchar(100) DEFAULT NULL,
  `house_img` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `name`, `owner_id`, `date_built`, `house_img`, `created_at`, `updated_at`) VALUES
(1, 'Spongebob Pineapple House', 1, '1999-07-17', 'pineapple_house.jpg', '2025-04-02 17:40:43', '2025-04-02 17:40:43'),
(2, 'Squidward\'s House', 2, '1999-07-17', 'squidward_house.jpg', '2025-04-02 17:40:43', '2025-04-02 17:40:43'),
(3, 'Patrick\'s Rock', 3, '1999-07-17', 'patrick_rock.jpg', '2025-04-02 17:40:43', '2025-04-02 17:40:43'),
(4, 'Krusty Krab', 4, '1999-07-17', 'krusty_krab.jpg', '2025-04-02 17:40:43', '2025-04-02 17:40:43'),
(5, 'Chum Bucket', 5, '1999-07-17', 'chum_bucket.jpg', '2025-04-02 17:40:43', '2025-04-02 17:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `id` int NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `bio` varchar(1000) DEFAULT NULL,
  `job` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`id`, `name`, `bio`, `job`, `created_at`, `updated_at`) VALUES
(1, 'Spongebob Squarepants', 'A cheerful, optimistic sea sponge who lives in a pineapple and works at the Krusty Krab.', 'Fry Cook at Krusty Krab', '2025-04-02 17:40:20', '2025-04-02 17:40:20'),
(2, 'Squidward', 'A grumpy, cynical squid who plays the clarinet and dislikes his neighbors.', 'Cashier at Krusty Krab', '2025-04-02 17:40:20', '2025-04-02 17:40:20'),
(3, 'Patrick Star', 'A lovable but dim-witted starfish and SpongeBob\'s best friend.', 'Unemployed', '2025-04-02 17:40:20', '2025-04-02 17:40:20'),
(4, 'Mr. Krabs', 'The money-loving owner of the Krusty Krab restaurant.', 'Owner of Krusty Krab', '2025-04-02 17:40:20', '2025-04-02 17:40:20'),
(5, 'Plankton', 'A small, scheming copepod who owns the Chum Bucket and wants to steal the Krabby Patty formula.', 'Owner of Chum Bucket', '2025-04-02 17:40:20', '2025-04-02 17:40:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `houses`
--
ALTER TABLE `houses`
  ADD CONSTRAINT `houses_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
