-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 27, 2024 at 06:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_asset_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `asset_class` varchar(50) DEFAULT NULL,
  `asset_number` varchar(50) DEFAULT NULL,
  `investment_order` varchar(50) DEFAULT NULL,
  `asset_name` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `merk` varchar(255) DEFAULT NULL,
  `asset_type` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `branch_code` varchar(50) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `division_name` varchar(255) DEFAULT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `acquisition_price` decimal(10,2) DEFAULT NULL,
  `acquisition_year` date DEFAULT NULL,
  `amortization_percentage` decimal(5,2) DEFAULT NULL,
  `condition` enum('Good','Damaged','Lost','Updated','Deleted') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `asset_class`, `asset_number`, `investment_order`, `asset_name`, `serial_number`, `merk`, `asset_type`, `type`, `branch_code`, `branch_name`, `division_name`, `department_name`, `user_name`, `acquisition_price`, `acquisition_year`, `amortization_percentage`, `condition`, `created_at`) VALUES
(1, 'Hardware', 'A0001', 'INV001', 'Laptop Dell XPS 13', 'SN123456', 'Dell', 'Laptop', 'XPS 13', 'BR001', 'Branch A', 'IT', 'Development', 'John Doe', 1500.00, '2023-01-15', 20.00, 'Good', '2024-07-25 03:00:00'),
(2, 'Hardware', 'A0002', 'INV002', 'Office Printer HP LaserJet', 'SN789101', 'HP', 'Printer', 'LaserJet', 'BR001', 'Branch A', 'Admin', 'Administration', 'Jane Smith', 300.00, '2022-05-22', 25.00, 'Damaged', '2024-07-25 03:05:00'),
(3, 'Software', 'A0003', 'INV003', 'Microsoft Office 2023', 'SN112233', 'Microsoft', 'Software', 'Office Suite', 'BR002', 'Branch B', 'IT', 'Development', 'Alice Johnson', 200.00, '2023-03-11', 15.00, 'Good', '2024-07-25 03:10:00'),
(4, 'Office Supplies', 'A0004', 'INV004', 'Ergonomic Chair', 'SN445566', 'IKEA', 'Furniture', 'Chair', 'BR003', 'Branch C', 'HR', 'Recruitment', 'Bob Brown', 120.00, '2021-11-30', 10.00, 'Updated', '2024-07-25 03:15:00'),
(5, 'Motor Vehicles', 'A0005', 'INV005', 'Company Car Toyota Camry', 'SN667788', 'Toyota', 'Vehicle', 'Camry', 'BR004', 'Branch D', 'Finance', 'Accounting', 'Emily Davis', 25000.00, '2020-07-01', 30.00, 'Good', '2024-07-25 03:20:00'),
(6, 'Office Supplies', 'A0006', 'INV006', 'Desk Lamp', 'SN889900', 'Philips', 'Furniture', 'Lamp', 'BR001', 'Branch A', 'IT', 'Support', 'Michael Green', 45.00, '2022-08-15', 5.00, 'Lost', '2024-07-25 03:25:00'),
(7, 'Building', 'A0007', 'INV007', 'Warehouse Building', 'SN998877', 'N/A', 'Property', 'Warehouse', 'BR005', 'Branch E', 'Facilities', 'Management', 'Sarah Wilson', 500000.00, '2018-06-10', 2.00, 'Good', '2024-07-25 03:30:00'),
(8, 'Software', 'A0008', 'INV008', 'Adobe Creative Suite', 'SN223344', 'Adobe', 'Software', 'Creative Suite', 'BR006', 'Branch F', 'Design', 'Graphic Design', 'James Lee', 600.00, '2023-04-20', 10.00, 'Damaged', '2024-07-25 03:35:00'),
(9, 'Motor Vehicles', 'A0009', 'INV009', 'Motorbike Yamaha', 'SN556677', 'Yamaha', 'Vehicle', 'Motorbike', 'BR007', 'Branch G', 'Logistics', 'Transport', 'Laura Kim', 1500.00, '2022-12-01', 20.00, 'Good', '2024-07-25 03:40:00'),
(10, 'Office Supplies', 'A0010', 'INV010', 'Conference Table', 'SN334455', 'Herman Miller', 'Furniture', 'Table', 'BR008', 'Branch H', 'Admin', 'Office', 'Oliver Brown', 800.00, '2021-09-10', 10.00, 'Deleted', '2024-07-25 03:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `asset_categories`
--

CREATE TABLE `asset_categories` (
  `id` int(11) NOT NULL,
  `category_code` varchar(10) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asset_categories`
--

INSERT INTO `asset_categories` (`id`, `category_code`, `category_name`) VALUES
(1, 'BMT111', 'Software'),
(2, 'BMT112', 'Patent'),
(3, 'BMT113', 'Goodwill'),
(4, 'BMT119', 'Others'),
(5, 'BMT221', 'Computer Hardware'),
(6, 'BMT222', 'Office Machines'),
(7, 'BMT223', 'Motor Vehicles'),
(8, 'BMT224', 'Cars'),
(9, 'BMT225', 'Office Supplies - Steel'),
(10, 'BMT226', 'Office Supplies - Non-Steel'),
(11, 'BMT229', 'Other Inventories'),
(12, 'BMT211', 'Land'),
(13, 'BMT212', 'Office Buildings'),
(14, 'BMT213', 'Other Buildings'),
(15, 'BMT219', 'Other Fixed Assets'),
(16, 'BMT411', 'Office Building'),
(17, 'BMT412', 'Warehouse'),
(18, 'BMT413', 'Shophouse/Office House'),
(19, 'BMT414', 'House'),
(20, 'BMT415', 'Apartment/Condominium'),
(21, 'BMT416', 'Land'),
(22, 'BMT419', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `asset_deletions`
--

CREATE TABLE `asset_deletions` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `deletion_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_fields`
--

CREATE TABLE `asset_fields` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `is_optional` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` enum('create','update','delete','approve','reject') DEFAULT NULL,
  `action_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('maker','approval') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'maker'),
(2, 'approver', 'approver', 'approval');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_categories`
--
ALTER TABLE `asset_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_deletions`
--
ALTER TABLE `asset_deletions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_id` (`asset_id`);

--
-- Indexes for table `asset_fields`
--
ALTER TABLE `asset_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `asset_categories`
--
ALTER TABLE `asset_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `asset_deletions`
--
ALTER TABLE `asset_deletions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_fields`
--
ALTER TABLE `asset_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asset_deletions`
--
ALTER TABLE `asset_deletions`
  ADD CONSTRAINT `asset_deletions_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`);

--
-- Constraints for table `asset_fields`
--
ALTER TABLE `asset_fields`
  ADD CONSTRAINT `asset_fields_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `asset_categories` (`id`);

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
