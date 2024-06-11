-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 11, 2024 at 01:14 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xuong-oop`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`) VALUES
(8, 212),
(7, 213);

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `id` int NOT NULL,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`id`, `cart_id`, `product_id`, `quantity`) VALUES
(10, 8, 23, 1),
(28, 7, 23, 2),
(29, 7, 22, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Điện thoại di động'),
(2, 'Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `user_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `status_delivery` enum('0','1','2','3','4','5') CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs NOT NULL DEFAULT '0',
  `status_payment` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `shipping_name`, `shipping_email`, `shipping_phone`, `shipping_address`, `status_delivery`, `status_payment`, `created_at`, `updated_at`) VALUES
(1, 107, 'thoxinh', 'nguyenminhhoa30903@gmail.com', '098183248183', 'Thach Hoa, Hà Nội', NULL, NULL, NULL, NULL, '0', 0, '2024-06-09 21:01:17', '2024-06-09 21:01:17'),
(3, 111, 'hoa', 'hoanmph45135@fpt.edu.vn', '0866487298', 'Thach That, Ha Noi', NULL, NULL, NULL, NULL, '0', 0, '2024-06-10 05:50:17', '2024-06-10 05:50:17'),
(4, 111, 'mhoa', 'hoanmph45135@fpt.edu.vn', '086648888', 'Cau dien, Ha Noi', NULL, NULL, NULL, NULL, '0', 0, '2024-06-10 15:49:16', '2024-06-10 15:49:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_regular` int NOT NULL,
  `price_sale` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `img_thumbnail` varchar(255) DEFAULT NULL,
  `overview` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `price_sale` int DEFAULT NULL,
  `price_regular` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `img_thumbnail`, `overview`, `content`, `created_at`, `updated_at`, `price_sale`, `price_regular`) VALUES
(16, 2, 'minhhoacuti', 'assets/uploads/1718060863Ảnh chụp màn hình 2023-05-10 235016.png', '', '', '2024-06-10 23:07:43', '2024-06-10 23:07:43', 120000, 300000),
(17, 2, 'iphone 15 pro maxx', 'assets/uploads/1718060887Screenshot 2023-06-04 100824.png', '', '', '2024-06-10 23:08:07', '2024-06-10 23:08:07', 120000, 300000),
(18, 1, 'iphone15', 'assets/uploads/1718060904Screenshot 2023-06-04 100824.png', '', '', '2024-06-10 23:08:24', '2024-06-10 23:08:24', 312030123, 148123),
(19, 2, 'search', 'assets/uploads/1718060916Screenshot 2023-06-05 185115.png', '', '', '2024-06-10 23:08:36', '2024-06-10 23:08:36', 123124124, 124234),
(20, 2, 'ihpne11', 'assets/uploads/1718060928Screenshot 2023-06-05 185307.png', '', '', '2024-06-10 23:08:48', '2024-06-10 23:08:48', 1243452, 184814),
(21, 2, 'laptop311', 'assets/uploads/1718060944Screenshot 2023-06-05 185647.png', '', '', '2024-06-10 23:09:04', '2024-06-10 23:09:04', 3154290, 99994004),
(22, 2, 'minhhoacuti', 'assets/uploads/1718060956Screenshot 2023-06-05 185501.png', '', '', '2024-06-10 23:09:16', '2024-06-10 23:09:16', 3818238, 4638293),
(23, 2, 'minhhoanguyenn', 'assets/uploads/1718060972Screenshot 2023-06-05 185755.png', '', '', '2024-06-10 23:09:32', '2024-06-10 23:09:32', 6316273, 1477271);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `type` enum('admin','member') NOT NULL DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `avatar`, `email`, `password`, `created_at`, `updated_at`, `is_active`, `type`) VALUES
(212, 'peach 0', NULL, 'peachcuti0@poly.edu.vn', '$2y$10$zMUiBOb26EpgvkW1FGLWBeONsRCEFw9SrvC0daukN1fBGqHKmnzZK', '2024-06-05 17:01:40', '2024-06-05 17:01:40', 1, 'admin'),
(213, 'peach 1', NULL, 'peachcuti1@poly.edu.vn', '$2y$10$whUZ9GtLek7WVSYKZ0wQuusmtgVldY4iMosBShTJHc8RTcGld9tgy', '2024-06-05 17:01:40', '2024-06-05 17:01:40', 1, 'member'),
(214, 'peach 2', NULL, 'peachcuti2@poly.edu.vn', '$2y$10$Wl8zuSyC9ubAJ8c7FBl9rOozmuy7A8ism84AaA.ZhpaS9J26/lp0O', '2024-06-05 17:01:40', '2024-06-05 17:01:40', 1, 'member'),
(215, 'peach 3', NULL, 'peachcuti3@poly.edu.vn', '$2y$10$srNn7y1gowdR1FhykBU6ruuAXEvvbkdkcr12Ej5ch5WtNPIUCtHr6', '2024-06-05 17:01:40', '2024-06-05 17:01:40', 1, 'member'),
(216, 'peach 4', NULL, 'peachcuti4@poly.edu.vn', '$2y$10$K78LLBsKe9d9PYw.NxiHWusWysXo0vgmEsuD8RNROrWfGAWUNJ9wK', '2024-06-05 17:01:41', '2024-06-05 17:01:41', 1, 'member'),
(217, 'peach 5', NULL, 'peachcuti5@poly.edu.vn', '$2y$10$s9GWsF6Fni4hra..hJ1RkOAHls1rJxEfNN0LYmSRzwyggqZnh8eoW', '2024-06-05 17:01:41', '2024-06-05 17:01:41', 1, 'member'),
(218, 'peach 6', NULL, 'peachcuti6@poly.edu.vn', '$2y$10$wqgSlKcG/vQhFooCEfC2POj2iizVhtD4GVq8tqN/8O8tl.nJo5CRm', '2024-06-05 17:01:41', '2024-06-05 17:01:41', 1, 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart_details`
--
ALTER TABLE `cart_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_producs_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
