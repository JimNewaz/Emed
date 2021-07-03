-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2021 at 10:35 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-med`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `registration_date`, `token`) VALUES
(1, 'admin', 'forallpurposes3@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2021-06-01 06:13:13', '740fdae9834f48e13cef70270007e0'),
(2, 'demo', 'ximnewaz@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-06-01 05:57:54', '9a884ea3716488341f3cb44aba4aed');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `shipping_charge` decimal(10,0) NOT NULL,
  `stock` int(11) NOT NULL,
  `product_availability` varchar(255) NOT NULL,
  `feature` varchar(255) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `name`, `company`, `price`, `image1`, `image2`, `image3`, `description`, `shipping_charge`, `stock`, `product_availability`, `feature`, `posting_date`) VALUES
(2, 'Napa ', 'Square', '100', 'v.jpg', 'napa.jpg', 'neo.jpg', 'Lorem&nbsp; Ipsum', '10', 10, 'In Stock', 'yes', '2021-06-03 06:06:50'),
(10, 'Ace', 'Square', '120', 'napa.jpg', 'napa.jpg', 'ace.jpg', '											Lorem Ipsum											', '100', 0, 'Out of Stock', 'yes', '2021-06-19 08:23:34'),
(11, 'Vitamin', 'ABCD', '1000', 'Vicks_AU_Cough_2in1_Syrup_front.jpg', 'Vicks_AU_Cough_2in1_Syrup_front.jpg', 'Vicks_AU_Cough_2in1_Syrup_front.jpg', 'Lorem Ipsum', '20', 5, 'In Stock', 'yes', '2021-06-05 19:48:27'),
(12, 'Vitamin A', 'Lorem', '300', 'vitamin a.jpg', 'vitamin a.jpg', 'vitamin a.jpg', 'Lorem Ipsum', '50', 10, 'In Stock', 'yes', '2021-06-10 11:12:28'),
(13, 'Vitamin D', 'Lorem', '100', 'vitamin d.jpg', 'vitamin d.jpg', 'vitamin d.jpg', 'Lorem Ipsum', '30', 8, 'In Stock', 'yes', '2021-06-10 11:13:09'),
(14, 'Vitamin D3', 'Lorem', '1800', 'omega3.jpg', 'omega3.jpg', 'omega3.jpg', 'Lorem Ipsum', '20', 0, 'Out of Stock', 'no', '2021-06-10 11:13:47'),
(16, 'Eye Drop', 'Lorem', '150', '6158jBL6lbL._SL1080_.jpg', 'tearon.jpg', 'tearon.jpg', 'Lorem Ipsum', '20', 10, 'In Stock', 'yes', '2021-06-10 12:05:19'),
(17, 'Nose Drop', 'Lorem Ipsum', '400', 'nasivion-classic-adult-0-05-nasal-spray-0.png', 'nasivion-classic-adult-0-05-nasal-spray-0.png', 'nasivion-classic-adult-0-05-nasal-spray-0.png', 'Lorem Ipsum', '20', 100, 'In Stock', 'no', '2021-06-10 12:10:43'),
(18, 'Panawell', 'Lorem Ipsum', '200', 'panawell.jpg', 'panawell.jpg', 'panawell.jpg', 'Lorem Ipsum', '50', 10, 'In Stock', 'no', '2021-06-10 12:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_orders`
--

CREATE TABLE `medicine_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderdate` timestamp NULL DEFAULT current_timestamp(),
  `amount` bigint(20) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine_orders`
--

INSERT INTO `medicine_orders` (`id`, `user_id`, `product_id`, `quantity`, `orderdate`, `amount`, `order_status`, `address`, `payment`) VALUES
(35, 1, 13, 1, '2021-06-18 19:32:28', 130, NULL, 'Test 1 2 3 4', 'Your Point'),
(36, 1, 16, 1, '2021-06-18 19:34:02', 0, NULL, 'Test 1 2 3 4', 'Your Point'),
(37, 1, 12, 1, '2021-06-18 19:40:12', 0, NULL, '', 'Cash on Delivery'),
(38, 1, 16, 1, '2021-06-18 19:41:55', 0, NULL, '', 'Cash on Delivery'),
(39, 1, 16, 1, '2021-06-18 19:54:01', 0, NULL, '', 'Cash on Delivery'),
(40, 1, 12, 1, '2021-06-18 19:54:40', 0, NULL, '', 'Cash on Delivery'),
(41, 1, 13, 1, '2021-06-18 19:55:51', 130, NULL, '', 'bkash'),
(42, 1, 16, 1, '2021-06-18 20:04:04', 130, NULL, 'Test 1 2 3 4', 'Your Point'),
(43, 1, 13, 1, '2021-06-18 20:15:31', 130, NULL, 'Test 1 2 3 4', 'Your Point'),
(44, 1, 13, 1, '2021-06-18 20:16:07', 130, NULL, 'Test 1 2 3 4', 'Your Point'),
(45, 1, 13, 1, '2021-06-18 20:16:38', 130, NULL, '', 'Nagad'),
(46, 1, 13, 1, '2021-06-18 20:17:00', 130, NULL, '', 'Nagad'),
(47, 1, 13, 1, '2021-06-18 20:19:32', 130, NULL, '', 'Nagad'),
(48, 1, 13, 1, '2021-06-18 20:20:46', 130, NULL, '', 'Nagad'),
(49, 1, 13, 1, '2021-06-18 20:22:27', 130, NULL, '', 'Nagad'),
(50, 1, 13, 1, '2021-06-18 20:25:30', 130, NULL, '', 'Nagad'),
(51, 1, 13, 1, '2021-06-18 20:27:07', 130, NULL, '', 'Nagad'),
(52, 1, 13, 1, '2021-06-18 20:29:33', 130, NULL, '', 'Nagad'),
(53, 1, 2, 1, '2021-06-18 20:29:53', 130, NULL, '', 'Nagad'),
(54, 1, 13, 1, '2021-06-18 20:30:56', 130, NULL, '', 'Nagad'),
(55, 1, 13, 1, '2021-06-18 20:34:02', 130, NULL, '', ''),
(56, 1, 13, 1, '2021-06-18 20:40:50', 130, NULL, '', 'bkash'),
(57, 1, 13, 1, '2021-06-18 20:45:13', 130, NULL, '', 'bkash'),
(58, 1, 16, 1, '2021-06-18 20:50:49', 130, NULL, '', 'bkash'),
(59, 1, 13, 1, '2021-06-18 20:54:22', 130, NULL, '', 'bkash'),
(60, 1, 16, 1, '2021-06-18 20:54:47', 130, NULL, '', 'bkash'),
(61, 1, 16, 1, '2021-06-18 20:55:30', 130, NULL, '', 'bkash'),
(62, 1, 13, 1, '2021-06-18 20:56:57', 130, NULL, '', 'bkash'),
(63, 1, 13, 1, '2021-06-18 20:57:52', NULL, NULL, NULL, NULL),
(64, 1, 13, 1, '2021-06-18 21:01:17', NULL, NULL, NULL, NULL),
(65, 1, 12, 1, '2021-06-18 21:02:07', NULL, NULL, NULL, NULL),
(66, 1, 13, 1, '2021-06-18 21:02:07', NULL, NULL, NULL, NULL),
(67, 1, 16, 1, '2021-06-18 21:03:08', NULL, NULL, NULL, NULL),
(68, 1, 16, 1, '2021-06-18 21:09:57', NULL, NULL, NULL, NULL),
(69, 1, 13, 1, '2021-06-18 21:12:03', NULL, NULL, NULL, NULL),
(70, 1, 16, 1, '2021-06-18 21:12:03', NULL, NULL, NULL, NULL),
(71, 1, 13, 1, '2021-06-18 21:25:02', NULL, NULL, NULL, NULL),
(72, 1, 16, 1, '2021-06-18 21:25:02', NULL, NULL, NULL, NULL),
(73, 1, 13, 1, '2021-06-18 21:28:40', NULL, NULL, NULL, NULL),
(74, 1, 12, 1, '2021-06-18 21:30:17', NULL, NULL, NULL, NULL),
(75, 1, 13, 1, '2021-06-18 21:32:52', NULL, NULL, NULL, NULL),
(76, 1, 13, 1, '2021-06-18 21:33:05', NULL, NULL, NULL, NULL),
(77, 1, 16, 1, '2021-06-18 21:33:45', NULL, NULL, NULL, NULL),
(78, 1, 16, 1, '2021-06-18 21:35:09', NULL, NULL, NULL, NULL),
(79, 1, 16, 1, '2021-06-18 21:35:14', NULL, NULL, NULL, NULL),
(80, 1, 16, 1, '2021-06-18 21:35:45', NULL, NULL, NULL, NULL),
(81, 1, 16, 1, '2021-06-18 21:35:58', 170, NULL, 'Test 1 2 3 4', 'Your Point'),
(82, 1, 2, 1, '2021-06-18 21:36:42', 110, NULL, 'Test 1 2 3 4', 'Your Point'),
(83, 1, 13, 1, '2021-06-18 21:39:33', 130, NULL, '', 'Cash on Delivery'),
(84, 1, 12, 1, '2021-06-18 21:43:00', 350, 'Delivered', 'Test 1 2 3 4', 'Nagad'),
(85, 1, 13, 1, '2021-06-18 21:47:26', 130, 'in Process', 'Test 1 2 3 4', 'Your Point'),
(86, 1, 11, 1, '2021-06-18 21:59:24', NULL, 'Delivered', NULL, NULL),
(87, 1, 13, 1, '2021-06-18 22:00:11', 130, 'in Process', 'Test 1 2 3 4', 'Your Point');

-- --------------------------------------------------------

--
-- Table structure for table `med_orders_medicine`
--

CREATE TABLE `med_orders_medicine` (
  `order_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `po_pres`
--

CREATE TABLE `po_pres` (
  `prescription_id` int(11) NOT NULL,
  `prescription_order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hospital` varchar(255) NOT NULL,
  `doctor` varchar(255) NOT NULL,
  `disease_type` varchar(255) NOT NULL,
  `prescription_image` varchar(255) NOT NULL,
  `upload_date` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `user_id`, `hospital`, `doctor`, `disease_type`, `prescription_image`, `upload_date`, `status`) VALUES
(24, 1, 'Normal Disease', 'Lorem Ipsum', 'Lorem Ipsum ', 'image00553-1.jpeg', '2021-06-01 15:32:13', 1),
(25, 1, 'Normal Disease', 'Test', 'Test', 'image00553-1.jpeg', '2021-06-01 17:26:27', 1),
(26, 1, 'Medium Disease', 'Mr Doctor', 'DMC ', 'image00553-1.jpeg', '2021-06-01 18:46:38', 1),
(28, 1, 'Medium Disease', 'Last Test', 'Last test', '193495001_2777709252540321_8990642363353929600_n.jpg', '2021-06-01 20:24:16', 1),
(29, 4, 'Deadly Disease', 'Test', 'Test', '193495001_2777709252540321_8990642363353929600_n.jpg', '2021-06-02 14:24:45', 1),
(30, 4, 'Normal Disease', 'Pres 1', 'Pres 1', 'image00553-1.jpeg', '2021-06-02 14:35:18', 0),
(31, 5, 'Deadly Disease', 'Test', 'Test', 'image00553-1.jpeg', '2021-06-03 04:42:15', 0),
(32, 1, 'Normal Disease', 'Test', 'DMC', 'pres.jpeg', '2021-06-18 19:30:46', 1),
(33, 1, 'Medium Disease', 'Mr Lorem', 'DCC', 'pres.jpeg', '2021-06-18 19:33:39', 1),
(34, 1, 'Normal Disease', 'Ds', 'dsd', 'pres.jpeg', '2021-06-18 21:58:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_order`
--

CREATE TABLE `prescription_order` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `amount` decimal(10,0) NOT NULL DEFAULT 0,
  `hospital` varchar(255) NOT NULL,
  `doctor` varchar(255) NOT NULL,
  `disease_type` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `shipping_address` longtext DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `contact_no`, `shipping_address`, `registration_date`, `status`, `point`, `token`) VALUES
(1, 'Sayed Nur E Newaz', 'ximnewaz@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '123456789', 'Test 1 2 3 4', '2021-06-19 08:30:32', 0, 40, '8e921bc85c63cc157bd1c270081f45'),
(4, 'Demo', 'demo@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '123', NULL, '2021-06-02 14:39:19', 0, 2, 'bc2ea0ea8251054b722290c75a7f4f'),
(5, 'sayed', 'sayed0newaz@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1234', 'asdasd', '2021-06-03 04:43:14', 0, 1, '487289e0a677524403399fc54644c4');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `list_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `posting date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`list_id`, `user_id`, `medicine_id`, `posting date`) VALUES
(11, 1, 10, '2021-06-13 17:54:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_orders`
--
ALTER TABLE `medicine_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKorders438149` (`user_id`);

--
-- Indexes for table `med_orders_medicine`
--
ALTER TABLE `med_orders_medicine`
  ADD PRIMARY KEY (`order_id`,`medicine_id`),
  ADD KEY `FKproducts_o292795` (`order_id`),
  ADD KEY `FKproducts_o914777` (`medicine_id`);

--
-- Indexes for table `po_pres`
--
ALTER TABLE `po_pres`
  ADD PRIMARY KEY (`prescription_id`,`prescription_order_id`),
  ADD KEY `FKimage_orde830788` (`prescription_id`),
  ADD KEY `FKimage_orde75649` (`prescription_order_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKimages918690` (`user_id`);

--
-- Indexes for table `prescription_order`
--
ALTER TABLE `prescription_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKimage_orde420554` (`company_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`list_id`),
  ADD KEY `FKwishlist308861` (`user_id`),
  ADD KEY `FKwishlist616636` (`medicine_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `medicine_orders`
--
ALTER TABLE `medicine_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `prescription_order`
--
ALTER TABLE `prescription_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `list_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medicine_orders`
--
ALTER TABLE `medicine_orders`
  ADD CONSTRAINT `FKorders438149` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `med_orders_medicine`
--
ALTER TABLE `med_orders_medicine`
  ADD CONSTRAINT `FKproducts_o292795` FOREIGN KEY (`order_id`) REFERENCES `medicine_orders` (`id`),
  ADD CONSTRAINT `FKproducts_o914777` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`);

--
-- Constraints for table `po_pres`
--
ALTER TABLE `po_pres`
  ADD CONSTRAINT `FKimage_orde75649` FOREIGN KEY (`prescription_order_id`) REFERENCES `prescription_order` (`id`),
  ADD CONSTRAINT `FKimage_orde830788` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`);

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `FKimages918690` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `prescription_order`
--
ALTER TABLE `prescription_order`
  ADD CONSTRAINT `FKimage_orde420554` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `FKwishlist308861` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKwishlist616636` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
