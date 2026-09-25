-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2026 at 02:29 PM
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
-- Database: `computer_accessories`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Mouse', 'Computer mouse and gaming mouse'),
(2, 'Keyboard', 'Computer and gaming keyboards'),
(3, 'RAM', 'Desktop and laptop memory'),
(4, 'SSD', 'Solid state drives'),
(5, 'HDD', 'Hard disk drives'),
(6, 'Graphics Card', 'GPU and graphics cards'),
(7, 'Power Supply', 'Computer power supplies'),
(8, 'Headset', 'Gaming and computer headsets'),
(9, 'Monitor', 'Computer monitors'),
(10, 'Cable', 'USB, HDMI and other cables');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `cost_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `reorder_level` int(11) NOT NULL DEFAULT 5,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `category_id`, `supplier_id`, `unit_price`, `cost_price`, `quantity`, `reorder_level`, `description`) VALUES
(1, 'Logitech G102 Mouse', 'MOU-001', 1, 1, 25.00, 18.00, 15, 5, 'Gaming mouse'),
(2, 'Mechanical Keyboard RGB', 'KEY-001', 2, 1, 45.00, 32.00, 15, 5, 'RGB mechanical keyboard'),
(3, 'Kingston 8GB RAM', 'RAM-001', 3, 2, 30.00, 22.00, 10, 3, '8GB DDR4 RAM'),
(4, 'Samsung 500GB SSD', 'SSD-001', 4, 2, 45.00, 35.00, 8, 3, '500GB SATA SSD'),
(5, 'WD 1TB HDD', 'HDD-001', 5, 3, 50.00, 40.00, 6, 2, '1TB hard disk drive'),
(6, 'Gaming Headset', 'HED-001', 8, 3, 35.00, 25.00, 12, 3, 'Gaming headset'),
(7, 'Logitech G305 Mouse', 'MOU-002', 1, 1, 35.00, 35.00, 2, 5, 'Wireless gaming mouse');

-- --------------------------------------------------------

--
-- Table structure for table `stock_transactions`
--

CREATE TABLE `stock_transactions` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `transaction_type` enum('IN','OUT') NOT NULL,
  `quantity` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_transactions`
--

INSERT INTO `stock_transactions` (`id`, `product_id`, `transaction_type`, `quantity`, `transaction_date`, `note`) VALUES
(1, 1, 'IN', 20, '2026-09-25 07:26:06', 'Initial stock'),
(2, 2, 'IN', 15, '2026-09-25 07:26:06', 'Initial stock'),
(3, 3, 'IN', 10, '2026-09-25 07:26:06', 'Initial stock'),
(4, 4, 'IN', 8, '2026-09-25 07:26:06', 'Initial stock'),
(5, 5, 'IN', 6, '2026-09-25 07:26:06', 'Initial stock'),
(6, 6, 'IN', 12, '2026-09-25 07:26:06', 'Initial stock');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `email`, `address`) VALUES
(1, 'ABC Computer Supplier', '012345678', 'abc@gmail.com', 'Phnom Penh'),
(2, 'Tech World Cambodia', '098765432', 'techworld@gmail.com', 'Phnom Penh'),
(3, 'Computer Zone', '011223344', 'computerzone@gmail.com', 'Phnom Penh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD CONSTRAINT `stock_transactions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
