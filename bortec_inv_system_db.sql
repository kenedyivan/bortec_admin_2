-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 25, 2018 at 12:23 PM
-- Server version: 5.7.22-0ubuntu18.04.1
-- PHP Version: 7.2.5-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bortec_inv_system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', '2018-04-13 19:48:14', '2018-04-13 19:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_stocks`
--

CREATE TABLE `inventory_stocks` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `received` int(11) DEFAULT '0',
  `sales` int(11) DEFAULT '0',
  `stocks` int(11) DEFAULT '0',
  `total_expenditure_cost` double DEFAULT '0',
  `total_sales_cost` double DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_stocks`
--

INSERT INTO `inventory_stocks` (`id`, `item_id`, `received`, `sales`, `stocks`, `total_expenditure_cost`, `total_sales_cost`, `created_at`, `updated_at`) VALUES
(1, 1, 100, 47, 53, 120000, 70500, '2018-04-09 12:44:25', '2018-05-16 13:30:21'),
(8, 9, 20, 15, 5, 14000, 15000, '2018-05-03 13:20:44', '2018-05-07 09:34:19'),
(11, 12, 80, 79, 1, 144000, 158000, '2018-05-07 12:37:22', '2018-05-07 09:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `codes` varchar(45) NOT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `units` varchar(45) DEFAULT NULL,
  `unit_cost` double NOT NULL DEFAULT '0',
  `unit_price` double DEFAULT NULL,
  `remarks` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `codes`, `product_name`, `units`, `unit_cost`, `unit_price`, `remarks`, `created_at`, `updated_at`) VALUES
(1, '355938094584622', 'Spark box', 'piece', 1200, 1500, 'Smart phone from tecno', '2018-04-09 12:44:25', '2018-04-09 12:44:25'),
(9, '90492143', 'Stoney', '300ml', 700, 1000, 'drink from coca cola', '2018-05-03 13:20:44', '2018-05-03 13:20:44'),
(12, '6009622620003', 'Rwenzori', '1.5L', 1800, 2000, 'MINERAL WATER', '2018-05-07 12:37:22', '2018-05-07 12:37:22');

-- --------------------------------------------------------

--
-- Table structure for table `operators`
--

CREATE TABLE `operators` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `auth_id` varchar(45) NOT NULL,
  `dob` date DEFAULT NULL,
  `image` text,
  `password` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operators`
--

INSERT INTO `operators` (`id`, `first_name`, `last_name`, `auth_id`, `dob`, `image`, `password`, `created_at`, `updated_at`) VALUES
(10, 'cvbn', 'howdy', 'btc6777', '1992-09-09', 'IMG-20180502-WA0001.jpg', '$2b$12$cMjeZ.bzXPon9Zs/WulJr.YaDHFvutn/ckwcsmLHlOoWFoaXQpR2i', '2018-05-02 19:10:40', '2018-05-03 13:57:06'),
(11, 'TASIWUKA', 'CAESAR VIANNE', 'btc8777', '1994-09-09', NULL, '$2b$12$tHcMIpbGT987DPi5upHvp.ZQXejm2XmFBREJJq.p6hRLNTs85vjIy', '2018-05-07 12:16:34', '2018-05-07 12:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `received_products`
--

CREATE TABLE `received_products` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` double NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `received_products`
--

INSERT INTO `received_products` (`id`, `item_id`, `operator_id`, `quantity`, `total_price`, `created_at`, `updated_at`, `created_date`) VALUES
(1, 1, 10, 100, 150000, '2018-05-07 09:27:41', '2018-05-07 09:27:41', '2018-05-07'),
(2, 9, 11, 20, 20000, '2018-05-07 09:30:49', '2018-05-07 09:30:49', '2018-05-08'),
(3, 12, 11, 50, 100000, '2018-05-07 09:37:50', '2018-05-07 09:37:50', '2018-05-09'),
(4, 12, 11, 30, 60000, '2018-05-07 09:40:38', '2018-05-07 09:40:38', '2018-05-10'),
(5, 12, 11, 30, 60000, '2018-05-14 09:40:38', '2018-05-14 09:40:38', '2018-05-11');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT '0',
  `total_price` double NOT NULL DEFAULT '0',
  `weather` varchar(45) DEFAULT NULL,
  `temp` float NOT NULL DEFAULT '0',
  `temp_min` float NOT NULL DEFAULT '0',
  `temp_max` float NOT NULL DEFAULT '0',
  `pressure` int(11) NOT NULL DEFAULT '0',
  `humidity` int(11) NOT NULL DEFAULT '0',
  `wind_speed` int(11) NOT NULL DEFAULT '0',
  `fuel_price` float NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `item_id`, `operator_id`, `quantity`, `total_price`, `weather`, `temp`, `temp_min`, `temp_max`, `pressure`, `humidity`, `wind_speed`, `fuel_price`, `created_at`, `updated_at`) VALUES
(4, 9, 11, 10, 10000, '3', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-07 09:31:49', '2018-05-07 09:31:49'),
(5, 9, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-08 09:34:19', '2018-05-07 09:34:19'),
(7, 12, 11, 9, 40000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-07 09:39:17', '2018-05-07 09:39:17'),
(8, 12, 11, 11, 118000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-12 09:41:36', '2018-05-12 09:41:36'),
(12, 12, 11, 6, 118000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-13 09:41:36', '2018-05-12 09:41:36'),
(13, 12, 11, 8, 118000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-14 09:41:36', '2018-05-12 09:41:36'),
(14, 12, 11, 3, 118000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-14 09:41:36', '2018-05-12 09:41:36'),
(15, 12, 11, 9, 118000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-15 09:41:36', '2018-05-12 09:41:36'),
(16, 12, 11, 10, 118000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-16 09:41:36', '2018-05-12 09:41:36'),
(17, 12, 11, 10, 118000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-17 09:41:36', '2018-05-12 09:41:36'),
(18, 12, 11, 3, 118000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-18 09:41:36', '2018-05-12 09:41:36'),
(19, 12, 11, 8, 118000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-19 09:41:36', '2018-05-12 09:41:36'),
(20, 12, 11, 10, 118000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-19 09:41:36', '2018-05-12 09:41:36'),
(21, 12, 11, 10, 118000, '2', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-20 09:41:36', '2018-05-12 09:41:36'),
(22, 9, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-10 09:34:19', '2018-05-07 09:34:19'),
(23, 9, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-11 09:34:19', '2018-05-07 09:34:19'),
(24, 9, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-12 09:34:19', '2018-05-07 09:34:19'),
(25, 9, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-13 09:34:19', '2018-05-07 09:34:19'),
(26, 9, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-14 09:34:19', '2018-05-07 09:34:19'),
(27, 9, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-15 09:34:19', '2018-05-07 09:34:19'),
(28, 9, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-17 09:34:19', '2018-05-07 09:34:19'),
(29, 9, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-18 09:34:19', '2018-05-07 09:34:19'),
(30, 9, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-19 09:34:19', '2018-05-07 09:34:19'),
(31, 9, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-20 09:34:19', '2018-05-07 09:34:19'),
(45, 1, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-07 09:34:19', '2018-05-07 09:34:19'),
(46, 1, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-08 09:34:19', '2018-05-07 09:34:19'),
(47, 1, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-09 09:34:19', '2018-05-07 09:34:19'),
(48, 1, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-10 09:34:19', '2018-05-07 09:34:19'),
(49, 1, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-11 09:34:19', '2018-05-07 09:34:19'),
(50, 1, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-12 09:34:19', '2018-05-07 09:34:19'),
(51, 1, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-13 09:34:19', '2018-05-07 09:34:19'),
(52, 1, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-14 09:34:19', '2018-05-07 09:34:19'),
(53, 1, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-15 09:34:19', '2018-05-07 09:34:19'),
(54, 1, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-16 09:34:19', '2018-05-07 09:34:19'),
(55, 1, 11, 5, 5000, '1', 293.23, 293.23, 293.23, 888, 89, 1, 3807.5, '2018-05-17 09:34:19', '2018-05-07 09:34:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_stocks`
--
ALTER TABLE `inventory_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inventory_stocks_items1_idx` (`item_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_id_UNIQUE` (`auth_id`);

--
-- Indexes for table `received_products`
--
ALTER TABLE `received_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_received_products_operators1_idx` (`operator_id`),
  ADD KEY `fk_received_products_items1_idx` (`item_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sales_operators1_idx` (`operator_id`),
  ADD KEY `fk_sales_items1_idx` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `inventory_stocks`
--
ALTER TABLE `inventory_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `operators`
--
ALTER TABLE `operators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `received_products`
--
ALTER TABLE `received_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory_stocks`
--
ALTER TABLE `inventory_stocks`
  ADD CONSTRAINT `fk_inventory_stocks_items1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `received_products`
--
ALTER TABLE `received_products`
  ADD CONSTRAINT `fk_received_products_items1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_received_products_operators1` FOREIGN KEY (`operator_id`) REFERENCES `operators` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_items1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sales_operators1` FOREIGN KEY (`operator_id`) REFERENCES `operators` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
