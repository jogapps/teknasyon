-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2021 at 09:48 AM
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
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `os` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `uId`, `appId`, `language`, `os`, `token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'glglglglglg', 'rpttptpttppt', 'lggllglglggllg', 'android', '4Plx4yxniRlSY48z1eoRYCes93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9YY5w5ENutV', NULL, '2021-01-26 22:56:50', '2021-01-26 22:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_10_09_143414_create_roles_table', 1),
(6, '2021_01_26_230253_create_devices_table', 2),
(9, '2021_01_27_001213_create_subscriptions_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '1234567890', 'android', '4Plx4yxniRlSY48z1eoRYCes93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9YY5w5ENutV', '345679847372229', 'updated', '2021-02-10 06:00:00', NULL, '2021-01-27 21:58:23', '2021-01-28 00:45:57'),
(2, '1234567432', 'ios', '123456789RlSY48z1eoRYCes93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9Y123456789', '345679847345457', 'new', '2021-02-06 06:00:00', NULL, '2021-01-28 02:20:00', '2021-01-28 00:45:57'),
(3, '1234567999', 'android', '565656xniRlSY48z1eoRYCes93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9YY5w565656', '345679847373459', 'expired', '2021-01-04 06:00:00', NULL, '2021-01-28 02:20:00', '2021-01-28 22:45:57'),
(5, '1234567765', 'android', 'yxniRlSY48z1eoRYCesxzsad93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9YY5w5ENutV', '345679847372229', 'new', '2021-02-17 06:00:00', NULL, '2021-01-27 21:58:23', '2021-01-28 21:58:23'),
(6, '2224567890', 'android', 'YPFR9YY5w5ENutV4Plx4yxniRlSY48z1eoRYCes93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eA', '345679847372229', 'expired', '2021-01-20 06:00:00', NULL, '2021-01-27 21:58:23', '2021-01-28 00:45:57'),
(7, '3214567432', 'ios', 'RlSY48frghyuikjz1eoRYCes93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9Y123456789', '345679847345455', 'updated', '2021-02-06 06:00:00', NULL, '2021-01-28 02:20:00', '2021-01-28 02:43:36'),
(8, '7684567432', 'ios', '56789RlSY48z1eoRYCefvbhs93n5eUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9Y123456789', '345679847345453', 'new', '2021-02-06 06:00:00', NULL, '2021-01-28 02:20:00', '2021-01-28 00:45:57'),
(9, '7671167432', 'ios', '789RlSY48z1eoRYCes93n5efdcvxsUrsc3f9q4nYuV5f8je55B1PW39riwoWfFbZhn4dl9luN1W3B7rt9TzMomOxMSYkZAtijiroxNADGB85ycZzH59qURenFV8IB0bn7tbI4eAYPFR9Y123456789', '345679847345451', 'new', '2021-02-06 06:00:00', NULL, '2021-01-28 02:20:00', '2021-01-28 00:45:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `devices_appid_unique` (`appId`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
