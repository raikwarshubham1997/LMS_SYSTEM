-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2022 at 02:40 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lead_systems`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add city', 7, 'add_city'),
(26, 'Can change city', 7, 'change_city'),
(27, 'Can delete city', 7, 'delete_city'),
(28, 'Can view city', 7, 'view_city'),
(29, 'Can add county', 8, 'add_county'),
(30, 'Can change county', 8, 'change_county'),
(31, 'Can delete county', 8, 'delete_county'),
(32, 'Can view county', 8, 'view_county'),
(33, 'Can add state', 9, 'add_state'),
(34, 'Can change state', 9, 'change_state'),
(35, 'Can delete state', 9, 'delete_state'),
(36, 'Can view state', 9, 'view_state'),
(37, 'Can add company_ detail', 10, 'add_company_detail'),
(38, 'Can change company_ detail', 10, 'change_company_detail'),
(39, 'Can delete company_ detail', 10, 'delete_company_detail'),
(40, 'Can view company_ detail', 10, 'view_company_detail'),
(41, 'Can add country', 8, 'add_country'),
(42, 'Can change country', 8, 'change_country'),
(43, 'Can delete country', 8, 'delete_country'),
(44, 'Can view country', 8, 'view_country'),
(45, 'Can add lead create', 11, 'add_leadcreate'),
(46, 'Can change lead create', 11, 'change_leadcreate'),
(47, 'Can delete lead create', 11, 'delete_leadcreate'),
(48, 'Can view lead create', 11, 'view_leadcreate'),
(49, 'Can add call logs', 12, 'add_calllogs'),
(50, 'Can change call logs', 12, 'change_calllogs'),
(51, 'Can delete call logs', 12, 'delete_calllogs'),
(52, 'Can view call logs', 12, 'view_calllogs');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
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
  `is_manager` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `is_manager`) VALUES
(1, 'pbkdf2_sha256$390000$wrMFpd9Bzqxh1k5ncupYVK$xKG3to9tu2gjiWmw7ezmJVpmEjdF++DQk8djgYq8eek=', '2022-11-22 04:57:02.473693', 1, 'mr@shubham123', 'shubham', 'Raikwar', 'raikwarshubham288@gmail.com', 0, 1, '2022-11-17 14:25:16.329387', 0),
(2, 'pbkdf2_sha256$390000$sZw8i2Za4MsmCMvzYUSVpD$fQb6RpVEEMMWpd13Z4me48kl0PK4iX7CtHx3+F2Px80=', '2022-11-17 10:27:39.266175', 0, 'rolf@123', 'Rolf', 'Smith', 'techpanda.sr@gmail.com', 1, 1, '2022-11-17 14:27:26.275662', 0),
(3, 'pbkdf2_sha256$390000$O9GllnMpgjpf0cdjOJI5kW$2VwdkJmX5W+DnRFh7RcqXMkj6G+TCyiHExjUU+dcnzU=', NULL, 0, 'rohit@321', 'Rohit', 'Lowansi', 'rohit@gmail.com', 1, 1, '2022-11-17 14:28:27.634001', 0),
(4, 'pbkdf2_sha256$390000$nURV91RlrjQbUvipw9motR$DvnuLS0/KRaWdojhC9jPgGyqPsCjakaBLr4/oA7j5jw=', '2022-11-21 08:00:03.433204', 0, 'Deepak@123', 'Deepak', 'Lowansi', 'techpanda@gmail.com', 0, 1, '2022-11-17 15:21:33.543657', 1),
(5, 'pbkdf2_sha256$390000$yeg710iHy9OcoOidJMOujb$lWR1qAeDN3pM/GXQftxl1Z0tyLyL8upJZIFVM3+wbBM=', NULL, 0, 'jerry@321', 'Jerry', 'jobs', 'mrglowroad@gmail.com', 0, 1, '2022-11-21 13:16:35.828208', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `companyadmin_calllogs`
--

CREATE TABLE `companyadmin_calllogs` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `remark` varchar(250) NOT NULL,
  `start_datetime` varchar(50) NOT NULL,
  `end_datetime` datetime NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `lead_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `companyadmin_city`
--

CREATE TABLE `companyadmin_city` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companyadmin_city`
--

INSERT INTO `companyadmin_city` (`id`, `name`) VALUES
(1, 'Bhopal'),
(2, 'Indore'),
(3, 'JabalPur'),
(4, 'Nasik'),
(5, 'Pune'),
(6, 'Mumbai'),
(7, 'Ahemadnagar'),
(8, 'Raipur'),
(9, 'Bhind'),
(10, 'Jalandhar'),
(11, 'Amritsar'),
(12, 'Bhatinda'),
(13, 'Shri Nagar');

-- --------------------------------------------------------

--
-- Table structure for table `companyadmin_company_detail`
--

CREATE TABLE `companyadmin_company_detail` (
  `id` bigint(20) NOT NULL,
  `owner` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `address` longtext NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companyadmin_company_detail`
--

INSERT INTO `companyadmin_company_detail` (`id`, `owner`, `company_name`, `address`, `email`, `phone_no`, `city_id`, `country_id`, `state_id`) VALUES
(1, 'Admin', 'techpanda', 'Savitri Empier, Indore Madhya Pradesh', 'techpanda.sr@gmail.com', '35465476454', 1, 1, 1),
(2, 'iiiii', 'iyyuiy', '533 Oak Street San Francisco, California, 94102 United States', 'rohit@gmail.com', '43243433443', 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `companyadmin_country`
--

CREATE TABLE `companyadmin_country` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companyadmin_country`
--

INSERT INTO `companyadmin_country` (`id`, `name`) VALUES
(1, 'Afghanistan'),
(2, 'Brazil'),
(3, 'China'),
(4, 'Australia'),
(5, 'Denmark'),
(6, 'Germany'),
(7, 'India'),
(8, 'Bangladesh'),
(9, 'Shrilanka'),
(10, 'Malaysia');

-- --------------------------------------------------------

--
-- Table structure for table `companyadmin_leadcreate`
--

CREATE TABLE `companyadmin_leadcreate` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `middle_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(150) NOT NULL,
  `intrested` varchar(150) NOT NULL,
  `lead_sources` varchar(150) NOT NULL,
  `remarks` longtext NOT NULL,
  `assigned_id` int(11) NOT NULL,
  `status` varchar(150) NOT NULL,
  `date_create` date NOT NULL,
  `contact` varchar(12) NOT NULL,
  `address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companyadmin_leadcreate`
--

INSERT INTO `companyadmin_leadcreate` (`id`, `first_name`, `middle_name`, `last_name`, `gender`, `birthday`, `email`, `intrested`, `lead_sources`, `remarks`, `assigned_id`, `status`, `date_create`, `contact`, `address`) VALUES
(3, 'shubham', 'kumar', 'Smith', 'male', '2002-03-22', 'rohit@gmail.com', 'Python', 'Facebook Ad', 'Google', 3, 'Not a Target', '2022-11-22', '998878878', 'ChattishGarh'),
(4, 'demo', 'kumar', 'Lowansi', 'male', '2000-06-22', 'aditya@gmail.com', 'Python', 'Facebook Ad', 'Facebook Ads only', 5, 'Open', '2022-11-22', '9098976653', 'Punjab'),
(5, 'Sakshi', 'singh', 'Gour', 'female', '2002-07-18', 'sakshi@gmail.com', 'Android', 'Other Sources', 'Amazon', 5, 'Not a Target', '2022-11-22', '6260557690', 'Ujjain'),
(6, 'Deepak', 'wqw', 'verma', 'male', '1999-12-04', 'deepak32@gmail.com', 'Php', 'Company Website', 'Facebook Ads only', 5, 'Disqualified', '2022-11-22', '7345628723', 'Bhopal');

-- --------------------------------------------------------

--
-- Table structure for table `companyadmin_state`
--

CREATE TABLE `companyadmin_state` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companyadmin_state`
--

INSERT INTO `companyadmin_state` (`id`, `name`) VALUES
(1, 'Madhya Pradesh'),
(2, 'Chattishgarh'),
(3, 'PunJab'),
(4, 'Jammu & Kasmir'),
(5, 'Himachal Pradesh'),
(6, 'Maharastra');

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
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'companyAdmin', 'calllogs'),
(7, 'companyAdmin', 'city'),
(10, 'companyAdmin', 'company_detail'),
(8, 'companyAdmin', 'country'),
(11, 'companyAdmin', 'leadcreate'),
(9, 'companyAdmin', 'state'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-11-17 08:49:34.504738'),
(2, 'auth', '0001_initial', '2022-11-17 08:49:46.529682'),
(3, 'admin', '0001_initial', '2022-11-17 08:49:49.552251'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-11-17 08:49:49.609048'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-17 08:49:49.763965'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-11-17 08:49:51.629566'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-11-17 08:49:54.109782'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-11-17 08:49:54.807497'),
(9, 'auth', '0004_alter_user_username_opts', '2022-11-17 08:49:55.046218'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-11-17 08:49:57.642048'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-11-17 08:49:57.745524'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-11-17 08:49:57.831962'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-11-17 08:49:58.149346'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-11-17 08:49:58.920170'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-11-17 08:49:59.564942'),
(16, 'auth', '0011_update_proxy_permissions', '2022-11-17 08:49:59.687075'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-11-17 08:50:00.293355'),
(18, 'auth', '0013_user_is_manager', '2022-11-17 08:50:00.631502'),
(19, 'sessions', '0001_initial', '2022-11-17 08:50:02.032765'),
(20, 'companyAdmin', '0001_initial', '2022-11-18 12:26:33.076649'),
(21, 'companyAdmin', '0002_alter_company_detail_city_id', '2022-11-18 12:26:35.267893'),
(22, 'companyAdmin', '0003_remove_company_detail_city_id_company_detail_city', '2022-11-18 12:26:37.645886'),
(23, 'companyAdmin', '0004_remove_city_con_id_remove_city_st_id', '2022-11-18 12:40:48.352989'),
(24, 'companyAdmin', '0005_company_detail_country_company_detail_state', '2022-11-18 12:52:06.022452'),
(25, 'companyAdmin', '0006_rename_county_country', '2022-11-18 12:58:17.061130'),
(26, 'companyAdmin', '0007_leadcreate', '2022-11-21 12:26:36.225855'),
(27, 'companyAdmin', '0008_alter_leadcreate_status', '2022-11-21 12:57:24.166777'),
(28, 'companyAdmin', '0009_alter_leadcreate_assigned', '2022-11-21 13:02:20.659884'),
(29, 'companyAdmin', '0010_alter_leadcreate_date_create', '2022-11-22 05:13:22.004063'),
(30, 'companyAdmin', '0011_leadcreate_contact', '2022-11-22 07:16:07.013079'),
(31, 'companyAdmin', '0012_leadcreate_address', '2022-11-22 07:46:05.587163'),
(32, 'companyAdmin', '0013_calllogs', '2022-11-22 11:01:25.042827'),
(33, 'companyAdmin', '0014_calllogs_end_datetime_calllogs_start_datetime', '2022-11-22 12:47:13.134924'),
(34, 'companyAdmin', '0015_rename_log_typ_calllogs_logs', '2022-11-22 13:08:39.038111'),
(35, 'companyAdmin', '0016_rename_logs_calllogs_name', '2022-11-22 13:14:09.589872'),
(36, 'companyAdmin', '0017_calllogs_created_by', '2022-11-22 13:26:53.988431'),
(37, 'companyAdmin', '0018_calllogs_lead_id', '2022-11-22 13:29:09.434598');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9bhoozk5xlm0cnisg57hv1rg7j6f7x9a', '.eJxVjDsOwjAQRO_iGlmOvfE6lPQ5g7X2bnAAOVI-FeLuJFIK0HTz3sxbRdrWErdF5jiyuipQl98uUX5KPQA_qN4nnae6zmPSh6JPuuh-YnndTvfvoNBS9nVGbNCaBAaAGJ1zgUkS5iCAzrDrLFJrrffSQnCdb7EZOMgAe7IY9fkCwuU3VA:1ovcER:oztcOTnKVYn0Df2wrduAznihUbxHHHNjpVQsvbXy0tM', '2022-12-01 10:34:55.366087'),
('eq6oyc89j3hec6xapu3e81cijbuc3bfu', '.eJxVjDsOwjAQRO_iGlmOvfE6lPQ5g7X2bnAAOVI-FeLuJFIK0HTz3sxbRdrWErdF5jiyuipQl98uUX5KPQA_qN4nnae6zmPSh6JPuuh-YnndTvfvoNBS9nVGbNCaBAaAGJ1zgUkS5iCAzrDrLFJrrffSQnCdb7EZOMgAe7IY9fkCwuU3VA:1ovtKy:F-grbGESl2xFBx2oYzda2roXdHwZuusa01TLc56uxiE', '2022-12-02 04:50:48.807214'),
('li1omlcqmniksw0rl8pqttg5o5kxu3v0', '.eJxVzMEOwiAQBNB_4WwIS4MuHr37DWSXBakampT21Pjv0qQHvc68mU0FWpcS1pbmMIq6KlCn34wpvlLdC3lSfUw6TnWZR9Y70Ufb9H2S9L4d9u-gUCt97UX84DGBx-EMJNkhsUvRZzKAaFnkwmwEOjIZDWckcN7mDhnAqs8X8LU4FA:1oxLLC:EL1evuetxhKPgLD6Q8LswjENUM2t8kwIRrbsyGNtV8Q', '2022-12-06 04:57:02.682933');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `companyadmin_calllogs`
--
ALTER TABLE `companyadmin_calllogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyAdmin_calllogs_created_by_id_7e9331ab_fk_auth_user_id` (`created_by_id`),
  ADD KEY `companyAdmin_calllog_lead_id_id_25aba44d_fk_companyAd` (`lead_id_id`);

--
-- Indexes for table `companyadmin_city`
--
ALTER TABLE `companyadmin_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companyadmin_company_detail`
--
ALTER TABLE `companyadmin_company_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyAdmin_company_city_id_a1b31d52_fk_companyAd` (`city_id`),
  ADD KEY `companyAdmin_company_state_id_d16bf248_fk_companyAd` (`state_id`),
  ADD KEY `companyAdmin_company_country_id_49383731_fk_companyAd` (`country_id`);

--
-- Indexes for table `companyadmin_country`
--
ALTER TABLE `companyadmin_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companyadmin_leadcreate`
--
ALTER TABLE `companyadmin_leadcreate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyAdmin_leadcreate_assigned_id_16c04a7f` (`assigned_id`);

--
-- Indexes for table `companyadmin_state`
--
ALTER TABLE `companyadmin_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companyadmin_calllogs`
--
ALTER TABLE `companyadmin_calllogs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companyadmin_city`
--
ALTER TABLE `companyadmin_city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `companyadmin_company_detail`
--
ALTER TABLE `companyadmin_company_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `companyadmin_country`
--
ALTER TABLE `companyadmin_country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `companyadmin_leadcreate`
--
ALTER TABLE `companyadmin_leadcreate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `companyadmin_state`
--
ALTER TABLE `companyadmin_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `companyadmin_calllogs`
--
ALTER TABLE `companyadmin_calllogs`
  ADD CONSTRAINT `companyAdmin_calllog_lead_id_id_25aba44d_fk_companyAd` FOREIGN KEY (`lead_id_id`) REFERENCES `companyadmin_leadcreate` (`id`),
  ADD CONSTRAINT `companyAdmin_calllogs_created_by_id_7e9331ab_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `companyadmin_company_detail`
--
ALTER TABLE `companyadmin_company_detail`
  ADD CONSTRAINT `companyAdmin_company_city_id_a1b31d52_fk_companyAd` FOREIGN KEY (`city_id`) REFERENCES `companyadmin_city` (`id`),
  ADD CONSTRAINT `companyAdmin_company_country_id_49383731_fk_companyAd` FOREIGN KEY (`country_id`) REFERENCES `companyadmin_country` (`id`),
  ADD CONSTRAINT `companyAdmin_company_state_id_d16bf248_fk_companyAd` FOREIGN KEY (`state_id`) REFERENCES `companyadmin_state` (`id`);

--
-- Constraints for table `companyadmin_leadcreate`
--
ALTER TABLE `companyadmin_leadcreate`
  ADD CONSTRAINT `companyAdmin_leadcreate_assigned_id_16c04a7f_fk_auth_user_id` FOREIGN KEY (`assigned_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
