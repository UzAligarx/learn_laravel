-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2024 at 04:45 PM
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
-- Database: `my_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Web Design'),
(2, 'Online Marketing'),
(3, 'Web development'),
(4, 'Android Development'),
(5, 'IOS Development');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`) VALUES
(1, 1, 10, 'Salom bu post juda ajoyib'),
(2, 1, 1, 'Salom bu post juda ajoyib'),
(3, 1, 2, 'Salomat nima gap'),
(4, 5, 1, 'Salom bu ajoyib post'),
(5, 10, 1, 'Salom bu juda ajoyib post ekan juda foydali'),
(6, 3, 1, 'Zuxal vapshe qattiq'),
(7, 1, 1, 'Bu post juda ajoyib'),
(8, 10, 2, 'Ooo bu post qanday ajoyib'),
(9, 10, 10, 'Salom bu post juda foydali ekan'),
(10, 10, 16, 'Bu postga sharx yarating'),
(11, 10, 4, 'Bu post juda ajoyib'),
(12, 2, 16, 'Bu post juda yoqdi'),
(13, 1, 1, 'Salom nima gaplar'),
(14, 10, 5, 'Salom bu post juda ajoyib'),
(15, 2, 3, 'Ajoyib post ekan\r\nmenga juda yoqdi'),
(16, 10, 8, 'Salom taxshimisiz'),
(17, 10, 29, 'Ajoyib content bo\'libdi');

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_10_01_134402_create_categories_table', 1),
(6, '2024_10_02_134405_create_posts_table', 1),
(7, '2024_10_04_134410_create_comments_table', 1),
(8, '2024_10_04_134431_create_tags_table', 1),
(9, '2024_10_04_134442_create_post_tag_table', 1),
(10, '2024_10_16_144635_create_notifications_table', 2);

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
('015a3b21-2dde-4f3c-9743-13aa98ced545', 'App\\Notifications\\PostCreated', 'App\\Models\\User', 10, '{\"id\":20,\"title\":\"Senior Implementation Engineer\",\"created_at\":\"2024-10-16T15:25:06.000000Z\"}', NULL, '2024-10-16 12:25:06', '2024-10-16 15:19:52'),
('16556895-b6fc-4ce8-b32c-68d6e247b76d', 'App\\Notifications\\PostUpdated', 'App\\Models\\User', 1, '{\"id\":2,\"title\":\"Chief Functionality Representative\",\"content\":\"Architecto ex nostrum saepe quas.\",\"short_content\":\"Voluptatum nam ut adipisci reprehenderit occaecati recusandae numquam.\",\"updated_at\":\"17\\/10\\/24 18:10:51\"}', NULL, '2024-10-17 15:30:51', '2024-10-17 15:30:51'),
('1d4b6e08-a246-44dd-878a-4401fe8e3814', 'App\\Notifications\\PostUpdated', 'App\\Models\\User', 10, '{\"id\":20,\"title\":\"Human Mobility Manager\",\"content\":\"Quidem soluta veritatis commodi praesentium facilis incidunt aut explicabo provident.\",\"short_content\":\"Accusantium necessitatibus nihil.\",\"updated_at\":\"16\\/10\\/24 18:10:51\"}', NULL, '2024-10-16 15:57:51', '2024-10-16 15:57:51'),
('67222d54-0b14-43fa-870c-29920c41edbb', 'App\\Notifications\\PostCreated', 'App\\Models\\User', 1, '{\"id\":21,\"title\":\"International Data Planner\",\"created_at\":\"2024-10-16T15:53:43.000000Z\"}', NULL, '2024-10-16 12:53:44', '2024-10-16 12:53:44'),
('7f7e32ef-2762-4feb-bacf-26f74119971f', 'App\\Notifications\\PostUpdated', 'App\\Models\\User', 2, '{\"id\":25,\"title\":\"Tatu talabasi\",\"content\":\"Minus quia labore totam doloremque alias maxime recusandae.\",\"short_content\":\"Fuga molestias dolore nesciunt consectetur vitae quia.\",\"updated_at\":\"16\\/10\\/24 19:10:17\"}', '2024-10-16 16:09:02', '2024-10-16 16:06:17', '2024-10-16 16:09:02'),
('b31c8ea6-3d07-459c-91b9-0425a798a116', 'App\\Notifications\\PostCreated', 'App\\Models\\User', 2, '{\"id\":26,\"title\":\"Principal Paradigm Developer\",\"created_at\":\"2024-10-16T19:14:35.000000Z\"}', NULL, '2024-10-16 16:14:35', '2024-10-16 16:14:35'),
('b7e5df8d-338d-4833-9b93-2b4e621d7713', 'App\\Notifications\\PostCreated', 'App\\Models\\User', 2, '{\"id\":24,\"title\":\"National Brand Strategist\",\"created_at\":\"2024-10-16T19:05:04.000000Z\"}', '2024-10-16 16:14:19', '2024-10-16 16:05:04', '2024-10-16 16:14:19'),
('d343d1b5-7676-4ef1-b6da-4f706c9026cd', 'App\\Notifications\\PostCreated', 'App\\Models\\User', 2, '{\"id\":25,\"title\":\"Direct Solutions Officer\",\"created_at\":\"2024-10-16T19:05:32.000000Z\"}', '2024-10-16 16:11:22', '2024-10-16 16:05:32', '2024-10-16 16:11:22'),
('e88655b8-f81d-42d2-b909-640135271e75', 'App\\Notifications\\PostUpdated', 'App\\Models\\User', 10, '{\"id\":20,\"title\":\"Principal Program Producer\",\"content\":\"Suscipit est qui velit.\",\"short_content\":\"Cum maxime et iusto autem iusto.\",\"updated_at\":\"16\\/10\\/24 17:10:31\"}', '2024-10-16 16:03:24', '2024-10-16 14:33:31', '2024-10-16 16:03:24'),
('f81ed070-aed6-49d5-8751-0354aa5be9d8', 'App\\Notifications\\PostCreated', 'App\\Models\\User', 10, '{\"id\":22,\"title\":\"Central Paradigm Supervisor\",\"created_at\":\"2024-10-16T18:21:40.000000Z\"}', '2024-10-17 12:37:32', '2024-10-16 15:21:40', '2024-10-17 12:37:32'),
('f94301cd-f987-4dcb-99b6-1e2e9e221979', 'App\\Notifications\\PostUpdated', 'App\\Models\\User', 10, '{\"id\":22,\"title\":\"Future Infrastructure Facilitator\",\"content\":\"Maiores consequuntur delectus dolorem.\",\"short_content\":\"Odit nam rem accusamus necessitatibus eveniet architecto.\",\"updated_at\":\"16\\/10\\/24 19:10:12\"}', NULL, '2024-10-16 16:00:12', '2024-10-16 16:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('rene01@example.org', '$2y$10$otlYmb231ne85e4WSiufnOZRmkOUJaVg1NzcZw/6dqpVsjDEg/NZO', '2024-10-12 14:00:53');

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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_content` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `short_content`, `content`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Delectus atque animi.', 'Ab magni odit nam aliquam ut et voluptas eveniet voluptatum vel voluptatum quo et.', 'Quia eos maiores ad sapiente. Perspiciatis odio porro dolores ratione assumenda dolorum et. Provident eligendi praesentium et omnis enim quaerat ea. Sit officiis tenetur nesciunt sit consectetur sunt sed natus. Ratione laborum et velit consequatur rerum.', NULL, '2024-10-11 06:30:42', '2024-10-11 08:12:13'),
(2, 1, 1, 'Chief Functionality Representative', 'Voluptatum nam ut adipisci reprehenderit occaecati recusandae numquam.', 'Architecto ex nostrum saepe quas.', NULL, '2024-10-11 06:30:42', '2024-10-17 15:30:51'),
(3, 2, 1, 'Et recusandae rem.', 'Animi omnis aut et aut sequi rem occaecati.', 'Qui neque fuga voluptas aut et fugiat. Asperiores perferendis voluptatem corrupti perspiciatis sit iste eum dolore. Officia numquam voluptatem voluptate facere ea delectus consequatur eos.', NULL, '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(4, 2, 3, 'Odio ea aut eum.', 'Nihil sint ullam incidunt nam incidunt perferendis nisi ut necessitatibus.', 'Eos et quia corrupti accusantium et nobis eum ut. Sit ea ut aut eveniet aut. Molestiae nisi omnis qui ut consequatur est sint.', NULL, '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(5, 3, 1, 'Voluptatem delectus commodi voluptatum.', 'Qui perspiciatis nam maxime molestias sed nam accusamus officia aliquam quidem.', 'Modi qui voluptatem itaque eaque est. Omnis temporibus at ut. Nulla nostrum doloribus ad et. Amet voluptatem architecto ut deleniti.', NULL, '2024-10-11 06:30:42', '2024-10-11 08:11:58'),
(6, 3, 3, 'Voluptas porro magnam minima.', 'Qui ut natus nostrum ut vero qui est optio.', 'Sed harum eveniet cumque animi libero. Ex deleniti enim et in non dolore adipisci. Voluptatem qui laudantium voluptatem laboriosam porro velit dignissimos ex.', NULL, '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(7, 4, 5, 'Quae reiciendis commodi ut.', 'Unde itaque consequuntur eos sunt alias similique.', 'Odio rem officia vel. Et dicta expedita error. Sit amet et similique sunt excepturi maxime qui.', NULL, '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(8, 4, 3, 'Placeat tempora reprehenderit.', 'Libero vel est molestias modi at sit libero consequatur sint possimus eos qui.', 'Ratione molestias sit dolores ducimus. Dicta esse perspiciatis est consequatur et. Natus rerum ipsum odit fugiat.', NULL, '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(9, 5, 4, 'Consequatur placeat quia.', 'Et nostrum et inventore perferendis fuga consectetur quis amet quo quasi suscipit.', 'Aut fugiat ullam aut quod omnis fuga quia doloremque. Sit eum necessitatibus autem libero et odit voluptatum. Officia earum molestiae laborum qui non distinctio consectetur.', NULL, '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(10, 5, 4, 'Beatae molestias omnis.', 'Hic consequuntur necessitatibus corporis sit non velit amet repudiandae facilis provident.', 'Dolorem fugiat rem fugiat. Velit voluptates et sequi dignissimos esse deserunt dignissimos.', NULL, '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(14, 1, 2, 'Assalomu alaykum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из ко', NULL, '2024-10-12 10:52:43', '2024-10-12 10:52:43'),
(15, 1, 2, 'Lorem ipsum', 'The standard Lorem Ipsum passage, used since the 1500s', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, '2024-10-12 10:53:19', '2024-10-12 10:53:19'),
(16, 10, 2, 'Lorem', 'The standard Lorem Ipsum passage, used since the 1500s', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, '2024-10-12 10:55:34', '2024-10-12 10:55:34'),
(18, 10, 2, 'Lorem haqida', 'The standard Lorem Ipsum passage, used since the 1500s', 'Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из ко', NULL, '2024-10-12 12:41:41', '2024-10-12 12:42:11'),
(20, 10, 2, 'Human Mobility Manager', 'Accusantium necessitatibus nihil.', 'Quidem soluta veritatis commodi praesentium facilis incidunt aut explicabo provident.', NULL, '2024-10-16 12:25:06', '2024-10-16 15:57:51'),
(21, 1, 3, 'International Data Planner', 'Facilis odio optio voluptatem non sit temporibus.', 'Numquam tempore unde optio.', NULL, '2024-10-16 12:53:43', '2024-10-16 12:53:43'),
(22, 10, 4, 'Future Infrastructure Facilitator', 'Odit nam rem accusamus necessitatibus eveniet architecto.', 'Maiores consequuntur delectus dolorem.', NULL, '2024-10-16 15:21:40', '2024-10-16 16:00:12'),
(23, 2, 3, 'National Brand Strategist', 'Voluptatibus ipsum impedit aspernatur officiis laboriosam earum consectetur porro odit.', 'Sapiente ipsum doloremque cum optio facere consectetur.', NULL, '2024-10-16 16:04:53', '2024-10-16 16:04:53'),
(24, 2, 3, 'National Brand Strategist', 'Voluptatibus ipsum impedit aspernatur officiis laboriosam earum consectetur porro odit.', 'Sapiente ipsum doloremque cum optio facere consectetur.', NULL, '2024-10-16 16:05:04', '2024-10-16 16:05:04'),
(25, 2, 5, 'Tatu talabasi', 'Fuga molestias dolore nesciunt consectetur vitae quia.', 'Minus quia labore totam doloremque alias maxime recusandae.', NULL, '2024-10-16 16:05:32', '2024-10-16 16:06:16'),
(26, 2, 5, 'Principal Paradigm Developer', 'Fugiat eius officia expedita adipisci.', 'Aut quisquam ipsum officiis doloremque molestias cumque molestias.', NULL, '2024-10-16 16:14:35', '2024-10-16 16:14:35'),
(27, 1, 5, 'Odit laudantium non.', 'Quae rerum accusantium dolores officiis qui placeat nulla soluta incidunt.', 'Aut at cupiditate sed eum. Culpa et dolores quaerat non.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(28, 1, 1, 'Nobis laudantium cum dolores.', 'Modi omnis architecto quia quae quae consequatur in illo ullam.', 'Aut itaque illum quisquam quis et porro. Praesentium maxime expedita veritatis consequatur eos quia.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(29, 1, 3, 'Architecto quo distinctio quas.', 'Velit reiciendis pariatur magnam hic error exercitationem.', 'Rerum est quia earum harum repudiandae quis rem. Fuga et quos eius tempora veniam molestiae id. Vel odit tempore error deleniti totam suscipit.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(30, 1, 3, 'Id molestias officiis magni facere.', 'Eaque aut sapiente et veritatis eum ut nihil voluptas veniam.', 'Necessitatibus delectus quibusdam nemo distinctio deserunt id dolores. Recusandae in iste quisquam reiciendis quae cupiditate molestiae. Non qui pariatur vero at. Aspernatur ut eius et iusto.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(31, 1, 1, 'Commodi et.', 'Ex eius error repellendus fugit animi blanditiis aliquam et quia provident maxime dolor ea.', 'Facilis autem qui soluta excepturi voluptates sapiente velit porro. Quisquam enim animi quaerat culpa qui nihil. Nostrum consequuntur laboriosam ducimus est ullam molestiae officiis consequatur.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(32, 1, 4, 'Animi et eum ut.', 'Est reprehenderit culpa ducimus cumque neque quia architecto earum.', 'Nobis voluptate voluptates architecto eligendi sit assumenda. Dolores quo aut consequatur minima qui. Vero enim hic recusandae maxime.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(33, 1, 5, 'Quod aliquam non ducimus.', 'Veniam laborum dolor corporis ut temporibus qui consequatur.', 'Iste accusamus doloribus labore enim. Eos dolorum itaque expedita soluta quod sint quidem laborum. Blanditiis voluptatum neque assumenda maxime itaque. Cumque est sequi ea.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(34, 1, 2, 'Sed aut laudantium.', 'Accusamus nihil quo qui ab quia sed similique.', 'Minus possimus explicabo ratione exercitationem. Id sint beatae cupiditate velit earum. Et nihil soluta sunt perspiciatis necessitatibus. Aut voluptatem neque et modi enim voluptatum.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(35, 1, 2, 'Ea sed temporibus.', 'Adipisci aliquid mollitia natus qui et consequatur mollitia omnis.', 'Iste iure non provident et reprehenderit. Est incidunt error aperiam. Qui esse aspernatur dolorem laborum adipisci ipsam. Sed natus saepe explicabo cumque necessitatibus.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(36, 1, 5, 'At et magni.', 'Error autem illo similique quis repudiandae fugiat consequuntur ad.', 'Quos debitis ea necessitatibus facilis mollitia mollitia eius. Non saepe cumque commodi hic aut officia dolor. Laborum quos praesentium saepe.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(37, 1, 2, 'Voluptates doloremque voluptatum suscipit.', 'Autem perspiciatis est maxime quia architecto tempora et.', 'Enim facilis et vel dolore vel autem nesciunt sequi. Porro tenetur natus recusandae nobis rerum et eligendi earum. Ut tempora sit omnis ullam hic veritatis.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(38, 1, 3, 'Vel alias ab enim.', 'Quibusdam nobis error sit nemo ut animi aperiam ad neque voluptatem.', 'Vel quidem qui voluptatum nulla omnis. Praesentium suscipit autem quia neque sit veritatis. Sed qui vitae impedit ut enim possimus.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(39, 1, 2, 'Sunt maxime optio beatae.', 'Minima et velit culpa aut voluptatibus non praesentium et ea et.', 'Accusamus ad a totam. Corrupti molestias odio cum placeat impedit iste quasi. Animi quis qui ea eos et amet.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(40, 1, 4, 'Quia id aspernatur.', 'Velit et quis est ea esse id voluptatem voluptate atque.', 'Consequatur in quo cumque eum est. Consequatur ratione unde nam est sint et esse. At nihil rerum dolore nihil.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(41, 1, 5, 'Aut tenetur.', 'Quis culpa autem vel porro voluptatibus dolor.', 'Hic voluptatem occaecati incidunt voluptate reiciendis qui. Aut delectus ex voluptatem iusto itaque. Dolorum omnis et optio debitis.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(42, 1, 2, 'Aut autem quia et.', 'Quidem recusandae temporibus quam laborum sed earum aliquid eum ducimus vel.', 'Facere labore corporis natus error voluptatem. Iste dolorem officia voluptatibus natus blanditiis voluptate sed recusandae. Sequi atque quisquam soluta sit. Magnam et quia possimus accusantium labore quasi perferendis.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(43, 1, 2, 'Porro doloribus natus adipisci.', 'Praesentium voluptas dolor esse cupiditate quisquam vero repellendus.', 'Aut odio quo pariatur. Necessitatibus eos est nisi praesentium. Adipisci voluptate veritatis rerum est.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(44, 1, 4, 'Occaecati laboriosam sit consectetur.', 'Qui provident nemo voluptas mollitia eaque natus.', 'Velit expedita dignissimos dolorem rem. Suscipit qui animi modi est voluptatem et. Dicta illum non cum. Quam doloremque nulla molestias possimus neque molestiae.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(45, 1, 5, 'Perferendis inventore.', 'Sunt voluptatem totam beatae at voluptates quo fuga voluptatibus magnam aut esse.', 'Et consectetur id doloribus repudiandae aut. Saepe voluptatem labore iusto aut. Eveniet autem dolores aut doloribus inventore nostrum in.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(46, 1, 5, 'Fugit non debitis totam repudiandae.', 'Molestias dolor sint distinctio sit rem nihil aliquid iusto quia ipsam odit enim nemo.', 'Doloremque voluptatem hic est est eos. Omnis eos suscipit ut dolor similique neque. Ipsum nisi adipisci illo. Voluptas facilis minima possimus in dolores eos.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(47, 1, 4, 'Perferendis voluptas provident corrupti voluptates.', 'Quia in perspiciatis quo quis quae sunt.', 'Corporis corporis rerum iste vero beatae quibusdam in sed. Ea voluptatibus consequatur aut maiores. Ut ipsum ut error et ducimus delectus placeat. Ea et veniam quos nesciunt.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(48, 1, 1, 'Enim ut quam.', 'Omnis adipisci facere dolor odio voluptatem in culpa magni.', 'Ipsa non eveniet sint sequi harum. Repellendus aperiam aut eaque. In eius expedita facilis minima esse blanditiis qui.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(49, 1, 3, 'Et et ea inventore.', 'Ad et aut omnis qui id quas numquam cumque voluptatem quasi esse eius.', 'Fugit sed quisquam sit. Reprehenderit delectus quis eius. Non vitae asperiores et.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(50, 1, 4, 'Harum aut est voluptatem.', 'Sunt saepe et et quaerat deleniti quia voluptatem.', 'Accusantium et provident repellendus iure eligendi. Odit earum eos provident quo. Eius totam cumque quas doloremque.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(51, 1, 2, 'Est dolores aspernatur quisquam.', 'Quibusdam soluta perferendis expedita ut nam distinctio eligendi temporibus aut tenetur a sed.', 'Quaerat doloremque provident corrupti maxime nihil. Ut tempore amet est aut qui voluptates excepturi est. Architecto cupiditate dolore fugiat voluptas. Amet maxime aut autem.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(52, 1, 2, 'Placeat iste incidunt iste.', 'Sed consectetur autem reprehenderit magni natus doloribus quas.', 'Eveniet nihil et et autem cupiditate ut assumenda. Delectus fugit dolores voluptatem explicabo. Voluptatem itaque aperiam consequatur ut molestiae in odit. Aperiam dolore nulla ea minus eligendi sed nulla ratione. Qui nulla autem velit ut.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(53, 1, 2, 'Corporis omnis consequuntur odit.', 'Ex est optio qui saepe voluptate quod voluptatem nostrum omnis.', 'Voluptatum quasi animi deleniti perspiciatis ipsum eum a. Ut voluptatibus asperiores sapiente id possimus. Deserunt doloribus odio explicabo laborum quo beatae officiis et.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(54, 1, 2, 'Aut alias voluptatem nobis.', 'Et repellendus voluptates doloribus qui ut suscipit quam at.', 'Enim impedit saepe deserunt ab. Maxime velit consectetur qui doloremque velit accusantium at. Eveniet consequatur nemo sed nemo eos est deleniti id.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(55, 1, 1, 'Soluta sit voluptate omnis.', 'Enim et ullam vel velit ut quas ratione et molestias.', 'Et aut adipisci ut. Nihil quibusdam dolor tempora repudiandae a dolorem non et. Blanditiis velit unde sit corrupti.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(56, 1, 2, 'Aut maiores nemo.', 'Error dolores necessitatibus aut aliquam ad hic.', 'Odio et eveniet sapiente sit. Perspiciatis enim rerum quis ipsum ipsum. Minus rerum earum laboriosam.', NULL, '2024-10-17 12:59:39', '2024-10-17 12:59:39'),
(57, 1, 2, 'A voluptatum omnis repellat.', 'Nihil distinctio totam maxime dolorum ut similique facilis quo.', 'Corporis voluptatem et sed quo voluptatem. Earum delectus debitis nesciunt ut doloribus. Quos commodi et sit expedita assumenda aut ea. Repudiandae aliquam aspernatur exercitationem in ut est.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(58, 1, 4, 'Voluptatem ut amet.', 'Reiciendis unde est veniam voluptatem delectus molestiae voluptatem iste.', 'Aut expedita repudiandae expedita. Eligendi mollitia debitis ea laboriosam eum modi similique tempore. Voluptas ullam ut illo. Eveniet culpa necessitatibus quia.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(59, 1, 4, 'Et facere qui.', 'Sit nesciunt voluptatem voluptatem amet ea rem ratione omnis.', 'Animi et dicta maxime voluptatum quia non est. Commodi reiciendis quibusdam ut. Nulla quisquam corrupti aliquam et atque nostrum nulla. Porro vel quis enim quis voluptatem.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(60, 1, 4, 'Molestiae mollitia asperiores.', 'Omnis quidem suscipit voluptates qui optio rerum et tempora illo temporibus.', 'Optio ut labore recusandae numquam deserunt aut vitae. Non dolor vel quod non provident dignissimos expedita. Natus dolore pariatur et quam. Distinctio neque et velit corrupti minima nihil.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(61, 1, 5, 'Suscipit illo occaecati.', 'Reprehenderit dolores quisquam iusto excepturi quos consequatur omnis illum qui beatae quia aliquid.', 'Enim repellat voluptatem modi ipsa magni. Sint fugiat quo sit corrupti ullam quo. Odio possimus sapiente a similique vitae.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(62, 1, 2, 'Veritatis animi distinctio dolores.', 'Dolores nihil rerum provident a optio repudiandae enim animi molestiae tempora porro earum ipsum.', 'Adipisci aperiam quae odit architecto maxime. Consequatur voluptas nihil qui officiis tempora tempore iste. Id modi praesentium aspernatur.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(63, 1, 1, 'Repellat saepe dolorem.', 'Eos eveniet nihil nobis dolor saepe modi et itaque suscipit aut necessitatibus.', 'Enim debitis vitae esse rerum magnam est dolores. Reprehenderit occaecati ut sint id id et. Sint perspiciatis odio aut reprehenderit.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(64, 1, 1, 'Eos nihil qui.', 'Neque architecto repellendus libero rerum iusto aut.', 'Veritatis ut et occaecati voluptatum consequatur magni molestias architecto. Sed repellendus a doloremque temporibus. Hic porro quibusdam aut officiis sit alias. Voluptatum ex in et.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(65, 1, 1, 'Incidunt rerum.', 'Ipsa voluptatem nihil ut repellat cupiditate ut ut nostrum nihil et inventore.', 'Officiis id repudiandae perspiciatis est. Quia voluptatem suscipit animi consequatur et sed.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(66, 1, 4, 'Natus necessitatibus eius tenetur.', 'Voluptas qui officiis rerum est cumque qui enim exercitationem esse.', 'Praesentium aut temporibus doloribus molestias. Cupiditate fuga autem eos laudantium inventore blanditiis optio. Quia dolor numquam et et commodi aliquid eius.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(67, 1, 4, 'Magni aut molestiae ipsam.', 'Voluptatibus voluptatum dolor sed et reiciendis quidem consequuntur ad quibusdam temporibus.', 'Aut dignissimos quo quis harum in molestias ut. Saepe sit consequatur iure. Fuga cumque omnis perspiciatis consectetur asperiores et. Qui facere sint et debitis excepturi totam.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(68, 1, 1, 'A fuga ut sed praesentium.', 'Ut doloremque asperiores porro deserunt corrupti ea quaerat.', 'Officiis rerum nostrum quidem doloremque fugit nihil. Repellat sequi delectus est quia expedita. Beatae earum delectus deleniti impedit incidunt itaque. Ratione rerum ullam occaecati facere beatae quaerat dolorem. Repellendus ipsam voluptatum soluta error et sed recusandae.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(69, 1, 3, 'Enim voluptatum ex.', 'Aliquam fugit dolorem nobis labore eligendi ratione voluptatem optio quis.', 'Id a explicabo cum in voluptatem aliquam. Eos rerum consequuntur voluptatem libero voluptas. Dolorem quam sit eum cum.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(70, 1, 2, 'Sunt consequatur et itaque.', 'Eum repellendus laborum ut et ea sint provident repellat nulla voluptatem.', 'Dolor at et debitis molestiae autem ea et. Suscipit commodi porro ducimus magni architecto. Voluptas sunt consequatur qui sed. Sunt fugit aut tenetur consequatur.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(71, 1, 2, 'Expedita tenetur debitis consequuntur.', 'Voluptatem sapiente eius recusandae sed dolor perspiciatis aut eligendi.', 'Ea reprehenderit aut occaecati est optio nihil vel. Quidem quo veritatis recusandae sed doloribus maiores. Dolores est quae possimus veniam.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(72, 1, 5, 'Earum rerum velit et.', 'Quibusdam eveniet odit laboriosam deserunt nisi qui tenetur rerum.', 'Sapiente rem nihil est alias nisi ut. Amet quaerat voluptatem nemo illum id sed ipsum sed. Aut libero quod consectetur dolorem commodi est et. Voluptatibus provident veritatis laboriosam minus. Consequatur soluta autem et similique.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(73, 1, 5, 'Eius esse ut autem.', 'Minima consequuntur ut quo inventore rem excepturi consequatur vitae.', 'Vel minima dolores sunt ut aspernatur beatae et numquam. Esse praesentium quaerat alias veniam porro. Animi maiores nam magnam.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(74, 1, 2, 'Sunt libero voluptas.', 'Omnis sint quasi beatae atque ducimus consequatur incidunt.', 'Tenetur ipsam aut ratione nisi consequatur sint numquam. Voluptatem fugiat eos blanditiis aut. Non ea praesentium itaque recusandae expedita voluptatem.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(75, 1, 3, 'Tempore ut aut molestiae.', 'Iusto enim vero dolorem sequi est tenetur laudantium.', 'Sint nihil vero repellendus in voluptate. Et delectus voluptatem molestias. Repudiandae voluptates natus ab nesciunt.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(76, 1, 2, 'Aperiam possimus aut omnis.', 'Est quia consectetur necessitatibus aut rerum repellendus ut corporis corrupti aut ab quaerat.', 'Fuga maiores est reprehenderit exercitationem ipsum error omnis. Quos quas et cupiditate dolorem nisi. Quis et blanditiis accusamus qui sunt.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(77, 1, 2, 'Nulla et ut labore.', 'Molestiae quo voluptas cumque assumenda aperiam consectetur hic occaecati vel repudiandae et asperiores fugiat.', 'Aut impedit consequatur placeat quibusdam. Rerum aut nisi ipsa et voluptatem esse non. Rerum aliquid ut quidem nesciunt qui. Ut illum animi impedit dolores molestiae recusandae ullam.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(78, 1, 1, 'Maiores eligendi officia.', 'Nobis dolor sit vel nostrum eius odio placeat et qui.', 'Eveniet consectetur eaque ut veniam aut enim nobis. Expedita quos quia qui. Quaerat placeat totam vitae dolor. Quam dolorum deserunt quis sed ullam amet.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(79, 1, 4, 'Quis possimus est est.', 'Cupiditate culpa impedit rem aut error enim mollitia.', 'Adipisci est sint voluptatem. Et quaerat nihil temporibus est dolores laborum. Laboriosam et optio excepturi sit aut quod. Ea odit nesciunt odio.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(80, 1, 1, 'Culpa repellendus consequatur ut.', 'Aut repudiandae nisi omnis et eligendi commodi hic quia vero quaerat eum.', 'Iusto ut velit illo qui amet et. Rem possimus nemo sit tenetur sequi totam quas. Ipsum magni est consequuntur ut aut. Ad unde quidem laborum quae nostrum officia.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(81, 1, 4, 'Ipsam molestiae iste.', 'Expedita autem asperiores nesciunt pariatur impedit voluptatem voluptatem perspiciatis possimus non.', 'Dolore sint ut praesentium mollitia nobis libero nemo fuga. Mollitia reprehenderit aliquam odit maxime autem unde. Nam aliquid non vitae itaque consequuntur. Quibusdam rem minima rerum quia qui. Vero aut vitae illo rerum.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(82, 1, 4, 'Sit et quis.', 'Ea incidunt neque molestias similique excepturi reiciendis facilis rerum perspiciatis tenetur minus dolorum a.', 'Et commodi qui velit non doloribus sint. Eligendi adipisci saepe consequatur nihil ratione repellat. Amet recusandae impedit sed ea iste assumenda natus dolor. Qui et aut minima sit laudantium repellat maiores.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(83, 1, 2, 'Provident qui.', 'Minima doloremque a sed optio quibusdam sapiente deserunt ut et quis consequuntur quo.', 'Iusto inventore iure velit exercitationem unde nesciunt. Eius minima ducimus iure perferendis et neque. Impedit doloribus rem id repudiandae sit consequatur distinctio. Autem similique modi nesciunt voluptatibus.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(84, 1, 1, 'Qui deleniti est aut.', 'Voluptas non optio rerum illum perferendis et laborum maiores ut.', 'Ex id qui corrupti rem. Delectus in quos fuga eos. Eaque impedit consequatur amet eum eos molestiae.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(85, 1, 1, 'Esse aut iure asperiores.', 'Omnis corporis rerum at quasi in cupiditate.', 'Voluptate necessitatibus recusandae voluptas voluptas excepturi nisi. Officiis est ex omnis ea. Nemo perspiciatis eum deleniti voluptate quae nihil ut voluptatibus. Laboriosam harum voluptatem libero ab ut.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(86, 1, 3, 'Et consequatur optio ex.', 'Maiores blanditiis omnis eos doloribus ullam quae.', 'Accusamus iste quisquam ea quis dignissimos quibusdam. Error et voluptatum minus et at. Architecto aut minus autem reiciendis ipsa consequatur.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(87, 1, 3, 'Saepe magnam ipsam.', 'Officiis aut quibusdam sequi rerum quo nobis quisquam nihil esse qui.', 'Et saepe qui quo accusantium. Libero qui ut eligendi laudantium et dolorem reprehenderit sed. Earum in reprehenderit est quis impedit. Quidem assumenda distinctio repellendus aperiam sed aut aut.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(88, 1, 2, 'Accusamus omnis consequatur fugit.', 'Reprehenderit sequi consequatur beatae ipsa inventore debitis qui blanditiis culpa fuga ducimus aliquam.', 'Ad nulla dolor accusamus adipisci amet assumenda. Tenetur repudiandae dolores eligendi molestiae magnam suscipit harum. Autem ab sunt harum eveniet. Sit esse aliquam autem eos debitis accusamus odio.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(89, 1, 2, 'Voluptatem deserunt omnis veritatis.', 'Quos tempora nemo repudiandae voluptatem nihil possimus dignissimos nulla autem.', 'Fugiat necessitatibus minus harum et maxime aperiam aut iste. Voluptatem ducimus necessitatibus enim ex molestiae. Quisquam porro aspernatur qui sit et et autem. Et culpa sint adipisci pariatur ut sed.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(90, 1, 3, 'Nobis dolores.', 'Porro odio deserunt neque atque non est rerum occaecati in amet id et voluptas.', 'Est reiciendis adipisci veritatis nemo. Libero illum repellat assumenda magnam quaerat est iste. Delectus fugit quis ea blanditiis sint optio dolorem.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(91, 1, 3, 'Qui doloremque sit aliquam.', 'Et reprehenderit sit non maiores et et impedit.', 'Doloribus id aut harum est maxime. Provident illo qui ea beatae omnis inventore. Ea magnam repellat rem quia. Quibusdam ipsum enim provident corrupti illo et et.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(92, 1, 5, 'Dolor est voluptatem.', 'Nam autem et recusandae inventore odit velit dolor aut.', 'Neque nobis doloribus dolor maiores laborum quam reiciendis. Consequatur explicabo itaque ex quo qui.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(93, 1, 2, 'Error quidem harum.', 'Incidunt ut rem veniam dolores totam qui eius fuga.', 'Qui blanditiis aut totam rerum quo. Quaerat earum nihil vero. Eveniet voluptatibus voluptatum saepe necessitatibus non maiores vitae.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(94, 1, 2, 'Ducimus sed autem.', 'Necessitatibus est saepe repudiandae sint et facere iste quod sit atque sapiente et.', 'Veniam vitae ratione dolor omnis vel non nihil. Itaque veritatis nostrum praesentium est ut ipsam. Ducimus eum ipsam sunt cupiditate id id nobis sit. Unde ducimus delectus sint sit vel culpa. Sit aut quasi voluptate quae nostrum veritatis.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(95, 1, 4, 'Qui quae adipisci.', 'Quia ut hic fugit vero est magni impedit qui.', 'Sed et quaerat praesentium rem labore aut quisquam. Labore facere quo blanditiis et ea. Ut in dolores nostrum qui perspiciatis maiores.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(96, 1, 4, 'Error qui aut.', 'Et consequatur voluptatibus ipsa non in voluptatem ea qui sed aut provident magnam.', 'Sunt itaque ducimus aut commodi rerum minus expedita. Iusto natus nesciunt qui repudiandae temporibus et. Error unde et commodi praesentium saepe. Optio dolore et suscipit rerum non error placeat.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(97, 1, 2, 'Sed dolorum ipsum.', 'Odio iusto est fugit velit velit atque natus totam asperiores sint ut.', 'Excepturi dolorem tenetur id libero voluptatem distinctio. Et quibusdam enim voluptatem et corrupti. Doloremque aut dolor voluptates et nihil sit quam occaecati.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(98, 1, 1, 'Ut aut quibusdam distinctio.', 'Nemo doloribus molestias commodi atque sed repellendus enim necessitatibus.', 'Autem laborum accusantium molestiae ut optio. Sit cumque ut voluptates et dolores. Adipisci laboriosam fuga ipsam.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(99, 1, 2, 'Earum sed et reprehenderit atque.', 'Sunt ea et omnis esse odio amet maiores neque est temporibus incidunt voluptatibus.', 'Similique minima nihil et qui maiores voluptatem dolores iusto. Ut ab amet voluptatem voluptas. Officiis culpa adipisci quis. Ullam sint facilis vel hic reprehenderit.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(100, 1, 3, 'Earum et esse vitae.', 'Consequatur blanditiis soluta et voluptates et est ex.', 'Quia rerum reiciendis sapiente quam voluptatem ut. Excepturi mollitia iure vel voluptatem. Natus fuga praesentium aut ab sit.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(101, 1, 2, 'Est quod ipsum.', 'Et dolorum totam neque commodi inventore sit impedit voluptatem est consectetur quo.', 'Debitis ullam quibusdam dolores nihil beatae sed a sed. Repellendus est doloribus eos hic sint facilis excepturi. Enim eum vitae atque corrupti enim unde. Nesciunt quasi molestiae et animi beatae facilis vel.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(102, 1, 4, 'Laboriosam qui.', 'Voluptatum dolores reprehenderit provident ipsa modi unde pariatur et minus id sit libero distinctio.', 'Qui molestiae qui sapiente et voluptate. Aut et architecto quia autem autem voluptates. Culpa eius temporibus asperiores deleniti nihil est.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(103, 1, 4, 'Mollitia similique exercitationem.', 'Expedita accusantium ratione sit laborum soluta nulla eaque quasi rerum.', 'Sint aliquam voluptas soluta molestiae aperiam sit. Accusantium doloremque eum iusto laboriosam fugiat vel velit officia.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(104, 1, 4, 'Quae quisquam dolore.', 'Aut et ratione voluptas dolores voluptate dolore voluptates et adipisci deserunt eius temporibus nisi ut.', 'Amet itaque eos adipisci sunt sit enim. Accusamus repellat exercitationem unde qui laudantium in quidem. Laboriosam repellendus ut laboriosam et ea qui placeat rerum. Quis aspernatur doloremque assumenda omnis aut architecto.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(105, 1, 4, 'Fugiat ea deleniti laborum.', 'Ab sapiente voluptas eos enim qui harum id autem nam.', 'Non ut qui laudantium fugit voluptatum quod voluptatem. Praesentium molestias sit sunt rerum aut. Et eaque aperiam at eligendi facere.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(106, 1, 2, 'Molestias hic earum.', 'Consequatur rerum tempore quia reprehenderit veritatis unde tempora repellendus perferendis.', 'Adipisci illum minima sit unde mollitia cumque ex similique. Aut quasi et culpa delectus. Veniam temporibus at assumenda in sunt sit. Ut fugit pariatur rerum.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(107, 1, 3, 'Et nesciunt itaque magni.', 'Est perferendis omnis dolor quia molestiae qui blanditiis ratione id eos.', 'Dolore eveniet magnam omnis mollitia iste voluptate. Molestiae error nihil rem explicabo facilis veritatis. Tenetur quod harum nesciunt deserunt voluptatem sit ex.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(108, 1, 3, 'Quasi ipsum unde.', 'Alias asperiores dolor est assumenda dolore at quae cum quis eaque quae et.', 'Voluptatem quos non fuga eum atque. Explicabo officiis veniam doloribus et. Temporibus vitae tempore vel voluptas quia molestiae et.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(109, 1, 3, 'Odio exercitationem non.', 'Dolorem est sint vel aliquid harum quidem recusandae non.', 'Velit reprehenderit debitis dolorem et. Esse voluptatem veniam omnis.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(110, 1, 3, 'Sed in velit.', 'Tempore qui ipsum quis iste et fuga cupiditate nesciunt temporibus.', 'Autem rerum nostrum est hic. Molestiae asperiores voluptatem et. Blanditiis autem quidem autem et. Odit error qui veniam a dolor.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(111, 1, 4, 'Ad doloribus velit.', 'Itaque molestias distinctio dolorem accusantium nisi tempore eaque expedita reprehenderit officia quam qui.', 'Rem voluptas minus eos tempora non hic. Quia est porro necessitatibus dicta blanditiis omnis deserunt. Perferendis quis ut nesciunt ducimus modi ex aut. Dolores eius enim nulla ut aut dolorem ullam exercitationem. Molestiae nobis aut quia et ad qui quia.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(112, 1, 4, 'Consequuntur ea molestiae assumenda.', 'Iure omnis cupiditate eaque et cum veritatis.', 'Sapiente dolor aut porro. Asperiores reprehenderit error fugit rem. Libero natus consectetur quia voluptatem porro sunt unde. Dolores sit molestiae adipisci molestias reprehenderit enim natus.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(113, 1, 2, 'Est et occaecati iste.', 'Molestiae sequi voluptas explicabo iusto tempora dolorem.', 'Commodi deleniti quia est totam doloremque. Quidem aut laudantium vero autem. Quis odit expedita nobis deserunt.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(114, 1, 4, 'Quibusdam dolorem quis quo.', 'Repellat incidunt qui illo aperiam consequatur consequatur praesentium voluptatem et culpa quod sed.', 'Nemo aut excepturi ad qui optio blanditiis voluptate. Aut nihil et commodi id. Blanditiis minima in ea esse quidem nemo. Vitae ducimus nesciunt vero aut sed ullam. Minima ipsam et qui quo tenetur quos mollitia.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(115, 1, 1, 'Enim et aut.', 'Non sunt fugit id voluptatem alias iusto omnis fuga consequatur libero sapiente amet.', 'Architecto possimus quis natus quia voluptates quas. Pariatur sit quia velit reiciendis omnis voluptas. Exercitationem accusantium nihil necessitatibus dignissimos quibusdam sit. Corporis recusandae explicabo voluptatum et quis.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(116, 1, 1, 'Cupiditate molestiae rerum perferendis.', 'Et sed quia iure et qui et dolorum.', 'Eos modi voluptatibus enim rerum quia dolor. Sunt et doloribus sapiente nihil sed sit consequuntur odio. Repudiandae quo delectus ratione atque quaerat. Ipsam voluptatibus beatae inventore sapiente dolorem neque at. Explicabo omnis quia voluptas assumenda molestiae temporibus maxime.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(117, 1, 4, 'Consequatur voluptatem debitis.', 'Repellendus non amet consequuntur impedit asperiores quidem et aut aut provident adipisci.', 'Et pariatur soluta facere. Consequatur vel culpa possimus cupiditate. Iusto aut non et saepe nesciunt consectetur. Sed cumque eos qui eligendi corporis.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(118, 1, 5, 'Aut hic odit maxime.', 'Et itaque eveniet beatae harum ut ullam.', 'Ipsam iste optio delectus iure totam ut. Quia cupiditate eum quos in magnam magnam voluptatibus aut. Ducimus et consequuntur et aut. Ipsam sit id ut consequuntur.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(119, 1, 5, 'Placeat autem autem qui.', 'Ea rerum ipsam quia minus repudiandae ut dolorem beatae tempore necessitatibus omnis hic.', 'Voluptatem fugiat molestiae reprehenderit veritatis voluptate eos. Eos in rerum distinctio veritatis inventore. Culpa laborum dolor sunt alias blanditiis voluptatem quisquam. A iusto blanditiis necessitatibus vitae eius a asperiores. Cumque at odit laborum libero temporibus id.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(120, 1, 3, 'Nam consequatur fugiat et.', 'Dolore rerum tenetur repudiandae cupiditate ex est enim sunt libero laudantium.', 'Iure accusamus est aut. Optio dolorem aut assumenda labore ipsum laboriosam.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(121, 1, 4, 'Enim maiores dolorem.', 'Non dicta repudiandae laudantium id ut ea minima quidem.', 'Unde reprehenderit necessitatibus ea et quis. Sit dolor laborum est dolores consequatur. Eum id aut rem numquam.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(122, 1, 5, 'Delectus reiciendis sit.', 'Ad doloremque enim ea quibusdam soluta id omnis.', 'Error ipsa fugiat consequatur id iure voluptates. Minima debitis id quis atque. Nam quas sunt quis quaerat et omnis tempore. Nihil qui nemo amet quae. Recusandae eaque nemo aut culpa sed ad quaerat.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(123, 1, 2, 'Non dolorum voluptatibus.', 'Eum dolores asperiores sed itaque repellat dolorum temporibus molestiae corporis sequi error exercitationem ducimus.', 'Sed nihil quia blanditiis unde autem et expedita. Reprehenderit vel est inventore ut accusamus voluptatem. Et blanditiis maiores dolorem est vitae deleniti.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(124, 1, 1, 'Sed aut et sunt.', 'Veniam autem cum molestiae ut sunt sed dignissimos mollitia odit.', 'Repudiandae qui pariatur est debitis vel. Sed sint nihil perferendis odio earum magnam.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(125, 1, 3, 'Commodi eos nisi.', 'Numquam et ut mollitia fuga ratione ut.', 'Quidem fugiat qui in deleniti nesciunt. Consectetur quibusdam nihil tempore aut necessitatibus. Aliquam harum sed et et non. Beatae laborum ut vel laborum quaerat voluptas fugit. Eaque exercitationem ut quia illum minima id.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(126, 1, 1, 'Doloribus voluptatem.', 'In commodi aut veritatis nihil incidunt sunt earum a voluptatem sit facere omnis.', 'Voluptatum magnam voluptatem recusandae ut. At facilis et natus et est omnis. Delectus ipsa quam placeat pariatur. Ut eligendi nulla alias.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(127, 1, 3, 'Laborum non iusto veritatis.', 'Nihil magni blanditiis quia laboriosam facere rerum.', 'Dolorem voluptas sed error voluptatibus quidem officia qui asperiores. Impedit dolorem suscipit ad ullam consequatur sed beatae. Officia dolorem enim sapiente debitis in id. Quo quibusdam dolorem consectetur nemo repudiandae.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(128, 1, 5, 'Molestiae dolorem nemo inventore.', 'Aut et ex aliquam velit pariatur omnis laboriosam fuga molestiae.', 'Debitis aut incidunt excepturi accusantium quia. Ad corrupti qui est veniam non. Numquam exercitationem fuga velit tenetur. Placeat nesciunt animi qui enim dolore non architecto sit.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(129, 1, 5, 'Ipsam officia amet est.', 'Quasi quod suscipit est est incidunt nisi autem possimus animi optio ut ipsam.', 'Totam maiores id atque esse. Dolores quo unde atque laborum laudantium. Et ex voluptatem enim distinctio qui sit. Molestiae quasi beatae iusto aut deleniti saepe dignissimos.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(130, 1, 2, 'Magnam minima possimus.', 'Dolor aperiam id dicta rerum nostrum mollitia quia quos sed.', 'Eligendi unde voluptatum harum dicta eum et itaque. Omnis nostrum quibusdam molestiae sunt et. Omnis aut vel deleniti exercitationem dolorum.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(131, 1, 5, 'Voluptatem odio voluptas sapiente.', 'Sed quidem alias natus voluptatem voluptates doloribus voluptatem perferendis ut quo aliquam unde dolorem.', 'Et qui consectetur repudiandae et sapiente. Dolor omnis dolorem aperiam voluptatem expedita. Tempora quo quia ipsa provident. Dolor nostrum esse delectus.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(132, 1, 3, 'Iure maiores officia.', 'Omnis rerum repellendus magnam adipisci omnis accusantium minima assumenda ex.', 'Saepe dolorem qui totam. In ab eos porro et doloremque voluptatem. Rerum nisi eaque beatae sit. Ut natus aut autem autem ea.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(133, 1, 3, 'Voluptatem quia impedit et et.', 'Rerum ea est voluptate dolorem quia quia ut qui itaque qui minima.', 'Similique nihil cum culpa qui tempore aut. Perspiciatis suscipit aliquam et praesentium assumenda beatae officia. Quibusdam veniam est aspernatur aut sed velit sed.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(134, 1, 2, 'Quo accusantium minima.', 'Voluptatum quasi dignissimos minus fugit quas impedit excepturi nihil qui excepturi et.', 'Ipsam fuga nemo est necessitatibus neque qui quam sint. Soluta quod soluta et nemo. Possimus molestias nobis et id nisi.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(135, 1, 4, 'Maxime ut ipsum.', 'Iste harum ad aut incidunt consequatur dolor quis quae voluptatem harum necessitatibus soluta fuga.', 'Explicabo esse sit culpa voluptates consequatur quia earum quae. Velit ipsam id quo dignissimos earum optio. Enim illum praesentium dolorum eveniet. Animi modi similique ut aliquid architecto sunt.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(136, 1, 1, 'Impedit numquam perspiciatis.', 'Sunt ut ipsum possimus dolor aut et consequatur minus eligendi qui soluta similique sit cumque.', 'Placeat dolor iste minima voluptatem. Omnis aut ipsum quos quia illum odit dolor consequatur. Rerum dolorem sint non eos aliquam dolorum ab est.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(137, 1, 3, 'Voluptatem dolores ut.', 'Voluptatem voluptas iste esse enim alias consequatur numquam quis minima commodi dolorum.', 'Autem soluta consequuntur vero accusantium veniam iusto non ratione. Ea tempora sint repellat id est maiores. Magni rem rem delectus. Suscipit repudiandae nemo laudantium.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(138, 1, 5, 'Explicabo quisquam et esse voluptas.', 'Qui nemo natus reiciendis aliquam adipisci quia maxime.', 'Ad doloremque repellat voluptatem commodi temporibus. Laudantium accusamus et impedit dolores. Repellat ut vero quas possimus corrupti porro. Quam dignissimos illo sed fugit nulla velit ab laborum.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(139, 1, 5, 'Ut voluptatem soluta repudiandae.', 'Aperiam error ex autem ut nihil odit et ut et aliquid saepe.', 'Nihil et cupiditate ducimus neque enim. Rerum similique tempora similique dolor. Laudantium magnam et deleniti impedit non minus aut. Et aut non id sunt et distinctio magni. Voluptatem et saepe natus omnis non.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(140, 1, 2, 'Molestias nihil voluptas omnis.', 'Distinctio ab dolorem voluptatem pariatur tempore qui non dolor.', 'Harum qui rem eius eius autem occaecati voluptatum et. Quis et autem vitae et. Enim eaque ut quaerat maxime.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(141, 1, 1, 'Dolor reiciendis qui nostrum.', 'Corporis autem deserunt laudantium architecto quibusdam qui ad perspiciatis provident blanditiis qui accusantium pariatur.', 'Corrupti perferendis nesciunt qui quia. Eligendi voluptas occaecati ut quasi totam eum sed. Sit non est assumenda ut odit.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(142, 1, 5, 'Reprehenderit asperiores.', 'Quo modi recusandae esse culpa praesentium culpa.', 'Quisquam et culpa ipsum sit ut. At officiis ex aspernatur repudiandae cum fugit et.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(143, 1, 4, 'Totam repellendus vel et.', 'Itaque deleniti et nam suscipit rerum minus.', 'Quia odit itaque qui dicta facilis tempore. Et ut velit occaecati sapiente eligendi. Molestiae qui fugiat eveniet. Nemo fugit repudiandae impedit est.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(144, 1, 2, 'Mollitia reprehenderit laboriosam.', 'Rerum at et velit tenetur aspernatur corporis enim et aut voluptas consequatur cumque.', 'Delectus qui quas quaerat sapiente. Sint qui quis sunt. Voluptatibus unde neque soluta nobis veniam dolorem. Consectetur aspernatur sapiente dolorem eaque et.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(145, 1, 3, 'Tenetur ea vel ut nihil.', 'Quod harum eos nemo ut architecto ex rerum.', 'Quisquam ratione ut non non laudantium nihil voluptatem quia. Accusamus illo suscipit porro aperiam. Perspiciatis quas sunt consequuntur tempora ea quas. Atque autem officiis qui laudantium quaerat ea.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(146, 1, 2, 'Deserunt velit.', 'Assumenda quia exercitationem officia ipsam et quia natus voluptate illum perspiciatis consequatur possimus velit.', 'Sequi est sed totam quia quas quas voluptas. Aut cum aut qui eum magnam quaerat. Iusto vel in unde voluptate earum repudiandae.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(147, 1, 4, 'Ex veritatis sint qui.', 'Doloremque eius corporis non rerum ex enim repellat aut fugiat consequatur.', 'Commodi in voluptas temporibus nesciunt. Porro omnis quo non nobis. Qui magni et alias perferendis repellat.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(148, 1, 5, 'Qui ex sunt.', 'Fugiat quia molestiae ratione laboriosam eligendi dolor et dolorem aut nemo molestiae delectus voluptatem.', 'Rerum reprehenderit labore quis porro. Et tempore quia cupiditate cum quas sapiente. Quis maxime impedit aliquam aut. Velit autem necessitatibus expedita sit vitae repellat recusandae eveniet.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(149, 1, 4, 'At recusandae quaerat dolor.', 'Qui voluptas adipisci quia nesciunt assumenda quis.', 'In ipsam non consequatur quia aliquam molestiae. Et qui harum architecto quidem qui reiciendis ab autem.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(150, 1, 5, 'Eos ipsum debitis.', 'Perspiciatis enim sit accusamus officiis ipsa rerum tempore quia aliquam consequatur ut.', 'Est recusandae minus enim aut exercitationem dicta. Corporis voluptates eveniet maxime facere dolores officia. Sunt quo commodi praesentium. Molestiae odit tenetur aut vero doloribus rem.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(151, 1, 4, 'Alias quia rerum rerum.', 'Quo impedit dignissimos nihil rerum repellat animi qui.', 'Sed illo nulla ducimus voluptas. Est ipsum asperiores dolores ipsa. Eum sed aut voluptas amet omnis voluptatem.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(152, 1, 1, 'Veritatis placeat rerum ut.', 'Quis veniam tempore et et quo ducimus aut atque non saepe illo sit voluptatem.', 'Laboriosam officiis et illum sed molestiae est omnis. Consectetur dolor ea voluptatem et rerum. Non suscipit esse ut quibusdam possimus aut commodi non. Voluptatum deleniti illo perferendis fugit eaque similique.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(153, 1, 4, 'Cum quo.', 'Aut autem voluptatem beatae voluptas reprehenderit a animi eveniet mollitia vel dicta iure totam.', 'Sint doloribus facere et sint consequatur at architecto dolorum. Dolores qui voluptatum delectus. Quo quae quo maiores magni aut cum et non.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(154, 1, 1, 'Molestiae qui quibusdam.', 'Nostrum voluptas repellat consequatur qui omnis impedit quia neque neque aut occaecati debitis minima.', 'Accusamus quia expedita sint dolorem dolores. Fugit tenetur provident ex laborum reiciendis. Qui explicabo voluptas consectetur unde harum. Cumque officiis rerum odio aut quia. Enim ut aliquam nisi omnis.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(155, 1, 2, 'Molestias sit inventore.', 'Fuga aut et assumenda non est animi nihil nobis consequatur ducimus sint.', 'Qui nostrum sapiente error sapiente laborum omnis quo qui. Quia qui dolorem assumenda praesentium asperiores suscipit.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(156, 1, 2, 'At ratione ut.', 'Maiores qui dicta eum et blanditiis corporis sequi quis unde officia dolore voluptates adipisci eligendi.', 'Amet officiis aut quia architecto. Temporibus asperiores porro consequatur facilis quasi. Optio rerum explicabo ut libero ut qui dolor ex. Itaque sed fuga ipsum omnis.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(157, 1, 3, 'Et perferendis magni.', 'Maxime eos sint tempora natus reprehenderit cupiditate voluptate eos perspiciatis.', 'Nesciunt corrupti molestias quam. Velit sed reprehenderit ut eum sit voluptas. Nihil animi quia quam ex.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(158, 1, 3, 'Laborum sint voluptate quos.', 'Quod sunt eveniet ab nihil voluptatem qui laudantium.', 'Sapiente doloribus magni sed. Assumenda assumenda beatae voluptas et. Tempore corrupti omnis ullam nostrum sed sint accusantium.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(159, 1, 3, 'Minus totam perferendis eius.', 'Nostrum sit molestias soluta similique eveniet qui occaecati voluptate facilis aliquid est aspernatur saepe.', 'Non sit est aspernatur aut sit inventore. Doloremque et ea in omnis modi itaque voluptatem. In sunt ipsum nobis autem rerum. Ad facere qui voluptatem est aperiam beatae perspiciatis. Non vitae quae et.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35');
INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `short_content`, `content`, `photo`, `created_at`, `updated_at`) VALUES
(160, 1, 4, 'Enim exercitationem sunt est.', 'Doloremque repudiandae dolorem vel nulla ut non illum voluptas.', 'Laborum quo rem corporis ut officia. Ex quas vero molestiae velit. Quo maiores eos non corrupti veniam et voluptatibus. Eveniet et et sit excepturi aliquam et.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(161, 1, 1, 'Architecto consequatur minima labore.', 'Sint excepturi modi enim praesentium perspiciatis modi id blanditiis iure doloribus aut qui voluptas.', 'Quis porro dolores inventore vero dolorem repellat. Magnam repudiandae fuga quos aut consequatur. Sed autem delectus nihil corporis culpa doloribus. Eveniet illum et quos nihil corrupti qui autem optio. Sed expedita velit vel quia sint qui ad veniam.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(162, 1, 1, 'Temporibus labore.', 'Reprehenderit quia rerum ipsum molestiae a aut sit adipisci iste pariatur perspiciatis.', 'Eos ut laboriosam rerum et non velit quia. Quae officiis officiis explicabo quibusdam et rerum tenetur. Totam velit quibusdam nemo eos.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(163, 1, 5, 'Iusto illum corrupti est.', 'Ab esse eum impedit itaque voluptatem modi laboriosam maxime et itaque.', 'Praesentium nobis rerum maxime quia inventore. Eum repellat et vitae aut inventore asperiores esse consequatur. Dolorem vitae tempora ratione autem molestiae et nostrum sunt. Ut quas cum maiores cum aspernatur possimus dignissimos nostrum.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(164, 1, 5, 'Nemo et voluptate quas.', 'Dolor nesciunt qui et molestiae voluptatem aut.', 'Quis dolores odit nulla dicta labore. Ullam possimus aliquam vitae nobis perferendis omnis cupiditate. Distinctio temporibus vitae distinctio quaerat nihil asperiores. Odit consequatur error veritatis velit facilis.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(165, 1, 2, 'Atque suscipit quidem.', 'Quidem qui eos consequuntur quam at eum dolorem optio nihil nulla at velit molestiae.', 'Explicabo unde et modi eos nihil esse aperiam. Delectus assumenda rerum odio sunt quos optio debitis. Voluptas accusantium perspiciatis sit quasi necessitatibus quis id. Sunt accusamus quibusdam dolorem modi atque cum dolorem.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(166, 1, 4, 'Numquam aut in qui.', 'Ipsum labore quis labore ut doloribus at voluptas ullam.', 'Qui labore aut non autem id. Non aliquam fugiat dolores nam cupiditate iure occaecati. Dignissimos reprehenderit sit unde facere hic eum.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(167, 1, 2, 'Nostrum cumque totam illo.', 'Facere ab magnam non atque modi recusandae sunt temporibus et dolore.', 'Harum quasi suscipit qui alias. Ut fugiat error aut aut. Reiciendis autem temporibus debitis perspiciatis aliquam. Porro illum necessitatibus qui et necessitatibus.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(168, 1, 1, 'Sed sint atque mollitia.', 'Fuga adipisci quis voluptatibus aut praesentium optio.', 'Iure dolores id maxime praesentium quo quod est. Iusto magnam qui sit sed officia aut consequatur. Quia ut illo porro quia. Culpa cum sit consequuntur distinctio molestiae.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(169, 1, 3, 'Est odit molestiae.', 'Reprehenderit porro neque aspernatur beatae sed voluptates magnam officiis fugit vitae nihil rerum.', 'Omnis labore voluptas iusto aut dolore. Eligendi quo recusandae provident quibusdam ut impedit qui. Consectetur consequatur velit id sed optio dolores.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(170, 1, 5, 'Placeat soluta.', 'Nobis nobis laboriosam a autem eos dolor laudantium ea eum sapiente.', 'Sint aut velit accusamus ut cumque consequuntur aut voluptatem. Optio corrupti nam sit illum eligendi culpa. Tempore sequi doloribus quos magni placeat optio quia rem.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(171, 1, 2, 'Ipsa quidem quod.', 'Possimus quibusdam quasi fuga vel voluptate asperiores adipisci.', 'Numquam et sit est aspernatur. Et provident soluta sunt consequatur. Consequatur et nihil quia aut sed illum qui. Asperiores ullam ad dolorem sequi vel vel.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(172, 1, 3, 'Iusto qui aliquid quidem officia.', 'Non quis aut libero inventore possimus quia id iure quis et aut.', 'Natus sed necessitatibus voluptates ut rem et. Enim est possimus mollitia ad. Magni sit consectetur nobis labore. Repellat natus vero deleniti voluptatem possimus dolores nulla.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(173, 1, 3, 'Explicabo qui quam quibusdam.', 'Et a totam neque omnis vitae accusamus consectetur perspiciatis.', 'Eaque harum id modi dicta mollitia. Voluptas accusantium et recusandae vel. At et est quia.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(174, 1, 4, 'Libero dicta nemo hic.', 'Officiis dolorem aut ea non tempore culpa voluptatem consectetur omnis et consequatur.', 'Facere cum delectus id fugit architecto est. Ipsam est voluptas sint veniam quo esse tempore voluptas. Placeat corporis rerum est laboriosam labore atque. Alias est aperiam ducimus nihil fuga deserunt molestiae.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(175, 1, 5, 'Impedit aut nesciunt.', 'Dolorem consequuntur nesciunt quis iure excepturi et sunt earum amet.', 'Et ratione nulla ullam vel. Nisi non nesciunt esse et consequuntur minima. Voluptatibus nisi enim illo. In expedita voluptatibus nemo voluptatem molestiae labore soluta.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(176, 1, 4, 'Aut fuga neque dolor.', 'Non ut sint vitae eveniet est est tempore accusamus ut sunt.', 'Et sed quasi modi aspernatur ut maxime. Et ut reiciendis aliquam quos veniam perferendis similique. In autem inventore ipsam tenetur sit. Vero unde culpa et explicabo molestias expedita ut. Architecto voluptas nostrum consequuntur perferendis dolores aut.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(177, 1, 5, 'Aliquam numquam est doloremque.', 'Esse voluptatibus doloribus dolores in quo et facilis consequatur id dolores.', 'Omnis totam iste dolor ullam enim. Qui esse ut ut in placeat tempore. Quo animi quae occaecati quaerat ipsum voluptatem non architecto.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(178, 1, 1, 'Unde maiores voluptates repellat.', 'Maxime commodi repellendus quis velit omnis doloribus debitis cumque cupiditate sapiente.', 'Illo et saepe odio deleniti ab nesciunt et. Molestiae tempore alias debitis harum.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(179, 1, 2, 'Hic nostrum eos.', 'Non occaecati voluptatem quia quis voluptatem blanditiis ut possimus odio enim quod.', 'In consequatur aliquid labore sed quia. Et ullam et perspiciatis nam cum. Autem adipisci error doloremque libero officia sequi sapiente. Sapiente molestiae vel aut rerum voluptate quas.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(180, 1, 3, 'Ut doloremque aut aut.', 'Voluptatem sint pariatur qui enim esse excepturi quo quam reiciendis.', 'Provident quia facilis qui vel dolor debitis. Harum sit numquam rerum et nesciunt ut. Incidunt temporibus aperiam laborum et debitis et nulla. Quae laborum et et.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(181, 1, 5, 'Quam quod incidunt error.', 'Voluptates sed vero voluptatem tempore optio omnis deleniti reiciendis non delectus sunt rerum.', 'Earum doloribus quae ut expedita quas non soluta. Quas neque omnis in sed. Aut non enim magnam illum sunt veritatis quos dolore. Eius et vel maiores labore est similique nostrum.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(182, 1, 5, 'Beatae ipsam similique odit.', 'Officiis laboriosam beatae recusandae aut corporis recusandae consequatur rerum corrupti soluta voluptas.', 'Consequuntur omnis non eos ut quaerat. A qui magnam expedita eum similique et. Quibusdam amet nam eos reprehenderit rerum nemo iusto.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(183, 1, 1, 'Dolor qui iure voluptatem.', 'Nobis voluptas fugiat quam vero libero odit enim occaecati earum aliquid harum quaerat.', 'Perspiciatis aut autem fugiat soluta. Maiores natus unde omnis ut et laborum omnis. Architecto libero inventore facere dolorem eaque sit.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(184, 1, 4, 'Porro aut fugiat molestiae est.', 'Excepturi est illo sapiente quia earum iste esse est.', 'Numquam rerum magnam numquam id est vel facilis. Aliquam qui officiis necessitatibus ut. Nesciunt aut ea voluptatum expedita amet. Impedit nihil sit possimus.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(185, 1, 5, 'Rerum doloribus odio rerum.', 'Architecto vitae recusandae odio non nulla consequatur totam tenetur perferendis recusandae sint sint.', 'Dolor necessitatibus est repellendus pariatur quia ut. Est itaque dolorem id officiis. Quis consectetur rem rerum est illum. Laboriosam minima maiores rerum.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(186, 1, 3, 'Qui aliquid sunt.', 'Eius natus architecto omnis qui illum nisi iure quo a.', 'Velit nostrum dolorem quae repellat. Quos facilis molestias iste. Est veniam deleniti voluptate sed. Ipsa deserunt asperiores aut sit.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(187, 1, 1, 'Voluptas nobis magni.', 'Aut ut necessitatibus eius sunt assumenda consequatur.', 'Asperiores ut consequatur aliquid ipsa dicta sunt. Velit aut labore cum voluptate numquam enim odio. Neque deserunt nihil magni pariatur qui dignissimos id.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(188, 1, 3, 'Ut ducimus doloremque hic.', 'Blanditiis dignissimos in reiciendis corporis vel ex corrupti id iure libero qui molestiae voluptatem.', 'Est quo sit et ipsam perspiciatis. Deleniti quia voluptate rem id totam labore ut. Dolorum eos dignissimos ipsa facere.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(189, 1, 3, 'Fugit sed quia neque.', 'Vitae fuga necessitatibus omnis aut qui nesciunt recusandae voluptates consequatur dolor.', 'Ut illo dolore facere iusto rem sunt dolorem reiciendis. Impedit modi qui labore. Quia deleniti consequuntur dolorum dolor.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(190, 1, 4, 'Maiores harum libero.', 'Atque dicta ipsum aut eligendi sed dignissimos laboriosam aliquam id.', 'Quia voluptatibus eius voluptates dolorem ea accusamus. Iusto nisi autem corrupti hic debitis quas. Velit omnis non aut vitae quia rerum et.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(191, 1, 4, 'Rerum non facilis.', 'Voluptatem aut accusamus vitae ut similique culpa reiciendis magnam recusandae porro reprehenderit magni exercitationem.', 'Laborum fuga modi sit quod laboriosam voluptatem. Necessitatibus quos neque eveniet inventore sed saepe maxime. Aliquam excepturi expedita ipsam iusto aut dolorem.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(192, 1, 3, 'Culpa praesentium cupiditate id voluptas.', 'Et laboriosam nihil est et pariatur doloribus possimus molestias ratione et repellat qui.', 'Est eius expedita aut. A reprehenderit dolor voluptatem impedit. Quaerat consequatur et voluptas rem consequatur aut.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(193, 1, 4, 'Odit praesentium repellat.', 'Et excepturi non temporibus et maxime voluptate sed ab.', 'Deserunt velit dolorem ut soluta quos. Illum aspernatur qui vero aut amet eligendi. Et repellendus vel vitae. Ex inventore temporibus rem quisquam sit. Ut alias rerum quidem non.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(194, 1, 2, 'Asperiores aut amet quos.', 'Veniam sequi rem fuga veritatis adipisci in doloribus distinctio sunt amet quaerat suscipit aut.', 'Voluptatum perferendis commodi et repellendus dolore. Impedit quaerat sunt cum aut. Saepe odit cum qui culpa amet sunt ad.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(195, 1, 1, 'Nostrum autem nesciunt.', 'Autem voluptas eum dolores ex facere distinctio sit deleniti iste amet.', 'Voluptatem et enim iusto ullam. Beatae inventore et ut nihil perferendis. Perferendis aliquam ut est alias. Blanditiis fuga facilis inventore omnis. Quisquam doloribus corrupti quaerat dignissimos quis.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(196, 1, 1, 'Ut optio dolor.', 'Voluptatibus nemo modi ut quis temporibus consequatur ut.', 'Quasi sint et omnis quas. Nemo commodi quaerat nobis excepturi suscipit et. Consequatur rem quos omnis quis doloremque qui fugit. Quia non est id aspernatur consequatur qui.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(197, 1, 5, 'Qui aut sit.', 'Est qui minus voluptas illum eum eos aut odit repudiandae adipisci iste.', 'Non molestiae quam et consequatur et voluptatem vel. Modi eligendi aliquam qui perferendis. Cumque fugiat quaerat modi provident et quasi eius. Numquam aut aspernatur aut numquam enim error. Consectetur aut aut neque sed eaque fugiat.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(198, 1, 1, 'Et ipsum sapiente.', 'Autem aut fuga magni nesciunt explicabo quo exercitationem sit sint.', 'Quaerat praesentium amet in quam. Natus hic numquam fuga est ipsa. Ab tempora exercitationem quia ut consequatur unde tempore voluptatem. Est unde autem et praesentium reiciendis laborum odio. Voluptas et distinctio voluptas sit.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(199, 1, 3, 'Blanditiis accusamus.', 'Libero corporis placeat inventore autem sit perferendis qui voluptatibus placeat.', 'Aperiam quam autem earum architecto. Voluptas est doloremque aut tempora iure. Perspiciatis voluptas molestias eos mollitia quasi omnis necessitatibus.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(200, 1, 3, 'Mollitia molestias et.', 'Quasi maiores ad maiores fugiat eum ratione optio consequatur.', 'Ad quibusdam accusamus modi quo. Sequi est ea labore qui. Velit rem beatae enim animi possimus ab. Doloribus doloribus rerum quam ut aut labore at.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(201, 1, 5, 'In eum.', 'Possimus tempora eligendi quia esse mollitia aut nisi id id rerum non quia voluptas.', 'Ipsum est et ut. Earum voluptatibus et non dolorem sequi voluptatem. Similique quod ut molestiae suscipit velit. Aut ut et modi totam soluta voluptas.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(202, 1, 3, 'Odit nam.', 'Accusamus cumque accusamus eligendi possimus mollitia facilis rerum debitis.', 'Occaecati qui in ut et. Fugiat rerum iusto consectetur mollitia molestiae dolorum saepe. Quia dolor quae eum quidem et est deserunt.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(203, 1, 4, 'Architecto sit molestiae.', 'Quibusdam exercitationem dicta nihil voluptate deserunt perferendis ut earum incidunt harum blanditiis est eius.', 'Sunt et rerum occaecati culpa. Excepturi nostrum velit nam aliquid. Sapiente provident nihil perspiciatis libero corporis. Error officia perspiciatis aut nam similique.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(204, 1, 2, 'Beatae et voluptates.', 'Iusto in odio fugit corrupti et voluptas ipsam magni et ex.', 'Voluptatem aut ut quasi consequatur doloremque. Vel molestiae rerum provident voluptatibus doloremque aliquam. Porro sed maiores nesciunt delectus quis. Eos et quis inventore laudantium et qui.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(205, 1, 4, 'Eius vitae dolorum.', 'Quia illum impedit neque est nihil quas sequi sit quia illo odio expedita.', 'Corrupti tenetur minus iure sed porro corrupti. Commodi reiciendis officia illum. Quia facere qui corporis sapiente velit repellat rerum.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(206, 1, 1, 'Quo deserunt est earum deleniti.', 'Fuga voluptas ratione natus ut et odio voluptas enim impedit odit ab.', 'Quo est sit sint molestiae excepturi quidem hic. Qui possimus ducimus aut tempora. Et nemo qui molestias.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(207, 1, 4, 'Numquam ipsa vitae tempore.', 'Vel nam et ut quas alias aliquid rerum deserunt quaerat sit.', 'Numquam quae occaecati at aut nostrum velit. Consequatur deserunt consequatur officia molestias sed nulla ut. Exercitationem eligendi necessitatibus quisquam. Ullam est doloribus at quam.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(208, 1, 1, 'Error dolores eaque.', 'Dolore et inventore voluptates earum explicabo minus non modi vero doloremque.', 'Cum officia quod ut. Aut et quas enim corrupti possimus aspernatur omnis accusamus. Et aut minima ea culpa.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(209, 1, 5, 'Alias qui quo.', 'Nostrum dolor ab aut ut amet earum.', 'Quibusdam blanditiis eos dicta porro aliquid corrupti quae. Sapiente suscipit consectetur cum suscipit sapiente.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(210, 1, 2, 'Suscipit id soluta beatae.', 'Id laborum reprehenderit eum consequatur nam sunt.', 'Praesentium vero ut voluptate eum repellat rerum non. Qui mollitia beatae eum hic. Voluptates ullam minus qui corporis pariatur fugiat. Tenetur earum harum repellendus beatae nobis quod aut.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(211, 1, 4, 'Consequatur optio itaque.', 'Quas perspiciatis nihil veniam ea est odio.', 'Sequi recusandae vero beatae consectetur quasi earum. Ipsum nihil ut ut delectus qui. Eaque libero dolor omnis quo.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(212, 1, 2, 'Eaque et nulla.', 'Veniam omnis non est et ut labore dolorum quia est sint consectetur.', 'Quia iusto velit quo amet omnis ipsa. Veniam fuga totam nesciunt molestiae sint illo distinctio. Voluptatem ex neque nulla ex minus quasi eius. Inventore inventore sapiente sunt sed sint nobis blanditiis.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(213, 1, 4, 'Sed quo repudiandae et.', 'Est velit minima voluptas incidunt repellendus sit qui quia nobis sit qui qui consequuntur.', 'Est et ut nesciunt magnam. Architecto sed perspiciatis quos et rerum accusamus. Libero recusandae porro voluptatem accusantium id odit.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(214, 1, 5, 'Cupiditate modi accusamus quas.', 'Et consequatur quae modi culpa pariatur at ratione repellat.', 'Ad doloremque incidunt fuga et itaque unde soluta. Veniam error nostrum eligendi ipsam eos et ipsum. Dicta iusto enim maiores doloremque et. Et est est aut consequatur sapiente ratione quis et.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(215, 1, 3, 'Nostrum voluptatem iste.', 'Recusandae non rerum illo qui aspernatur omnis explicabo aut aut rerum cumque aliquam.', 'Dolores a quisquam ipsa velit vel illum dolores. Quo aliquid amet expedita non sit consequatur. Ex inventore enim enim excepturi nulla. Maiores eaque omnis necessitatibus suscipit fugiat cumque.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(216, 1, 1, 'Ut in fuga.', 'Perspiciatis dolores inventore doloribus rem eos dolorem adipisci et non quia a eum.', 'Aut quibusdam totam iure placeat aut et quas. Temporibus repellendus quo quaerat iure ea. Sunt alias modi odit dignissimos. Temporibus molestiae dolor id dolorem est.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(217, 1, 1, 'Quia sed sequi.', 'Consequatur architecto aut tempore dolorem et quo et in error ipsam.', 'Aut non ad quia ab labore tenetur quia. Dolorem sapiente sunt non fugiat ullam aut. Omnis autem sint sit sint voluptas quo totam.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(218, 1, 2, 'Vitae similique sit qui quaerat.', 'Quo autem harum blanditiis debitis tempora expedita et facere quia cum suscipit porro.', 'Ea autem ratione maxime dolores quia repellat. Qui id iure exercitationem aut fugiat. Neque impedit labore necessitatibus placeat.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(219, 1, 4, 'Molestias nihil et et.', 'Architecto voluptatem iste ut veritatis eum placeat hic blanditiis esse.', 'Cupiditate sunt accusamus sunt. Explicabo dolore molestias facere deleniti incidunt quos dolorem sapiente. Quaerat est voluptate recusandae aspernatur consequuntur mollitia. Quidem nemo autem sit quo.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(220, 1, 1, 'Sapiente illum consequatur.', 'Enim atque omnis voluptas et excepturi omnis suscipit nemo iusto sint velit.', 'Dignissimos perferendis accusantium nisi atque omnis voluptas. Ad tenetur a et consequatur aliquam voluptas aperiam et. Ut beatae id illo dolores ut dolor sint impedit. Iure sequi repudiandae esse facere sit quis.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(221, 1, 4, 'Officia excepturi adipisci.', 'Dolores voluptates commodi et voluptas quidem dolor consequatur.', 'Aliquid accusantium est cupiditate laborum qui et totam et. Nulla hic est eum necessitatibus ut voluptates eveniet exercitationem. Maiores molestiae odio exercitationem tenetur qui sed nam occaecati.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(222, 1, 3, 'Tenetur veritatis velit.', 'Minus cupiditate odit aut repudiandae dolor dignissimos nostrum voluptatem.', 'Facere aut et est veniam. Eos sunt voluptas ea sint. Tempore ratione tempore dolorem quasi autem nisi officia. Facere omnis ipsa ut quos cupiditate odio.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(223, 1, 3, 'Eaque sapiente ducimus.', 'Quia voluptatibus deserunt asperiores quasi ut veniam odio voluptatibus et et mollitia.', 'Impedit inventore sunt alias voluptatibus qui. Quaerat et sunt dolor est ut aut quaerat. Voluptatibus architecto iste nostrum quisquam quasi.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(224, 1, 2, 'Aut labore eum voluptates.', 'Ex temporibus error eos sit consequuntur ea numquam nihil veniam nam nihil modi voluptate.', 'Odit sint fugiat quibusdam nisi magni ex. Porro dolorem voluptatum vitae dolorum qui magnam rem. Ea aut iure harum at est ut accusantium. Rerum sed nulla qui officia velit libero.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(225, 1, 2, 'Ipsa magnam.', 'Ea hic dolorum at maiores at aut optio itaque.', 'Repellendus sunt et ut ut fuga. Natus optio omnis earum quis repellendus. Quaerat nihil ratione illum dolor. Ut nemo impedit provident iusto omnis vero.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(226, 1, 1, 'Ullam ducimus ea.', 'Quas et suscipit recusandae earum ut doloremque velit.', 'Sit est deleniti est mollitia ut nostrum. Fuga sed quibusdam nulla iste ut. Quo quia modi omnis et neque hic.', NULL, '2024-10-17 13:01:35', '2024-10-17 13:01:35'),
(227, 1, 3, 'Numquam quia dolore.', 'Sit totam et delectus et qui enim adipisci eaque consectetur est et aperiam accusamus.', 'Quia tenetur architecto eos quod doloribus qui dignissimos. Aut recusandae nostrum optio qui nam non veniam. Consequatur enim alias dolor dolores.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(228, 1, 1, 'Ex eius et ullam.', 'Illo maxime iste voluptatem non ex adipisci cumque ullam.', 'Rerum similique sequi officia voluptatibus aperiam voluptatem commodi. Tempore est repellat explicabo mollitia et incidunt. Sequi est delectus pariatur odio incidunt sunt facilis. Sint quo aut architecto. Alias corporis nulla quae nam quia fugiat.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(229, 1, 3, 'Numquam sit.', 'Molestiae sequi deserunt ad quis quisquam velit sit dolorem ut ratione dolor.', 'Voluptas qui ullam tenetur sequi. Doloribus quaerat velit dicta assumenda. Fuga ut tempore ut ipsam. Est ipsam veritatis iusto unde beatae optio ab iusto.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(230, 1, 5, 'Nemo sed cum dolor est.', 'Harum aut molestiae est exercitationem voluptas temporibus facilis neque aut ut occaecati.', 'Tempore qui voluptatem iste. Quidem consequatur atque dolores animi quia animi error adipisci. Sapiente molestiae porro labore molestias eum eaque. Quaerat qui pariatur culpa itaque dolor dolore cupiditate ratione.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(231, 1, 1, 'Repellendus modi omnis.', 'Rerum facilis similique ut qui quidem aspernatur corporis dolores omnis quas odio sapiente nulla aliquam.', 'Et quibusdam sed sunt. Suscipit sit labore eveniet sint placeat et quo illo.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(232, 1, 2, 'Perspiciatis harum quis nisi.', 'Sed molestiae a exercitationem labore neque distinctio hic animi eius cumque deleniti est nisi.', 'Vitae sequi ex laudantium vel iure. Nemo consequatur qui est et. Officiis officia et consequuntur laborum recusandae nihil.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(233, 1, 4, 'Consequatur repellendus facere voluptates.', 'Nostrum et nihil dolore magnam eaque autem et occaecati nobis ullam.', 'Sit qui delectus veritatis sit. Qui consequatur quas rem quam exercitationem quis veritatis ipsa. Quis autem est quia et. Veritatis nihil aliquid ipsa assumenda.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(234, 1, 2, 'Quia cumque nemo ratione.', 'Ab et doloribus earum quia dolorem doloremque ipsam.', 'Enim nihil rem sequi iusto quia optio atque. Sapiente facere quam quaerat beatae alias non. Dolores et omnis ipsa cupiditate. Reiciendis omnis sunt eligendi beatae.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(235, 1, 3, 'Unde cum et voluptas.', 'Ab sed nihil cumque qui odio et praesentium laudantium.', 'Esse officiis accusamus consequatur quis ex repudiandae. Harum est qui voluptas ad voluptatem. Atque omnis temporibus incidunt nam. Veritatis illo facilis commodi aut corrupti optio ut.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(236, 1, 4, 'Quia occaecati aut.', 'Amet ut eum tempora non ducimus doloremque repellendus autem.', 'Est tempore quo consequatur maxime. Fugit amet velit facere architecto mollitia. Blanditiis fugiat deserunt atque at in molestias.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(237, 1, 5, 'Asperiores et.', 'Aliquam eius ipsum quis reprehenderit tempore veniam vel ea laborum natus.', 'Ut officiis eveniet voluptates est. Accusantium nihil molestias et quasi ut tenetur harum quia. Aut voluptas ratione molestiae ea error reprehenderit. Dolorem architecto ut fugiat alias voluptatibus adipisci vel.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(238, 1, 5, 'Ratione modi consequatur.', 'Sint eligendi magni rerum sunt ullam beatae animi necessitatibus repudiandae.', 'Nisi praesentium vel expedita necessitatibus sint. Velit cum vitae inventore sint quisquam non. Aut voluptatibus ea blanditiis ut et nihil. Sint aut quo natus neque non quis illo est.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(239, 1, 5, 'Nisi expedita ea.', 'Ut nulla ullam quas qui vel assumenda et dicta facilis expedita id cupiditate ut.', 'Dolores ea minus maiores accusamus nihil. Quod consequatur qui non. Quos voluptates voluptatibus aut. Aliquid odit possimus voluptatum sed quaerat.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(240, 1, 2, 'Similique explicabo velit error.', 'Nihil voluptas impedit quaerat eum itaque voluptatibus ea quasi quam blanditiis.', 'Ad harum sint at consequatur. Blanditiis fugit pariatur est error dolores voluptate voluptates. Quia consectetur voluptatem eos consequatur eius asperiores. Molestias doloremque corrupti officiis tempore sunt numquam.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(241, 1, 3, 'Qui enim reprehenderit qui.', 'Fugiat asperiores possimus saepe vel magni expedita nemo quae ut.', 'Sint nam quis maxime in dolorem est. Natus excepturi occaecati dolorem blanditiis minus. Magnam ut qui ipsum.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(242, 1, 2, 'Enim similique dignissimos.', 'Rerum adipisci odio iure distinctio quidem dolorum minus facere ut quaerat ut minus.', 'Dolore tempore qui dolore et voluptates magni officiis. Qui quam odio maxime fuga porro. Numquam ut illum repudiandae. Et non voluptatibus at minima earum.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(243, 1, 3, 'Voluptate debitis sapiente harum.', 'In ut reprehenderit hic labore est voluptatibus enim alias soluta.', 'Quo quo laboriosam ut delectus voluptatem. Nisi et sunt eos sit suscipit suscipit dolorem. Similique alias distinctio et velit.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(244, 1, 3, 'Id facere doloremque porro.', 'Possimus necessitatibus iure et voluptas accusantium sed neque nesciunt enim.', 'Est exercitationem corrupti repellendus reiciendis exercitationem. Nesciunt voluptas ratione aliquid doloremque quisquam numquam. Accusamus sed iusto maiores provident aut deleniti.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(245, 1, 2, 'Architecto provident tempora.', 'Velit eveniet nihil quo possimus laboriosam et.', 'Deleniti culpa quas qui. Sed sed facilis dolore beatae sequi nemo. Aut quibusdam sed assumenda fuga voluptas aut officia provident. Molestias et voluptate maiores quaerat doloribus. Cum ducimus saepe eligendi delectus aut quis.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(246, 1, 1, 'Non est voluptatem tempora.', 'Dolorum sunt inventore tempore qui perferendis consequatur qui doloribus voluptas voluptatibus perferendis sapiente.', 'Maiores nesciunt incidunt at. Veritatis veritatis error et nemo. Veritatis sit vitae exercitationem itaque. Nulla laboriosam eum eligendi ratione id rerum reprehenderit quas.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(247, 1, 1, 'Autem sequi maiores eligendi.', 'Voluptatem sit repellendus qui dolorem reiciendis natus sequi molestiae nihil molestiae quia at.', 'Sed aspernatur delectus eius ea magnam. Repellendus facere aliquid cumque adipisci perferendis. Possimus dolor repellat incidunt autem. Nulla rerum nemo consectetur alias.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(248, 1, 4, 'Quo voluptatem nulla.', 'Asperiores iste libero id officiis et nostrum tenetur adipisci officia aliquam doloremque veritatis deleniti.', 'Dolor ut in harum vel sed beatae aut deleniti. Hic quis maiores sit.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(249, 1, 4, 'Quam est est ut.', 'Expedita voluptatem excepturi ad quod ut iure nihil omnis id consectetur voluptatem cum.', 'Unde ut quo dolorem velit unde quae. Omnis recusandae nostrum ut porro consequatur optio debitis. Sapiente consectetur exercitationem necessitatibus aperiam hic fuga.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(250, 1, 3, 'Distinctio quas ut.', 'Cum corrupti aut rerum optio dolores ut et.', 'Tempora adipisci cum rerum aperiam perferendis dolores. Ut et aut eligendi nesciunt.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(251, 1, 2, 'Voluptatem voluptatibus voluptatibus et.', 'Quod nobis est quibusdam itaque voluptatem non.', 'Et sint similique eos exercitationem ab. Voluptas quam consequuntur autem nesciunt quia et. Laboriosam ratione accusamus eos et provident nobis doloribus. Incidunt sed ipsam voluptatem voluptatem voluptates eveniet quia.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(252, 1, 1, 'Minima doloribus.', 'Nisi harum ea error eum quod voluptas ea sunt.', 'Sit aut doloremque quia nemo. Amet et consequatur rerum veniam fugiat laborum hic. Enim repudiandae voluptates ut id saepe.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(253, 1, 2, 'Repellat sed ab aut omnis.', 'Officia ea labore non esse provident quis non molestiae nam omnis vero odit.', 'Molestiae eius dolor culpa repellat. Placeat reprehenderit laboriosam ut rem reiciendis et. Hic alias molestiae non fugiat. Exercitationem deleniti ut vel rerum beatae soluta nemo.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(254, 1, 4, 'Nemo labore perferendis.', 'Qui autem libero et minus ipsa numquam enim ut dolorum eos eveniet placeat.', 'Aliquam explicabo ut nostrum sit odio ipsam ratione. Cumque ullam aut eveniet. Qui et fugiat rerum sed velit maxime non.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(255, 1, 1, 'Ea nam excepturi cum.', 'Temporibus praesentium repellendus esse eum molestias qui velit natus ratione aut omnis voluptatem nesciunt.', 'Minima qui qui et similique quidem inventore. Omnis fuga id voluptate nisi cum. Voluptatem ut officiis quia accusamus velit. Rerum qui perspiciatis minima quos deleniti alias.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36'),
(256, 1, 3, 'Qui et optio sunt.', 'Ut dolorum earum cum dolorem consequatur vel doloribus quibusdam omnis quos eaque.', 'Aspernatur voluptatibus est illo corrupti alias iste nihil. Rerum iste eaque aliquam optio recusandae distinctio. Consequatur ullam tempora consequatur voluptate rerum rerum. Asperiores sit enim qui vel adipisci pariatur rerum. Accusamus libero unde sequi neque.', NULL, '2024-10-17 13:01:36', '2024-10-17 13:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`) VALUES
(1, 5, 1, NULL),
(2, 5, 3, NULL),
(3, 5, 6, NULL),
(4, 5, 5, NULL),
(5, 1, 2, NULL),
(6, 1, 1, NULL),
(7, 1, 3, NULL),
(8, 11, 2, NULL),
(9, 11, 1, NULL),
(10, 11, 3, NULL),
(11, 12, 2, NULL),
(12, 12, 1, NULL),
(13, 13, 1, NULL),
(14, 13, 3, NULL),
(15, 14, 2, NULL),
(16, 14, 1, NULL),
(17, 15, 4, NULL),
(18, 15, 6, NULL),
(19, 15, 5, NULL),
(20, 16, 2, NULL),
(21, 16, 1, NULL),
(22, 17, 4, NULL),
(23, 17, 6, NULL),
(24, 18, 1, NULL),
(25, 18, 3, NULL),
(26, 19, 1, NULL),
(27, 19, 3, NULL),
(28, 19, 2, NULL),
(29, 19, 1, NULL),
(30, 19, 1, NULL),
(31, 19, 3, NULL),
(32, 20, 2, NULL),
(33, 20, 3, NULL),
(34, 20, 6, NULL),
(35, 20, 5, NULL),
(36, 21, 2, NULL),
(37, 21, 1, NULL),
(38, 21, 3, NULL),
(39, 21, 4, NULL),
(40, 21, 5, NULL),
(41, 20, 2, NULL),
(42, 20, 3, NULL),
(43, 20, 4, NULL),
(44, 22, 1, NULL),
(45, 22, 6, NULL),
(46, 20, 2, NULL),
(47, 20, 1, NULL),
(48, 20, 3, NULL),
(49, 20, 4, NULL),
(50, 20, 6, NULL),
(51, 20, 5, NULL),
(52, 22, 2, NULL),
(53, 22, 3, NULL),
(54, 24, 1, NULL),
(55, 24, 3, NULL),
(56, 24, 4, NULL),
(57, 24, 6, NULL),
(58, 24, 5, NULL),
(59, 25, 1, NULL),
(60, 25, 3, NULL),
(61, 25, 6, NULL),
(62, 25, 5, NULL),
(63, 25, 3, NULL),
(64, 26, 1, NULL),
(65, 26, 6, NULL),
(66, 26, 5, NULL),
(67, 2, 2, NULL),
(68, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(2, 'Consulting'),
(1, 'Design'),
(3, 'Development'),
(4, 'Marketing'),
(6, 'SEO'),
(5, 'Writing');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `photo`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Deion Abernathy', 'rene01@example.org', NULL, '2024-10-11 06:30:42', '$2y$10$RRxeA7/WjaUjMozlLAAD5ecHiIgvWk7TOOr4fyCSzzZNuDlyRLjoC', 'QhmQj3eEOgqJyVLSx74lztnLgwsTymyDZKZQNtlSjWutIg3U8syxS61t4kZe', '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(2, 'Dominique Gottlieb', 'vonrueden.roscoe@example.com', NULL, '2024-10-11 06:30:42', '$2y$10$RRxeA7/WjaUjMozlLAAD5ecHiIgvWk7TOOr4fyCSzzZNuDlyRLjoC', 'f96sRYC4nGvrXeIhFYIamWMRBFFzOczEf6iTeacrCLoda3fswzEJSA92tSM8', '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(3, 'Hassan Larkin Sr.', 'yundt.nasir@example.org', NULL, '2024-10-11 06:30:42', '$2y$10$RRxeA7/WjaUjMozlLAAD5ecHiIgvWk7TOOr4fyCSzzZNuDlyRLjoC', 'aYzGhi3XrVNUbnTn4NbC7PbEnBQlCBClUbO2KcQOaFAhfLgPgMpzXNJhQsU0', '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(4, 'Dallin Gislason DDS', 'ryleigh69@example.com', NULL, '2024-10-11 06:30:42', '$2y$10$RRxeA7/WjaUjMozlLAAD5ecHiIgvWk7TOOr4fyCSzzZNuDlyRLjoC', 'UIWRAJTcQV', '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(5, 'Dr. Sterling Russel', 'giovanni.runolfsdottir@example.org', NULL, '2024-10-11 06:30:42', '$2y$10$RRxeA7/WjaUjMozlLAAD5ecHiIgvWk7TOOr4fyCSzzZNuDlyRLjoC', '0vhh5QfMz6O0aVLI3usEXpAPUkzORcYBvD9Jq4Lop4h82TmaK1xc1QW6hdcx', '2024-10-11 06:30:42', '2024-10-11 06:30:42'),
(10, 'Bunyod', 'bunyod@gmail.com', NULL, NULL, '$2y$10$qZf9oNZauSVz9I/Aa0Hb7us3D7tuE6ipvzKxZAo5eAcjIAT.4A6LS', NULL, '2024-10-11 13:32:21', '2024-10-11 13:32:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
