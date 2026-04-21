-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2026 at 06:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farmer`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`admin_id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `contact_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `name`, `email`, `subject`, `message`, `contact_date`) VALUES
(1, 'kalpana', 'khk@gmail.com', 'framing equipment', 'suggest me to choose equipments in framing', '2026-03-15');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `equipment_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rental_rate_per_day` decimal(10,2) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `availability_status` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`equipment_id`, `name`, `type`, `brand`, `model`, `description`, `rental_rate_per_day`, `purchase_price`, `availability_status`, `photo`) VALUES
(9, 'Harrow', 'Disc(offset)', 'FieldKing', 'Dabangg Harrow', 'leveling soil to create a fine seedbed.', 15000.00, 400000.00, 'Available', 'Harrow.png'),
(10, 'Plough', 'Fixed MB', 'Mahindra', 'Mouldboard', 'ideal for basic soil turning.', 10000.00, 28500.00, 'Available', 'Plough.webp');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `user_id`, `rental_id`, `amount`, `payment_method`, `payment_date`) VALUES
(5, 1, 36, 1500.00, 'Cash', '2026-03-15'),
(6, 1, 1, 1500.00, 'Cash', '2026-03-15'),
(7, 1, 1, 1500.00, 'Cash', '2026-03-15'),
(8, 5, 41, 500.00, 'Cash', '2026-03-15'),
(9, 5, 44, 1000.00, 'Cash', '2026-03-16');

-- --------------------------------------------------------

--
-- Table structure for table `rentalbooking`
--

CREATE TABLE `rentalbooking` (
  `booking_id` int(11) NOT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `renter_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `no_of_days` varchar(1000) NOT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rentalbooking`
--

INSERT INTO `rentalbooking` (`booking_id`, `equipment_id`, `renter_id`, `start_date`, `end_date`, `no_of_days`, `total_cost`) VALUES
(38, 10, 5, '2026-03-15', '2026-03-16', '1', 500.00),
(39, 10, 5, '2026-03-15', '2026-03-16', '1', 500.00),
(40, 10, 5, '2026-03-15', '2026-03-16', '1', 500.00),
(41, 10, 5, '2026-03-15', '2026-03-16', '1', 500.00),
(42, 10, 5, '2026-03-15', '2026-03-16', '1', 500.00),
(43, 9, 5, '2026-03-16', '2026-03-18', '2', 1000.00),
(44, 9, 5, '2026-03-16', '2026-03-18', '2', 1000.00),
(45, 9, 5, '2026-03-16', '2026-03-18', '2', 1000.00),
(46, 9, 5, '2026-03-16', '2026-03-19', '3', 1500.00);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `review_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `equipment_id`, `user_id`, `rating`, `comment`, `review_date`) VALUES
(2, 9, 5, 3, 'good service', '2026-03-16');

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `login_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `login_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`login_id`, `user_id`, `username`, `password`, `login_type`) VALUES
(1, 4, 'sonu', '12345678', 'Online'),
(2, 1, 'kalpana', '12345678', 'Offline'),
(3, 3, 'suma', '12345678', 'Online'),
(4, 5, 'chinni', '12345678', 'Online'),
(5, 6, 'samuu', '12345678', 'Online'),
(6, 7, 'john', '12345678', 'Online');

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE `userregistration` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `farm_location` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userregistration`
--

INSERT INTO `userregistration` (`user_id`, `name`, `email`, `password`, `phone`, `city`, `address`, `farm_location`, `role`) VALUES
(1, 'kalpana', 'khk@gmail.com', '12345678', '123456789', 'dwd', 'xyz', 'vidyagiri', 'Farmer'),
(3, 'suma', 'suma@gmail.com', '12345678', '1234567890', 'blgm', 'dwd', 'vidyagiri', 'farmer'),
(4, 'sonu', 'sonu@gmail.com', '12345678', '1234567890', 'hub', 'unkal', 'unkal', 'farmer'),
(5, 'chinni', 'chinni@gmail.com', '12345678', '1234567890', 'blgm', 'xyz', 'hub', 'farmer'),
(6, 'samuu', 'samuu@gmail.com', '12345678', '1234567890', 'dwd', 'xyz', 'vidyagiri', 'farmer'),
(7, 'john', 'john@gmail.com', '12345678', '1234567890', 'dwd', 'xyz', 'hub', 'farmer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`equipment_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `rentalbooking`
--
ALTER TABLE `rentalbooking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `renter_id` (`renter_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`login_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `userregistration`
--
ALTER TABLE `userregistration`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminlogin`
--
ALTER TABLE `adminlogin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `equipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rentalbooking`
--
ALTER TABLE `rentalbooking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `userregistration`
--
ALTER TABLE `userregistration`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rentalbooking`
--
ALTER TABLE `rentalbooking`
  ADD CONSTRAINT `rentalbooking_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`),
  ADD CONSTRAINT `rentalbooking_ibfk_2` FOREIGN KEY (`renter_id`) REFERENCES `userregistration` (`user_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `userregistration` (`user_id`);

--
-- Constraints for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userregistration` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
