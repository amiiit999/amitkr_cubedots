-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2021 at 11:41 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cubedotsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `created_at`, `updated_at`) VALUES
(1, 'software', '2021-01-15 13:52:10', '2021-01-15 13:52:10'),
(2, 'web developer', '2021-01-15 13:54:52', '2021-01-15 13:54:52'),
(3, 'PHP Developer', '2021-01-15 13:55:06', '2021-01-15 13:55:06'),
(4, 'Python Developer', '2021-01-15 20:23:50', '2021-01-15 20:23:50'),
(5, 'Android Developer', '2021-01-15 20:25:20', '2021-01-15 20:25:20'),
(6, 'Java Developer', '2021-01-16 00:50:33', '2021-01-16 00:50:33'),
(7, 'HR', '2021-01-16 00:51:06', '2021-01-16 00:51:06'),
(8, 'Business Analyst', '2021-01-16 00:51:39', '2021-01-16 00:51:39');

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
(4, '2021_01_15_183756_create_posts_table', 1),
(5, '2021_01_15_183905_create_profiles_table', 1),
(6, '2021_01_15_183917_create_categories_table', 1);

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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `post_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_title`, `description`, `category_id`, `post_image`, `created_at`, `updated_at`) VALUES
(1, 2, 'Java Developer', 'Hello ,\r\n\r\nGreetings from Anonymous Company.\r\n\r\nWe are Hiring JAVA Developers for our Prestigious client Anonymous Company.. \r\nWe are building up their team and looking for candidates, who are Hands-On with Product development.\r\n\r\nPlease send your resume to discuss further details.\r\n\r\nAbout Company -\r\n \r\nAnonymous Company is a leading provider Software products like Learning Management Systems(LMS), GoPerform(Machine learning based Search Engine), Doctor Elearning and E learning Content. \r\nOur customers include INTEL Japan, Honda Cars, GE Money, SBI Cards, NIIT, Landmark Group, ITC, JCB, Aviva, Maxnewyork Life, ICICI Pru , MPC Dubai, Royal Bank of Scotland , WNS, Metlife, Thomson Reuters, Cognizant , Patni , Unitedlex , Deutsche Postbank , Dominos, Optima , EXL Services, Unitedlex and many other organisations. \r\n\r\nOur Product in learning space like LMS has served more than .5 Mn users worldwide for secure distribution of training videos , simulations and assessments. It comes with advanced tracking and training management features. GoPerform application is used by banks and credit card companies to provide query answering systems.', 6, 'http://localhost/Practice/new/cubedots/laravel/public/posted_images/Java-Developer.png', '2021-01-15 17:40:49', '2021-01-16 02:22:23'),
(3, 1, 'Android Developer', 'Dear AMIT KUMAR,\r\n\r\nGreetings from Anonymous Company !!\r\nHiring for the role of Android Developer for Indore (MP) location. Feel free to reach me at anonymous@gmail.com or Call/WhatsApp me for any Job-related assistance.\r\n\r\nJob Description:\r\n- 2+ years of experience with Android and Laravel Framework.\r\n- Should be well versed with PHP, Laravel, Javascript, Ajax, and Node.js.\r\n- Good knowledge and understanding of the type of content the website are planning to host.\r\n- Develop content based on client requirements.\r\n- Build efficient, testable, and reusable PHP modules.\r\n- Solve complex performance problems and architectural challenges.\r\n- Troubleshoot, test, and maintain the core product software and databases to ensure strong optimization and functionality.\r\n- Contribute to all phases of the development lifecycle.\r\n- Good understanding of Controllers, Model, Middleware, Contracts or Facades, Service provider, Eloquent, Laravel Validations, Routes for web or API, Blade with at least one control statement, Migrations.\r\n- Should possess good communication skills.\r\n- Familiarity with other Framework is a Plus.\r\n- Salary: Max 6LPA (Depending on your exp and interview)', 4, 'http://localhost/Practice/new/cubedots/laravel/public/posted_images/adroid.jpg', '2021-01-15 20:27:53', '2021-01-15 20:27:53'),
(4, 1, 'Java Developer', 'We\'re #hiring for a Junior Java Developer for Jaipur location.\r\nNote - Candidates from other location will not preferred only local(Jaipur) candidates can apply.\r\nExperience - 0.6 months\r\nSalary - 10k to 15k\r\nExcellent communication skills.\r\nQualification - BCA , MCA , B.tech CS (graduation should be completed.)\r\nCandidates who are pursuing bachelor will not consider.\r\nlocation - Jaipur\r\nPreferred only local candidates.\r\nImmediate Joining.', 6, 'http://localhost/Practice/new/cubedots/laravel/public/posted_images/java.jpg', '2021-01-16 02:30:17', '2021-01-16 02:30:17'),
(5, 1, 'Java Developer', 'We\'re #hiring for a Junior Java Developer for Jaipur location.\r\nNote - Candidates from other location will not preferred only local(Jaipur) candidates can apply.\r\nExperience - 0.6 months\r\nSalary - 10k to 15k\r\nExcellent communication skills.\r\nQualification - BCA , MCA , B.tech CS (graduation should be completed.)\r\nCandidates who are pursuing bachelor will not consider.\r\nlocation - Jaipur\r\nPreferred only local candidates.\r\nImmediate Joining.', 6, 'http://localhost/Practice/new/cubedots/laravel/public/posted_images/java.jpg', '2021-01-16 02:30:19', '2021-01-16 02:30:19'),
(6, 1, 'Java Developer', 'We\'re #hiring for a Junior Java Developer for Jaipur location.\r\nNote - Candidates from other location will not preferred only local(Jaipur) candidates can apply.\r\nExperience - 0.6 months\r\nSalary - 10k to 15k\r\nExcellent communication skills.\r\nQualification - BCA , MCA , B.tech CS (graduation should be completed.)\r\nCandidates who are pursuing bachelor will not consider.\r\nlocation - Jaipur\r\nPreferred only local candidates.\r\nImmediate Joining.', 6, 'http://localhost/Practice/new/cubedots/laravel/public/posted_images/java.jpg', '2021-01-16 02:30:19', '2021-01-16 02:30:19'),
(7, 1, 'HR', 'Job Description Roles and Responsibilities Hi, we are looking for HR Recruiter / Hr generalist - Freshers only Freshers preferred. 6 days working, 9.30am to 6.30pm. Sal - best in the industry. Please apply for the job in naukri.com, we will check & update you. HR Generalist Activities hr recruiter screening fresher Human Resource Management recruiter training mba internship', 7, 'http://localhost/Practice/new/cubedots/laravel/public/posted_images/hr.jpg', '2021-01-16 02:36:33', '2021-01-16 02:37:04'),
(8, 1, 'PHP Developer', 'We are #hiring #php Developer for Noida Location.\r\nSalary- 20k -40k\r\nExperience- 2-5 Years\r\nLocation- Noida Sector - 16\r\nFollowing Technical Skills & Knowledge Required:\r\n· PHP/ Wordpress/Laravel/HTML5/JavaScript/CSS &JQUERY\r\n· Designing& Development Web Application on Wordpress/PHP/Laravel.\r\n· Customize the website as per our clients and our requirements.\r\n·Use Clean Code Techniques to create new functions on the website.\r\n· Integration of user-facing elements developed by front-end developers.\r\n· Build efficient, testable, and reusable PHP modules.\r\n· Solve complex performance problems and architectural challenges\r\n· User authentication and authorization between multiple systems, servers, and environments\r\n· Integration & Manage multiple data sources and databases into one system.\r\n· Familiarity with the limitations of PHP as a platform and its workarounds.\r\n·Familiarity with SQL/No-SQL databases and their declarative query languages.\r\n· Proficiency in #PHP, #jQuery, #Javascript, #CSS, #Laravel , #HTML & #MySQL', 3, 'http://localhost/Practice/new/cubedots/laravel/public/posted_images/Why-Choose.jpg', '2021-01-16 03:08:55', '2021-01-16 03:08:55'),
(9, 1, 'PHP Developer', 'PHP Developer - Somajiguda - Day Shift- Competitive Salary & BenefitsThere are jobs-and then there are careers. The chance to do the kind of work that improves other people s working week. The opportunity to challenge yourself and learn new skills. The opportunity to be surrounded by smart, ambitious, motivated people, day-in and day-out. Thats the kind of work you can expect at Hoopers Group. Come join us.The RoleAs a PHP Developer you will be joining a talented team and will work closely with senior developers in order to understand our clients processes and requirements.You will be responsible for maintaining and creating software solutions that support a variety of business processes using a combination of modern and legacy software in both browser and desktop environments.Nice to have skills & experience (desirable and not all essential) Proficiency in PHP Understanding of HTML/JavaScript/CSS Work across a range of front-end solutions Understanding of database functionality Able to work on developing solutions using APIs Working knowledge of Git Experience in working within a team with strong people skills Interested in pursuing knowledge in the latest developments in technology CodeIgniter and WordPress plugin development would be desirable and not essentialIf you are interested in this position, please apply directly with your up to date CV and we will reach out to you with more information.', 3, 'http://localhost/Practice/new/cubedots/laravel/public/posted_images/php-developer.jpg', '2021-01-16 04:28:16', '2021-01-16 04:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `name`, `designation`, `profile_pic`, `created_at`, `updated_at`) VALUES
(1, 1, 'super admin', 'admin', 'http://localhost/Practice/new/cubedots/laravel/public/uploads/admin.JPG', '2021-01-15 15:22:25', '2021-01-15 15:22:25'),
(2, 1, 'editor', 'editor', 'http://localhost/Practice/new/cubedots/laravel/public/uploads/Editor.JPG', '2021-01-15 15:30:15', '2021-01-15 15:30:15'),
(3, 2, 'Amar Sinha', 'editor', 'http://localhost/Practice/new/cubedots/laravel/public/uploads/Editorr.JPG', '2021-01-15 16:41:21', '2021-01-16 02:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'superadmin@admin.com', NULL, '$2y$10$xQS4o/0fY.rBIGJymVCSHO4ZR.B4wW3CFfee9sq4uy7X79CyuVoUW', NULL, '2021-01-15 14:07:09', '2021-01-15 14:07:09'),
(2, 'editor', 'editor@editor.com', NULL, '$2y$10$eEQqlTpbAtQswerkArvPbOsm0GBgvUUb1RPEo6kIGJDp.0jqpTYlq', NULL, '2021-01-15 16:38:58', '2021-01-15 16:38:58'),
(3, 'reader', 'amiiitshah@gmail.com', NULL, '$2y$10$NFOeAU9ZB0f4ghiRZlOjuebDwlLZHVkkzRpT/YAh1LV93SsJOJIp2', NULL, '2021-01-15 18:37:49', '2021-01-15 18:37:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
