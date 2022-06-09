-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 31, 2022 at 02:52 AM
-- Server version: 5.7.36
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel1`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Womens', '2022-05-31 02:50:04', '2022-05-31 02:50:04'),
(2, 'Mens', '2022-05-31 02:50:10', '2022-05-31 02:50:10'),
(3, 'Kids', '2022-05-31 02:50:25', '2022-05-31 02:50:25');

-- --------------------------------------------------------

--
-- Table structure for table `category_companies`
--

DROP TABLE IF EXISTS `category_companies`;
CREATE TABLE IF NOT EXISTS `category_companies` (
  `company_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `class_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes_users`
--

DROP TABLE IF EXISTS `classes_users`;
CREATE TABLE IF NOT EXISTS `classes_users` (
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_semester` int(11) NOT NULL,
  `course_year` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diaries`
--

DROP TABLE IF EXISTS `diaries`;
CREATE TABLE IF NOT EXISTS `diaries` (
  `diary_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `diary_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`diary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diaries_contents`
--

DROP TABLE IF EXISTS `diaries_contents`;
CREATE TABLE IF NOT EXISTS `diaries_contents` (
  `diarycontent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `diarycontent_weekday` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diarycontent_work` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diarycontent_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diarycontent_note` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diarycontent_teacher_comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diarycontent_trainer_comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `week_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`diarycontent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups_permissions`
--

DROP TABLE IF EXISTS `groups_permissions`;
CREATE TABLE IF NOT EXISTS `groups_permissions` (
  `permission_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_04_18_144553_create_companies_table', 1),
(5, '2021_04_18_144906_create_trainers_table', 1),
(6, '2021_05_17_035842_category_table', 1),
(7, '2021_05_24_005942_create_categories_table', 1),
(8, '2021_06_07_004410_create_category_companies_table', 1),
(9, '2021_06_07_013458_create_types_table', 1),
(10, '2021_06_07_013719_create_groups_table', 1),
(11, '2021_06_07_013819_create_users_permission_table', 1),
(12, '2021_06_07_014113_create_permissions_table', 1),
(13, '2021_06_07_014227_create_groups_permissions_table', 1),
(14, '2021_06_07_014710_create_classes_users_table', 1),
(15, '2021_06_07_014939_create_classes_table', 1),
(16, '2021_06_07_015133_create_courses_table', 1),
(17, '2021_06_07_015624_create_diaries_table', 1),
(18, '2021_06_07_015726_create_weeks_table', 1),
(19, '2021_06_07_020441_create_diaries_contents_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trainer_id` int(10) NOT NULL,
  `product_description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_image`, `trainer_id`, `product_description`, `created_at`, `updated_at`) VALUES
(1, 'Áo thun 3 lỗ', '30000', 'aothun.jpg', 1, 'Áo thun 3 lỗ', '2021-07-03 02:09:09', '2022-05-21 06:26:44'),
(3, 'qQiKJwg85D', 'SHluzj74sY', 'x799ro2baGOhSVlci6fs1GUzxjpxdjHqJKLlrKC53hdbQGQc3Y', 0, 'krVkH99DK2', NULL, NULL),
(4, 'fXkImnRV8i', 'n1WpipDPle', '8Nm8uDO2QuQhGpLSJb3E2lAnH1h4ycnunepbTfF74Ayjj4KJWe', 0, 'vosQKyA4CP', NULL, NULL),
(5, '14cmKqe3w7', 'YrOTLutUj8', 'nFCYiXC4XxyJLa8tbspm86352uVDbI3FHElLerRQDdvCmDNtyz', 0, '6OrluDWHpj', NULL, NULL),
(6, 'LKa4jRU660', 'omje0eJLKE', '7qqaG7lVeb4out0BgrS4NxLHO7hwtx982HeZkdLHqIUwPiwtbu', 0, 'guLHhV9OOe', NULL, NULL),
(7, 'zBV7bIXqML', 'wUgSXdw36n', 'n3Fdme9Ajhezv76qE6VTWuXfRF96OMuq7RwDweL8ZPxzjvKeKW', 0, 'JQAOL3ubrs', NULL, NULL),
(8, 'MxHMkERjIH', 'poBPZ5qQ5e', 'qTRkonTZdF8C3HL2kLpd5l4r3glEGl0lLeE4naRFKqJhf97n2k', 0, 'GGBVvdmI82', NULL, NULL),
(9, 'oPUbOIJRf1', 'pymgwMlJiS', 'Klpl7uTFjUDBn9KsHUeQkX4qXUf32BRuIb0vqsdZDS2ZMV8dXv', 0, 'Ly3Yb6Y2wL', NULL, NULL),
(10, '8LQtuhF21c', 'umYid5TJff', 'ESMkqHqebBLs2vRMTjGchfxLet5gjbz5CUxmYzgzvB7urRdvhm', 0, 'fiXYWTTEUP', NULL, NULL),
(11, 'osk4Pm24fv', 'w9B9hNjBXB', 'YiQEVl1f7vF2d7CjnwfOIZ1E9eJGk3mpz6rYIqz73FRDB3mRvO', 0, '2AvKNt02kV', NULL, NULL),
(12, 'kCxDaT0dlU', 'Tz4qPsvxxA', '6rhIxcQVvX6BFkIZJyxrB5IJvi2kfdsHxMafGHUDk1tmq8Bqsc', 0, 'KkFEGdeRSH', NULL, NULL),
(13, 'oXA4Tf1dMP', 'T2RQYgM2wz', 'WL2Hq5h8m7dH89WpRf7lHRH2EuB1YpPSPuB9oJjpONeZvGBGCS', 0, 'Wq0hvGLnmd', NULL, NULL),
(14, '28XQnpMNlj', 'vych3IVJVE', 'j6uIhc61hxkyJ4NYTNoFtY3qcoiUwhzMtQNMlentekRJwu9tSv', 0, 'NlJubdhRGl', NULL, NULL),
(15, 'uf5Nbe4VRg', 'QrijM6qjlb', 'vRAz60NQR2HWCXMFwpgxIhwqFFZJQjLaMT2Xv93EugmX502vvK', 0, 'zvDiTuMTus', NULL, NULL),
(16, 'nKKxniziHx', 'fKkneK2zat', 'oGmEdcfJSN07vDWKUXo9JlSlZgszY8ktiUlTTNxulvQT0rSCu4', 0, 'XzugAbA1nW', NULL, NULL),
(17, 'HHH6TX4N95', 'v5XiSWIhsx', 'CHZRXOA1plZzd21p2EzgfLzTjhd9gZWOCSfiDXsu41hnIQomJo', 0, 'u193EkPaEz', NULL, NULL),
(18, 'gLrfCyNVj1', 'w7UcyO97C2', '6jqTDBskW4tgx7EAIhXGYdNfXDpj86VgoTyXeG8GAUAz0iLj8w', 0, 'kUsUAjp2LA', NULL, NULL),
(19, '1djajb5HW0', 'WuVs1UQpJZ', 'jF0xEPA2EZQdBMriRHEJ3X3DqS0wm1tBBe54mjw68YPE1h4Ssh', 0, 'Kd0JwkTIxh', NULL, NULL),
(20, 'eMWyNaKxsN', 'ea0qMzHIQP', 'HNPQAHdQftqoQJ75uqLnI3FHMCdf0pr9VCpLHGPgbANNdV4NYn', 0, '2gkHnoWiox', NULL, NULL),
(21, 'hs6HXIsxj2', '9CbY9k1edV', '2OXz2dSaY2sX2clCoUjhKKakibN8iv0u2TtEoBzGkXUNZIzChE', 0, 'vh3mRdAkzR', NULL, NULL),
(22, '01377BWgNE', 'lBr38nGhmv', 'F90KNvyay1Ed2pq7JPBqo9SMzjqjbUxyL68geT6sqwcCNRnxrV', 0, 'HpaelO03FK', NULL, NULL),
(23, 'jpA06kfOq4', 'GKDlzc6PUh', '5DTcLM0UFGTYbUxkeZD6reLC1xA2RkMvcShzyHa9Oi8f8ZcDVC', 0, 'tXwo3Rn0YH', NULL, NULL),
(24, 'YWwcE2iZ4q', '0uVwX1ZugU', '3vk9zW3N8e5OU9YBFmxUtmJIwcTQbXV7J0scY6Hds85llSufPx', 0, 'UvNyyrzrrp', NULL, NULL),
(25, 'ZboadHWGsS', 'L5BC1xSyaA', 'aOJHrjarOtqzLYDoqUNjp9HN2goEF0eluwb7o40FM2mqNUKGge', 0, 'NugpNPCMM8', NULL, NULL),
(26, 'zkTVOL02Ws', 'Z6vgZwDQEi', 'rdstbrSPl7Hh753TlasqzXoyhKWRhT5oCIhMUxik0wLONipOAj', 0, 'rVd1ooY864', NULL, NULL),
(27, 'iBCESmWFtP', '6AbMJV9xHg', 'a5kc5Yv8mpqG6E3d9kiy2syIIZ1C0EGzvYM2TDZU9UmnZ6gPRX', 6, 'gKh0OC0gl2', NULL, NULL),
(28, 'xld6S60KL9', 'aU6XcASWzw', 'TSEUphHwuEwjvkvkyLFVeqkHQWZoAIGYm6u7hpSPXFhXB1GRt5', 0, '5k6WufUsdV', NULL, NULL),
(29, 'G8t9D2v4V4', 'L8kGIHgmtP', 'P2Umss1nZixMBQVEQ8ORPE2U4sJMTJqWPw5Wh546jlUzhBqES4', 0, '60xMgCjs3l', NULL, NULL),
(30, '0dakmYdqd2', 'Ywu74r4b3J', 'eBnHeNCaTN8Un0a3x1uAFUJjeo8Qdp6DJaPa78SiYZvp3Vzvkv', 0, '9JC1GUDwgU', NULL, NULL),
(31, 'ZqmuGsPqi5', 'mY2jtB1kWw', 'zeQKquCFp8hOEYp7cH6qmHzetmmQWfGRR9WQLGd6L9jgGBmqOt', 0, '1gj2OmQXTY', NULL, NULL),
(32, 'Fkdz634wdp', '8go4gN74Vy', 'AVGoNHeHLHuuW9JDKlBNJLCXLuZd3ZJ3Eb3wdKtzksBRdMFE0Q', 0, 'HPsCUa7FgS', NULL, NULL),
(33, '2b0q3c1vnd', 'dxWgWXINuE', 'A6WwcBVch59dzWFit70CXi60QwEH7Mi3bOKm55LSlNZP3peoKS', 0, 'UzuW0GFBWT', NULL, NULL),
(34, 'vUX83JMat6', 'rXK4zgK1cd', 'RN5oMUZN2ctT8eS6gvUJRwLnFdnIGG7qUjmuU72pBFwLYu2Lb6', 0, '3IBRt8ktjM', NULL, NULL),
(35, 'fyU5Nk9o7m', 'C0LUf2chYr', 'sTBh74dZi6FwuFCsobgSrfEeKAqZKVcGzOtlNpmDxZORs0KjGM', 0, '6DLuBGlCtp', NULL, NULL),
(36, 'CwdMWU8uEF', 'JQoIIug1sI', 'CQ0PvnzYb5j9PxKnxnOnB78l0f52ladxLkT0ux94IrjBHxtog9', 0, 'uswwgWTd8B', NULL, NULL),
(37, 'NGOqPIVtmg', 'NmjV4HwarC', 'uX4ihmqHfIZfKLY7Q7bEcOQWBaqBgzXR2slYkTrYU5m4cBlE1C', 0, 'DzUEnHHmMR', NULL, NULL),
(38, 'qHVoYMchkI', 'vS9WPwfRR8', 'DLHICxgfDlxyiZxcTvjhMpkoaICw9bhT8YORQWOC736QaQlOqB', 0, '2rZCLfW2Us', NULL, NULL),
(39, 'wvFc6zwLrs', 'Q1niLtIK7D', 'oWxpljFCQPfUAQGhDYUjDe1MYRWDcmdi3MhrzZG1aarOyypdWn', 94, 'KUlLiKqeAV', NULL, NULL),
(40, 'L3tC986K4e', 'uwy7yeC1JT', 'kGibrFCd6Uzowqo9WuUd4aLdW8k9B4URmxRssGjp55vOe7BI9V', 0, 'bmRExwPAxV', NULL, NULL),
(41, 'BbmrR7JAwi', 'EMtf59dqDm', 'lSZEyDSsOCtnD08HbMVio5keZQj4woglnHYUVjm9fx5prnvZqI', 0, 'hOWpecApow', NULL, NULL),
(42, 'QjKaDUmGso', 'Ref7zpqvDk', '1EavjCglNgUG6yIuvJBsbiwkE9LsEXOrYoMIveyGhXohXMOJNo', 0, 'gw27XyvjkU', NULL, NULL),
(43, '9DAlucXowW', 'arHD41gF3C', 'Bdrby9QccG5ThdhmnEcwlCvTyYudvSPwIMmaKAKg8yhD8ETIVp', 0, 'HI6s8A2xLl', NULL, NULL),
(44, 'M3oG9tiT32', 'YNv25vNdka', 'zFwfLe7hQCAUO0pVe0ldmxXiHWxFyhBpvV36NNcoB37MXnQ9Hl', 0, 'WUA7a3EZ82', NULL, NULL),
(45, 'GtJLyC7pYn', 'o9WmIpXJrk', 'kvqOIFN9OInAZpbMvh5DWfjQrcIAYee2C1BOaPZYqeZknJ4Z6T', 0, 'K15jUZcz0E', NULL, NULL),
(46, 't49ccaDMvy', 'si0DBx3bwR', '2IFa8OqfbAh2AHorMzZn43UX3RKsB7otNoE2uPFFEwaNekN7sC', 9, 'UxG0GMH7vv', NULL, NULL),
(47, 'Nyzv0ZV9yw', '4RW12P38ZK', 'VLg8EgyhyoRSvpX49IjptBCl2imjbycHQk0Gn4eCTcBBk6TCrr', 0, 'UhOw5dd5Hp', NULL, NULL),
(48, '2LWQ1o3csX', 'JwwDYUhu9R', 'EOU40KgQzETsp1jZ9HhLGXLadZ3EPi8EaYR0hMkgEkrQsU4SDN', 0, 'AXPA8rdrax', NULL, NULL),
(49, 'YNRLrtC9Gk', 'rBGw1zulNm', 'qPYgT6yj6jj7AOp2fhBbLAHN28GTJNQUUYd9uETIm5xbQtEXhu', 0, 'BO9TUeDiCn', NULL, NULL),
(50, 'qSz6hpKTzh', 'u3K2PeamCs', 'VNTIR36P802jsO46C8s3HvkGDF36nGoraxyMUjf8rMwUxFVLd7', 0, 'uGvmvpjOD2', NULL, NULL),
(51, 'ug4BJiKZdr', 'hIJr14znAN', 'qrZc5jLTZdcRbbTZkPQCHjffMaHmGOctZJxmC3Ek10trJol2Jv', 0, 'W6kXvWWscC', NULL, NULL),
(52, '3WfgpQ8MzS', 'ywj38RIO4r', 'SaKFyz7q8fWLKv6GN4tCJNNz1GySIDf5yJKIwZknWu7R4q20i9', 3, 'ub7cRbxto3', NULL, NULL),
(53, 'Tkv79JMQUH', 'LX5ESIaeVZ', 'DKg0YbUQlKOK8VJZnOliPGylxCMjb14Hpb7UNJDVsPx9gZvFRc', 0, 'cgNBOzjf9A', NULL, NULL),
(54, 'dJ6HzYZrwm', 'PDMQQHNXWO', 'rYxKK1udKQCfZD9vPxdT3hDGXeS76OaGq0FOhxaVDDAbB1yEFA', 8, 'Gz89v80F0b', NULL, NULL),
(55, 'xQYDyG32lO', 'FKOAjum8rk', '87sEAkVIFsFcVDHBgfgWpOIIutLvGyQNmQJaiFazmQ05Sa6MeE', 0, 'VT5HrUiYXk', NULL, NULL),
(56, '6w9skHm3MY', 'wqcr403yK5', '6RuIge1JuXDubclQUOBFfkRtsurUfdhTTKm7tpnRA4PHUeKTd0', 0, 'HGJCIVCgtr', NULL, NULL),
(57, '1Akb6l7FJ0', '4s9T9Tepw7', 'PbKxFiKhdWQA3D8QKvz64XAa76hrqDD1bedIktPW0DN7XQueYT', 6, 'mD0uGm37zi', NULL, NULL),
(58, 'DLjqgTyAzY', 'mE6teCFohF', 'Ckuo2MoHF2qRfWpd62D63pwVdY8tjq4uMgudRLT2OhZXb3eQ6r', 0, 'qrA2MbZaoV', NULL, NULL),
(59, 'EtQJao5nAc', 'q5217lOTGr', 'r6mXoWi8lCwDrv7nOhGOGX9VjM4XUEdqfvfxaCcAEYmuhb6RM0', 0, 'D4GpiiwZhY', NULL, NULL),
(60, 'JiRiJtiKPg', 'FT8bLUVQaz', 'Mz6EHRtlZzDOUWRf6F2SVntoP6yT2UZLkXBPxdDKY7re025cYD', 0, 'HwdoxgoWDb', NULL, NULL),
(61, 'JcIKvmO2UI', 'FyKyZbjMO6', 'JDWGCyMnTyebxUhd1WWtZM9Rsv8KEKu0WTeoR0AHAiwhQdIJM7', 0, 'xgQVNh6otK', NULL, NULL),
(62, 'yUCe0t7Mte', '5b3zKiDeMB', '1j3eCR0UC1rGUqgXx0G6bLgXj0GdzjHeZGsdyCtme8uFipTv79', 0, 'LRCycbYpp5', NULL, NULL),
(63, 'MOCwxFEXeK', 'sSlPrq7QXR', 'Aj0O6NTCXXOYb1an04neX61gJw4GdlIhZIq6Zl5IQD3hhpbyna', 0, 'R0m0rMpoig', NULL, NULL),
(64, 'f6a2ARjL5z', 'SRzvcwo8xS', 's2KWfbXqC9cHBEngPnFXIKRevhbY9NTNYmjWQfsuR7ho0IHxdO', 335, 'tNyYDaPza4', NULL, NULL),
(65, '2NLPnRltRO', 'SQZ66jiyjT', 'cCE8JHYwMvo5cITIPiVpdvLQj7s8st8q6kQTOG9npCN5IO1sAO', 6, 'G1VBz12dzj', NULL, NULL),
(66, 'P1w7uvpvCp', 'SzX0PjfX5S', 'C6NzkhXOUc6I5dDUaFRjoQfcC6ryqbmU0oouon4ouzLeBSN75D', 0, 'w3G5SUm5rx', NULL, NULL),
(67, 'DEOYyVXD22', 'qXYGreqU5W', '8rak1oOsJsk2b2EBsR4HBR8tSGXTYRaMLLOBcNJ2Ebjr3WUuyD', 0, 'dGj299fwCf', NULL, NULL),
(68, '8nMFDw7Nhb', 'brfUAUzbYb', 'aRL2EMvsSZA5R3M9ciKV8t0uEmQ5CqBw0m9rcMNvM5PQpokuVT', 9, 'IuOL6yf6mK', NULL, NULL),
(69, '7cxcCYemoB', 'powo3MPjMw', 'JrOL0gI6lyZdOYTU5GOOij6c4VKiJENCpkEfWlRVfdelmQMWfc', 0, 'fpBfH4W8GX', NULL, NULL),
(70, '9Gt01tXp3d', 'tFGzqlDDm9', 'm1OeNolRDZ9FjzdUJYcraNoaij68GiGmEwfrS90S4zzoduoGhG', 0, 'bjGXXamkgN', NULL, NULL),
(71, 'zS5UzeKPHt', 'F6o9ZzVDPc', 'bUDDs58UBn6yv78pu3iEsREZoPkS0j4ixQY8lIDOG1Scp3OrSt', 0, 'bom7rfrR3Q', NULL, NULL),
(72, 'BatNSQTWpR', 'UWz0VIGrAE', 'hj4mo9Mszl6UJVmkDCEjOPXchkhX5Njrp393MpqZAyovWKCKwJ', 5, 'cYN0BeFF2h', NULL, NULL),
(73, 'qgG8pbXkrT', 'wA9WBoDgG1', 'UpZgcuwSPjCyKJaqzgpsYaUsd2j4cEuWnPD5uHnMa3bJoLDQbD', 0, 'vCvbAH3Kgf', NULL, NULL),
(74, '1gJztmgvfW', 'iFB1N2FHDh', 'JDnhyrmcv69G96Xm0YlTEnm3ShXqL0VP36H4h0OvY8JS2p9NHD', 0, 'GwPGih8MnG', NULL, NULL),
(75, 'Ooo2ct49m6', 'JsQbPQlGCZ', '8vtAHsGtHBGV5BDu2KNJ4msdiEtNRvHyx5nDtdDIhu9zrHYN3B', 5, '6CBNIletWI', NULL, NULL),
(76, 'z39SYZb6nx', 'g0yAJkdd46', 'okmOqR2Kf4cQW18d9azyXeV85taxn084PEaMHhjwCeBRRMXO27', 0, 'UjCpLfTcWQ', NULL, NULL),
(77, 'LnIHdvQvFH', 'RyDRjDv4sO', 'vhNMpcG6BzgCYYBQJ4wAuFDX5le5SNDGBUuss6EyKWP37nI8JC', 0, 'otuNHyNUC5', NULL, NULL),
(78, '9d7AD0pfTU', 'IO738FVVgP', 'hl4wiWApbg9QorA3MyWrIv83gcQXKW0TQ7q01eZ1VIIjAxy7M6', 0, 'q8b3PgvEJm', NULL, NULL),
(79, 'BzoWQe9yKZ', 'nxLCu0uhOs', 'usTDvYX0m8z6Tr0ac6w2v07jyS1hqpgCgpXOj6CcWLzacMiRRF', 0, 'Zn3IIapKYh', NULL, NULL),
(80, 'dsh2yDQgBJ', 'gHubh8Sx9l', 'JU2X4ChRFBCA7mDKqvBslYRhiZMUIDCoXmkIlWIWKAixifMXHc', 0, 'moYxHFtW4E', NULL, NULL),
(81, 'vkUP1bAoyd', 'AKySEQvio9', 'zDluLj7dr3fYkHIn8SF3tPIfqsY6TDMhoLoa2efYf6vtMeYeUj', 0, 'xXdHzqxuXw', NULL, NULL),
(82, 'oI2zgJBtr3', 'IxeQMEt3qi', 'HHbAfNJTEdu5eG3XYaeAHbYAa6TAmjVOd8F69l3j3JsGPiICvY', 0, 'DM42RWdbE7', NULL, NULL),
(83, 'JkMQXTDdQ2', '8aQDNbmx0p', 'moWE6wpvTPjXBezhCzpUuZycP9vArknL0ZeL4AV0hhpb7036Qr', 5, 'MgkcMQPUvH', NULL, NULL),
(84, 'cjjFRR4s56', 'rsdtGBLg0I', 'ITdJtsSE3OOgzHO35QSQkDePrUn4uqqfT2P8RKAdWEocKZVJY3', 0, 'fSpPdNaCyf', NULL, NULL),
(85, '2pytCDjzYb', 'D6z8DBtNFu', 'LYVuoEHfaxqUSNO7naznR3dsXyQaul7QfupdW9vV0VEGrSnQpI', 6, '8tfj3GKEtK', NULL, NULL),
(86, 'qteyQqCaqx', 'cwaIWmRSWY', '8vM2teww5n2IkpzNkvAstfrO8EJnd4eH1DWt8vRcNRDwAwfi7A', 0, '3un6T2ypiu', NULL, NULL),
(87, 'SHLAPbOrK2', 'G9op0WlkNJ', 'vFqHAjxvDpfcJLp9y5vp2mMbU7BTkNy5ChHzmKZiHM5sz1hp1X', 4, 'uRYRfofyBI', NULL, NULL),
(88, 'NTToOzP1QM', 'SZ6VhlCPGO', 'HXsSAdbo6WfoP4DRhQK094atzLSe6QFlKVcjO1WtvH3QCrSkSs', 0, '7PDHjqhAtR', NULL, NULL),
(89, 'sDQgElqT5s', 'L9HTzud3N6', '2NxAwlVucxTE94pdmjQe27creIZjn1JLnVYpBDLHnnfHt70gi1', 0, 'P4FTez4hem', NULL, NULL),
(90, 'hNgUi33DZv', 'XB3zxJi7LP', 'w8oMnkBJ7W5UIgCkyYBSpdtPo1OGZCtUFPUoueBZpDHy1MOlwO', 0, 'eBw0s7xdMU', NULL, NULL),
(91, 'ZDVK6j6EZW', 'IXbPWlTpfo', '0giZOte0Z9tU2w85DrWxu4zLGA3erUh3KVYiCYBrw2ANG6uCs7', 0, 'AWtLGN2KJz', NULL, NULL),
(92, 'cysrGOwpk1', 'W0qfDjmdUz', 'zESMYLv0Nxxn1jG5ZDU952VkeEdmEix4OdLjdRCrASitLDkJZs', 0, 'SMRsUWF8oM', NULL, NULL),
(93, 'Kl0Fgt9fiO', 'wBr2aUClWQ', 'deQ5jUKEnQayJkdVEi8CqltBbVXgL9su4LrzyQHSOi4S7ZFNpT', 0, '5BwAqw8WVN', NULL, NULL),
(94, 's2bT88QyQQ', 'fw8zL8V49K', 'z9rHi9rf61Kotjy0LF8dcBbfPaqjFOnkWCY1IUeCxZk2zNr10R', 0, 'eurbSi0DFQ', NULL, NULL),
(95, '7XQTucPOpw', 'ZI3U9Y9nVQ', 'kd7r53taCscyEW0V7EV0ObpjhUi8hfIaA7WjNXe9fuSHcH1jYh', 0, 'fbx8VQvaTi', NULL, NULL),
(96, 'dt8CmWLBOd', 'sHoLtBOTGl', 'chbvCr0q7BZt7rNkxVgNJANA8hCt1H5LhSfkM6E5E9vnaVYw0l', 0, 'X8LaZLxfLC', NULL, NULL),
(97, 'Pv56uS5oOE', 'dIV7xKPKsF', 'XVEgDVUL5L7idyoBXw1ZcpTE0If1qreNCipMKu6tkupyefKa8R', 5, '24uYrVOUS4', NULL, NULL),
(98, 't85ZXJdm4M', 'RpzHIr3xDU', '9lDarRGfyPpIOUJLDPhUwwZX6okVeCcw8doiqJOmbRNUDBhArv', 0, '41xgM2Vq4c', NULL, NULL),
(99, '1EYvnnTmF7', 'BJqvQMTkkb', 'HmhzOhHqeG3afTHqE2EktOsypJD21KbXxKx2kJbEqXkuo7SaF9', 0, 'PNq8aquRXq', NULL, NULL),
(100, 'HY1LSw33Vx', 'ZYQwvcfJ2H', 'D4up6nGRFKO9XssvtB5ytIBRZQApTRlKsw3dSrp0jMU4mcN9yx', 0, 'YPpKNdFIri', NULL, NULL),
(101, 'J5GuORGWgQ', 'GTUCNPV1gN', 'Y3xo7LvKhIRghYutSH7yWkh9nrm3bNxjqi7y7YbK2pMMjwUxnr', 0, '1tdT9OQNZI', NULL, NULL),
(102, 'jvzrd0Onz4', 'XRNuSqj90x', 'RqDLin8GGG3cIKjorf59jffzeCWOI7KZwumGRxuqe46iGoCECn', 0, 'VU2gj9rtYN', NULL, NULL),
(103, 'qgpU5efWPx', 'u7vPzjF32x', 'BvquT40FRwBmLMMDYhe7LEtgme5bxJsVXCIJtan4RRgYxARmpt', 0, 'llibTZzuyY', NULL, NULL),
(104, 'Ymv98KDq3d', '86edI2C92P', 'pThDwujNxwXUMBsgiD82ZYBeM82ExSYYG77n77jihfOemxQnKe', 4, 'RX9N5UK1T9', NULL, NULL),
(105, 'fnTOlbMMB7', 'JrzZRFxPiu', 'I4C2FYu0r9XXXc3oXV7QQw2zkwkUqLsvC3D9E8gnF988q8Tip8', 0, 'IehRBt4N3w', NULL, NULL),
(106, 'pGQ7zSFqWW', 'i7dQIG2k3H', 'Z8x0tge7L0PyUP5R7gF0MjSfUAtuRqL1rUSsMEeSetE9iLqgRv', 0, 'p5mMlhIjQD', NULL, NULL),
(107, '7tpECxdZ0V', '5eqlzLlacl', 'ckpQdKrFTYEKWxHX0x34DQuAYmS61n2j3BQjKdQCgALlL1Yntw', 0, 'Z2d2wScQ0a', NULL, NULL),
(108, 'h6TPbEcQnI', 'z7N2W1jxSx', '6exVzcn2M7DQmtkKfLENCqHXCqMo0lUEFpX0wBe7OyoF9UtdDy', 0, 'RzrIAca9mA', NULL, NULL),
(109, 'xE8lXf0bZ0', 'vL2sJkWsox', 'gx4NrAbyhEfv34hqZgb52K6af3KW6ZAkTRdxyPJOEXkNmReWOT', 0, 'xgYaMg6NAC', NULL, NULL),
(110, 'AOiqEF3tyK', 'ITwwjKb1Ml', 'y4TyaijUouZFZ01YrJLvGqfJ3nY9dO1KKEOqux3YI2SNYiJj3p', 5, 'ui2XCtVUeY', NULL, NULL),
(111, 'xiaywd4zY2', 'KW3L1JlWFw', 'ibYcTwUfBd0jnJjetVGcYx89x7jzheZdlxHwxfNG3E0a1UuXvR', 2, 'yiAynNdjac', NULL, NULL),
(112, 'axJpK8N9uU', '0KoEpo5QLJ', 'hPxEOpjgeaUysYL3fJLXmhGwTn8RScz7XG8hkxGX1mwiwn1LSt', 0, 'FPnoHG06Kn', NULL, NULL),
(113, 'O9EnD06Ene', 'zL9aMbttD8', 'MbYMdVobmv7PIh8eFMt301pXQVI1eVpdWb8HGPZ66KgArvR9v0', 9, 'Ki2cwQRJHB', NULL, NULL),
(114, 'OH9j4JY95t', 'EZ7yum7DMD', 'nuBZWc6iQwfdl2mnblQ1PApPUcxl06boROwP6T988bBYuBSW2S', 0, 'gGAdf2BObG', NULL, NULL),
(115, 'WoZNkaXtIA', 'U5PtCt2raj', '2ZMKrZuaxelccgTaok9NK3AWjDTWnGLzC7JbLaCmRh0iRTVVWO', 0, '1uHYBNEscT', NULL, NULL),
(116, 'muMZX3FSFA', 'kSrTHnFIRi', '8NW3xGYmJPTD6TDRPINZLiB4LWhBWzgTcx5pOen0baKY3EcNo7', 0, 'NmbrsgYh5y', NULL, NULL),
(117, 'nV0kiJAsrr', 'dTGw22nRsC', 'XGtW6q6guOknngZezxTilbBcpyYKGAiaNKQU6yK6yjSiENeLPr', 2, 'IdYdyty5Ie', NULL, NULL),
(118, 'buGF0him1M', 'M1TcWOZmND', '8uhf4CrYpg5irSWGhYKyVch2WlSOi1TzucBMQHRBe2nLAr7AI5', 0, 'LwojGdY2Wo', NULL, NULL),
(119, 'diaZyaUNew', 'KLh0Lv8h8F', 'BSU7ZVG08VSFY4aVXbvKIVaom1wGMJXih5uIoqCpi3JpPFkRa4', 0, 'xS2k4Xw7kK', NULL, NULL),
(120, '9U0ZWKbO8i', 'V3RIjcl405', 'oiwlX7a4KKLTxzva6VhCN83noH5wYiESsOaQnqVCTmrHMUMLem', 0, 'Rf8xAfQHsz', NULL, NULL),
(121, 'Mpjogs8kLr', 'qQUITPr3iz', '4RsjzKuRkYJNPgIG27evFFd5NCp3WBU8sDj8fkN2qFO6idpuHe', 0, '9soSbF7WwH', NULL, NULL),
(122, 'kygYE6e3lg', 'pN3LkuV3Dv', 'GQlDoguHywVO8H2duNG1m4ew7E5YWfsbOrDkZVVgezfNIkpdFL', 0, 'Ojuh6OeWVj', NULL, NULL),
(123, 'b9neXAmPvw', 'pyXJtOuThr', 'aYU9WH64bEPPMxV5QqUF41xwYZXBPYskd88gCY0C7rI4yqEF1J', 0, 'bfJZ2Oqwmr', NULL, NULL),
(124, 'dfFsZoPtNX', 'ktg5dLIMte', 'ttoLx3HDZZBqLLQjMFdMNfwTGbk5pA9TI5bX9JL8gq1xfvjwYR', 0, '7wVdN9ue8p', NULL, NULL),
(125, 'Jmct9eHOZi', 'hn5KPIO3PE', 'tGeXOwrtpe6luiBIAzzp1mkGcAM51JINNIy0NlEamvcrXvRZ1B', 0, '1F8eTHCLqx', NULL, NULL),
(126, 'UFe1UwoMFU', 'zWAvYDhCys', '3bsJfC90yCFMgqrwkEH39QGc1jklitvNbjPtl6tNoiqMRvEYor', 1, 'dntALmlFpY', NULL, NULL),
(127, 'xmv023yqCP', 'QR7uPfxMkJ', 'Bqrk8JSzb8nMBCYFVXf9gvdDBIcbm90mZB3if83juCU3ihtQl1', 0, 'UBidzzxW4Y', NULL, NULL),
(128, 'aryAeJJUC3', 'hvMTrV20vh', 'wykQNk30iUOYPiJl0QODa6lzL7ZigBirRsscULwHkwrQT9nGv1', 0, 'xuXwlwoXIo', NULL, NULL),
(129, 'lMJR8ardYT', 'ul5cqPyWSX', 'XcHmzBOjk2rX9BXjRIitHNiCBEdz8Y9bGYD2zaKbYtO0FZI7tl', 0, 'R9Fd85osq7', NULL, NULL),
(130, 'bTU1iVKsUv', '9MuRiOSr0n', 'WwMVH5EIayoVUTzzLXlVTxLMIEX8PAIzFYSzvhaBsMzkpHOybw', 0, 'wOsjcqNCiC', NULL, NULL),
(131, 'mE0DtA6fmQ', 'TwkVaNBrDm', 'wqcKrg0hIumbpla1uaKBpmhD7b0sF8qyqW35VAOQzvwC2l3LsM', 878, 'iv0sWtSaOL', NULL, NULL),
(132, '8ypyybDaHw', 'q7vtkPc6DR', 'xTQjcpXsovdOqVmlKD2roJcsPsPx5zvftwOr3JjSOLf6i91D31', 0, 'MtaG28Gcnv', NULL, NULL),
(133, 'WUUPyMNqCa', 'ew5zM58b6g', 'HSaRnOG3fd4jr2EWs1QiPzUAOqqyKNNQOJeS8zeAEWjiCXalG3', 0, 'AOg0CjrCBg', NULL, NULL),
(134, 'pflArhbWZu', '0Aok5inf4E', 'yHOZAaxWRAX4fua5hj1524q5FQxbufEEUBPzz5DsZB8nTFp4Ed', 0, '7K3hAR8KHY', NULL, NULL),
(135, 'sOy3rhfow2', 'LoHDNugmjv', 'mvrtNIGB0UwoHC22k73FDERJi5nOyLBKfNAYXSR542CiWy4OZg', 0, 'bzPWn8l30w', NULL, NULL),
(136, 'QCDDZxyAYW', '74xdFqcFZN', 'A5hKiTdkQ7aL2PkxHuI8zBtbcSI3WGa7hB4Vn32XybABM1LvQu', 0, 'P38BRGNkUt', NULL, NULL),
(137, 'C0TQVdxPgO', 'TUK32OU3Bo', 'LgJrXrsDOooZynW4l9ebkhi6Tlug2fOSrxD3PyiJ6lZVRyfUxu', 0, 'qWTtfhFGUe', NULL, NULL),
(138, 'ujUgOlrqKA', '7Nxqsh46kN', '4X0LCuodCIc6G6p6Hdbdr9YenD6PATMweN77gf6cvYOsQgsQn3', 0, 'YQCuO2EeM4', NULL, NULL),
(139, 'WB2rhUW5Zr', 'x3LRCDsyw5', 'Kiv8fAyyRBfG4mOBhylxPjioy8ZTgvgwLdQWBQV6rfUOr3P9HX', 0, 'eDKFyt2CFS', NULL, NULL),
(140, 'R7qT4aYb98', '3KTYkVX9gL', 'QMxjKvLhwZg8R4fNgrYiA26rirzU4ZZ9CDBS1dgck2DfmAVs1h', 0, 'f4WqzvPMOc', NULL, NULL),
(141, 'IReAhbBpvJ', 'm5xa9adzFK', 'JDwWMTwbBjqCbvPyVftwHZaak2n00rGcGed0J6ngoE5b3ssKsP', 0, '2WeFe0wzda', NULL, NULL),
(142, 'QrHZ6bGdzs', 's8dx2DX1uX', 'fW6sFplo1Jhw5WXd82m0EvpkY1Po5NRkFv8P3nxJoFi8W8Rsxh', 0, 'YXfi58PqVS', NULL, NULL),
(143, 'Kd1ibEcO2i', 'oOO0q1gsdf', 'LkBs3Ln9Wqfe7qiqLjsWe1WbzEnZZv1ZUPKHYuUjtrs43RRFnk', 0, 'l3USp4VIIN', NULL, NULL),
(144, 'J4STM6rSuE', 'Kzl76IyFIH', '67jAH5CwmJL69Ba501IZnTyIBw3U1cGifqXHypZA9nxHeHHmJi', 68, 'QHCTMPEUkF', NULL, NULL),
(145, 'tyuCRbs21Y', 'hUrPN2MFAo', 'c2GddbxUyrYRGmrQsLHPveJcKTvRBAQNGLsKFVGzdRU6MddwDg', 0, 'GlS1hbIBeS', NULL, NULL),
(146, 'sitK6Clp5S', 'Zd1slXhOR9', 'Hj5asYlXjemduUncK4aMvNfSYLXmuJI7LpMMSCGctlTkePfbY4', 0, 'DHCBweNorO', NULL, NULL),
(147, 'AiYFQFXfMQ', 'yems5wvLAW', 'YYeskbCSFka1UvhHMv2ukyckJ0mS6SiZJmVPLm7O64PW74HirW', 0, 'TwtkstYhjs', NULL, NULL),
(148, 'qcgQxPDcjI', 'OIJeO6oRqk', '7lzFAu7xL5ceR1SULThAc2VrzCeFPPZ4Mtxu7OnmUBd5Uuer95', 0, '1CqK8zh0rZ', NULL, NULL),
(149, 'Q75FFgx6sm', 'l5OE0ZtgLG', '3s1ktGkAXQ1v4XHBWOiCU2XbH8LDH1nG0citmkdxHQSlRvQTly', 0, 'EL44FsSV3c', NULL, NULL),
(150, 'UuCNGSkoqn', 'dRTw8DtCgj', 'TFc8eDyPe3CwLyXGqZpOmHRIABXWY3420WR5dhhQcSEhU8Yb63', 0, 'S3PoZFt4UX', NULL, NULL),
(151, 'hXDiwre2cN', 'UXOdIclZXL', 'tLsKUihDCZJIP9ulhAzELd5lZI1jlmydFDCLqwcg59hIls89vT', 0, 'itfoplMIL8', NULL, NULL),
(152, 'PKKREzTOUM', 'Itsr2pmlD4', 'Z4bEbvy7vNr02abLiDQInbZCzydeAb6R8RIzrGBngsgHCVZq23', 0, 'OFKcBqngEB', NULL, NULL),
(153, 'L0RvM2e2Kq', '3amcs7vgQP', '6Atv3AyscJ0awK9wLfy081PgqrgoVwsTDBymDKTkNZN0A9JjAK', 7, 'hwSbvFsU3u', NULL, NULL),
(154, 'gWcwVaMzTO', 'gbShDSSQq1', '1nslAlMGilpl6ol8T2EamfSWX9AlkmgP7rddwcsVXyKOF43p1R', 5, 's2uz1uyYNp', NULL, NULL),
(155, 'Y4XUMprPLm', 'QEtp7DGxEP', 'S0XfuVDrsDuBdL9MbkVw8AEF7TDqpSTRE4U234LMMLFbUSm3nP', 0, '71BCiQY9Uv', NULL, NULL),
(156, 'f14wYQ0LzZ', '0jXY1MttED', 'kRnT2t9gGAjHjeZKem4MdbohZaOLn26luLBrjYjeuTgrE6umBN', 0, 'OOIHtBIMhw', NULL, NULL),
(157, 'WVJSfUH6Xe', 'vmjJLtmeOw', 'ZK5dUSiED7w83v43Rs4eS8uzo0fL4Dyw335J66fkFKJ0QK0KJz', 0, 'vHGE7H1mn9', NULL, NULL),
(158, 'xUtZOuoxEl', '6fzidfYt2Z', 'Q9DBlLWRLO0YXgTohQtTbmw4XqmHdwqXZEvP87ALeTGi0UwR4l', 0, 'FFLaQ9qtda', NULL, NULL),
(159, '7D9mwBzMNO', '9AWkxSOEbX', 'rckLEMXMCnbkLuQohDpQIP8zYkPYEvaomDjLtK3dYabGLTBdYr', 0, 'iDn10b4Vzk', NULL, NULL),
(160, 'cD2sYbZgCv', 'X4SpcJ7DZT', 'EWC95qc98iZLccHkFLW6WyKbbWz519H4u2SLEJZp3WMRaC3dzm', 0, '3u0oodEyEn', NULL, NULL),
(161, 'T86HWVxP3E', 'o66DsnvbTb', 'KQjueHapGMoJQa9tvNq6bXUdIV5qoMWiwp0mznPGDkipgHF4Wb', 0, '39Wo61tywu', NULL, NULL),
(162, 'mNB8y0C3bo', '31gQeLDjeV', 'fjqIJ1aU6UXMsIkvQf6O6UQ46G6aWwc9qqGIeQ3oI66m6z53Tj', 0, 'XSJdUZASI9', NULL, NULL),
(163, 'Q8axrYFh34', 'CiSbMsCsTR', 'L9GLLc8183y5GjCr7Ye04SW3QRdHMyeL7I3eSMIvZnZsaKRPYv', 0, 'NmTDBpuukB', NULL, NULL),
(164, 'FaHowrgdWQ', 'WbBcSKJj7P', 'N7ozzAKZ3KTy2LvoBRUKQyz4poVAqIcBdHlo7Z6uwL7qVhyJn5', 0, 'YXEI6Mkp3q', NULL, NULL),
(165, 'wBmXrvHyDm', 'Hw21y7mZzt', 'yeXUUd736fYYaDdfYZzN0a6HY2spIvlzAGStlxw7chKPstXEdO', 0, 'S36bA16cnK', NULL, NULL),
(166, 'dq9ijzOt2i', 'nX91Ki3VtF', 'WKrNkvCRzBpUnzgCricIeiXdX6RPMinhTtVFLyX8BJ44ig5txU', 0, '6Sy30nTZXn', NULL, NULL),
(167, 'Zq4KdEo5yI', 'a3Bu5Ilyit', '1HYg78f01mf4FaWW6zRMLMfvz8XKI7zs9pBD4ivSErD5WVEYSV', 0, 'XRdU51SbLS', NULL, NULL),
(168, 'NZsksJs2bw', 'R3rKB4xh7K', 'YibIuLvKo0iNynWNm3ySxofykL5xzLkLR5fHkBJUbq4aiKBUKE', 0, '0Ys1aBsYVy', NULL, NULL),
(169, 'yJJVXTahNW', 'TA1Jtx9wpK', 'NKlmS030Jzu4p826yFEQW0MARNsd85EUstFCWipfzptR5nuKE0', 4, 'kIJHuP8TaO', NULL, NULL),
(170, 'IRq37LTa6d', 'FikdctFGYM', 'kd3bVfXtAXUGwMknhw4YOxmAD0iJDBAU9eXjheUHEms4R9kh1M', 8, 'xR2C5RywzQ', NULL, NULL),
(171, 'B3mL257aDe', 'EF80KMkCja', 'W5yWzxaoxKeK1F8HhMNZxfAncv93C9z2QWJjyY1JiLSLlzZKGr', 0, 'T5aXoNoEku', NULL, NULL),
(172, 'JmREB29Cfg', 'PKGXdJECW9', 'JUi6XrgqVEuMzkY1cXzbEbqloMCVXC5JmKGRMHAcWTknzXwwPA', 0, 'HXrA3YRlIK', NULL, NULL),
(173, '3auvm3kDOm', 'N4YlG2BmZB', 'aw0MYRKYxFBNP0oiYgP1vxCfLlVibUNZrnu8aw4jEXSOl0ktxx', 0, 'vXqyeqUBJ3', NULL, NULL),
(174, 'xxW5jGicyc', 'kt5cXVRFP2', 'lH4kCK8x4duT0MKtxraqe4TMZA0oBqFHxQ3CLKHdn3VB6Xb06O', 0, 'vb3tyAsqDK', NULL, NULL),
(175, '55xuDRwqjP', 'qNOk7JQXU1', 'Vue4fodxYAoDxQuuTJExIx34h5dUaMkRv9VJwLTq18nPrl6zw7', 0, 'zmQzYM6jKl', NULL, NULL),
(176, 'd76RzI4bvj', 'BisAvrRbgn', 'aU4hH2h7iSBK5Yb6geK3VNfcyWsqNdcch6aa2zlHJ9te8snaSt', 0, 'JRiLMt3KmW', NULL, NULL),
(177, 'JgksWFhBFn', 'AcDUIbrEam', 'LkKrBkmYgPbjAZHakPgDheQ6rH3SmTUgHPEQh0Vy7ZMwpHQ1xR', 0, 'udu9O7MwtN', NULL, NULL),
(178, 'jEscYMVRRE', 'EjmCep3rK2', 'LA8xgKkQAAoIjGgivP1e9cF0Mt1g5sxR4hkcscl0TtEndgplWD', 9, 'RHfJBrkHgt', NULL, NULL),
(179, 'iLvMUdmFE8', 'FoOLFQTqXf', 'xnfwBEB7ARXwEjeyYIkY4rsFdkCnE7smdfWXMNuDn8Ww56Dg9Q', 0, 'jnjWLvVqNJ', NULL, NULL),
(180, 'AoTa6ZhnXc', 'HhQQRBtmZY', 'VVfis9CTsNjoqtccEDHz6o42GnHtZuqEeOYbVKtTgjiPvzPQy4', 0, 'aJQDn6hc8Y', NULL, NULL),
(181, 'zR6zyuD4sC', '7S4M92JVMc', 'EXUl3bwQeERpfM8fLEvySpzjARAZ3TU2g2H5mbrPyDvY6rpzYy', 6, 'qOnr8PmqKg', NULL, NULL),
(182, 'gpPzxhufXs', 'SfWYJPkhwH', 'VRSXzDp8uVAmYR6YXCVnsYh29FFgETX97mdotNow4l3AktUOod', 0, 'VDVByYWAl8', NULL, NULL),
(183, '8fyoLs1t0y', 'QPRwe2b8OY', 'QnwU1Ndibt6d3BUZb9twOzkAM20pCj8sgz1EnWJqeG6CxMRUWm', 0, 'VvdF57R7Ih', NULL, NULL),
(184, 'g4mfsUytsv', 'rBaCkn8Ftj', 'F85RZTm7TWnip4jzQ2zJpcJoRWsVO44LVWdcud4UVSxdssVvS0', 0, 'QTwGps0ViN', NULL, NULL),
(185, 'IjYRU8MxWF', 'JtX388wpXm', '7qzkOb0YOxXl66kfNzHgKWvawLEx0XfI2S2JPN9YDpv00BIZQi', 0, 'ixSx3OMcwj', NULL, NULL),
(186, 'DZPBaqkvnN', 'jgMnOM51Nw', '9PkTuFguISjBDK9SxbWKvKsTRmbzPiTERgkht9d5WZz9NFZqUW', 0, 'Ak1Cjozg5D', NULL, NULL),
(187, 'YJv3WO7O7t', 'OlaXcdSEqe', 'WlzU7oCEspvH9yEzfSF7piPpc35hzbIjJKebk6alpJVY3QscaO', 0, 'E1KjkylAQ5', NULL, NULL),
(188, 'uiYYbmu06q', 'W8M40Yz1Hr', 'H4M9UD5LdnEsno3EjVoH0e8EPjgPLUuSKXDQUqIZtjP3v5VC43', 0, 'jNxS7KAUC2', NULL, NULL),
(189, 'z8smzcfEOd', 'Yfgvmwvb4z', '4GBWDzvUi2BiVSfLfcAbE3n7FFnXXkR3aS4MskOnjijoVuWuxi', 0, 'Z8AhCigc8x', NULL, NULL),
(190, 'msUxyifrcn', 'YeGAojqosM', 'zNz4dHaka09OLSvNNFd0iZVCDnLaqTzTcWGvdBO11Vbha9VBcR', 0, 'tGmzOC5wRv', NULL, NULL),
(191, 'zHy1V4nQVa', 'RgoM7Qlgu6', 'SSddXg0SejCIXsm4sLqpTB7tzF1dedQdXB0Wm6AtaRouZUQM7m', 0, '38yFil51kJ', NULL, NULL),
(192, 'edQ5HT5WHd', 'KavkHP1Y5u', 'z6Ge3auBCr5bUKZZRrO4Y6AedGsWs87YPE8RqkHhTVeRxwsUNH', 0, 'Ltp1oU5FP1', NULL, NULL),
(193, '4RsLLzATdf', '0gTq4VqvVS', 'pdMxQrqcwalVt4sSOctGrSbMXnFw1ygZIlfE3tdcIWkBFb5eDn', 0, 'zwLbamu3Cm', NULL, NULL),
(194, 'Rvzbb0fOoj', 'HFWeSyyDsX', 'qFJAVyqkxpxvUzD0AbH28T4b3WQaN7rmBYZ5DTmuhFKVN9xuGL', 8, 'WwnTJMK4DF', NULL, NULL),
(195, 'K3SD4femgs', 'DASljTe2dg', 'EtPuxdDhqJ6mxrNL3Vw1yVay9cXd4CeI5PYnLcHGYB4Xy5uf0o', 0, 'q107EelweF', NULL, NULL),
(196, 'vFd5HZQiPh', 'zu7ZoATZAl', 'ehUIqNIeQlzkhRi45S8MQOkv9tGBo0fN0qZcKABn9Ks2ch0UvR', 0, 'tkmqdyUdHG', NULL, NULL),
(197, 'SYZttdQ7g3', 'VSpgFS0Qo9', 'M7KjkL5whf56Kp9RZpjZcXI7zaflRzAQ00NWHz4t1RGmdMxydh', 0, 'ZpubRcP4jz', NULL, NULL),
(198, '7qLaX0AR5z', 'sAPAD7A0jy', 'sZFUBIKfpSJEiK92xiheVpzqdMcNzCMPelgVy3J5yyztO2tOcs', 0, 'x5HwqtO5zA', NULL, NULL),
(199, 'ewlWstx60B', 'f7qeaugvzx', 'qyvRkGFLyLXRIlVbFJXiZM6mnQ056TIogdmYmdLgPyUt860SOD', 0, 'Pi7PfWPztk', NULL, NULL),
(200, 'Bag with Flag', '$11.05', '1653536298.jpg', 143, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-21 17:22:47', '2022-05-26 03:38:18'),
(201, 'Cross Body Mini Bag', '$40.00', '1653536500.jpg', 143, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:41:40', '2022-05-26 03:41:40'),
(202, 'Geometric print Scarf', '$23.00', '1653536565.jpg', 143, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:42:45', '2022-05-26 03:42:45'),
(203, 'Solid Crossbody Bag', '$120.00 - $169.00', '1653536604.jpg', 143, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:43:24', '2022-05-26 03:43:24'),
(204, 'Travel Large Trifold Wallet', '$29.00', '1653536642.jpg', 143, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:44:02', '2022-05-26 03:44:02'),
(205, 'Clarks Women\'s Step Cali', '$45.00', '1653536785.jpg', 138, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:46:25', '2022-05-26 03:46:25'),
(206, 'Gina Dress Sandal', '$79.00', '1653536822.jpg', 138, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:47:02', '2022-05-26 03:47:02'),
(207, 'Basic Dress Green', '$236.00', '1653536952.jpg', 142, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:49:12', '2022-05-26 03:49:12'),
(208, 'Collared Poplin Dress', '$20.00', '1653536984.jpg', 142, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:49:44', '2022-05-26 03:49:44'),
(209, 'Global Dress Reserved', '$27.00', '1653537016.jpg', 142, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:50:16', '2022-05-26 03:50:16'),
(210, 'Tarot Garden Dress', '$129.00', '1653537045.jpg', 142, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:50:45', '2022-05-26 03:50:45'),
(211, 'T-shirts Coupe Amincie', '$45.00', '1653537184.jpg', 139, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:53:04', '2022-05-26 03:53:04'),
(212, 'Basic Long Sleeve', '$11.05 - $320.00', '1653537585.jpg', 140, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 03:59:45', '2022-05-26 03:59:45'),
(213, 'Crew Neck T-shirt', '$134.00', '1653537643.jpg', 140, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 04:00:43', '2022-05-26 04:00:43'),
(214, 'Wide Cotton Tunic', '$250.00', '1653537669.jpg', 140, 'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', '2022-05-26 04:01:09', '2022-05-26 04:01:09');

-- --------------------------------------------------------

--
-- Table structure for table `protypes`
--

DROP TABLE IF EXISTS `protypes`;
CREATE TABLE IF NOT EXISTS `protypes` (
  `protype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `protype_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protype_phone` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`protype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `protypes`
--

INSERT INTO `protypes` (`protype_id`, `protype_name`, `protype_phone`, `created_at`, `updated_at`) VALUES
(138, 'Boots', '1653535625.jpg', '2022-05-21 17:19:35', '2022-05-26 03:27:05'),
(139, 'Jeans', '1653535605.jpg', '2022-05-21 17:23:12', '2022-05-26 03:26:45'),
(140, 'T-Shirts', '1653535650.jpg', '2022-05-26 03:27:30', '2022-05-26 03:27:30'),
(141, 'Tops', '1653535666.jpg', '2022-05-26 03:27:46', '2022-05-26 03:27:46'),
(142, 'Dresses', '1653535679.jpg', '2022-05-26 03:27:59', '2022-05-26 03:27:59'),
(143, 'Bag', '1653535696.jpg', '2022-05-26 03:28:16', '2022-05-26 03:28:16'),
(144, 'Hats', '1653538517.jpg', '2022-05-26 04:15:17', '2022-05-26 04:15:17'),
(145, 'Accessories', '1653538565.jpg', '2022-05-26 04:16:05', '2022-05-26 04:16:05'),
(146, 'Glasses', '1653538591.jpg', '2022-05-26 04:16:31', '2022-05-26 04:16:31'),
(147, 'Slippers', '1653538622.jpg', '2022-05-26 04:17:02', '2022-05-26 04:17:02'),
(148, 'Polo Shirts', '1653538649.jpg', '2022-05-26 04:17:29', '2022-05-26 04:17:29'),
(149, 'Coat', '1653538682.jpg', '2022-05-26 04:18:02', '2022-05-26 04:18:02'),
(150, 'Outerwear', '1653538722.jpg', '2022-05-26 04:18:42', '2022-05-26 04:18:42'),
(151, 'Shoes', '1653538742.jpg', '2022-05-26 04:19:02', '2022-05-26 04:19:02'),
(152, 'Hoodie', '1653538767.jpg', '2022-05-26 04:19:27', '2022-05-26 04:19:27'),
(153, 'Knits', '1653538788.jpg', '2022-05-26 04:19:48', '2022-05-26 04:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_user_email_unique` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `email_verified_at`, `password`, `type_id`, `group_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'cuong', 'cuongp948@gmail.com', NULL, '$2y$10$pInEjkAUQdLy5CiPFbpAveRSpQTh3G6ZVbDjApEEWLi8.5lNrRYxi', NULL, NULL, NULL, '2022-05-21 06:22:03', '2022-05-21 06:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `users_permission`
--

DROP TABLE IF EXISTS `users_permission`;
CREATE TABLE IF NOT EXISTS `users_permission` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weeks`
--

DROP TABLE IF EXISTS `weeks`;
CREATE TABLE IF NOT EXISTS `weeks` (
  `week_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `week_weekdays` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_check` tinyint(4) NOT NULL,
  `end_at` date NOT NULL,
  `diary_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`week_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
