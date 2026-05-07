-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2026 at 08:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sporthub`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `fullname`, `email`, `address`, `password`, `created_at`) VALUES
(1, 'leah b ignacio', 'leah@gmail.com', 'malibago', '$2a$10$X/HzE6k200bbscPpMmLLr.U4Ul1Mkb6Ft3GalpQVvJ3FhZRO7hDN2', '2026-05-14 03:31:46'),
(2, 'Myra Dizon', 'myra@gmail.com', 'Tambis 2, Saint Bernard, So. Leyte', '$2a$10$sdQLiBMgZcHY6MOvAOzSF.OGbQIJxY8YOQTD3P3wq/RYYSAoRUuAG', '2026-05-14 05:48:51');

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

CREATE TABLE `equipments` (
  `id` int(11) NOT NULL,
  `equipment_name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipments`
--

INSERT INTO `equipments` (`id`, `equipment_name`, `category`, `price`, `stock`, `created_at`, `image`) VALUES
(4, 'Basketball', 'Wilson Ball', 450.00, 0, '2026-05-10 00:01:42', '1778371878_BBall.jpg'),
(5, 'Volleyball', 'Net', 200.00, 0, '2026-05-10 00:03:54', '1778371434_volleyballnet.jpg'),
(6, 'Table Tennis', 'Blade', 1000.00, 13, '2026-05-10 00:05:39', '1778371539_tableTennisBlade.webp'),
(7, 'Volleyball', 'MIKASA Ball', 300.00, 20, '2026-05-10 00:08:27', '1778371707_VBallMikasa.png'),
(8, 'Volleyball', 'White Ball', 250.00, 20, '2026-05-10 00:08:49', '1778371729_VballWhite.avif'),
(9, 'Volleyball', 'MIZUNA Knee Pad white', 150.00, 20, '2026-05-10 00:20:16', '1778372416_VKPadWhiteMizuna.jpg'),
(10, 'Volleyball', 'NIKE Knee Pad white', 200.00, 40, '2026-05-10 00:20:57', '1778372457_VKPadWhite.jpg'),
(11, 'Volleyball', 'KIPSTA Knee Pad black', 100.00, 20, '2026-05-10 00:21:30', '1778372490_VKneePad.jpg'),
(12, 'Volleyball', 'McDavid Arm Sleeve Padded black', 300.00, 30, '2026-05-10 00:24:56', '1778372696_McDavidPaddedArmSleeveBalck.jpg'),
(13, 'Volleyball', 'KIPSTA Arm Sleeve black', 100.00, 200, '2026-05-10 00:25:46', '1778372746_VSleeveKIPSTAblack.avif'),
(14, 'Volleyball', 'MIZUNO Arm Sleeve black', 120.00, 20, '2026-05-10 00:26:22', '1778372782_VSleeveMizunoblack.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `total_amount`, `payment_status`, `order_date`) VALUES
(9, 1, 1000.00, 'Paid', '2026-05-14 06:06:06'),
(10, 1, 2000.00, 'Paid', '2026-05-14 06:16:32'),
(11, 2, 200.00, 'Paid', '2026-05-14 09:37:14'),
(12, 1, 200.00, 'Paid', '2026-05-14 09:37:51'),
(14, 1, 400.00, 'Paid', '2026-05-15 04:25:49'),
(15, 1, 2000.00, 'Paid', '2026-05-15 04:29:38'),
(16, 1, 450.00, 'Paid', '2026-05-15 04:32:33'),
(17, 1, 1250.00, 'Paid', '2026-05-15 04:33:05'),
(18, 1, 200.00, 'Paid', '2026-05-15 15:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_items_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_items_id`, `order_id`, `equipment_id`, `quantity`) VALUES
(8, 9, 6, 1),
(9, 10, 6, 2),
(10, 11, 5, 1),
(11, 12, 5, 1),
(12, 14, 5, 2),
(13, 15, 6, 2),
(14, 16, 4, 1),
(15, 17, 8, 5),
(16, 18, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `role`, `created_at`) VALUES
(2, 'Jaylou Quigao', 'kijaw@gmail.com', '$2y$10$xGfBmZJ/iYRFbrUiiMBmLOHxRDmbNqukfbqJvC6uLKBhBzhCEqlc2', 'admin', '2026-05-09 23:17:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_items_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `equipments`
--
ALTER TABLE `equipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
