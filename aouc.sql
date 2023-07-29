-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2023 at 09:45 AM
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
-- Database: `aouc`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_cource_category`
--

CREATE TABLE `app_cource_category` (
  `id` bigint(20) NOT NULL,
  `Category_Name` varchar(30) NOT NULL,
  `Image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_cource_category`
--

INSERT INTO `app_cource_category` (`id`, `Category_Name`, `Image`) VALUES
(14, 'programming', 'Cource_Category/front.jpg'),
(15, 'Theory', 'Cource_Category/back.jpg'),
(16, 'Practicle', 'Cource_Category/idBack.png'),
(17, 'xyz', 'Cource_Category/idBack_PVfM3Ar.png');

-- --------------------------------------------------------

--
-- Table structure for table `app_course_detail`
--

CREATE TABLE `app_course_detail` (
  `id` bigint(20) NOT NULL,
  `Course_Title` varchar(50) NOT NULL,
  `Price` int(11) NOT NULL,
  `Number_of_lecturers` int(11) NOT NULL,
  `Course_Level` varchar(50) NOT NULL,
  `Content_Duration` varchar(50) NOT NULL,
  `Published` varchar(20) NOT NULL,
  `Timestamp` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Course_Category_id` bigint(20) NOT NULL,
  `No_of_Reviews` int(11) NOT NULL,
  `No_of_Subscribers` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_course_detail`
--

INSERT INTO `app_course_detail` (`id`, `Course_Title`, `Price`, `Number_of_lecturers`, `Course_Level`, `Content_Duration`, `Published`, `Timestamp`, `Subject`, `Image`, `Course_Category_id`, `No_of_Reviews`, `No_of_Subscribers`, `Date`) VALUES
(4, 'C++', 150, 10, '12', '120', '2023-07-01', '2:50', 'C++', 'Cource/FIdFront_kDFSfbu.jpg', 14, 7, 12, '2023-07-08'),
(5, 'Communications Skills', 1500, 10, '12', '23', '2023-07-03', '2.58', 'English', 'Cource/idBack_lTXZVxb.png', 15, 0, 2, '2023-07-22'),
(6, 'Python', 200, 25, '16', '23', '2023-07-08', '-', 'Programming', 'Cource/front_iTdRPOT.jpg', 16, 0, 0, '2023-07-28');

-- --------------------------------------------------------

--
-- Table structure for table `app_customuser`
--

CREATE TABLE `app_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_teacher` tinyint(1) NOT NULL,
  `is_student` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_customuser`
--

INSERT INTO `app_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `is_teacher`, `is_student`) VALUES
(1, 'pbkdf2_sha256$600000$XRUeacY2uvuNHbcJPUyayq$miQLFM2R4lKNqBN1qI5vCgM7HvzXgvNK98Nco5RntSo=', '2023-07-29 07:37:01.866211', 0, 'admin@uso.com', '', '', '', 0, 1, '2023-07-27 08:31:04.186008', 1, 0),
(2, 'pbkdf2_sha256$600000$J8TZTtCePwZXhGKheUO5XT$KvwFqmiVRfF52Dy/YfYp8vkFqLWbp+XRI58u6pNLQTE=', '2023-07-29 07:35:34.657076', 0, 'fawad@uso.com', '', '', '', 0, 1, '2023-07-27 08:45:37.435066', 0, 1),
(3, 'pbkdf2_sha256$600000$fMGKhy5cV2VTDo51ZwdQYK$PWPQiZXKQIDY/D+xDvDecVzcIJZ9oBWZronkeCOTrbo=', '2023-07-29 07:38:47.433736', 0, 'ali@uso.com', '', '', '', 0, 1, '2023-07-27 17:19:36.464869', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_customuser_groups`
--

CREATE TABLE `app_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_customuser_user_permissions`
--

CREATE TABLE `app_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_feedback`
--

CREATE TABLE `app_feedback` (
  `id` bigint(20) NOT NULL,
  `Date` datetime(6) NOT NULL,
  `Comments` varchar(100) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Course_id` bigint(20) NOT NULL,
  `Student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_feedback`
--

INSERT INTO `app_feedback` (`id`, `Date`, `Comments`, `Rating`, `Course_id`, `Student_id`) VALUES
(1, '2023-07-28 09:34:45.488550', 'possible', 5, 4, 1),
(2, '2023-07-28 09:38:25.725253', '534', 3, 4, 1),
(3, '2023-07-28 10:12:32.029886', 'liakak', 2, 4, 1),
(4, '2023-07-28 12:17:31.634402', 'puython', 0, 4, 1),
(5, '2023-07-28 17:43:19.848328', 'khan', 3, 4, 2),
(6, '2023-07-29 05:40:01.512350', 'khn', 5, 4, 2),
(7, '2023-07-29 06:08:59.175050', 'pakistan', 3, 4, 2),
(8, '2023-07-29 06:46:59.435583', 'pakistan zindabad', 4, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `app_feepaid`
--

CREATE TABLE `app_feepaid` (
  `id` bigint(20) NOT NULL,
  `Date` datetime(6) NOT NULL,
  `Amount` int(11) NOT NULL,
  `IBAN` int(11) NOT NULL,
  `Course_id` bigint(20) NOT NULL,
  `Student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_feepaid`
--

INSERT INTO `app_feepaid` (`id`, `Date`, `Amount`, `IBAN`, `Course_id`, `Student_id`) VALUES
(1, '2023-07-28 17:14:57.026080', 200, 123456789, 6, 2),
(2, '2023-07-29 06:48:03.976078', 150, 2147483647, 4, 2),
(3, '2023-07-29 07:07:26.546971', 200, 54646, 6, 2),
(4, '2023-07-29 07:36:32.824226', 150, 1787898, 4, 1),
(5, '2023-07-29 07:36:56.543591', 200, 2147483647, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_student`
--

CREATE TABLE `app_student` (
  `id` bigint(20) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Email` varchar(254) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_student`
--

INSERT INTO `app_student` (`id`, `Name`, `Email`, `Address`, `user_id`) VALUES
(1, 'ahmad', 'fawad@uso.com', 'kil kabal Swat', 2),
(2, 'Ali', 'ali@uso.com', 'Kabal', 3);

-- --------------------------------------------------------

--
-- Table structure for table `app_subsribe`
--

CREATE TABLE `app_subsribe` (
  `id` bigint(20) NOT NULL,
  `Date` date NOT NULL,
  `Course_id` bigint(20) NOT NULL,
  `Student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_subsribe`
--

INSERT INTO `app_subsribe` (`id`, `Date`, `Course_id`, `Student_id`) VALUES
(25, '2023-07-28', 4, 1),
(26, '2023-07-28', 5, 1),
(43, '2023-07-29', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `app_teacher`
--

CREATE TABLE `app_teacher` (
  `id` bigint(20) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Email` varchar(254) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_teacher`
--

INSERT INTO `app_teacher` (`id`, `Name`, `Email`, `Address`, `user_id`) VALUES
(1, 'Ali khan', 'admin@uso.com', 'kabal Swat', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add cource_ category', 6, 'add_cource_category'),
(22, 'Can change cource_ category', 6, 'change_cource_category'),
(23, 'Can delete cource_ category', 6, 'delete_cource_category'),
(24, 'Can view cource_ category', 6, 'view_cource_category'),
(25, 'Can add user', 7, 'add_customuser'),
(26, 'Can change user', 7, 'change_customuser'),
(27, 'Can delete user', 7, 'delete_customuser'),
(28, 'Can view user', 7, 'view_customuser'),
(29, 'Can add teacher', 8, 'add_teacher'),
(30, 'Can change teacher', 8, 'change_teacher'),
(31, 'Can delete teacher', 8, 'delete_teacher'),
(32, 'Can view teacher', 8, 'view_teacher'),
(33, 'Can add student', 9, 'add_student'),
(34, 'Can change student', 9, 'change_student'),
(35, 'Can delete student', 9, 'delete_student'),
(36, 'Can view student', 9, 'view_student'),
(37, 'Can add course_ detail', 10, 'add_course_detail'),
(38, 'Can change course_ detail', 10, 'change_course_detail'),
(39, 'Can delete course_ detail', 10, 'delete_course_detail'),
(40, 'Can view course_ detail', 10, 'view_course_detail'),
(41, 'Can add subsribe', 11, 'add_subsribe'),
(42, 'Can change subsribe', 11, 'change_subsribe'),
(43, 'Can delete subsribe', 11, 'delete_subsribe'),
(44, 'Can view subsribe', 11, 'view_subsribe'),
(45, 'Can add feedback', 12, 'add_feedback'),
(46, 'Can change feedback', 12, 'change_feedback'),
(47, 'Can delete feedback', 12, 'delete_feedback'),
(48, 'Can view feedback', 12, 'view_feedback'),
(49, 'Can add fee paid', 13, 'add_feepaid'),
(50, 'Can change fee paid', 13, 'change_feepaid'),
(51, 'Can delete fee paid', 13, 'delete_feepaid'),
(52, 'Can view fee paid', 13, 'view_feepaid');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(6, 'App', 'cource_category'),
(10, 'App', 'course_detail'),
(7, 'App', 'customuser'),
(12, 'App', 'feedback'),
(13, 'App', 'feepaid'),
(9, 'App', 'student'),
(11, 'App', 'subsribe'),
(8, 'App', 'teacher'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-27 08:30:32.982968'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-07-27 08:30:33.173017'),
(3, 'auth', '0001_initial', '2023-07-27 08:30:34.047202'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-07-27 08:30:34.309018'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-07-27 08:30:34.332027'),
(6, 'auth', '0004_alter_user_username_opts', '2023-07-27 08:30:34.348024'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-07-27 08:30:34.365029'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-07-27 08:30:34.374029'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-07-27 08:30:34.393043'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-07-27 08:30:34.412038'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-07-27 08:30:34.429043'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-07-27 08:30:34.630082'),
(13, 'auth', '0011_update_proxy_permissions', '2023-07-27 08:30:34.652088'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-07-27 08:30:34.669096'),
(15, 'App', '0001_initial', '2023-07-27 08:30:36.559454'),
(16, 'admin', '0001_initial', '2023-07-27 08:30:37.017494'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-07-27 08:30:37.057520'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-27 08:30:37.087512'),
(19, 'sessions', '0001_initial', '2023-07-27 08:30:37.212678'),
(20, 'App', '0002_course_detail_no_of_reviews_and_more', '2023-07-28 05:54:11.399185'),
(21, 'App', '0003_feedback', '2023-07-28 09:23:34.650822'),
(22, 'App', '0003_course_detail_date_alter_course_detail_published', '2023-07-28 16:42:28.735816'),
(23, 'App', '0004_feepaid', '2023-07-28 17:12:09.149049');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('18n11dmidhv0jaaqrosrhqpo3hwo2on3', '.eJxVjMEOwiAQRP-FsyHtdqHg0Xu_gSywSNVAUtqT8d9tkx70Npn3Zt7C0bZmtzVe3BzFVYC4_HaewpPLAeKDyr3KUMu6zF4eijxpk1ON_Lqd7t9Bppb39YCaAnFPpFEBjom1RYUpAVi2athz9L21ytvORA6DQewwqBQTmhFAfL7Yjjda:1qPLaW:Ug0hEjtGcPwe8HjS6I55OL0vxz8pcGZPp82QxgJFEng', '2023-08-11 11:24:52.743445'),
('9myrtqnl06c331pr4xfxw35mo1iop4nf', '.eJxVjDsOwjAQBe_iGln-4B8lPWew1vYuDiBbipMKcXcSKQW0b2bem0VYlxrXgXOcCrswyU6_W4L8xLaD8oB27zz3tsxT4rvCDzr4rRd8XQ_376DCqFt99pBCIaPAJuWK8NoKqVwyhMUG5wnBEgYjdAYnyZNUaVOdNkheGM8-X-wmOBY:1qP5AI:CdxAhkDHt2cYnviLF0kQkGfYspdC6PQjja-pjjmc0SA', '2023-08-10 17:52:42.405462'),
('d3ibbc9uyawxaafs2wr39mh6yyk5n03z', '.eJxVjEEOwiAQRe_C2hBgoKBL9z0DgRlGqoYmpV0Z765NutDtf-_9l4hpW2vcelniROIiQJx-t5zwUdoO6J7abZY4t3WZstwVedAux5nK83q4fwc19fqtDWMIYQDwbBmURYvFmUzkz84TI5DOwaAmBUVbE1wygMicPKvBEIv3B-mHOGU:1qPRUR:o3HDovW6ELRpGDnn13EHb0dNyiAPLhExaHLb86mh3CY', '2023-08-11 17:42:59.301592'),
('h7m27284y212ub7mgyci5sko214lowwk', '.eJxVjDsOwjAQBe_iGln-4B8lPWew1vYuDiBbipMKcXcSKQW0b2bem0VYlxrXgXOcCrswyU6_W4L8xLaD8oB27zz3tsxT4rvCDzr4rRd8XQ_376DCqFt99pBCIaPAJuWK8NoKqVwyhMUG5wnBEgYjdAYnyZNUaVOdNkheGM8-X-wmOBY:1qPKm3:8b7JaASrv_1g7tiVBKiKEps189Ay8sbecobmpjlEd-w', '2023-08-11 10:32:43.160090'),
('pjptl6ta2qjk24zmeamrhgvrfsasvjbs', '.eJxVjMEOwiAQRP-FsyHtdqHg0Xu_gSywSNVAUtqT8d9tkx70Npn3Zt7C0bZmtzVe3BzFVYC4_HaewpPLAeKDyr3KUMu6zF4eijxpk1ON_Lqd7t9Bppb39YCaAnFPpFEBjom1RYUpAVi2athz9L21ytvORA6DQewwqBQTmhFAfL7Yjjda:1qP01V:tPkMVu5Ow0h9vWYv0eR61D-bzt6YPOCdSypFS6QESUc', '2023-08-10 12:23:17.304669'),
('v93yaqcl4e2ek4e16fuhi2d0ft0jwwa9', '.eJxVjEEOwiAQRe_C2hBgoKBL9z0DgRlGqoYmpV0Z765NutDtf-_9l4hpW2vcelniROIiQJx-t5zwUdoO6J7abZY4t3WZstwVedAux5nK83q4fwc19fqtDWMIYQDwbBmURYvFmUzkz84TI5DOwaAmBUVbE1wygMicPKvBEIv3B-mHOGU:1qPeXH:u7mp2-hPTHOsiguD4fAzWwjHMYvmsKc6l3B-cEEYEIU', '2023-08-12 07:38:47.442866'),
('wklibufnee29ajx434n44sjf9sezhdw2', '.eJxVjDsOwjAQBe_iGln-4B8lPWew1vYuDiBbipMKcXcSKQW0b2bem0VYlxrXgXOcCrswyU6_W4L8xLaD8oB27zz3tsxT4rvCDzr4rRd8XQ_376DCqFt99pBCIaPAJuWK8NoKqVwyhMUG5wnBEgYjdAYnyZNUaVOdNkheGM8-X-wmOBY:1qPH2V:tWg_wtwT32f13WSlJBp1p0v3SPi2WXe80zwLpfdi2uI', '2023-08-11 06:33:27.310854');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_cource_category`
--
ALTER TABLE `app_cource_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_course_detail`
--
ALTER TABLE `app_course_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_course_detail_Course_Category_id_e8d83b1e_fk_App_courc` (`Course_Category_id`);

--
-- Indexes for table `app_customuser`
--
ALTER TABLE `app_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `app_customuser_groups`
--
ALTER TABLE `app_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `App_customuser_groups_customuser_id_group_id_df552c33_uniq` (`customuser_id`,`group_id`),
  ADD KEY `App_customuser_groups_group_id_866c84c5_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `app_customuser_user_permissions`
--
ALTER TABLE `app_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `App_customuser_user_perm_customuser_id_permission_dfcd5057_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `App_customuser_user__permission_id_454c1db8_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `app_feedback`
--
ALTER TABLE `app_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_feedback_Course_id_83092e51_fk_App_course_detail_id` (`Course_id`),
  ADD KEY `App_feedback_Student_id_56ff1a9d_fk_App_student_id` (`Student_id`);

--
-- Indexes for table `app_feepaid`
--
ALTER TABLE `app_feepaid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_feepaid_Course_id_751885bf_fk_App_course_detail_id` (`Course_id`),
  ADD KEY `App_feepaid_Student_id_5a2ea6b4_fk_App_student_id` (`Student_id`);

--
-- Indexes for table `app_student`
--
ALTER TABLE `app_student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `App_student_user_id_2d63d905_fk_App_customuser_id` (`user_id`);

--
-- Indexes for table `app_subsribe`
--
ALTER TABLE `app_subsribe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_subsribe_Course_id_4677a041_fk_App_course_detail_id` (`Course_id`),
  ADD KEY `App_subsribe_Student_id_a0608ad1_fk_App_student_id` (`Student_id`);

--
-- Indexes for table `app_teacher`
--
ALTER TABLE `app_teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `App_teacher_user_id_46910e67_fk_App_customuser_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_App_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_cource_category`
--
ALTER TABLE `app_cource_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `app_course_detail`
--
ALTER TABLE `app_course_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `app_customuser`
--
ALTER TABLE `app_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_customuser_groups`
--
ALTER TABLE `app_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_customuser_user_permissions`
--
ALTER TABLE `app_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_feedback`
--
ALTER TABLE `app_feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `app_feepaid`
--
ALTER TABLE `app_feepaid`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_student`
--
ALTER TABLE `app_student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_subsribe`
--
ALTER TABLE `app_subsribe`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `app_teacher`
--
ALTER TABLE `app_teacher`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_course_detail`
--
ALTER TABLE `app_course_detail`
  ADD CONSTRAINT `App_course_detail_Course_Category_id_e8d83b1e_fk_App_courc` FOREIGN KEY (`Course_Category_id`) REFERENCES `app_cource_category` (`id`);

--
-- Constraints for table `app_customuser_groups`
--
ALTER TABLE `app_customuser_groups`
  ADD CONSTRAINT `App_customuser_group_customuser_id_3d19b914_fk_App_custo` FOREIGN KEY (`customuser_id`) REFERENCES `app_customuser` (`id`),
  ADD CONSTRAINT `App_customuser_groups_group_id_866c84c5_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `app_customuser_user_permissions`
--
ALTER TABLE `app_customuser_user_permissions`
  ADD CONSTRAINT `App_customuser_user__customuser_id_a001c150_fk_App_custo` FOREIGN KEY (`customuser_id`) REFERENCES `app_customuser` (`id`),
  ADD CONSTRAINT `App_customuser_user__permission_id_454c1db8_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `app_feedback`
--
ALTER TABLE `app_feedback`
  ADD CONSTRAINT `App_feedback_Course_id_83092e51_fk_App_course_detail_id` FOREIGN KEY (`Course_id`) REFERENCES `app_course_detail` (`id`),
  ADD CONSTRAINT `App_feedback_Student_id_56ff1a9d_fk_App_student_id` FOREIGN KEY (`Student_id`) REFERENCES `app_student` (`id`);

--
-- Constraints for table `app_feepaid`
--
ALTER TABLE `app_feepaid`
  ADD CONSTRAINT `App_feepaid_Course_id_751885bf_fk_App_course_detail_id` FOREIGN KEY (`Course_id`) REFERENCES `app_course_detail` (`id`),
  ADD CONSTRAINT `App_feepaid_Student_id_5a2ea6b4_fk_App_student_id` FOREIGN KEY (`Student_id`) REFERENCES `app_student` (`id`);

--
-- Constraints for table `app_student`
--
ALTER TABLE `app_student`
  ADD CONSTRAINT `App_student_user_id_2d63d905_fk_App_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_customuser` (`id`);

--
-- Constraints for table `app_subsribe`
--
ALTER TABLE `app_subsribe`
  ADD CONSTRAINT `App_subsribe_Course_id_4677a041_fk_App_course_detail_id` FOREIGN KEY (`Course_id`) REFERENCES `app_course_detail` (`id`),
  ADD CONSTRAINT `App_subsribe_Student_id_a0608ad1_fk_App_student_id` FOREIGN KEY (`Student_id`) REFERENCES `app_student` (`id`);

--
-- Constraints for table `app_teacher`
--
ALTER TABLE `app_teacher`
  ADD CONSTRAINT `App_teacher_user_id_46910e67_fk_App_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_customuser` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_App_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
