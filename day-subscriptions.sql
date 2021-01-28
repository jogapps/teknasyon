-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2021 at 03:47 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teknasyon`
--

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `os` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `appId`, `os`, `token`, `receipt`, `status`, `expires_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, '1234567432', 'ios', '123456789RlSY48z1eoRYCes93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9Y123456789', '345679847345457', 'new', '2021-02-06 06:00:00', NULL, '2021-01-28 02:20:00', '2021-01-28 00:45:57'),
(3, '1234567999', 'android', '565656xniRlSY48z1eoRYCes93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9YY5w565656', '345679847373459', 'expired', '2021-01-04 06:00:00', NULL, '2021-01-28 02:20:00', '2021-01-28 22:45:57'),
(7, '3214567432', 'ios', 'RlSY48frghyuikjz1eoRYCes93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9Y123456789', '345679847345455', 'updated', '2021-02-06 06:00:00', NULL, '2021-01-28 02:20:00', '2021-01-28 02:43:36'),
(8, '7684567432', 'ios', '56789RlSY48z1eoRYCefvbhs93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9Y123456789', '345679847345453', 'new', '2021-02-06 06:00:00', NULL, '2021-01-28 02:20:00', '2021-01-28 00:45:57'),
(9, '7671167432', 'ios', '789RlSY48z1eoRYCes93n5efdcvxsUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9Y123456789', '345679847345451', 'new', '2021-02-06 06:00:00', NULL, '2021-01-28 02:20:00', '2021-01-28 00:45:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_appid_unique` (`appId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
