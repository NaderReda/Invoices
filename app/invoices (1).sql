-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2026 at 11:56 AM
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
-- Database: `invoices`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `product` varchar(255) NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `amount_collection` decimal(8,2) DEFAULT NULL,
  `amount_commission` decimal(8,2) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `rate_vat` varchar(255) NOT NULL,
  `value_vat` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  `value_status` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `invoice_date`, `due_date`, `product`, `section_id`, `amount_collection`, `amount_commission`, `discount`, `rate_vat`, `value_vat`, `total`, `status`, `value_status`, `note`, `payment_date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '66', '2026-01-15', '2026-01-22', 'البطاقات', 2, 50000.00, 3000.00, '0', '5%', 150.00, 3150.00, 'غير مدفوعة', 2, NULL, NULL, NULL, '2026-01-15 17:30:27', '2026-01-15 17:30:27'),
(4, '545', '2026-01-17', '2026-01-29', 'paypal', 1, 60000.00, 1200.00, '0', '5%', 60.00, 1260.00, 'مدفوعة جزئيا', 3, 'تاني فاتورة', '2026-01-17', NULL, '2026-01-17 09:06:27', '2026-01-17 10:35:43'),
(5, '33', '2026-01-17', '2026-01-27', 'البربد', 3, 70000.00, 2000.00, '0', '5%', 100.00, 2100.00, 'مدفوعة', 1, NULL, '2026-01-17', NULL, '2026-01-17 09:10:56', '2026-01-17 09:11:20'),
(8, '22', '2026-01-18', '2026-01-27', 'البطاقات', 2, 50000.00, 4500.00, '0', '5%', 225.00, 4725.00, 'مدفوعة جزئيا', 3, NULL, '2026-01-19', NULL, '2026-01-18 14:29:28', '2026-01-18 16:26:11'),
(11, '11', '2026-01-18', '2026-01-27', 'البربد', 3, 30000.00, 2300.00, '0', '5%', 115.00, 2415.00, 'غير مدفوعة', 2, NULL, NULL, NULL, '2026-01-18 14:50:14', '2026-01-18 14:50:14'),
(13, '00', '2026-01-18', '2026-01-26', 'البربد', 3, 8900.00, 800.00, '0', '5%', 40.00, 840.00, 'مدفوعة', 1, NULL, '2026-01-18', NULL, '2026-01-18 14:53:23', '2026-01-18 16:25:00'),
(15, '55', '2026-01-19', '2026-01-21', 'paypal', 1, 60000.00, 3000.00, '0', '5%', 150.00, 3150.00, 'غير مدفوعة', 2, NULL, NULL, NULL, '2026-01-19 06:16:09', '2026-01-19 06:16:09'),
(16, 'lkj', '2026-01-19', '2026-01-22', 'البربد', 3, 45000.00, 700.00, '0', '10%', 70.00, 770.00, 'غير مدفوعة', 2, NULL, NULL, NULL, '2026-01-19 06:17:42', '2026-01-19 06:17:42');

-- --------------------------------------------------------

--
-- Table structure for table `invoices_details`
--

CREATE TABLE `invoices_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_invoice` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `product` varchar(50) NOT NULL,
  `section` varchar(999) NOT NULL,
  `status` varchar(50) NOT NULL,
  `value_status` int(11) NOT NULL,
  `Payment_date` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `user` varchar(300) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices_details`
--

INSERT INTO `invoices_details` (`id`, `id_invoice`, `invoice_number`, `product`, `section`, `status`, `value_status`, `Payment_date`, `note`, `user`, `created_at`, `updated_at`) VALUES
(2, 4, '545', 'paypal', '1', 'غير مدفوعة', 2, NULL, 'تاني فاتورة', 'ali', '2026-01-17 09:06:27', '2026-01-17 09:06:27'),
(3, 4, '545', 'paypal', '1', 'مدفوعة جزئيا', 3, '2026-01-17', 'تاني فاتورة', 'ali', '2026-01-17 09:07:40', '2026-01-17 09:07:40'),
(4, 5, '33', 'البربد', '3', 'غير مدفوعة', 2, NULL, NULL, 'ali', '2026-01-17 09:10:56', '2026-01-17 09:10:56'),
(5, 5, '33', 'البربد', '3', 'مدفوعة', 1, '2026-01-17', NULL, 'ali', '2026-01-17 09:11:20', '2026-01-17 09:11:20'),
(6, 13, '00', 'البربد', '3', 'غير مدفوعة', 2, NULL, NULL, 'nader', '2026-01-18 14:53:23', '2026-01-18 14:53:23'),
(10, 13, '00', 'البربد', '3', 'مدفوعة', 1, '2026-01-18', NULL, 'ali', '2026-01-18 16:25:00', '2026-01-18 16:25:00'),
(11, 8, '22', 'البطاقات', '2', 'مدفوعة جزئيا', 3, '2026-01-19', NULL, 'ali', '2026-01-18 16:26:11', '2026-01-18 16:26:11'),
(12, 15, '55', 'paypal', '1', 'غير مدفوعة', 2, NULL, NULL, 'ali', '2026-01-19 06:16:09', '2026-01-19 06:16:09'),
(13, 16, 'lkj', 'البربد', '3', 'غير مدفوعة', 2, NULL, NULL, 'ali', '2026-01-19 06:17:42', '2026-01-19 06:17:42');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_attachments`
--

CREATE TABLE `invoice_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(999) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `created_by` varchar(999) NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_12_30_164201_create_sections_table', 1),
(6, '2025_12_31_092339_create_invoices_table', 1),
(7, '2025_12_31_111853_create_products_table', 1),
(8, '2026_01_03_202455_create_invoices_details_table', 1),
(9, '2026_01_04_075839_create_invoice_attachments_table', 1),
(10, '2026_01_09_160609_create_permission_tables', 1),
(11, '2026_01_13_091752_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('3335b7cc-6d83-48a8-9b77-a326f67dc564', 'App\\Notifications\\Add_invoice_new', 'App\\Models\\User', 1, '{\"id\":14,\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"nader\"}', NULL, '2026-01-18 14:53:52', '2026-01-18 14:53:52'),
('5dad69cd-9b7d-4b16-bf62-e538af4fc0a9', 'App\\Notifications\\Add_invoice_new', 'App\\Models\\User', 2, '{\"id\":16,\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"ali\"}', '2026-01-19 06:18:10', '2026-01-19 06:17:42', '2026-01-19 06:18:10'),
('61d6dec6-c44d-4b3a-9a7e-e51ecc42d139', 'App\\Notifications\\Add_invoice_new', 'App\\Models\\User', 1, '{\"id\":13,\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"nader\"}', NULL, '2026-01-18 14:53:23', '2026-01-18 14:53:23'),
('7059aa34-d775-4827-b640-51b1ad473ec0', 'App\\Notifications\\Add_invoice_new', 'App\\Models\\User', 1, '{\"id\":16,\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"ali\"}', NULL, '2026-01-19 06:17:42', '2026-01-19 06:17:42'),
('8a8b58f6-27c4-4ea9-9064-e759632bad41', 'App\\Notifications\\Add_invoice_new', 'App\\Models\\User', 2, '{\"id\":14,\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"nader\"}', '2026-01-18 16:38:52', '2026-01-18 14:53:52', '2026-01-18 16:38:52'),
('b4a5de45-215a-44dd-947b-88f0d26c3de5', 'App\\Notifications\\Add_invoice_new', 'App\\Models\\User', 2, '{\"id\":15,\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"ali\"}', '2026-01-19 06:18:10', '2026-01-19 06:16:09', '2026-01-19 06:18:10'),
('cefa5d45-6dd7-4384-b369-7f6722021d5f', 'App\\Notifications\\Add_invoice_new', 'App\\Models\\User', 2, '{\"id\":13,\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f \\u0628\\u0648\\u0627\\u0633\\u0637\\u0629 :\",\"user\":\"nader\"}', '2026-01-18 16:38:52', '2026-01-18 14:53:23', '2026-01-18 16:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'الفواتير', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(2, 'قائمة الفواتير', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(3, 'الفواتير المدفوعة', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(4, 'الفواتير المدفوعة جزئيا', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(5, 'الفواتير الغير مدفوعة', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(6, 'ارشيف الفواتير', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(7, 'التقارير', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(8, 'تقرير الفواتير', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(9, 'تقرير العملاء', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(10, 'المستخدمين', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(11, 'قائمة المستخدمين', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(12, 'صلاحيات المستخدمين', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(13, 'الاعدادات', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(14, 'المنتجات', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(15, 'الاقسام', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(16, 'اضافة فاتورة', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(17, 'حذف الفاتورة', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(18, 'تصدير EXCEL', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(19, 'تغير حالة الدفع', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(20, 'تعديل الفاتورة', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(21, 'ارشفة الفاتورة', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(22, 'طباعةالفاتورة', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(23, 'اضافة مرفق', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(24, 'حذف المرفق', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(25, 'اضافة مستخدم', 'web', '2026-01-15 07:46:37', '2026-01-15 07:46:37'),
(26, 'تعديل مستخدم', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(27, 'حذف مستخدم', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(28, 'عرض صلاحية', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(29, 'اضافة صلاحية', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(30, 'تعديل صلاحية', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(31, 'حذف صلاحية', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(32, 'اضافة منتج', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(33, 'تعديل منتج', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(34, 'حذف منتج', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(35, 'اضافة قسم', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(36, 'تعديل قسم', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(37, 'حذف قسم', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38'),
(38, 'الاشعارات', 'web', '2026-01-15 07:46:38', '2026-01-15 07:46:38');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `description`, `section_id`, `created_at`, `updated_at`) VALUES
(2, 'paypal', 'vv', 1, '2026-01-15 17:29:21', '2026-01-15 17:29:21'),
(3, 'البطاقات', 'رر', 2, '2026-01-15 17:29:38', '2026-01-15 17:29:38'),
(4, 'البربد', 'عمالة', 3, '2026-01-17 09:09:05', '2026-01-17 09:09:05'),
(5, 'القروض', NULL, 3, '2026-01-18 16:27:30', '2026-01-18 16:27:30');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'owner', 'web', '2026-01-15 17:16:51', '2026-01-15 17:16:51'),
(2, 'user', 'web', '2026-01-17 09:03:56', '2026-01-17 09:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(38, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_name` varchar(999) NOT NULL,
  `description` text DEFAULT NULL,
  `Created_by` varchar(999) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_name`, `description`, `Created_by`, `created_at`, `updated_at`) VALUES
(1, 'البنك العربي', 'vb', 'ali', '2026-01-15 17:22:35', '2026-01-15 17:22:35'),
(2, 'البنك الاهلي', 'mn', 'ali', '2026-01-15 17:22:44', '2026-01-15 17:22:44'),
(3, 'بنك الرياض', 'من', 'ali', '2026-01-17 09:08:23', '2026-01-17 09:08:23'),
(4, 'ابو ظبي', 'اسلامي', 'ali', '2026-01-18 16:27:52', '2026-01-18 16:27:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `roles_name` text NOT NULL,
  `Status` varchar(10) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles_name`, `Status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nader', 'nader@gmail.com', NULL, '$2y$10$bJ9hOqLjVQRMcIbHH3wqqeBrfmh7PDkZKHbPAiqR1HNGAVn9LYPse', 'owner', 'مفعل', NULL, NULL, '2026-01-17 09:04:22'),
(2, 'ali', 'ali@gmail.com', NULL, '$2y$10$L8drmvNl0BFQDuZBK.3iROJjRNs17hD.GCpGc9bWqrSQxh7HJuOiu', 'admin', 'مفعل', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_section_id_foreign` (`section_id`);

--
-- Indexes for table `invoices_details`
--
ALTER TABLE `invoices_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_details_id_invoice_foreign` (`id_invoice`);

--
-- Indexes for table `invoice_attachments`
--
ALTER TABLE `invoice_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_attachments_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_section_id_foreign` (`section_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `invoices_details`
--
ALTER TABLE `invoices_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `invoice_attachments`
--
ALTER TABLE `invoice_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices_details`
--
ALTER TABLE `invoices_details`
  ADD CONSTRAINT `invoices_details_id_invoice_foreign` FOREIGN KEY (`id_invoice`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_attachments`
--
ALTER TABLE `invoice_attachments`
  ADD CONSTRAINT `invoice_attachments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
