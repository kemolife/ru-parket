-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 13 2018 г., 07:54
-- Версия сервера: 10.1.29-MariaDB
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop-new`
--

-- --------------------------------------------------------

--
-- Структура таблицы `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  `consignee` varchar(64) NOT NULL DEFAULT '',
  `country` int(11) DEFAULT '0',
  `province` int(11) DEFAULT '0',
  `city` int(11) DEFAULT '0',
  `district` int(11) DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(16) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `default` int(11) DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `consignee`, `country`, `province`, `city`, `district`, `address`, `zipcode`, `phone`, `mobile`, `email`, `default`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(9, 17, 'kemolife1990', 'kemo', 1, 120000, 120100, 120102, 'Lvіv-poshtamt', '79000', NULL, '23434234', NULL, 0, 1535914635, 1535914734, 17, 17),
(10, 18, 'Lvіv-poshtamt', 'kemolife1990', 1, 140000, 140200, 140221, 'Lvіv-poshtamt', '79000', NULL, '23434234', NULL, 0, 1537731233, 1537731233, 18, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `attribute`
--

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attribute`
--

INSERT INTO `attribute` (`id`, `group_id`, `sort_order`, `name`) VALUES
(1, 6, 1, 'Description'),
(2, 6, 5, 'No. of Cores'),
(3, 6, 3, 'test 1'),
(4, 3, 1, 'test 2'),
(5, 3, 2, 'test 3'),
(6, 3, 3, 'test 4'),
(7, 3, 4, 'test 5'),
(8, 3, 5, 'test 6'),
(9, 3, 6, 'test 7'),
(10, 3, 7, 'test 8'),
(11, 3, 8, 'test 9');

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_group`
--

CREATE TABLE `attribute_group` (
  `id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `image` varchar(64) DEFAULT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `attribute_group`
--

INSERT INTO `attribute_group` (`id`, `sort_order`, `image`, `name`) VALUES
(3, 2, 'upload/attr-group/201809180938002635.svg', 'Memory'),
(4, 1, NULL, 'Technical'),
(5, 3, NULL, 'Motherboard'),
(6, 4, 'upload/attr-group/201809180939321500.svg', 'Processor');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_operation`
--

CREATE TABLE `auth_operation` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_operation`
--

INSERT INTO `auth_operation` (`id`, `parent_id`, `name`) VALUES
(111, 0, 'basic'),
(113, 0, 'user'),
(114, 0, 'role'),
(11101, 111, 'backendLogin'),
(11302, 113, 'viewUser'),
(11303, 113, 'createUser'),
(11304, 113, 'updateUser'),
(11305, 113, 'deleteUser'),
(11402, 114, 'viewRole'),
(11403, 114, 'createRole'),
(11404, 114, 'updateRole'),
(11405, 114, 'deleteRole');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_role`
--

CREATE TABLE `auth_role` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `operation_list` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_role`
--

INSERT INTO `auth_role` (`id`, `name`, `description`, `operation_list`) VALUES
(1, 'Super Admin', '', 'all'),
(3, 'Normal Admin', '', 'backendLogin;viewUser;viewRole');

-- --------------------------------------------------------

--
-- Структура таблицы `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(3) DEFAULT '1',
  `description_big` text,
  `description_small` text,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `banner`
--

INSERT INTO `banner` (`id`, `name`, `status`, `description_big`, `description_small`, `image`, `created_at`) VALUES
(7, 'banner 1', 1, 'Никто не уйдет без подарка', 'Подарок гарантирован каждому покупателю', 'upload/banners/201810030938011929.jpg', '2018-09-09 11:13:31'),
(8, 'banner 2', 1, 'Никто не уйдет без подарка', 'Подарок гарантирован каждому покупателю', 'upload/banners/201810030938175228.jpg', '2018-09-09 11:13:31'),
(9, 'banner 3', 1, 'Никто не уйдет без подарка 1', 'Подарок гарантирован каждому покупателю', 'upload/banners/201810030937393544.jpg', '2018-09-09 11:13:31');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_catalog`
--

CREATE TABLE `blog_catalog` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `surname` varchar(128) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `is_nav` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `page_size` int(11) NOT NULL DEFAULT '10',
  `template` varchar(255) NOT NULL DEFAULT 'post',
  `redirect_url` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blog_catalog`
--

INSERT INTO `blog_catalog` (`id`, `parent_id`, `title`, `surname`, `banner`, `is_nav`, `sort_order`, `page_size`, `template`, `redirect_url`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Статьи', 'articles', 'upload/blog/201810121248249573.jpg', 1, 50, 10, 'post', '', 1, 1536686555, 1539337704),
(2, 0, 'Новости', 'new', 'upload/blog/201810121250321538.jpg', 1, 50, 10, 'post', '', 1, 1536687583, 1539337832);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_comment`
--

CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blog_comment`
--

INSERT INTO `blog_comment` (`id`, `post_id`, `content`, `author`, `email`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты... Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты... Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты...', 'test', 'cubeonlinegmb@gmail.com', '', 1, 1536688530, 1536688530),
(2, 1, 'Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты... Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты... Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты...', 'test1', 'cubeonlinegmb@gmail.com', NULL, 0, 1536696559, 1536696559);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_post`
--

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `brief` text,
  `content` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `surname` varchar(128) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `click` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blog_post`
--

INSERT INTO `blog_post` (`id`, `catalog_id`, `title`, `brief`, `content`, `tags`, `surname`, `banner`, `click`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Новость 1', 'popular', '<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами.</p>\r\n\r\n<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами.</p>\r\n\r\n<p>Взобравшись на первую вершину курсивных гор, бросил он последний взгляд назад, на силуэт своего родного города Буквоград, на заголовок деревни Алфавит и на подзаголовок своего переулка Строчка. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз.</p>\r\n\r\n<ul>\r\n	<li>Далеко-далеко за словесными горами</li>\r\n	<li>Маленький ручеек Даль журчит по всей</li>\r\n	<li>Далеко-далеко за словесными горами</li>\r\n</ul>\r\n\r\n<p>Взобравшись на первую вершину курсивных гор, бросил он последний взгляд назад, на силуэт своего родного города Буквоград, на заголовок деревни Алфавит и на подзаголовок своего переулка Строчка. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз.</p>\r\n\r\n<p><img alt=\"post pic1\" class=\"float-center\" src=\"http://localhost:8080/img/about-2.jpg\" style=\"background-color:rgb(254, 254, 254); border-style:none; box-sizing:border-box; color:rgb(33, 37, 41); display:block; font-family:roboto-regular,-apple-system,blinkmacsystemfont,segoe ui,helvetica neue,arial,sans-serif; font-size:14px; margin-left:auto; margin-right:auto; max-width:1030px; vertical-align:middle\" /></p>\r\n\r\n<p>Возвращайся ты лучше в свою безопасную страну&raquo;. Не послушавшись рукописи, наш текст продолжил свой путь. Вскоре ему повстречался коварный составитель рекламных текстов, напоивший его языком и речью и заманивший в свое агенство, которое использовало его снова и снова в своих проектах. И если его не переписали, то живет он там до сих пор. Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана.</p>\r\n', 'tag1', 'new1', 'upload/blog/201810120302106776.jpg', 30, 18, 1, 1536687359, 1539345730),
(2, 2, 'Новость 3', 'popular', '<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами.</p>\r\n\r\n<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами.</p>\r\n\r\n<p>Взобравшись на первую вершину курсивных гор, бросил он последний взгляд назад, на силуэт своего родного города Буквоград, на заголовок деревни Алфавит и на подзаголовок своего переулка Строчка. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз.</p>\r\n\r\n<ul>\r\n	<li>Далеко-далеко за словесными горами</li>\r\n	<li>Маленький ручеек Даль журчит по всей</li>\r\n	<li>Далеко-далеко за словесными горами</li>\r\n</ul>\r\n\r\n<p>Взобравшись на первую вершину курсивных гор, бросил он последний взгляд назад, на силуэт своего родного города Буквоград, на заголовок деревни Алфавит и на подзаголовок своего переулка Строчка. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз. Грустный реторический вопрос скатился по его щеке и он продолжил свой путь. По дороге встретил текст рукопись. Она предупредила его: &laquo;В моей стране все переписывается по несколько раз.</p>\r\n\r\n<p><img alt=\"post pic1\" class=\"float-center\" src=\"http://localhost:8080/img/about-2.jpg\" style=\"background-color:rgb(254, 254, 254); border-style:none; box-sizing:border-box; color:rgb(33, 37, 41); display:block; font-family:roboto-regular,-apple-system,blinkmacsystemfont,segoe ui,helvetica neue,arial,sans-serif; font-size:14px; margin-left:auto; margin-right:auto; max-width:1030px; vertical-align:middle\" /></p>\r\n\r\n<p>Возвращайся ты лучше в свою безопасную страну&raquo;. Не послушавшись рукописи, наш текст продолжил свой путь. Вскоре ему повстречался коварный составитель рекламных текстов, напоивший его языком и речью и заманивший в свое агенство, которое использовало его снова и снова в своих проектах. И если его не переписали, то живет он там до сих пор. Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана.</p>\r\n', 'tag2', 'new2', 'upload/blog/201810120259006784.jpg', 48, 18, 1, 1536687659, 1539345540);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_tag`
--

CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `frequency` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blog_tag`
--

INSERT INTO `blog_tag` (`id`, `name`, `frequency`) VALUES
(1, 'tag12', 1),
(3, 'tag13', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `bonus`
--

CREATE TABLE `bonus` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bonus_type_id` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `started_at` int(11) NOT NULL,
  `ended_at` int(11) NOT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `used_at` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bonus`
--

INSERT INTO `bonus` (`id`, `user_id`, `bonus_type_id`, `money`, `min_amount`, `started_at`, `ended_at`, `sn`, `order_id`, `used_at`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(10000011, 0, 3, '50.00', '500.00', 1442483647, 1447483647, 'w6ORs_UX', 0, 0, 1425884506, 1425884506, 1, 1),
(10000012, 0, 3, '50.00', '500.00', 1442483647, 1447483647, 'n2P9SIUo', 0, 0, 1425884506, 1425884506, 1, 1),
(10000013, 0, 3, '50.00', '500.00', 1442483647, 1447483647, 'RWXzKuqX', 0, 0, 1425884506, 1425884506, 1, 1),
(10000014, 0, 3, '50.00', '500.00', 1442483647, 1447483647, 'iVPqeeGl', 0, 0, 1425884506, 1425884506, 1, 1),
(10000015, 0, 3, '50.00', '500.00', 1442483647, 1447483647, 'IU2pkCB5', 0, 0, 1425884506, 1425884506, 1, 1),
(10000016, 1, 2, '30.00', '300.00', 2147483647, 2147483647, NULL, 0, 0, 1425884550, 1425884550, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `bonus_type`
--

CREATE TABLE `bonus_type` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `type` int(11) NOT NULL DEFAULT '1',
  `started_at` int(11) NOT NULL,
  `ended_at` int(11) NOT NULL,
  `min_goods_amount` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bonus_type`
--

INSERT INTO `bonus_type` (`id`, `name`, `money`, `min_amount`, `type`, `started_at`, `ended_at`, `min_goods_amount`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, '用户红包', '10.00', '100.00', 1, 2147483647, 2147483647, '0.00', 1425627458, 1425627458, 1, 1),
(2, '订单金额红包', '30.00', '300.00', 3, 2147483647, 2147483647, '200.00', 1425631730, 1425631747, 1, 1),
(3, '线下代码', '50.00', '500.00', 4, 1442483647, 1447483647, '0.00', 1425632582, 1425632608, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` text,
  `url` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `brand`
--

INSERT INTO `brand` (`id`, `name`, `logo`, `description`, `url`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test2', '', 'test2', '', 50, 1, 1427248346, 1539280426),
(2, 'test4', '', 'test5', '', 50, 1, 1427248346, 1539280439),
(3, 'test1', '', 'test1', '', 50, 1, 1427266554, 1539280415);

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `session_id` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int(11) NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `thumb` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `session_id`, `product_id`, `sku`, `name`, `number`, `market_price`, `price`, `thumb`, `type`, `created_at`, `updated_at`) VALUES
(2, 18, 'l0qitf207p8q30djcgk565uetv', 7, 'feilip_9352', 'Hx9352', 1, '1999.00', '1599.00', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 29, 1538324572, 1539265793),
(3, 17, 'rrgpk73cmiinidjohrrv0ntd51', 7, 'feilip_9352', 'tesaf21213', 6, '1999.00', '1599.00', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 29, 1539349338, 1539349338),
(9, 22, '8l0fo0v3304vgndiqu00j1rokh', 7, 'feilip_9352', 'tesaf21213', 5, '1999.00', '1599.00', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 29, 1539358354, 1539358354),
(10, 0, 'cnpbkl0kcda65ob3900npltr82', 7, 'feilip_9352', 'tesaf21213', 1, '1999.00', '1599.00', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 29, 1539361150, 1539361150);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `is_nav` int(11) NOT NULL DEFAULT '1',
  `banner` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` text,
  `redirect_url` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` text,
  `is_same` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `brief`, `is_nav`, `banner`, `keywords`, `description`, `redirect_url`, `sort_order`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `seo_title`, `seo_keywords`, `seo_description`, `is_same`) VALUES
(1, 0, 'Массивная доска', 'mobile', 1, 'upload/category/201809160245541155.jpg', '', '', '', 50, 1, 1422858315, 1537037664, 0, 0, NULL, NULL, NULL, 0),
(2, 0, 'Штучный паркет', 'computer', 1, 'upload/category/201809160246464709.jpg', '', '', '', 50, 1, 1422858539, 1537037573, 0, 0, NULL, NULL, NULL, 0),
(3, 1, 'Дуб', 'iphone', 1, '', '', '', '', 50, 1, 1422858566, 1539281510, 0, 0, NULL, NULL, NULL, 0),
(4, 1, 'Ясень', 'sansung', 1, '', '', '', '', 50, 1, 1422858593, 1539281523, 0, 0, NULL, NULL, NULL, 0),
(5, 2, 'Мербау', '', 0, '', '', '台式机电脑', '', 50, 1, 1424857244, 1539281758, 0, 0, NULL, NULL, NULL, 0),
(6, 2, 'Тик', '', 0, '', '', 'Тик', '', 50, 1, 1424857273, 1539281771, 0, 0, NULL, NULL, NULL, 1),
(7, 2, 'Клен', '', 0, '', '', 'Клен', '', 50, 1, 1424857318, 1539281781, 0, 0, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `client_messages`
--

CREATE TABLE `client_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `client_messages`
--

INSERT INTO `client_messages` (`id`, `name`, `tel`, `area`, `address`, `type`, `status`, `create_date`) VALUES
(1, 'kemo', '121323', NULL, NULL, 1, 1, 1538680608),
(2, 'kemo', '121323', NULL, NULL, 1, 1, 1538680696);

-- --------------------------------------------------------

--
-- Структура таблицы `cms_catalog`
--

CREATE TABLE `cms_catalog` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `brief` varchar(1022) DEFAULT NULL,
  `content` text,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `is_nav` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `page_type` varchar(255) NOT NULL DEFAULT 'page',
  `page_size` int(11) NOT NULL DEFAULT '10',
  `template_list` varchar(255) NOT NULL DEFAULT 'list',
  `template_show` varchar(255) NOT NULL DEFAULT 'show',
  `template_page` varchar(255) NOT NULL DEFAULT 'page',
  `redirect_url` varchar(255) DEFAULT NULL,
  `click` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cms_catalog`
--

INSERT INTO `cms_catalog` (`id`, `parent_id`, `title`, `surname`, `brief`, `content`, `seo_title`, `seo_keywords`, `seo_description`, `banner`, `is_nav`, `sort_order`, `page_type`, `page_size`, `template_list`, `template_show`, `template_page`, `redirect_url`, `click`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, '新手指南', 'getting_start', '', '', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425949502, 1425950562),
(2, 0, '配送政策', 'shipment', '', '', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425949533, 1425949533),
(3, 0, '支付方式', 'payment', '', '', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425949596, 1425949596),
(4, 0, '售后服务', 'after_sales', '', '', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425949619, 1425950281),
(5, 0, '关于商城', 'about_shop', '', '', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425949660, 1425949660),
(11, 1, '免费注册', 'register', '', '<p><input alt=\"\" src=\"http://hikeblog.qiniudn.com/funshopregister1.png\" type=\"image\" /></p>\r\n', '', '', '', '', 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950646, 1425958287),
(12, 1, '购物流程', 'flow', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(13, 1, '会员积分', 'point', '', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong>1、什么是会员积分？</strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;所有会员在称本商城购物，并确认收货后，均可获得等同于购买商品实际支付金额的积分数。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;同时本商城会定期推出各类积分兑换活动，请随时关注活动公告。</p>\r\n\r\n<p><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>2、如何获得积分？</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong>（1）购买商品积分</strong></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; A、每一张成功交易并确认收货的订单，都可获得积分，即您确认收货后才能获得积分，而不是付款后。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; B、不同商品积分标准不同，获得积分以订单提交时所注明的积分为准。（如：购买本商品可得 78 积分）</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; C、同笔订单同款商品购买多件，可获得相应倍数的积分。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong>（2）商品交易评价积分 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;购买过的商品，撰写您对商品的评价，您将获得每件商品5个积分的奖励。上传图片的精彩评价，还将获得每件商品25个积分的额外奖励。同笔订单同款商品只能评价一次。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong>（3）活动积分赠送 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 参与相关活动您可以获得丰厚的积分奖励，请经常关注丽子首页活动。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong> （4）玩游戏得积分 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;去丽子问答与姐妹们分享美妆心得，还能得积分。<a href=\"http://www.lizi.com/ask\" target=\"_blank\">点这里去问答逛逛吧~</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong> （5）LiZi问答得积分 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您可以在&ldquo;我的丽子&mdash;&mdash;账户管理&mdash;&mdash;我的积分&rdquo; &nbsp; &nbsp;查看您的累计积分。</p>\r\n\r\n<p><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>3、如何查看积分 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;您可以在&ldquo;我的丽子&mdash;&mdash;账户管理&mdash;&mdash;我的积分&rdquo;查看您的累计积分。</p>\r\n\r\n<p><br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>4、积分使用 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;会员积分可以抵现金使用， 100个积分=1元。<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>积分使用步骤：</strong>在商品详情页面<br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 点击加入购物车按钮&mdash;&gt;去购物车结算&mdash;&gt;我的购物车&mdash;&gt;去结算&mdash;&gt;使用积分（页面左下角，输入使用积分数量，点击使用）。</p>\r\n\r\n<p><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>订单退款积分处理方式：</strong>订单付款前取消，积分自动返还；订单付款后，订单发生取消、退款、退货等状态变化，积分不再返还。</p>\r\n\r\n<p><br />\r\n&nbsp;<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>5、免责声明 </strong><br />\r\n<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;本商城感谢您访问会员积分计划，本计划由本商城提供。以上计划条款和条件，连同计划有关的任何促销内容的相应条款和条件，</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;构成本计划会员与本商城之间关于制度的完整协议。如果您使用本商城，您就参加了本计划并接受了这些条款、条件、限制和要求。</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;请注意，您本商城的使用以及您的会员资格还受制于本商城网站上更新的所有条款、条件、限制和要求，请仔细阅读这些条款和条件。</p>\r\n', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(14, 1, '优惠券使用', 'bonus', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(15, 1, '常见问题', 'faq', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(21, 2, '包邮说明', 'shipment_free', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(22, 2, '配送范围', 'shipment_area', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(23, 2, '配送费用', 'shipment_fee', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(24, 2, '验货与签收', 'shipment_receive', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(25, 2, '配送查询', 'shipment_search', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(31, 3, '货到付款', 'payment_cod', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(32, 3, '网上支付', 'payment_online', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(41, 4, '正品保障', 'sales_quality', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(42, 4, '售后政策', 'sales_return_policy', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(43, 4, '退换货流程', 'sales_return_flow', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(44, 4, '退款说明', 'sales_return_money', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(45, 4, '取消订单', 'sales_cancel_order', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(51, 5, '关于我们', 'about_us', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(52, 5, '联系我们', 'about_contact', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(53, 5, '商务合作', 'about_cooperation', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(54, 5, '人才招聘', 'about_hr', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005),
(55, 5, '商城协议', 'about_agreement', '', 'content', '', '', '', NULL, 1, 50, 'page', 10, 'list', 'show', 'page', '', 0, 1, 1425950891, 1425951005);

-- --------------------------------------------------------

--
-- Структура таблицы `cms_show`
--

CREATE TABLE `cms_show` (
  `id` int(11) NOT NULL,
  `catalog_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `surname` varchar(128) DEFAULT NULL,
  `brief` varchar(1022) DEFAULT NULL,
  `content` text,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `template_show` varchar(255) NOT NULL DEFAULT 'show',
  `author` varchar(255) NOT NULL DEFAULT 'admin',
  `click` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `star` int(11) NOT NULL DEFAULT '5',
  `content` text NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `up` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `username`, `email`, `product_id`, `order_id`, `star`, `content`, `point`, `up`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(9, NULL, 'test', 'kemolife1990@gmail.com', 7, NULL, 5, 'test', 0, 0, 0, 1537021416, 1537021416, NULL, NULL),
(10, NULL, 'test', 'kemolife1990@gmail.com', 7, NULL, 5, 'test', 0, 0, 0, 1537021464, 1537021464, NULL, NULL),
(11, 18, NULL, NULL, 7, NULL, 5, 'test', 0, 0, 0, 1537024501, 1537024501, NULL, NULL),
(12, 18, NULL, NULL, 8, NULL, 5, 'test test', 0, 0, 0, 1537025648, 1537025648, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `consultation`
--

CREATE TABLE `consultation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `question` text NOT NULL,
  `answer` text,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `consultation`
--

INSERT INTO `consultation` (`id`, `user_id`, `username`, `product_id`, `type`, `question`, `answer`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'admin', 2, 1, '请问这款产品是哪儿产品的？', NULL, 0, 1424673654, 1424673654, 1, 1),
(2, 1, 'admin', 2, 1, '请问还有什么需要注意的？', NULL, 0, 1424674334, 1424674334, 1, 1),
(3, 1, 'admin', 2, 1, '听说这款可以干洗?', '可以', 1, 1424674365, 1424674365, 1, 1),
(4, 1, 'admin', 2, 1, '是不是比较适合早上用？', '是的，早上比较合适', 1, 1424674371, 1424674371, 1, 1),
(5, 1, 'admin', 1, 1, '请问这个有什么副作用吗？', '完全正品，没有副作用', 1, 1424846462, 1424846462, 1, 1),
(6, 1, 'admin', 2, 1, '好用吗', '非常好用', 1, 1427443426, 1427443446, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `coupon`
--

CREATE TABLE `coupon` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_type_id` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `started_at` int(11) NOT NULL,
  `ended_at` int(11) NOT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `used_at` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `coupon`
--

INSERT INTO `coupon` (`id`, `user_id`, `coupon_type_id`, `money`, `min_amount`, `started_at`, `ended_at`, `sn`, `order_id`, `used_at`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(10000011, 1, 1, '10.00', '100.00', 1425949502, 1435949502, NULL, 0, 0, 1426039047, 1426039047, 1, 1),
(10000012, 4, 1, '10.00', '100.00', 1425949502, 1435949502, NULL, 40, 1426154778, 1426039047, 1426154778, 1, 4),
(10000013, 4, 1, '100.00', '10000.00', 1425949502, 1435949502, NULL, 0, 0, 1426042246, 1426042246, 1, 1),
(10000014, 0, 2, '20.00', '200.00', 1423949502, 1431949502, '0xF9pkRk', 0, 0, 1426042320, 1426042320, 1, 1),
(10000015, 0, 2, '20.00', '200.00', 1423949502, 1431949502, 'm0EGgLfk', 0, 0, 1426042320, 1426042320, 1, 1),
(10000016, 0, 2, '20.00', '200.00', 1423949502, 1431949502, '-oMfl6DY', 0, 0, 1426042320, 1426042320, 1, 1),
(10000017, 0, 2, '20.00', '200.00', 1423949502, 1431949502, 'N5IucCqR', 0, 0, 1426042320, 1426042320, 1, 1),
(10000018, 4, 2, '20.00', '200.00', 1423949502, 1431949502, 'aaaaaaaa', 39, 1426154344, 1426042320, 1426154344, 1, 4),
(10000019, 1, 3, '30.00', '300.00', 1423949502, 2147483647, NULL, 0, 0, 1426042388, 1426042388, 1, 1),
(10000020, 4, 3, '30.00', '300.00', 1423949502, 2147483647, NULL, 39, 1426154344, 1426042388, 1426154344, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `coupon_type`
--

CREATE TABLE `coupon_type` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `min_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `type` int(11) NOT NULL DEFAULT '1',
  `started_at` int(11) NOT NULL,
  `ended_at` int(11) NOT NULL,
  `min_goods_amount` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `coupon_type`
--

INSERT INTO `coupon_type` (`id`, `name`, `money`, `min_amount`, `type`, `started_at`, `ended_at`, `min_goods_amount`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, '用户红包', '10.00', '100.00', 1, 1425949502, 1435949502, '0.00', 1426039017, 1426039017, 1, 1),
(2, '随机5个', '20.00', '200.00', 4, 1423949502, 1431949502, '0.00', 1426042302, 1426042302, 1, 1),
(3, '用户30', '30.00', '300.00', 1, 1423949502, 2147483647, '0.00', 1426042374, 1426042374, 1, 1),
(4, '10', '10.00', '0.00', 1, 2015, 1431949502, '0.00', 1426495961, 1426495961, 1, 1),
(5, '10', '0.00', '0.00', 1, 1425139200, 1431949502, '0.00', 1426496140, 1426496140, 1, 1),
(6, '10', '100.00', '500.00', 1, 1427040000, 1427731199, '0.00', 1426496272, 1426496272, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `favorite`
--

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attention` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `favorite`
--

INSERT INTO `favorite` (`id`, `user_id`, `product_id`, `attention`, `created_at`, `updated_at`) VALUES
(7, 1, 3, 0, 1425868210, 1425868210),
(8, 1, 2, 0, 1426479342, 1426479342);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1422844002),
('m140608_201405_user_init', 1422844006),
('m140608_201406_rbac_init', 1422844006),
('m141208_201480_blog_init', 1536605053),
('m141208_201481_cms_init', 1425949196),
('m141208_201488_setting_init', 1425951611),
('m141208_201489_auth_init', 1422844019);

-- --------------------------------------------------------

--
-- Структура таблицы `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `options`
--

INSERT INTO `options` (`id`, `sort_order`, `name`) VALUES
(1, 1, 'Description'),
(2, 5, 'No. of Cores'),
(3, 3, 'test 1'),
(4, 1, 'test 2'),
(5, 2, 'test 3'),
(6, 3, 'test 4'),
(7, 4, 'test 5'),
(8, 5, 'test 6'),
(9, 6, 'test 7'),
(10, 7, 'test 8'),
(11, 8, 'test 9');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sn` varchar(32) NOT NULL,
  `consignee` varchar(64) NOT NULL DEFAULT '',
  `country` int(11) DEFAULT '0',
  `province` int(11) DEFAULT '0',
  `city` int(11) DEFAULT '0',
  `district` int(11) DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(16) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `payment_method` int(11) DEFAULT '0',
  `payment_status` int(11) NOT NULL DEFAULT '2',
  `payment_id` int(11) DEFAULT '0',
  `payment_name` varchar(120) NOT NULL DEFAULT '',
  `payment_fee` decimal(10,2) DEFAULT '0.00',
  `shipment_status` int(11) NOT NULL DEFAULT '0',
  `shipment_id` int(11) DEFAULT '0',
  `shipment_name` varchar(255) DEFAULT NULL,
  `shipment_fee` decimal(10,2) DEFAULT '0.00',
  `amount` decimal(10,2) DEFAULT '0.00',
  `tax` decimal(10,2) DEFAULT '0.00',
  `invoice` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `paid_at` int(11) DEFAULT NULL,
  `shipped_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `user_id`, `sn`, `consignee`, `country`, `province`, `city`, `district`, `address`, `zipcode`, `phone`, `mobile`, `email`, `remark`, `payment_method`, `payment_status`, `payment_id`, `payment_name`, `payment_fee`, `shipment_status`, `shipment_id`, `shipment_name`, `shipment_fee`, `amount`, `tax`, `invoice`, `status`, `paid_at`, `shipped_at`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(27, 1, '201502221439094649', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', NULL, '', 1, 10, 0, '', '0.00', 0, 0, NULL, '8.00', '4006.00', '0.00', NULL, -1, NULL, NULL, 1424587149, 1426479451, 1, 1),
(28, 1, '201502221439355767', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', NULL, '', 2, 20, 0, '', '0.00', 0, 0, NULL, '18.00', '16012.00', '0.00', NULL, 10, NULL, NULL, 1424587175, 1424587175, 1, 1),
(30, 1, '201502221444042625', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', NULL, '', 2, 10, 0, '', '0.00', 0, 0, NULL, '18.00', '8016.00', '0.00', NULL, 10, NULL, NULL, 1424587444, 1424587444, 1, 1),
(32, 1, '201502221449543414', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', NULL, '', 2, 10, 0, '', '0.00', 60, 0, '', '18.00', '8016.00', '0.00', '', 10, NULL, NULL, 1424587794, 1424831239, 1, 1),
(33, 1, '201502221451463217', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', NULL, '', 1, 10, 0, '', '0.00', 0, 0, NULL, '18.00', '2017.00', '0.00', NULL, 20, NULL, NULL, 1424587906, 1424592535, 1, 1),
(34, 1, '201502230855073492', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', '', '13246897856', '', '', 1, 10, 0, '', '0.00', 0, 0, '', '8.00', '2007.00', '0.00', '', -1, NULL, NULL, 1424652907, 1539266663, 1, 17),
(36, 1, '201502251600097369', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', 'admin@demo.com', '', 2, 10, 0, '', '0.00', 0, 0, NULL, '18.00', '6017.00', '0.00', NULL, -1, NULL, NULL, 1424851209, 1425875179, 1, 1),
(37, 1, '201503041600341534', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', 'admin@demo.com', 'haha', 1, 20, 0, '', '0.00', 0, 0, NULL, '8.00', '2007.00', '0.00', NULL, -2, NULL, NULL, 1425456034, 1425873864, 1, 1),
(38, 1, '201503091557582523', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', 'admin@demo.com', '', 1, 20, 0, '', '0.00', 70, 0, NULL, '8.00', '30003.00', '0.00', NULL, 70, NULL, NULL, 1425887878, 1427876009, 1, 1),
(39, 4, '201503121759044018', '斯蒂芬森', 1, 120000, 120100, 120103, '大兴城501', '5123234', NULL, '2342423423423', 'shflg1234@163.com', '', 1, 20, 0, '', '0.00', 0, 0, NULL, '8.00', '5956.95', '0.00', NULL, -1, NULL, NULL, 1426154344, 1539282050, 4, 17),
(40, 4, '201503121806182492', '斯蒂芬森', 1, 120000, 120100, 120103, '大兴城501', '5123234', NULL, '2342423423423', 'shflg1234@163.com', '', 1, 30, 0, '', '0.00', 80, 1, '1234242a', '8.00', '1996.98', '0.00', NULL, -1, NULL, NULL, 1426154778, 1539282046, 4, 17),
(41, 4, '201503130835582500', '斯蒂芬森', 1, 120000, 120100, 120103, '大兴城501', '5123234', NULL, '2342423423423', 'shflg1234@163.com', '', 1, 20, 0, '', '0.00', 0, 0, NULL, '8.00', '2006.97', '0.00', NULL, -1, NULL, NULL, 1426206958, 1539282042, 4, 17),
(42, 4, '201503131118437407', '斯蒂芬森', 1, 120000, 120100, 120103, '大兴城501', '5123234', NULL, '2342423423423', 'shflg1234@163.com', '', 1, 20, 0, '', '0.00', 0, 0, NULL, '8.00', '6007.00', '0.00', NULL, -1, NULL, NULL, 1426216723, 1539282038, 4, 17),
(43, 1, '201503131626024640', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', 'admin@demo.com', '', 2, 10, 0, '', '0.00', 0, 0, NULL, '18.00', '8016.00', '0.00', NULL, 10, NULL, NULL, 1426235162, 1426235162, 1, 1),
(44, 4, '201503161714577297', '斯蒂芬森', 1, 120000, 120100, 120103, '大兴城501', '5123234', NULL, '2342423423423', 'shflg1234@163.com', '', 1, 20, 0, '', '0.00', 0, 0, NULL, '8.00', '2006.99', '0.00', NULL, -1, NULL, NULL, 1426497297, 1539282034, 4, 17),
(45, 4, '201503161715378038', '斯蒂芬森', 1, 120000, 120100, 120103, '大兴城501', '5123234', NULL, '2342423423423', 'shflg1234@163.com', '', 1, 20, 0, '', '0.00', 0, 0, NULL, '8.00', '7.99', '0.00', NULL, -1, NULL, NULL, 1426497337, 1539282027, 4, 17),
(46, 1, '201503260849354224', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', 'admin@demo.com', '', 1, 20, 0, '', '0.00', 0, 0, NULL, '8.00', '1607.00', '0.00', NULL, -1, NULL, NULL, 1427330976, 1539282024, 1, 17),
(47, 1, '201503260912189002', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', 'admin@demo.com', '', 1, 20, 0, '', '0.00', 0, 0, NULL, '8.00', '12800.00', '0.00', NULL, -1, NULL, NULL, 1427332338, 1539282016, 1, 17),
(48, 1, '201504011652182364', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', 'admin@demo.com', '', 0, 20, 0, '', '0.00', 0, 0, NULL, '0.00', '-0.05', '0.00', NULL, -1, NULL, NULL, 1427878338, 1427878338, 1, 1),
(49, 1, '201504011658262183', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', 'admin@demo.com', '', 0, 20, 0, '', '0.00', 0, 0, NULL, '0.00', '0.00', '0.00', NULL, -1, NULL, NULL, 1427878706, 1427878706, 1, 1),
(50, 1, '201504011659379092', 'sdfsdfs', 1, 440000, 440200, 440204, '大兴城501', '123422', NULL, '13246897856', 'admin@demo.com', '', 0, 20, 0, '', '0.00', 0, 0, NULL, '10.00', '9.97', '0.00', NULL, -1, NULL, NULL, 1427878777, 1427878777, 1, 1),
(51, 17, '201809030257336154', 'kemo', 1, 120000, 120100, 120102, 'Lvіv-poshtamt', '79000', NULL, '23434234', 'kemolife1990@gmail.com', '', 1, 20, 0, '', '0.00', 0, 0, NULL, '8.00', '1607.00', '0.00', NULL, -1, NULL, NULL, 1535914653, 1539282019, 17, 17),
(52, 17, '201809030259062865', 'kemo', 1, 120000, 120100, 120102, 'Lvіv-poshtamt', '79000', NULL, '23434234', 'kemolife1990@gmail.com', '', 1, 20, 0, '', '0.00', 0, 0, NULL, '8.00', '1607.00', '0.00', NULL, -1, NULL, NULL, 1535914746, 1539282007, 17, 17),
(53, 17, '201809030307148491', 'kemo', 1, 120000, 120100, 120102, 'Lvіv-poshtamt', '79000', NULL, '23434234', 'kemolife1990@gmail.com', '', 1, 20, 0, '', '0.00', 0, 0, '', '12.00', '1607.00', '0.00', '', -1, NULL, NULL, 1535915234, 1539282003, 17, 17),
(54, 18, '201809232234123931', 'kemolife1990', 1, 140000, 140200, 140221, 'Lvіv-poshtamt', '79000', NULL, '23434234', 'kemolife1991@gmail.com', '', 1, 20, 0, '', '0.00', 0, 0, NULL, '8.00', '8003.00', '0.00', NULL, -1, NULL, NULL, 1537731252, 1538325880, 18, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `order_log`
--

CREATE TABLE `order_log` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_log`
--

INSERT INTO `order_log` (`id`, `order_id`, `status`, `remark`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 46, 20, NULL, 1427330976, 1427330976, 1, 1),
(2, 47, 20, NULL, 1427332338, 1427332338, 1, 1),
(3, 38, 70, NULL, 1427876009, 1427876009, 1, 1),
(4, 48, 20, NULL, 1427878338, 1427878338, 1, 1),
(5, 49, 20, NULL, 1427878706, 1427878706, 1, 1),
(6, 50, 20, NULL, 1427878778, 1427878778, 1, 1),
(7, 53, 20, NULL, 1535915234, 1535915234, 17, 17),
(8, 54, 20, NULL, 1537731252, 1537731252, 18, 18),
(9, 54, -1, NULL, 1538325880, 1538325880, 18, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int(11) NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `thumb` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `user_id`, `order_id`, `product_id`, `sku`, `name`, `number`, `market_price`, `price`, `thumb`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 27, 2, '4s', 'iPhone 4s', 2, '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', 0, 1424587149, 1424587149),
(2, 1, 28, 2, '4s', 'iPhone 4s', 5, '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', 0, 1424587175, 1424587175),
(3, 1, 28, 3, 'iphone6', 'iPhone 6', 1, '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', 0, 1424587175, 1424587175),
(4, 1, 30, 2, '4s', 'iPhone 4s', 1, '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', 0, 1424587444, 1424587444),
(5, 1, 30, 3, 'iphone6', 'iPhone 6', 1, '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', 0, 1424587444, 1424587444),
(6, 1, 32, 3, 'iphone6', 'iPhone 6', 1, '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', 0, 1424587794, 1424587794),
(7, 1, 32, 2, '4s', 'iPhone 4s', 1, '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', 0, 1424587794, 1424587794),
(8, 1, 33, 2, '4s', 'iPhone 4s', 1, '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', 0, 1424587906, 1424587906),
(9, 1, 34, 2, '4s', 'iPhone 4s', 1, '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', 0, 1424652907, 1424652907),
(10, 0, 36, 3, 'iphone6', 'iPhone 6', 1, '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', 0, 1424851209, 1424851209),
(11, 0, 37, 2, '4s', 'iPhone 4s', 1, '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', 0, 1425456034, 1425456034),
(12, 0, 38, 3, 'iphone6', 'iPhone 6', 5, '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', 0, 1425887878, 1425887878),
(13, 0, 39, 3, 'iphone6', 'iPhone 6', 1, '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', 0, 1426154344, 1426154344),
(14, 0, 40, 2, '4s', 'iPhone 4s', 1, '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', 0, 1426154778, 1426154778),
(15, 0, 41, 2, '4s', 'iPhone 4s', 1, '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', 0, 1426206958, 1426206958),
(16, 0, 42, 3, 'iphone6', 'iPhone 6', 1, '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', 0, 1426216723, 1426216723),
(17, 0, 43, 3, 'iphone6', 'iPhone 6', 1, '8666.00', '5999.00', '/upload/201502/small-iphone61.jpg', 0, 1426235162, 1426235162),
(18, 0, 43, 2, '4s', 'iPhone 4s', 1, '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', 0, 1426235162, 1426235162),
(19, 0, 44, 2, '4s', 'iPhone 4s', 1, '2999.00', '1999.00', '/upload/201502/small-iphone4s.jpg', 0, 1426497297, 1426497297),
(20, 0, 46, 8, 'feilip_9352', '飞利浦电动牙刷Hx9353', 1, '1999.00', '1599.00', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 29, 1427330976, 1427330976),
(21, 0, 47, 8, 'feilip_9352', '飞利浦电动牙刷Hx9353', 8, '1999.00', '1599.00', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 29, 1427332338, 1427332338),
(22, 0, 48, 4, 'lenovo', '联想', 1, '0.00', '0.00', '/upload/201502/small-jing.jpg', 0, 1427878338, 1427878338),
(23, 0, 49, 4, 'lenovo', '联想', 1, '0.00', '0.00', '/upload/201502/small-jing.jpg', 0, 1427878706, 1427878706),
(24, 0, 50, 4, 'lenovo', '联想', 1, '0.00', '0.00', '/upload/201502/small-jing.jpg', 0, 1427878778, 1427878778),
(25, 0, 53, 13, 'feilip_9352', '飞利浦电动牙刷Hx9352', 1, '1999.00', '1599.00', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 29, 1535915234, 1535915234),
(26, 0, 54, 8, 'feilip_9352', '飞利浦电动牙刷Hx9353', 3, '1999.00', '1599.00', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 29, 1537731252, 1537731252),
(27, 0, 54, 7, 'feilip_9352', '飞利浦电动牙刷Hx9352', 2, '1999.00', '1599.00', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 29, 1537731252, 1537731252);

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `fee` varchar(64) DEFAULT NULL,
  `description` text,
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `point_log`
--

CREATE TABLE `point_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `point` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `point_log`
--

INSERT INTO `point_log` (`id`, `user_id`, `type`, `point`, `remark`, `balance`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 1, 5, '105021', 50, 1542342423, 1539260836, 1, 17);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `weight` decimal(10,3) NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `brief` varchar(255) DEFAULT NULL,
  `content` text,
  `thumb` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` text,
  `type` int(11) NOT NULL DEFAULT '0',
  `brand_id` int(11) DEFAULT '0',
  `star` decimal(11,2) NOT NULL DEFAULT '5.00',
  `sales` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `box` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `sku`, `stock`, `weight`, `market_price`, `price`, `brief`, `content`, `thumb`, `image`, `origin`, `keywords`, `description`, `type`, `brand_id`, `star`, `sales`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `box`) VALUES
(1, 3, 'Mac Book', 'mac-book', 0, '0.000', '0.00', '0.00', '', 'mac book\r\n\r\nmac book', '/upload/201502/small-macbook-54dda510e3355.jpg', '/upload/201502/macbook-54dda510e3355.jpg', NULL, '', '', 0, 1, '5.00', 0, 1, 1423811521, 1423811921, 1, 1, 1),
(2, 3, 'iPhone 4s', '4s', 999, '0.150', '2999.00', '1999.00', '', '<p>4ss ss s 4s 4s<br />\r\n4s一款非常优秀的手机<br />\r\n欢迎购买</p>\r\n', '/upload/201502/small-iphone4s.jpg', '/upload/201502/iphone4s.jpg', NULL, '', '', 6, 2, '4.82', 1, 1, 1423812146, 1536486898, 1, 18, 1),
(3, 3, 'iPhone 6', 'iphone6', 5, '586.000', '8666.00', '5999.00', '', '<img alt=\"Cetaphil丝塔芙舒特肤温和洗面奶/洁面乳118ml-产品描述\" src=\"http://nalapic.b0.upaiyun.com/67bfb935dd1d.jpg\" /><img alt=\"Cetaphil丝塔芙舒特肤温和洗面奶/洁面乳118ml-产品描述\" src=\"http://nalapic.b0.upaiyun.com/ccca8bb9dea.jpg\" /><img alt=\"Cetaphil丝塔芙舒特肤温和洗面奶/洁面乳118ml-产品描述\" src=\"http://nalapic.b0.upaiyun.com/17898eaa46c22.jpg\" /><img alt=\"Cetaphil丝塔芙舒特肤温和洗面奶/洁面乳118ml-产品描述\" src=\"http://nalapic.b0.upaiyun.com/289721c13374a.jpg\" />', '/upload/201502/small-iphone61.jpg', '/upload/201502/iphone61.jpg', NULL, '', '', 0, 1, '5.00', 0, 1, 1423812269, 1424571576, 1, 1, 1),
(4, 5, 'tweds314212saf', 'lenovo', 17, '0.000', '0.00', '0.00', 'sdfsfdsf', '<p>sdfsfsdf</p>\r\n', '/upload/201502/small-jing.jpg', '/upload/201502/jing.jpg', NULL, '', 'sdfs', 0, NULL, '5.00', 0, 1, 1424939882, 1539281939, 1, 17, 1),
(5, 1, 'aaaaaaaaaaaaaa', 'aaaaaa', 0, '0.000', '0.00', '0.00', '', '<p>aaaaaaaaaaaa</p>\r\n', NULL, NULL, NULL, '', '', 19, 2, '5.00', 0, 1, 1427094473, 1427095472, 1, 1, 1),
(6, 1, 'bbbbbb', 'bbbbbb', 0, '0.000', '0.00', '0.00', '', '<p>assdf</p>\r\n', NULL, NULL, NULL, '', '', 27, 0, '5.00', 0, 1, 1427094992, 1427094992, 1, 1, 1),
(7, 1, 'tesaf21213', 'feilip_9352', 10, '900.000', '1999.00', '1599.00', '', '<p>rwerwer</p>\r\n', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', NULL, '', '', 29, 3, '5.00', 0, 1, 1427166353, 1539281922, 1, 17, 1),
(8, 1, 'test234', 'feilip_9352', 3, '900.000', '1999.00', '1599.00', '', '<p>Lorem Ipsum - це текст-&quot;риба&quot;, що використовується в друкарстві та дизайні.</p>\r\n\r\n<ul>\r\n	<li>Lorem Ipsum є, фактично, стандартною &quot;рибою&quot; аж з XVI сторіччя</li>\r\n	<li>&quot;Риба&quot; не тільки успішно пережила п&#39;ять століть</li>\r\n	<li>завдяки виданню зразків шрифтів Letraset, які містили уривки з Lorem Ipsum</li>\r\n</ul>\r\n\r\n<p>і вдруге - нещодавно завдяки програмам комп&#39;ютерного верстування на кшталт Aldus Pagemaker, які використовували різні версії Lorem Ipsum.</p>\r\n\r\n<p><a href=\"test.html\" title=\"link somewhere\">Технический паспорт</a></p>\r\n\r\n<p><a href=\"test.html\" title=\"link somewhere\">Декларация о соответствии</a></p>\r\n', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', NULL, '', 'Вже давно відомо, що читабельний зміст буде заважати зосередитись людині, яка\r\n                                    оцінює композицію сторінки. Сенс використання Lorem Ipsum полягає в тому, що цей\r\n                                    текст має більш-менш нормальне розподілення літер на відміну від, наприклад,\r\n                                    \"Тут іде текст. Тут іде текст.\" Це робить текст схожим на оповідний. Багато\r\n                                    програм верстування та веб-дизайну використовують Lorem Ipsum як зразок і пошук\r\n                                    за терміном \"lorem ipsum\" відкриє багато веб-сайтів, які знаходяться ще в\r\n                                    зародковому стані. Різні версії Lorem Ipsum з\'явились за минулі роки, деякі\r\n                                    випадково, деякі було створено зумисно (зокрема, жартівливі).', 29, NULL, '5.00', 0, 1, 1427166372, 1539281901, 1, 17, 1),
(9, 6, 'test423', 'feilip_9352', 0, '900.000', '1999.00', '1599.00', '', '<p>test1232</p>\r\n', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', NULL, '', '', 29, NULL, '5.00', 0, 1, 1427166671, 1539281888, 1, 17, 1),
(10, 1, 'test Hx9352 323 121', 'feilip_9352', 15, '900.000', '1999.00', '1599.00', '', '<p>test Hx9352 323 121</p>\r\n', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', NULL, '', '', 29, NULL, '5.00', 0, 1, 1427169146, 1539281866, 1, 17, 1),
(11, 1, 'test Hx9352 323', 'feilip_9352', 10, '900.000', '1999.00', '1599.00', '', '<p>test Hx9352 323</p>\r\n', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', NULL, '', '', 29, 3, '5.00', 0, 1, 1427169158, 1539281843, 1, 17, 1),
(12, 1, 'test Hx9352', 'feilip_9352', 10, '900.000', '1999.00', '1599.00', '', '<p><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_01.jpg\" />,<img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_02.jpg\" /><img src=\"http://hikeblog.qiniudn.com/funshop_feilipu_03.jpg\" /></p>\r\n', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', NULL, '', '', 29, 3, '5.00', 0, 1, 1427341008, 1539280395, 1, 17, 1),
(13, 1, 'test12', 'feilip_9352', 9, '900.000', '1999.00', '1599.00', '', '<p>test&nbsp;</p>\r\n', 'upload/product/201810030317105286.jpg', 'upload/product/201810030317105286.jpg', NULL, '', '', 31, 3, '5.00', 0, 1, 1427341079, 1538569729, 1, 17, 3),
(14, 1, 'test1', '1', 123, '231.000', '1222.00', '3333.00', '', '<p>test</p>\r\n', NULL, NULL, NULL, 'tst', '', 1, 1, '5.00', 0, 1, 1538570504, 1538570504, 17, 17, 3),
(15, 1, 'test1333', '123', 2, '12222.000', '12222.00', '3333.00', '', '', NULL, NULL, NULL, '', '', 0, 3, '5.00', 0, 1, 1538571066, 1538571066, 17, 17, 23),
(16, 1, 'test1333222', '1', 2, '123.000', '2222.00', '3333.00', '', '<p>test</p>\r\n', NULL, NULL, NULL, '', 'test', 6, 2, '5.00', 0, 1, 1538571196, 1538571196, 17, 17, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_attribute`
--

CREATE TABLE `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_attribute`
--

INSERT INTO `product_attribute` (`product_id`, `attribute_id`, `text`) VALUES
(1, 2, '1'),
(2, 4, '16GB'),
(3, 4, '8gb'),
(4, 3, '100mhz'),
(5, 2, '4');

-- --------------------------------------------------------

--
-- Структура таблицы `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `filename` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '50'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_image`
--

INSERT INTO `product_image` (`id`, `product_id`, `filename`, `description`, `image`, `thumb`, `origin`, `sort_order`) VALUES
(1, 1, 'macbook-54dda510e3355.jpg', '', '/upload/201502/macbook-54dda510e3355.jpg', '/upload/201502/small-macbook-54dda510e3355.jpg', NULL, 50),
(2, 2, 'iphone4s.jpg', '', '/upload/201502/iphone4s.jpg', '/upload/201502/small-iphone4s.jpg', NULL, 50),
(3, 3, 'iphone6.jpg', '', '/upload/201502/iphone6.jpg', '/upload/201502/small-iphone6.jpg', NULL, 48),
(4, 3, 'iphone61.jpg', '', '/upload/201502/iphone61.jpg', '/upload/201502/small-iphone61.jpg', NULL, 45),
(5, 3, 'sumsung-54e93c9d44f44.jpg', '', '/upload/201502/sumsung-54e93c9d44f44.jpg', '/upload/201502/small-sumsung-54e93c9d44f44.jpg', NULL, 50),
(6, 4, 'jing.jpg', '', '/upload/201502/jing.jpg', '/upload/201502/small-jing.jpg', NULL, 50),
(7, 9, NULL, NULL, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', NULL, 50),
(8, 9, NULL, NULL, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', NULL, 50),
(9, 7, NULL, NULL, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', NULL, 50),
(10, 7, NULL, NULL, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', NULL, 50),
(12, 8, NULL, NULL, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', NULL, 50),
(13, 10, NULL, NULL, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', NULL, 50),
(14, 11, NULL, NULL, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', NULL, 50),
(15, 11, NULL, NULL, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', NULL, 50),
(16, 12, NULL, NULL, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_01.jpg', NULL, 50),
(17, 12, NULL, NULL, 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', 'http://hikeblog.qiniudn.com/funshop_feilipu_image_02.jpg', NULL, 50),
(24, 13, 'upload/product/201810030317105286.jpg', NULL, 'upload/product/201810030317105286.jpg', 'upload/product/201810030317105286.jpg', NULL, 50),
(25, 14, 'upload/product/201810030350202735.jpg', NULL, 'upload/product/201810030350202735.jpg', 'upload/product/201810030350202735.jpg', NULL, 50),
(26, 16, 'upload/product/201810030353128772.jpg', NULL, 'upload/product/201810030353128772.jpg', 'upload/product/201810030353128772.jpg', NULL, 50);

-- --------------------------------------------------------

--
-- Структура таблицы `product_options`
--

CREATE TABLE `product_options` (
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_options`
--

INSERT INTO `product_options` (`product_id`, `option_id`, `text`) VALUES
(1, 2, '1'),
(1, 4, '16GB'),
(3, 4, '8gb'),
(5, 3, '100mhz'),
(5, 2, '4');

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) NOT NULL DEFAULT '1',
  `birthday` datetime DEFAULT NULL,
  `country` int(11) DEFAULT '0',
  `province` int(11) DEFAULT '0',
  `city` int(11) DEFAULT '0',
  `district` int(11) DEFAULT '0',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `surname`, `avatar_url`, `sex`, `birthday`, `country`, `province`, `city`, `district`, `phone`) VALUES
(1, 'Administration', 'Site', NULL, 1, NULL, 0, 0, 0, 0, '+341243123123'),
(4, NULL, '', NULL, 1, '2004-11-30 00:00:00', 1, 150000, 150200, 150202, '+341243123123'),
(21, 'kemoTest2', NULL, NULL, 1, NULL, 0, 0, 0, 0, '+441628260'),
(22, 'kemo122336565', NULL, NULL, 1, NULL, 0, 0, 0, 0, '+441628260');

-- --------------------------------------------------------

--
-- Структура таблицы `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `language` varchar(16) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `region`
--

INSERT INTO `region` (`id`, `parent_id`, `name`, `path`, `language`, `grade`) VALUES
(1, 0, 'Россия', NULL, NULL, NULL),
(2, 1, 'Москва и Московская обл.', NULL, NULL, NULL),
(3, 1, 'Санкт-Петербург и область', NULL, NULL, NULL),
(4, 1, 'Адыгея', NULL, NULL, NULL),
(5, 1, 'Алтайский край', NULL, NULL, NULL),
(6, 1, 'Амурская обл.', NULL, NULL, NULL),
(7, 1, 'Архангельская обл.', NULL, NULL, NULL),
(8, 1, 'Астраханская обл.', NULL, NULL, NULL),
(9, 1, 'Башкортостан (Башкирия)', NULL, NULL, NULL),
(10, 1, 'Белгородская обл.', NULL, NULL, NULL),
(11, 1, 'Брянская обл.', NULL, NULL, NULL),
(12, 1, 'Бурятия', NULL, NULL, NULL),
(13, 1, 'Владимирская обл.', NULL, NULL, NULL),
(14, 1, 'Волгоградская обл.', NULL, NULL, NULL),
(15, 1, 'Вологодская обл.', NULL, NULL, NULL),
(16, 1, 'Воронежская обл.', NULL, NULL, NULL),
(17, 1, 'Дагестан', NULL, NULL, NULL),
(18, 1, 'Еврейская обл.', NULL, NULL, NULL),
(19, 1, 'Ивановская обл.', NULL, NULL, NULL),
(20, 1, 'Иркутская обл.', NULL, NULL, NULL),
(21, 1, 'Кабардино-Балкария', NULL, NULL, NULL),
(22, 1, 'Калининградская обл.', NULL, NULL, NULL),
(23, 1, 'Калмыкия', NULL, NULL, NULL),
(24, 1, 'Калужская обл.', NULL, NULL, NULL),
(25, 1, 'Камчатская обл.', NULL, NULL, NULL),
(26, 1, 'Карелия', NULL, NULL, NULL),
(27, 1, 'Кемеровская обл.', NULL, NULL, NULL),
(28, 1, 'Кировская обл.', NULL, NULL, NULL),
(29, 1, 'Коми', NULL, NULL, NULL),
(30, 1, 'Костромская обл.', NULL, NULL, NULL),
(31, 1, 'Краснодарский край', NULL, NULL, NULL),
(32, 1, 'Красноярский край', NULL, NULL, NULL),
(33, 1, 'Курганская обл.', NULL, NULL, NULL),
(34, 1, 'Курская обл.', NULL, NULL, NULL),
(35, 1, 'Липецкая обл.', NULL, NULL, NULL),
(36, 1, 'Магаданская обл.', NULL, NULL, NULL),
(37, 1, 'Марий Эл', NULL, NULL, NULL),
(38, 1, 'Мордовия', NULL, NULL, NULL),
(39, 1, 'Мурманская обл.', NULL, NULL, NULL),
(40, 1, 'Нижегородская (Горьковская)', NULL, NULL, NULL),
(41, 1, 'Новгородская обл.', NULL, NULL, NULL),
(42, 1, 'Новосибирская обл.', NULL, NULL, NULL),
(43, 1, 'Омская обл.', NULL, NULL, NULL),
(44, 1, 'Оренбургская обл.', NULL, NULL, NULL),
(45, 1, 'Орловская обл.', NULL, NULL, NULL),
(46, 1, 'Пензенская обл.', NULL, NULL, NULL),
(47, 1, 'Пермский край', NULL, NULL, NULL),
(48, 1, 'Приморский край', NULL, NULL, NULL),
(49, 1, 'Псковская обл.', NULL, NULL, NULL),
(50, 1, 'Ростовская обл.', NULL, NULL, NULL),
(51, 1, 'Рязанская обл.', NULL, NULL, NULL),
(52, 1, 'Самарская обл.', NULL, NULL, NULL),
(53, 1, 'Саратовская обл.', NULL, NULL, NULL),
(54, 1, 'Саха (Якутия)', NULL, NULL, NULL),
(55, 1, 'Сахалин', NULL, NULL, NULL),
(56, 1, 'Свердловская обл.', NULL, NULL, NULL),
(57, 1, 'Северная Осетия', NULL, NULL, NULL),
(58, 1, 'Смоленская обл.', NULL, NULL, NULL),
(59, 1, 'Ставропольский край', NULL, NULL, NULL),
(60, 1, 'Тамбовская обл.', NULL, NULL, NULL),
(61, 1, 'Татарстан', NULL, NULL, NULL),
(62, 1, 'Тверская обл.', NULL, NULL, NULL),
(63, 1, 'Томская обл.', NULL, NULL, NULL),
(64, 1, 'Тува (Тувинская Респ.)', NULL, NULL, NULL),
(65, 1, 'Тульская обл.', NULL, NULL, NULL),
(66, 1, 'Тюменская обл. и Ханты-Мансийский АО', NULL, NULL, NULL),
(67, 1, 'Удмуртия', NULL, NULL, NULL),
(68, 1, 'Ульяновская обл.', NULL, NULL, NULL),
(69, 1, 'Уральская обл.', NULL, NULL, NULL),
(70, 1, 'Хабаровский край', NULL, NULL, NULL),
(71, 1, 'Хакасия', NULL, NULL, NULL),
(72, 1, 'Челябинская обл.', NULL, NULL, NULL),
(73, 1, 'Чечено-Ингушетия', NULL, NULL, NULL),
(74, 1, 'Читинская обл.', NULL, NULL, NULL),
(75, 1, 'Чувашия', NULL, NULL, NULL),
(76, 1, 'Чукотский АО', NULL, NULL, NULL),
(77, 1, 'Ямало-Ненецкий АО', NULL, NULL, NULL),
(78, 1, 'Ярославская обл.', NULL, NULL, NULL),
(79, 1, 'Карачаево-Черкесская Республика', NULL, NULL, NULL),
(80, 1, 'Крым', NULL, NULL, NULL),
(81, 2, 'Москва', NULL, NULL, NULL),
(82, 2, 'Абрамцево', NULL, NULL, NULL),
(83, 2, 'Алабино', NULL, NULL, NULL),
(84, 2, 'Апрелевка', NULL, NULL, NULL),
(85, 2, 'Архангельское', NULL, NULL, NULL),
(86, 2, 'Ашитково', NULL, NULL, NULL),
(87, 2, 'Байконур', NULL, NULL, NULL),
(88, 2, 'Бакшеево', NULL, NULL, NULL),
(89, 2, 'Балашиха', NULL, NULL, NULL),
(90, 2, 'Барыбино', NULL, NULL, NULL),
(91, 2, 'Белозёрский', NULL, NULL, NULL),
(92, 2, 'Белоомут', NULL, NULL, NULL),
(93, 2, 'Белые Столбы', NULL, NULL, NULL),
(94, 2, 'Бородино (Московская обл.)', NULL, NULL, NULL),
(95, 2, 'Бронницы', NULL, NULL, NULL),
(96, 2, 'Быково (Московская обл.)', NULL, NULL, NULL),
(97, 2, 'Валуево', NULL, NULL, NULL),
(98, 2, 'Вербилки', NULL, NULL, NULL),
(99, 2, 'Верея', NULL, NULL, NULL),
(100, 2, 'Видное', NULL, NULL, NULL),
(101, 2, 'Внуково', NULL, NULL, NULL),
(102, 2, 'Вождь Пролетариата', NULL, NULL, NULL),
(103, 2, 'Волоколамск', NULL, NULL, NULL),
(104, 2, 'Вороново', NULL, NULL, NULL),
(105, 2, 'Воскресенск', NULL, NULL, NULL),
(106, 2, 'Восточный', NULL, NULL, NULL),
(107, 2, 'Востряково', NULL, NULL, NULL),
(108, 2, 'Высоковск', NULL, NULL, NULL),
(109, 2, 'Голицыно (Московская обл.)', NULL, NULL, NULL),
(110, 2, 'Деденево', NULL, NULL, NULL),
(111, 2, 'Дедовск', NULL, NULL, NULL),
(112, 2, 'Дзержинский', NULL, NULL, NULL),
(113, 2, 'Дмитров', NULL, NULL, NULL),
(114, 2, 'Долгопрудный', NULL, NULL, NULL),
(115, 2, 'Домодедово', NULL, NULL, NULL),
(116, 2, 'Дорохово', NULL, NULL, NULL),
(117, 2, 'Дрезна', NULL, NULL, NULL),
(118, 2, 'Дубки', NULL, NULL, NULL),
(119, 2, 'Дубна', NULL, NULL, NULL),
(120, 2, 'Егорьевск', NULL, NULL, NULL),
(121, 2, 'Железнодорожный (Московск.)', NULL, NULL, NULL),
(122, 2, 'Жилево', NULL, NULL, NULL),
(123, 2, 'Жуковка', NULL, NULL, NULL),
(124, 2, 'Жуковский', NULL, NULL, NULL),
(125, 2, 'Загорск', NULL, NULL, NULL),
(126, 2, 'Загорянский', NULL, NULL, NULL),
(127, 2, 'Запрудная', NULL, NULL, NULL),
(128, 2, 'Зарайск', NULL, NULL, NULL),
(129, 2, 'Звенигород', NULL, NULL, NULL),
(130, 2, 'Зеленоград', NULL, NULL, NULL),
(131, 2, 'Ивантеевка (Московская обл.)', NULL, NULL, NULL),
(132, 2, 'Икша', NULL, NULL, NULL),
(133, 2, 'Ильинский (Московская обл.)', NULL, NULL, NULL),
(134, 2, 'Истра', NULL, NULL, NULL),
(135, 2, 'Калининец', NULL, NULL, NULL),
(136, 2, 'Кашира', NULL, NULL, NULL),
(137, 2, 'Керва', NULL, NULL, NULL),
(138, 2, 'Климовск', NULL, NULL, NULL),
(139, 2, 'Клин', NULL, NULL, NULL),
(140, 2, 'Клязьма', NULL, NULL, NULL),
(141, 2, 'Кожино', NULL, NULL, NULL),
(142, 2, 'Кокошкино', NULL, NULL, NULL),
(143, 2, 'Коломна', NULL, NULL, NULL),
(144, 2, 'Колюбакино', NULL, NULL, NULL),
(145, 2, 'Королев', NULL, NULL, NULL),
(146, 2, 'Косино', NULL, NULL, NULL),
(147, 2, 'Котельники', NULL, NULL, NULL),
(148, 2, 'Красково', NULL, NULL, NULL),
(149, 2, 'Красноармейск (Московская обл.)', NULL, NULL, NULL),
(150, 2, 'Красногорск', NULL, NULL, NULL),
(151, 2, 'Краснозаводск', NULL, NULL, NULL),
(152, 2, 'Краснознаменск (Московская обл.)', NULL, NULL, NULL),
(153, 2, 'Красный Ткач', NULL, NULL, NULL),
(154, 2, 'Крюково', NULL, NULL, NULL),
(155, 2, 'Кубинка', NULL, NULL, NULL),
(156, 2, 'Купавна', NULL, NULL, NULL),
(157, 2, 'Куровское', NULL, NULL, NULL),
(158, 2, 'Лесной Городок', NULL, NULL, NULL),
(159, 2, 'Ликино-Дулево', NULL, NULL, NULL),
(160, 2, 'Лобня', NULL, NULL, NULL),
(161, 2, 'Лопатинский', NULL, NULL, NULL),
(162, 2, 'Лосино-Петровский', NULL, NULL, NULL),
(163, 2, 'Лотошино', NULL, NULL, NULL),
(164, 2, 'Лукино', NULL, NULL, NULL),
(165, 2, 'Луховицы', NULL, NULL, NULL),
(166, 2, 'Лыткарино', NULL, NULL, NULL),
(167, 2, 'Львовский', NULL, NULL, NULL),
(168, 2, 'Люберцы', NULL, NULL, NULL),
(169, 2, 'Малаховка', NULL, NULL, NULL),
(170, 2, 'Михайловское', NULL, NULL, NULL),
(171, 2, 'Михнево', NULL, NULL, NULL),
(172, 2, 'Можайск', NULL, NULL, NULL),
(173, 2, 'Монино', NULL, NULL, NULL),
(174, 2, 'Московский', NULL, NULL, NULL),
(175, 2, 'Муханово', NULL, NULL, NULL),
(176, 2, 'Мытищи', NULL, NULL, NULL),
(177, 2, 'Нарофоминск', NULL, NULL, NULL),
(178, 2, 'Нахабино', NULL, NULL, NULL),
(179, 2, 'Некрасовка', NULL, NULL, NULL),
(180, 2, 'Немчиновка', NULL, NULL, NULL),
(181, 2, 'Новобратцевский', NULL, NULL, NULL),
(182, 2, 'Новоподрезково', NULL, NULL, NULL),
(183, 2, 'Ногинск', NULL, NULL, NULL),
(184, 2, 'Обухово', NULL, NULL, NULL),
(185, 2, 'Одинцово', NULL, NULL, NULL),
(186, 2, 'Ожерелье', NULL, NULL, NULL),
(187, 2, 'Озеры', NULL, NULL, NULL),
(188, 2, 'Октябрьский (Московская обл.)', NULL, NULL, NULL),
(189, 2, 'Опалиха', NULL, NULL, NULL),
(190, 2, 'Орехово-Зуево', NULL, NULL, NULL),
(191, 2, 'Павловский Посад', NULL, NULL, NULL),
(192, 2, 'Первомайский (Московская обл.)', NULL, NULL, NULL),
(193, 2, 'Пески (Московская обл.)', NULL, NULL, NULL),
(194, 2, 'Пироговский', NULL, NULL, NULL),
(195, 2, 'Подольск', NULL, NULL, NULL),
(196, 2, 'Полушкино', NULL, NULL, NULL),
(197, 2, 'Правдинский', NULL, NULL, NULL),
(198, 2, 'Привокзальный', NULL, NULL, NULL),
(199, 2, 'Пролетарский', NULL, NULL, NULL),
(200, 2, 'Протвино (Московская обл.)', NULL, NULL, NULL),
(201, 2, 'Пушкино', NULL, NULL, NULL),
(202, 2, 'Пущино', NULL, NULL, NULL),
(203, 2, 'Раменское', NULL, NULL, NULL),
(204, 2, 'Реутов', NULL, NULL, NULL),
(205, 2, 'Решетниково', NULL, NULL, NULL),
(206, 2, 'Родники (Московская обл.)', NULL, NULL, NULL),
(207, 2, 'Рошаль', NULL, NULL, NULL),
(208, 2, 'Рублево', NULL, NULL, NULL),
(209, 2, 'Руза', NULL, NULL, NULL),
(210, 2, 'Салтыковка', NULL, NULL, NULL),
(211, 2, 'Северный', NULL, NULL, NULL),
(212, 2, 'Сергиев Посад', NULL, NULL, NULL),
(213, 2, 'Серебряные Пруды', NULL, NULL, NULL),
(214, 2, 'Серпухов', NULL, NULL, NULL),
(215, 2, 'Солнечногорск', NULL, NULL, NULL),
(216, 2, 'Солнцево', NULL, NULL, NULL),
(217, 2, 'Софрино', NULL, NULL, NULL),
(218, 2, 'Старая Купавна', NULL, NULL, NULL),
(219, 2, 'Старбеево', NULL, NULL, NULL),
(220, 2, 'Ступино', NULL, NULL, NULL),
(221, 2, 'Сходня', NULL, NULL, NULL),
(222, 2, 'Талдом', NULL, NULL, NULL),
(223, 2, 'Текстильщик', NULL, NULL, NULL),
(224, 2, 'Темпы', NULL, NULL, NULL),
(225, 2, 'Томилино', NULL, NULL, NULL),
(226, 2, 'Троицк', NULL, NULL, NULL),
(227, 2, 'Туголесский Бор', NULL, NULL, NULL),
(228, 2, 'Тучково', NULL, NULL, NULL),
(229, 2, 'Уваровка', NULL, NULL, NULL),
(230, 2, 'Удельная', NULL, NULL, NULL),
(231, 2, 'Успенское', NULL, NULL, NULL),
(232, 2, 'Фирсановка', NULL, NULL, NULL),
(233, 2, 'Фрязино', NULL, NULL, NULL),
(234, 2, 'Фряново', NULL, NULL, NULL),
(235, 2, 'Химки', NULL, NULL, NULL),
(236, 2, 'Хотьково', NULL, NULL, NULL),
(237, 2, 'Черкизово', NULL, NULL, NULL),
(238, 2, 'Черноголовка', NULL, NULL, NULL),
(239, 2, 'Черусти', NULL, NULL, NULL),
(240, 2, 'Чехов', NULL, NULL, NULL),
(241, 2, 'Шарапово', NULL, NULL, NULL),
(242, 2, 'Шатура', NULL, NULL, NULL),
(243, 2, 'Шатурторф', NULL, NULL, NULL),
(244, 2, 'Шаховская', NULL, NULL, NULL),
(245, 2, 'Шереметьевский', NULL, NULL, NULL),
(246, 2, 'Щелково', NULL, NULL, NULL),
(247, 2, 'Щербинка', NULL, NULL, NULL),
(248, 2, 'Электрогорск', NULL, NULL, NULL),
(249, 2, 'Электросталь', NULL, NULL, NULL),
(250, 2, 'Электроугли', NULL, NULL, NULL),
(251, 2, 'Юбилейный (Московская обл.)', NULL, NULL, NULL),
(252, 2, 'Яхрома', NULL, NULL, NULL),
(253, 3, 'Санкт-Петербург', NULL, NULL, NULL),
(254, 3, 'Александровская', NULL, NULL, NULL),
(255, 3, 'Бокситогорск', NULL, NULL, NULL),
(256, 3, 'Большая Ижора', NULL, NULL, NULL),
(257, 3, 'Будогощь', NULL, NULL, NULL),
(258, 3, 'Вознесенье', NULL, NULL, NULL),
(259, 3, 'Волосово', NULL, NULL, NULL),
(260, 3, 'Волхов', NULL, NULL, NULL),
(261, 3, 'Всеволожск', NULL, NULL, NULL),
(262, 3, 'Выборг', NULL, NULL, NULL),
(263, 3, 'Вырица', NULL, NULL, NULL),
(264, 3, 'Высоцк', NULL, NULL, NULL),
(265, 3, 'Гатчина', NULL, NULL, NULL),
(266, 3, 'Дружная Горка', NULL, NULL, NULL),
(267, 3, 'Дубровка', NULL, NULL, NULL),
(268, 3, 'Ефимовский', NULL, NULL, NULL),
(269, 3, 'Зеленогорск (Ленинградская обл.)', NULL, NULL, NULL),
(270, 3, 'Ивангород', NULL, NULL, NULL),
(271, 3, 'Каменногорск', NULL, NULL, NULL),
(272, 3, 'Кикерино', NULL, NULL, NULL),
(273, 3, 'Кингисепп', NULL, NULL, NULL),
(274, 3, 'Кириши', NULL, NULL, NULL),
(275, 3, 'Кировск', NULL, NULL, NULL),
(276, 3, 'Кобринское', NULL, NULL, NULL),
(277, 3, 'Колпино', NULL, NULL, NULL),
(278, 3, 'Коммунар', NULL, NULL, NULL),
(279, 3, 'Коммунар', NULL, NULL, NULL),
(280, 3, 'Кронштадт', NULL, NULL, NULL),
(281, 3, 'Лисий Нос', NULL, NULL, NULL),
(282, 3, 'Лодейное Поле', NULL, NULL, NULL),
(283, 3, 'Ломоносов', NULL, NULL, NULL),
(284, 3, 'Луга', NULL, NULL, NULL),
(285, 3, 'Павловск (Ленинградская обл.)', NULL, NULL, NULL),
(286, 3, 'Парголово', NULL, NULL, NULL),
(287, 3, 'Петродворец', NULL, NULL, NULL),
(288, 3, 'Пикалёво', NULL, NULL, NULL),
(289, 3, 'Подпорожье', NULL, NULL, NULL),
(290, 3, 'Приозерск', NULL, NULL, NULL),
(291, 3, 'Пушкин', NULL, NULL, NULL),
(292, 3, 'Светогорск', NULL, NULL, NULL),
(293, 3, 'Сертолово', NULL, NULL, NULL),
(294, 3, 'Сестрорецк', NULL, NULL, NULL),
(295, 3, 'Сланцы', NULL, NULL, NULL),
(296, 3, 'Сосновый Бор', NULL, NULL, NULL),
(297, 3, 'Тихвин', NULL, NULL, NULL),
(298, 3, 'Тосно', NULL, NULL, NULL),
(299, 3, 'Шлиссельбург', NULL, NULL, NULL),
(300, 4, 'Адыгейск', NULL, NULL, NULL),
(301, 4, 'Майкоп (Адыгея)', NULL, NULL, NULL),
(302, 5, 'Акташ', NULL, NULL, NULL),
(303, 5, 'Акутиха', NULL, NULL, NULL),
(304, 5, 'Алейск', NULL, NULL, NULL),
(305, 5, 'Алтайский', NULL, NULL, NULL),
(306, 5, 'Баево', NULL, NULL, NULL),
(307, 5, 'Барнаул', NULL, NULL, NULL),
(308, 5, 'Белово (Алтайский край)', NULL, NULL, NULL),
(309, 5, 'Белокуриха', NULL, NULL, NULL),
(310, 5, 'Белоярск', NULL, NULL, NULL),
(311, 5, 'Бийск', NULL, NULL, NULL),
(312, 5, 'Благовещенск', NULL, NULL, NULL),
(313, 5, 'Боровлянка', NULL, NULL, NULL),
(314, 5, 'Бурла', NULL, NULL, NULL),
(315, 5, 'Бурсоль', NULL, NULL, NULL),
(316, 5, 'Быстрый Исток', NULL, NULL, NULL),
(317, 5, 'Волчиха', NULL, NULL, NULL),
(318, 5, 'Горно-Алтайск', NULL, NULL, NULL),
(319, 5, 'Горняк', NULL, NULL, NULL),
(320, 5, 'Ельцовка', NULL, NULL, NULL),
(321, 5, 'Залесово', NULL, NULL, NULL),
(322, 5, 'Заринск', NULL, NULL, NULL),
(323, 5, 'Заток', NULL, NULL, NULL),
(324, 5, 'Змеиногорск', NULL, NULL, NULL),
(325, 5, 'Камень-на-Оби', NULL, NULL, NULL),
(326, 5, 'Ключи (Алтайский край)', NULL, NULL, NULL),
(327, 5, 'Кош-Агач', NULL, NULL, NULL),
(328, 5, 'Красногорское (Алтайский край)', NULL, NULL, NULL),
(329, 5, 'Краснощеково', NULL, NULL, NULL),
(330, 5, 'Кулунда', NULL, NULL, NULL),
(331, 5, 'Кытманово', NULL, NULL, NULL),
(332, 5, 'Мамонтово', NULL, NULL, NULL),
(333, 5, 'Новичиха', NULL, NULL, NULL),
(334, 5, 'Новоалтайск', NULL, NULL, NULL),
(335, 5, 'Онгудай', NULL, NULL, NULL),
(336, 5, 'Павловск (Алтайский край)', NULL, NULL, NULL),
(337, 5, 'Петропавловское', NULL, NULL, NULL),
(338, 5, 'Поспелиха', NULL, NULL, NULL),
(339, 5, 'Ребриха', NULL, NULL, NULL),
(340, 5, 'Родино', NULL, NULL, NULL),
(341, 5, 'Рубцовск', NULL, NULL, NULL),
(342, 5, 'Славгород', NULL, NULL, NULL),
(343, 5, 'Смоленское', NULL, NULL, NULL),
(344, 5, 'Солонешное', NULL, NULL, NULL),
(345, 5, 'Солтон', NULL, NULL, NULL),
(346, 5, 'Староаллейское', NULL, NULL, NULL),
(347, 5, 'Табуны', NULL, NULL, NULL),
(348, 5, 'Тальменка', NULL, NULL, NULL),
(349, 5, 'Тогул', NULL, NULL, NULL),
(350, 5, 'Топчиха', NULL, NULL, NULL),
(351, 5, 'Троицкое (Алтайский край)', NULL, NULL, NULL),
(352, 5, 'Турочак', NULL, NULL, NULL),
(353, 5, 'Тюменцево', NULL, NULL, NULL),
(354, 5, 'Угловское', NULL, NULL, NULL),
(355, 5, 'Усть-Калманка', NULL, NULL, NULL),
(356, 5, 'Усть-Кан', NULL, NULL, NULL),
(357, 5, 'Усть-Кокса', NULL, NULL, NULL),
(358, 5, 'Усть-Улаган', NULL, NULL, NULL),
(359, 5, 'Усть-Чарышская Пристань', NULL, NULL, NULL),
(360, 5, 'Хабары', NULL, NULL, NULL),
(361, 5, 'Целинное', NULL, NULL, NULL),
(362, 5, 'Чарышское', NULL, NULL, NULL),
(363, 5, 'Шебалино', NULL, NULL, NULL),
(364, 5, 'Шелаболиха', NULL, NULL, NULL),
(365, 5, 'Шипуново', NULL, NULL, NULL),
(366, 6, 'Айгунь', NULL, NULL, NULL),
(367, 6, 'Архара', NULL, NULL, NULL),
(368, 6, 'Белогорск', NULL, NULL, NULL),
(369, 6, 'Благовещенск (Амурская обл.)', NULL, NULL, NULL),
(370, 6, 'Бурея', NULL, NULL, NULL),
(371, 6, 'Возжаевка', NULL, NULL, NULL),
(372, 6, 'Екатеринославка', NULL, NULL, NULL),
(373, 6, 'Ерофей Павлович', NULL, NULL, NULL),
(374, 6, 'Завитинск', NULL, NULL, NULL),
(375, 6, 'Зея', NULL, NULL, NULL),
(376, 6, 'Златоустовск', NULL, NULL, NULL),
(377, 6, 'Ивановка', NULL, NULL, NULL),
(378, 6, 'Коболдо', NULL, NULL, NULL),
(379, 6, 'Магдагачи', NULL, NULL, NULL),
(380, 6, 'Новобурейский', NULL, NULL, NULL),
(381, 6, 'Поярково', NULL, NULL, NULL),
(382, 6, 'Райчихинск', NULL, NULL, NULL),
(383, 6, 'Ромны', NULL, NULL, NULL),
(384, 6, 'Свободный', NULL, NULL, NULL),
(385, 6, 'Серышево', NULL, NULL, NULL),
(386, 6, 'Сковородино', NULL, NULL, NULL),
(387, 6, 'Стойба', NULL, NULL, NULL),
(388, 6, 'Тамбовка', NULL, NULL, NULL),
(389, 6, 'Тында', NULL, NULL, NULL),
(390, 6, 'Февральск', NULL, NULL, NULL),
(391, 6, 'Шимановск', NULL, NULL, NULL),
(392, 6, 'Экимчан', NULL, NULL, NULL),
(393, 6, 'Ядрино', NULL, NULL, NULL),
(394, 7, 'Амдерма', NULL, NULL, NULL),
(395, 7, 'Архангельск', NULL, NULL, NULL),
(396, 7, 'Березник', NULL, NULL, NULL),
(397, 7, 'Вельск', NULL, NULL, NULL),
(398, 7, 'Верхняя Тойма', NULL, NULL, NULL),
(399, 7, 'Волошка', NULL, NULL, NULL),
(400, 7, 'Вычегодский', NULL, NULL, NULL),
(401, 7, 'Емца', NULL, NULL, NULL),
(402, 7, 'Илеза', NULL, NULL, NULL),
(403, 7, 'Ильинско-Подомское', NULL, NULL, NULL),
(404, 7, 'Каргополь (Архангельская обл.)', NULL, NULL, NULL),
(405, 7, 'Карпогоры', NULL, NULL, NULL),
(406, 7, 'Кодино', NULL, NULL, NULL),
(407, 7, 'Коноша', NULL, NULL, NULL),
(408, 7, 'Коряжма', NULL, NULL, NULL),
(409, 7, 'Котлас', NULL, NULL, NULL),
(410, 7, 'Красноборск', NULL, NULL, NULL),
(411, 7, 'Лешуконское', NULL, NULL, NULL),
(412, 7, 'Мезень', NULL, NULL, NULL),
(413, 7, 'Мирный (Архангельская обл.)', NULL, NULL, NULL),
(414, 7, 'Нарьян-Мар', NULL, NULL, NULL),
(415, 7, 'Новодвинск', NULL, NULL, NULL),
(416, 7, 'Няндома', NULL, NULL, NULL),
(417, 7, 'Онега', NULL, NULL, NULL),
(418, 7, 'Пинега', NULL, NULL, NULL),
(419, 7, 'Плесецк', NULL, NULL, NULL),
(420, 7, 'Савинск', NULL, NULL, NULL),
(421, 7, 'Северодвинск', NULL, NULL, NULL),
(422, 7, 'Сольвычегодск', NULL, NULL, NULL),
(423, 7, 'Холмогоры', NULL, NULL, NULL),
(424, 7, 'Шенкурск', NULL, NULL, NULL),
(425, 7, 'Яренск', NULL, NULL, NULL),
(426, 8, 'Астрахань', NULL, NULL, NULL),
(427, 8, 'Ахтубинск', NULL, NULL, NULL),
(428, 8, 'Верхний Баскунчак', NULL, NULL, NULL),
(429, 8, 'Володарский', NULL, NULL, NULL),
(430, 8, 'Енотаевка', NULL, NULL, NULL),
(431, 8, 'Икряное', NULL, NULL, NULL),
(432, 8, 'Камызяк', NULL, NULL, NULL),
(433, 8, 'Капустин Яр', NULL, NULL, NULL),
(434, 8, 'Красный Яр (Астраханская обл.)', NULL, NULL, NULL),
(435, 8, 'Лиман', NULL, NULL, NULL),
(436, 8, 'Началово', NULL, NULL, NULL),
(437, 8, 'Харабали', NULL, NULL, NULL),
(438, 8, 'Черный Яр', NULL, NULL, NULL),
(439, 9, 'Агидель', NULL, NULL, NULL),
(440, 9, 'Аксаково', NULL, NULL, NULL),
(441, 9, 'Амзя', NULL, NULL, NULL),
(442, 9, 'Архангелькое', NULL, NULL, NULL),
(443, 9, 'Аскарово', NULL, NULL, NULL),
(444, 9, 'Аскино', NULL, NULL, NULL),
(445, 9, 'Баймак', NULL, NULL, NULL),
(446, 9, 'Бакалы', NULL, NULL, NULL),
(447, 9, 'Белебей', NULL, NULL, NULL),
(448, 9, 'Белорецк', NULL, NULL, NULL),
(449, 9, 'Бижбуляк', NULL, NULL, NULL),
(450, 9, 'Бирск', NULL, NULL, NULL),
(451, 9, 'Благовещенск (Башкирия)', NULL, NULL, NULL),
(452, 9, 'Большеустьикинское', NULL, NULL, NULL),
(453, 9, 'Бураево', NULL, NULL, NULL),
(454, 9, 'Верхнеяркеево', NULL, NULL, NULL),
(455, 9, 'Верхние Киги', NULL, NULL, NULL),
(456, 9, 'Верхние Татышлы', NULL, NULL, NULL),
(457, 9, 'Верхний Авзян', NULL, NULL, NULL),
(458, 9, 'Давлеканово', NULL, NULL, NULL),
(459, 9, 'Дуван', NULL, NULL, NULL),
(460, 9, 'Дюртюли', NULL, NULL, NULL),
(461, 9, 'Ермекеево', NULL, NULL, NULL),
(462, 9, 'Ермолаево', NULL, NULL, NULL),
(463, 9, 'Зилаир', NULL, NULL, NULL),
(464, 9, 'Зирган', NULL, NULL, NULL),
(465, 9, 'Иглино', NULL, NULL, NULL),
(466, 9, 'Инзер', NULL, NULL, NULL),
(467, 9, 'Исянгулово', NULL, NULL, NULL),
(468, 9, 'Ишимбай', NULL, NULL, NULL),
(469, 9, 'Калтасы', NULL, NULL, NULL),
(470, 9, 'Кананикольское', NULL, NULL, NULL),
(471, 9, 'Кандры', NULL, NULL, NULL),
(472, 9, 'Караидель', NULL, NULL, NULL),
(473, 9, 'Караидельский', NULL, NULL, NULL),
(474, 9, 'Киргиз-Мияки', NULL, NULL, NULL),
(475, 9, 'Красноусольский', NULL, NULL, NULL),
(476, 9, 'Кумертау', NULL, NULL, NULL),
(477, 9, 'Кушнаренково', NULL, NULL, NULL),
(478, 9, 'Малояз', NULL, NULL, NULL),
(479, 9, 'Межгорье', NULL, NULL, NULL),
(480, 9, 'Мелеуз', NULL, NULL, NULL),
(481, 9, 'Месягутово', NULL, NULL, NULL),
(482, 9, 'Мраково', NULL, NULL, NULL),
(483, 9, 'Нефтекамск', NULL, NULL, NULL),
(484, 9, 'Октябрьский (Башкирия)', NULL, NULL, NULL),
(485, 9, 'Приютово', NULL, NULL, NULL),
(486, 9, 'Раевский', NULL, NULL, NULL),
(487, 9, 'Салават', NULL, NULL, NULL),
(488, 9, 'Сибай', NULL, NULL, NULL),
(489, 9, 'Старобалтачево', NULL, NULL, NULL),
(490, 9, 'Старосубхангулово', NULL, NULL, NULL),
(491, 9, 'Стерлибашево', NULL, NULL, NULL),
(492, 9, 'Стерлитамак', NULL, NULL, NULL),
(493, 9, 'Туймазы', NULL, NULL, NULL),
(494, 9, 'Уфа', NULL, NULL, NULL),
(495, 9, 'Учалы', NULL, NULL, NULL),
(496, 9, 'Федоровка (Башкирия)', NULL, NULL, NULL),
(497, 9, 'Чекмагуш', NULL, NULL, NULL),
(498, 9, 'Чишмы', NULL, NULL, NULL),
(499, 9, 'Шаран', NULL, NULL, NULL),
(500, 9, 'Янаул', NULL, NULL, NULL),
(501, 10, 'Алексеевка (Белгородская обл.)', NULL, NULL, NULL),
(502, 10, 'Белгород', NULL, NULL, NULL),
(503, 10, 'Борисовка', NULL, NULL, NULL),
(504, 10, 'Валуйки', NULL, NULL, NULL),
(505, 10, 'Вейделевка', NULL, NULL, NULL),
(506, 10, 'Волоконовка', NULL, NULL, NULL),
(507, 10, 'Грайворон', NULL, NULL, NULL),
(508, 10, 'Губкин', NULL, NULL, NULL),
(509, 10, 'Ивня', NULL, NULL, NULL),
(510, 10, 'Короча', NULL, NULL, NULL),
(511, 10, 'Красногвардейское (Белгород.)', NULL, NULL, NULL),
(512, 10, 'Новый Оскол', NULL, NULL, NULL),
(513, 10, 'Ракитное', NULL, NULL, NULL),
(514, 10, 'Ровеньки', NULL, NULL, NULL),
(515, 10, 'Старый Оскол', NULL, NULL, NULL),
(516, 10, 'Строитель', NULL, NULL, NULL),
(517, 10, 'Чернянка', NULL, NULL, NULL),
(518, 10, 'Шебекино', NULL, NULL, NULL),
(519, 11, 'Алтухово', NULL, NULL, NULL),
(520, 11, 'Белая Березка', NULL, NULL, NULL),
(521, 11, 'Белые Берега', NULL, NULL, NULL),
(522, 11, 'Большое Полпино', NULL, NULL, NULL),
(523, 11, 'Брянск', NULL, NULL, NULL),
(524, 11, 'Бытошь', NULL, NULL, NULL),
(525, 11, 'Выгоничи', NULL, NULL, NULL),
(526, 11, 'Вышков', NULL, NULL, NULL),
(527, 11, 'Гордеевка', NULL, NULL, NULL),
(528, 11, 'Дубровка (Брянская обл.)', NULL, NULL, NULL),
(529, 11, 'Дятьково', NULL, NULL, NULL),
(530, 11, 'Дятьково', NULL, NULL, NULL),
(531, 11, 'Жирятино', NULL, NULL, NULL),
(532, 11, 'Жуковка', NULL, NULL, NULL),
(533, 11, 'Злынка', NULL, NULL, NULL),
(534, 11, 'Ивот', NULL, NULL, NULL),
(535, 11, 'Карачев', NULL, NULL, NULL),
(536, 11, 'Клетня', NULL, NULL, NULL),
(537, 11, 'Климово', NULL, NULL, NULL),
(538, 11, 'Клинцы', NULL, NULL, NULL),
(539, 11, 'Кокаревка', NULL, NULL, NULL),
(540, 11, 'Комаричи', NULL, NULL, NULL),
(541, 11, 'Красная Гора', NULL, NULL, NULL),
(542, 11, 'Локоть (Брянская обл.)', NULL, NULL, NULL),
(543, 11, 'Мглин', NULL, NULL, NULL),
(544, 11, 'Навля', NULL, NULL, NULL),
(545, 11, 'Новозыбков', NULL, NULL, NULL),
(546, 11, 'Погар', NULL, NULL, NULL),
(547, 11, 'Почеп', NULL, NULL, NULL),
(548, 11, 'Ржаница', NULL, NULL, NULL),
(549, 11, 'Рогнедино', NULL, NULL, NULL),
(550, 11, 'Севск', NULL, NULL, NULL),
(551, 11, 'Стародуб', NULL, NULL, NULL),
(552, 11, 'Суземка', NULL, NULL, NULL),
(553, 11, 'Сураж', NULL, NULL, NULL),
(554, 11, 'Трубчевск', NULL, NULL, NULL),
(555, 11, 'Унеча', NULL, NULL, NULL),
(556, 12, 'Бабушкин', NULL, NULL, NULL),
(557, 12, 'Багдарин', NULL, NULL, NULL),
(558, 12, 'Баргузин', NULL, NULL, NULL),
(559, 12, 'Баянгол', NULL, NULL, NULL),
(560, 12, 'Бичура', NULL, NULL, NULL),
(561, 12, 'Выдрино', NULL, NULL, NULL),
(562, 12, 'Гусиное Озеро', NULL, NULL, NULL),
(563, 12, 'Гусиноозерск', NULL, NULL, NULL),
(564, 12, 'Заиграево', NULL, NULL, NULL),
(565, 12, 'Закаменск', NULL, NULL, NULL),
(566, 12, 'Иволгинск', NULL, NULL, NULL),
(567, 12, 'Илька', NULL, NULL, NULL),
(568, 12, 'Кабанск', NULL, NULL, NULL),
(569, 12, 'Каменск', NULL, NULL, NULL),
(570, 12, 'Кижинга', NULL, NULL, NULL),
(571, 12, 'Курумкан', NULL, NULL, NULL),
(572, 12, 'Кырен', NULL, NULL, NULL),
(573, 12, 'Кяхта', NULL, NULL, NULL),
(574, 12, 'Монды', NULL, NULL, NULL),
(575, 12, 'Мухоршибирь', NULL, NULL, NULL),
(576, 12, 'Нижнеангарск', NULL, NULL, NULL),
(577, 12, 'Орлик', NULL, NULL, NULL),
(578, 12, 'Петропавловка (Бурятия)', NULL, NULL, NULL),
(579, 12, 'Романовка (Бурятия)', NULL, NULL, NULL),
(580, 12, 'Северобайкальск (Бурятия)', NULL, NULL, NULL),
(581, 12, 'Селенгинск', NULL, NULL, NULL),
(582, 12, 'Сосново-Озерское', NULL, NULL, NULL),
(583, 12, 'Таксимо (Бурятия)', NULL, NULL, NULL),
(584, 12, 'Турунтаево', NULL, NULL, NULL),
(585, 12, 'Улан-Удэ', NULL, NULL, NULL),
(586, 12, 'Хоринск', NULL, NULL, NULL),
(587, 13, 'Александров', NULL, NULL, NULL),
(588, 13, 'Андреево', NULL, NULL, NULL),
(589, 13, 'Анопино', NULL, NULL, NULL),
(590, 13, 'Бавлены', NULL, NULL, NULL),
(591, 13, 'Балакирево', NULL, NULL, NULL),
(592, 13, 'Боголюбово', NULL, NULL, NULL),
(593, 13, 'Великодворский', NULL, NULL, NULL),
(594, 13, 'Вербовский', NULL, NULL, NULL),
(595, 13, 'Владимир', NULL, NULL, NULL),
(596, 13, 'Вязники', NULL, NULL, NULL),
(597, 13, 'Городищи (Владимирская обл.)', NULL, NULL, NULL),
(598, 13, 'Гороховец', NULL, NULL, NULL),
(599, 13, 'Гусевский', NULL, NULL, NULL),
(600, 13, 'Гусь Хрустальный', NULL, NULL, NULL),
(601, 13, 'Гусь-Хрустальный', NULL, NULL, NULL),
(602, 13, 'Золотково', NULL, NULL, NULL),
(603, 13, 'Иванищи', NULL, NULL, NULL),
(604, 13, 'Камешково', NULL, NULL, NULL),
(605, 13, 'Карабаново', NULL, NULL, NULL),
(606, 13, 'Киржач', NULL, NULL, NULL),
(607, 13, 'Ковров', NULL, NULL, NULL),
(608, 13, 'Кольчугино', NULL, NULL, NULL),
(609, 13, 'Красная Горбатка', NULL, NULL, NULL),
(610, 13, 'Лакинск', NULL, NULL, NULL),
(611, 13, 'Меленки', NULL, NULL, NULL),
(612, 13, 'Муром', NULL, NULL, NULL),
(613, 13, 'Петушки', NULL, NULL, NULL),
(614, 13, 'Покров', NULL, NULL, NULL),
(615, 13, 'Радужный (Владимирская обл.)', NULL, NULL, NULL),
(616, 13, 'Собинка', NULL, NULL, NULL),
(617, 13, 'Судогда', NULL, NULL, NULL),
(618, 13, 'Суздаль', NULL, NULL, NULL),
(619, 13, 'Юрьев-Польский', NULL, NULL, NULL),
(620, 14, 'Алексеевская', NULL, NULL, NULL),
(621, 14, 'Алущевск', NULL, NULL, NULL),
(622, 14, 'Быково (Волгоградская обл.)', NULL, NULL, NULL),
(623, 14, 'Волгоград', NULL, NULL, NULL),
(624, 14, 'Волжский (Волгоградская обл.)', NULL, NULL, NULL),
(625, 14, 'Городище (Волгоградская обл.)', NULL, NULL, NULL),
(626, 14, 'Дубовка (Волгоградская обл.)', NULL, NULL, NULL),
(627, 14, 'Елань', NULL, NULL, NULL),
(628, 14, 'Жирновск', NULL, NULL, NULL),
(629, 14, 'Иловля', NULL, NULL, NULL),
(630, 14, 'Калач-на-Дону', NULL, NULL, NULL),
(631, 14, 'Камышин', NULL, NULL, NULL),
(632, 14, 'Кириллов', NULL, NULL, NULL),
(633, 14, 'Клетский', NULL, NULL, NULL),
(634, 14, 'Котельниково', NULL, NULL, NULL),
(635, 14, 'Котово', NULL, NULL, NULL),
(636, 14, 'Кумылженская', NULL, NULL, NULL),
(637, 14, 'Ленинск', NULL, NULL, NULL),
(638, 14, 'Михайловка', NULL, NULL, NULL),
(639, 14, 'Нехаевский', NULL, NULL, NULL),
(640, 14, 'Николаевск', NULL, NULL, NULL),
(641, 14, 'Новоаннинский', NULL, NULL, NULL),
(642, 14, 'Новониколаевский', NULL, NULL, NULL),
(643, 14, 'Ольховка', NULL, NULL, NULL),
(644, 14, 'Палласовка (Волгоградская обл.)', NULL, NULL, NULL),
(645, 14, 'Рудня (Волгоградская обл.)', NULL, NULL, NULL),
(646, 14, 'Светлый Яр', NULL, NULL, NULL),
(647, 14, 'Серафимович', NULL, NULL, NULL),
(648, 14, 'Средняя Ахтуба', NULL, NULL, NULL),
(649, 14, 'Сталинград', NULL, NULL, NULL),
(650, 14, 'Старая Полтавка', NULL, NULL, NULL),
(651, 14, 'Суровикино', NULL, NULL, NULL),
(652, 14, 'Урюпинск', NULL, NULL, NULL),
(653, 14, 'Фролово', NULL, NULL, NULL),
(654, 14, 'Чернышковский', NULL, NULL, NULL),
(655, 15, 'Бабаево', NULL, NULL, NULL),
(656, 15, 'Белозерск', NULL, NULL, NULL),
(657, 15, 'Великий Устюг', NULL, NULL, NULL),
(658, 15, 'Верховажье', NULL, NULL, NULL),
(659, 15, 'Вожега', NULL, NULL, NULL),
(660, 15, 'Вологда', NULL, NULL, NULL),
(661, 15, 'Вохтога', NULL, NULL, NULL),
(662, 15, 'Вытегра', NULL, NULL, NULL),
(663, 15, 'Грязовец', NULL, NULL, NULL),
(664, 15, 'Кадников', NULL, NULL, NULL),
(665, 15, 'Кадуй', NULL, NULL, NULL),
(666, 15, 'Кириллов', NULL, NULL, NULL),
(667, 15, 'Кичменгский Городок', NULL, NULL, NULL),
(668, 15, 'Липин Бор', NULL, NULL, NULL),
(669, 15, 'Никольск', NULL, NULL, NULL),
(670, 15, 'Нюксеница', NULL, NULL, NULL),
(671, 15, 'Сокол', NULL, NULL, NULL),
(672, 15, 'Сямжа', NULL, NULL, NULL),
(673, 15, 'Тарногский Городок', NULL, NULL, NULL),
(674, 15, 'Тотьма', NULL, NULL, NULL),
(675, 15, 'Устюжна', NULL, NULL, NULL),
(676, 15, 'Харовск', NULL, NULL, NULL),
(677, 15, 'Чагода', NULL, NULL, NULL),
(678, 15, 'Череповец', NULL, NULL, NULL),
(679, 15, 'Шексна', NULL, NULL, NULL),
(680, 15, 'Шуйское', NULL, NULL, NULL),
(681, 16, 'Анна', NULL, NULL, NULL),
(682, 16, 'Бобров', NULL, NULL, NULL),
(683, 16, 'Богучар', NULL, NULL, NULL),
(684, 16, 'Борисоглебск', NULL, NULL, NULL),
(685, 16, 'Бутурлиновка', NULL, NULL, NULL),
(686, 16, 'Верхний Мамон', NULL, NULL, NULL),
(687, 16, 'Верхняя Хава', NULL, NULL, NULL),
(688, 16, 'Воробьевка', NULL, NULL, NULL),
(689, 16, 'Воронеж', NULL, NULL, NULL),
(690, 16, 'Грибановский', NULL, NULL, NULL),
(691, 16, 'Давыдовка', NULL, NULL, NULL),
(692, 16, 'Елань-Коленовский', NULL, NULL, NULL),
(693, 16, 'Калач', NULL, NULL, NULL),
(694, 16, 'Кантемировка', NULL, NULL, NULL),
(695, 16, 'Лиски (Воронежская обл.)', NULL, NULL, NULL),
(696, 16, 'Нижнедевицк', NULL, NULL, NULL),
(697, 16, 'Новая Усмань', NULL, NULL, NULL),
(698, 16, 'Нововоронеж', NULL, NULL, NULL),
(699, 16, 'Новохоперск', NULL, NULL, NULL),
(700, 16, 'Ольховатка', NULL, NULL, NULL),
(701, 16, 'Острогожск', NULL, NULL, NULL),
(702, 16, 'Павловск (Воронежская обл.)', NULL, NULL, NULL),
(703, 16, 'Панино', NULL, NULL, NULL),
(704, 16, 'Петропавловка', NULL, NULL, NULL),
(705, 16, 'Поворино', NULL, NULL, NULL),
(706, 16, 'Подгоренский', NULL, NULL, NULL),
(707, 16, 'Рамонь', NULL, NULL, NULL),
(708, 16, 'Репьевка', NULL, NULL, NULL),
(709, 16, 'Россошь', NULL, NULL, NULL),
(710, 16, 'Семилуки', NULL, NULL, NULL),
(711, 16, 'Таловая', NULL, NULL, NULL),
(712, 16, 'Терновка', NULL, NULL, NULL),
(713, 16, 'Хохольский', NULL, NULL, NULL),
(714, 16, 'Эртиль', NULL, NULL, NULL),
(715, 17, 'Агвали', NULL, NULL, NULL),
(716, 17, 'Акуша', NULL, NULL, NULL),
(717, 17, 'Ахты', NULL, NULL, NULL),
(718, 17, 'Ачису', NULL, NULL, NULL),
(719, 17, 'Бабаюрт', NULL, NULL, NULL),
(720, 17, 'Бежта', NULL, NULL, NULL),
(721, 17, 'Ботлих', NULL, NULL, NULL),
(722, 17, 'Буйнакск', NULL, NULL, NULL),
(723, 17, 'Вачи', NULL, NULL, NULL),
(724, 17, 'Гергебиль', NULL, NULL, NULL),
(725, 17, 'Гуниб', NULL, NULL, NULL),
(726, 17, 'Дагестанские Огни', NULL, NULL, NULL),
(727, 17, 'Дербент', NULL, NULL, NULL),
(728, 17, 'Дылым', NULL, NULL, NULL),
(729, 17, 'Ершовка', NULL, NULL, NULL),
(730, 17, 'Избербаш', NULL, NULL, NULL),
(731, 17, 'Карабудахкент', NULL, NULL, NULL),
(732, 17, 'Карата', NULL, NULL, NULL),
(733, 17, 'Каспийск', NULL, NULL, NULL),
(734, 17, 'Касумкент', NULL, NULL, NULL),
(735, 17, 'Кизилюрт', NULL, NULL, NULL),
(736, 17, 'Кизляр', NULL, NULL, NULL),
(737, 17, 'Кочубей', NULL, NULL, NULL),
(738, 17, 'Кумух', NULL, NULL, NULL),
(739, 17, 'Курах', NULL, NULL, NULL),
(740, 17, 'Магарамкент', NULL, NULL, NULL),
(741, 17, 'Маджалис', NULL, NULL, NULL),
(742, 17, 'Махачкала', NULL, NULL, NULL),
(743, 17, 'Мехельта', NULL, NULL, NULL),
(744, 17, 'Новолакское', NULL, NULL, NULL),
(745, 17, 'Рутул', NULL, NULL, NULL),
(746, 17, 'Советское (Дагестан)', NULL, NULL, NULL),
(747, 17, 'Тарумовка', NULL, NULL, NULL),
(748, 17, 'Терекли-Мектеб', NULL, NULL, NULL),
(749, 17, 'Тлярата', NULL, NULL, NULL),
(750, 17, 'Тпиг', NULL, NULL, NULL),
(751, 17, 'Унцукуль', NULL, NULL, NULL),
(752, 17, 'Уркарах', NULL, NULL, NULL),
(753, 17, 'Хасавюрт', NULL, NULL, NULL),
(754, 17, 'Хив', NULL, NULL, NULL),
(755, 17, 'Хунзах', NULL, NULL, NULL),
(756, 17, 'Цуриб', NULL, NULL, NULL),
(757, 17, 'Южно-Сухокумск', NULL, NULL, NULL),
(758, 18, 'Биробиджан', NULL, NULL, NULL),
(759, 19, 'Архиповка', NULL, NULL, NULL),
(760, 19, 'Верхний Ландех', NULL, NULL, NULL),
(761, 19, 'Вичуга', NULL, NULL, NULL),
(762, 19, 'Гаврилов Посад', NULL, NULL, NULL),
(763, 19, 'Долматовский', NULL, NULL, NULL),
(764, 19, 'Дуляпино', NULL, NULL, NULL),
(765, 19, 'Заволжск', NULL, NULL, NULL),
(766, 19, 'Заречный (Ивановская обл.)', NULL, NULL, NULL),
(767, 19, 'Иваново', NULL, NULL, NULL),
(768, 19, 'Иваньковский', NULL, NULL, NULL),
(769, 19, 'Ильинское-Хованское', NULL, NULL, NULL),
(770, 19, 'Каминский', NULL, NULL, NULL),
(771, 19, 'Кинешма', NULL, NULL, NULL),
(772, 19, 'Комсомольск', NULL, NULL, NULL),
(773, 19, 'Кохма', NULL, NULL, NULL),
(774, 19, 'Лух', NULL, NULL, NULL),
(775, 19, 'Палех', NULL, NULL, NULL),
(776, 19, 'Пестяки', NULL, NULL, NULL),
(777, 19, 'Приволжск', NULL, NULL, NULL),
(778, 19, 'Пучеж', NULL, NULL, NULL),
(779, 19, 'Родники (Ивановская обл.)', NULL, NULL, NULL),
(780, 19, 'Савино', NULL, NULL, NULL),
(781, 19, 'Сокольское', NULL, NULL, NULL),
(782, 19, 'Тейково', NULL, NULL, NULL),
(783, 19, 'Фурманов', NULL, NULL, NULL),
(784, 19, 'Шуя', NULL, NULL, NULL),
(785, 19, 'Южа', NULL, NULL, NULL),
(786, 19, 'Юрьевец', NULL, NULL, NULL),
(787, 20, 'Алексеевск', NULL, NULL, NULL),
(788, 20, 'Алзамай', NULL, NULL, NULL),
(789, 20, 'Алыгжер', NULL, NULL, NULL),
(790, 20, 'Ангарск', NULL, NULL, NULL),
(791, 20, 'Артемовский (Иркутская обл.)', NULL, NULL, NULL),
(792, 20, 'Байкал', NULL, NULL, NULL),
(793, 20, 'Байкальск', NULL, NULL, NULL),
(794, 20, 'Балаганск', NULL, NULL, NULL),
(795, 20, 'Баяндай', NULL, NULL, NULL),
(796, 20, 'Бирюсинск', NULL, NULL, NULL),
(797, 20, 'Бодайбо', NULL, NULL, NULL),
(798, 20, 'Большая Речка', NULL, NULL, NULL),
(799, 20, 'Большой Луг', NULL, NULL, NULL),
(800, 20, 'Бохан', NULL, NULL, NULL),
(801, 20, 'Братск', NULL, NULL, NULL),
(802, 20, 'Видим', NULL, NULL, NULL),
(803, 20, 'Витимский', NULL, NULL, NULL),
(804, 20, 'Вихоревка', NULL, NULL, NULL),
(805, 20, 'Еланцы', NULL, NULL, NULL),
(806, 20, 'Ербогачен', NULL, NULL, NULL),
(807, 20, 'Железногорск-Илимский', NULL, NULL, NULL),
(808, 20, 'Жигалово', NULL, NULL, NULL),
(809, 20, 'Забитуй', NULL, NULL, NULL),
(810, 20, 'Залари', NULL, NULL, NULL),
(811, 20, 'Звездный', NULL, NULL, NULL),
(812, 20, 'Зима', NULL, NULL, NULL),
(813, 20, 'Иркутск', NULL, NULL, NULL),
(814, 20, 'Казачинское (Иркутская обл.)', NULL, NULL, NULL),
(815, 20, 'Качуг', NULL, NULL, NULL),
(816, 20, 'Квиток', NULL, NULL, NULL),
(817, 20, 'Киренск', NULL, NULL, NULL),
(818, 20, 'Куйтун', NULL, NULL, NULL),
(819, 20, 'Култук', NULL, NULL, NULL),
(820, 20, 'Кутулик', NULL, NULL, NULL),
(821, 20, 'Мама', NULL, NULL, NULL),
(822, 20, 'Нижнеудинск', NULL, NULL, NULL),
(823, 20, 'Оса', NULL, NULL, NULL),
(824, 20, 'Саянск', NULL, NULL, NULL),
(825, 20, 'Слюдянка', NULL, NULL, NULL),
(826, 20, 'Тайшет', NULL, NULL, NULL),
(827, 20, 'Тулун', NULL, NULL, NULL),
(828, 20, 'Усолье-Сибирское (Иркутская обл.)', NULL, NULL, NULL),
(829, 20, 'Усть-Илимск', NULL, NULL, NULL),
(830, 20, 'Усть-Кут', NULL, NULL, NULL),
(831, 20, 'Усть-Ордынский', NULL, NULL, NULL),
(832, 20, 'Усть-Уда', NULL, NULL, NULL),
(833, 20, 'Черемхово', NULL, NULL, NULL),
(834, 20, 'Чунский', NULL, NULL, NULL),
(835, 20, 'Шелехов', NULL, NULL, NULL),
(836, 21, 'Баксан', NULL, NULL, NULL),
(837, 21, 'Майский', NULL, NULL, NULL),
(838, 21, 'Нальчик', NULL, NULL, NULL),
(839, 21, 'Нарткала', NULL, NULL, NULL),
(840, 21, 'Прохладный', NULL, NULL, NULL),
(841, 21, 'Советское (Кабардино-Балкария)', NULL, NULL, NULL),
(842, 21, 'Терек', NULL, NULL, NULL),
(843, 21, 'Тырныауз', NULL, NULL, NULL),
(844, 21, 'Чегем-Первый', NULL, NULL, NULL),
(845, 22, 'Багратионовск', NULL, NULL, NULL),
(846, 22, 'Балтийск', NULL, NULL, NULL),
(847, 22, 'Гвардейск', NULL, NULL, NULL),
(848, 22, 'Гурьевск (Калининградская обл.)', NULL, NULL, NULL),
(849, 22, 'Гусев', NULL, NULL, NULL),
(850, 22, 'Железнодорожный (Калининград.)', NULL, NULL, NULL),
(851, 22, 'Зеленоградск', NULL, NULL, NULL),
(852, 22, 'Знаменск', NULL, NULL, NULL),
(853, 22, 'Калининград (Кенигсберг)', NULL, NULL, NULL),
(854, 22, 'Краснознаменск (Калининград.)', NULL, NULL, NULL),
(855, 22, 'Ладушкин', NULL, NULL, NULL),
(856, 22, 'Мамоново', NULL, NULL, NULL),
(857, 22, 'Неман', NULL, NULL, NULL),
(858, 22, 'Нестеров', NULL, NULL, NULL),
(859, 22, 'Озерск(Калининградская обл.)', NULL, NULL, NULL),
(860, 22, 'Пионерск', NULL, NULL, NULL),
(861, 22, 'Полесск', NULL, NULL, NULL),
(862, 22, 'Правдинск', NULL, NULL, NULL),
(863, 22, 'Светлогорск', NULL, NULL, NULL),
(864, 22, 'Светлый (Калининградская обл.)', NULL, NULL, NULL),
(865, 22, 'Славск', NULL, NULL, NULL),
(866, 22, 'Советск (Калининградская обл.)', NULL, NULL, NULL),
(867, 22, 'Черняховск', NULL, NULL, NULL),
(868, 23, 'Аршань', NULL, NULL, NULL),
(869, 23, 'Городовиковск', NULL, NULL, NULL),
(870, 23, 'Каспийский', NULL, NULL, NULL),
(871, 23, 'Комсомольский (Калмыкия)', NULL, NULL, NULL),
(872, 23, 'Малые Дербеты', NULL, NULL, NULL),
(873, 23, 'Приютное', NULL, NULL, NULL),
(874, 23, 'Советское (Калмыкия)', NULL, NULL, NULL),
(875, 23, 'Троицкое (Калмыкия)', NULL, NULL, NULL),
(876, 23, 'Утта', NULL, NULL, NULL),
(877, 23, 'Цаган-Аман', NULL, NULL, NULL),
(878, 23, 'Элиста', NULL, NULL, NULL),
(879, 23, 'Юста', NULL, NULL, NULL),
(880, 23, 'Яшалта', NULL, NULL, NULL),
(881, 23, 'Яшкуль', NULL, NULL, NULL),
(882, 24, 'Бабынино', NULL, NULL, NULL),
(883, 24, 'Балабаново', NULL, NULL, NULL),
(884, 24, 'Барятино', NULL, NULL, NULL),
(885, 24, 'Белоусово', NULL, NULL, NULL),
(886, 24, 'Бетлица', NULL, NULL, NULL),
(887, 24, 'Боровск', NULL, NULL, NULL),
(888, 24, 'Дудоровский', NULL, NULL, NULL),
(889, 24, 'Думиничи', NULL, NULL, NULL),
(890, 24, 'Еленский', NULL, NULL, NULL),
(891, 24, 'Жиздра', NULL, NULL, NULL),
(892, 24, 'Жуков', NULL, NULL, NULL),
(893, 24, 'Износки', NULL, NULL, NULL),
(894, 24, 'Калуга', NULL, NULL, NULL),
(895, 24, 'Киров (Калужская обл.)', NULL, NULL, NULL),
(896, 24, 'Козельск', NULL, NULL, NULL),
(897, 24, 'Кондрово', NULL, NULL, NULL),
(898, 24, 'Кремёнки', NULL, NULL, NULL),
(899, 24, 'Людиново', NULL, NULL, NULL),
(900, 24, 'Малоярославец', NULL, NULL, NULL),
(901, 24, 'Медынь', NULL, NULL, NULL),
(902, 24, 'Мещовск', NULL, NULL, NULL),
(903, 24, 'Мосальск', NULL, NULL, NULL),
(904, 24, 'Обнинск', NULL, NULL, NULL),
(905, 24, 'Перемышль', NULL, NULL, NULL),
(906, 24, 'Спас-Деменск', NULL, NULL, NULL),
(907, 24, 'Сухиничи', NULL, NULL, NULL),
(908, 24, 'Таруса', NULL, NULL, NULL),
(909, 24, 'Ульяново', NULL, NULL, NULL),
(910, 24, 'Ферзиково', NULL, NULL, NULL),
(911, 24, 'Хвастовичи', NULL, NULL, NULL),
(912, 24, 'Юхнов', NULL, NULL, NULL),
(913, 25, 'Атласово', NULL, NULL, NULL),
(914, 25, 'Аянка', NULL, NULL, NULL),
(915, 25, 'Большерецк', NULL, NULL, NULL),
(916, 25, 'Вилючинск', NULL, NULL, NULL),
(917, 25, 'Елизово (Камчатская обл.)', NULL, NULL, NULL),
(918, 25, 'Ильпырский', NULL, NULL, NULL),
(919, 25, 'Каменское', NULL, NULL, NULL),
(920, 25, 'Кировский', NULL, NULL, NULL),
(921, 25, 'Ключи (Камчатская обл.)', NULL, NULL, NULL),
(922, 25, 'Крапивная', NULL, NULL, NULL),
(923, 25, 'Мильково', NULL, NULL, NULL),
(924, 25, 'Никольское', NULL, NULL, NULL),
(925, 25, 'Озерновский', NULL, NULL, NULL),
(926, 25, 'Оссора', NULL, NULL, NULL),
(927, 25, 'Палана', NULL, NULL, NULL),
(928, 25, 'Парень', NULL, NULL, NULL),
(929, 25, 'Пахачи', NULL, NULL, NULL),
(930, 25, 'Петропавловск-Камчатский', NULL, NULL, NULL),
(931, 25, 'Тигиль', NULL, NULL, NULL),
(932, 25, 'Тиличики', NULL, NULL, NULL),
(933, 25, 'Усть-Большерецк', NULL, NULL, NULL),
(934, 25, 'Усть-Камчатск', NULL, NULL, NULL),
(935, 26, 'Амбарный', NULL, NULL, NULL),
(936, 26, 'Беломорск', NULL, NULL, NULL),
(937, 26, 'Валаам', NULL, NULL, NULL),
(938, 26, 'Вирандозеро', NULL, NULL, NULL),
(939, 26, 'Гирвас', NULL, NULL, NULL),
(940, 26, 'Деревянка', NULL, NULL, NULL),
(941, 26, 'Идель', NULL, NULL, NULL),
(942, 26, 'Ильинский (Карелия)', NULL, NULL, NULL),
(943, 26, 'Калевала', NULL, NULL, NULL),
(944, 26, 'Кемь', NULL, NULL, NULL),
(945, 26, 'Кестеньга', NULL, NULL, NULL),
(946, 26, 'Кондопога', NULL, NULL, NULL),
(947, 26, 'Костомукша', NULL, NULL, NULL),
(948, 26, 'Лахденпохья', NULL, NULL, NULL),
(949, 26, 'Лоухи', NULL, NULL, NULL),
(950, 26, 'Медвежьегорск', NULL, NULL, NULL),
(951, 26, 'Муезерский', NULL, NULL, NULL),
(952, 26, 'Олонец', NULL, NULL, NULL),
(953, 26, 'Петрозаводск', NULL, NULL, NULL),
(954, 26, 'Питкяранта', NULL, NULL, NULL),
(955, 26, 'Повенец', NULL, NULL, NULL),
(956, 26, 'Пряжа', NULL, NULL, NULL),
(957, 26, 'Пудож', NULL, NULL, NULL),
(958, 26, 'Сегежа', NULL, NULL, NULL),
(959, 26, 'Сортавала', NULL, NULL, NULL),
(960, 26, 'Суоярви', NULL, NULL, NULL),
(961, 26, 'Хийденсельга', NULL, NULL, NULL),
(962, 27, 'Анжеро-Судженск', NULL, NULL, NULL),
(963, 27, 'Барзас', NULL, NULL, NULL),
(964, 27, 'Белово', NULL, NULL, NULL),
(965, 27, 'Белогорск', NULL, NULL, NULL),
(966, 27, 'Березовский (Кемеровская обл.)', NULL, NULL, NULL),
(967, 27, 'Грамотеино', NULL, NULL, NULL),
(968, 27, 'Гурьевск', NULL, NULL, NULL),
(969, 27, 'Ижморский', NULL, NULL, NULL),
(970, 27, 'Итатский', NULL, NULL, NULL),
(971, 27, 'Калтан', NULL, NULL, NULL),
(972, 27, 'Кедровка', NULL, NULL, NULL),
(973, 27, 'Кемерово', NULL, NULL, NULL),
(974, 27, 'Киселевск', NULL, NULL, NULL),
(975, 27, 'Крапивинский', NULL, NULL, NULL),
(976, 27, 'Ленинск-Кузнецкий', NULL, NULL, NULL),
(977, 27, 'Мариинск', NULL, NULL, NULL),
(978, 27, 'Междуреченск', NULL, NULL, NULL),
(979, 27, 'Мыски', NULL, NULL, NULL),
(980, 27, 'Новокузнецк', NULL, NULL, NULL),
(981, 27, 'Осинники', NULL, NULL, NULL),
(982, 27, 'Полысаево', NULL, NULL, NULL),
(983, 27, 'Прокопьевск', NULL, NULL, NULL),
(984, 27, 'Промышленная', NULL, NULL, NULL),
(985, 27, 'Тайга', NULL, NULL, NULL),
(986, 27, 'Таштагол', NULL, NULL, NULL),
(987, 27, 'Тисуль', NULL, NULL, NULL),
(988, 27, 'Топки', NULL, NULL, NULL),
(989, 27, 'Тяжинский', NULL, NULL, NULL),
(990, 27, 'Юрга', NULL, NULL, NULL),
(991, 27, 'Яшкино', NULL, NULL, NULL),
(992, 27, 'Яя', NULL, NULL, NULL),
(993, 28, 'Арбаж', NULL, NULL, NULL),
(994, 28, 'Аркуль', NULL, NULL, NULL),
(995, 28, 'Белая Холуница', NULL, NULL, NULL),
(996, 28, 'Богородское (Кировская обл.)', NULL, NULL, NULL),
(997, 28, 'Боровой', NULL, NULL, NULL),
(998, 28, 'Верхошижемье', NULL, NULL, NULL),
(999, 28, 'Вятские Поляны (Кировская обл.)', NULL, NULL, NULL),
(1000, 28, 'Зуевка', NULL, NULL, NULL),
(1001, 28, 'Каринторф', NULL, NULL, NULL),
(1002, 28, 'Кикнур', NULL, NULL, NULL),
(1003, 28, 'Кильмезь', NULL, NULL, NULL),
(1004, 28, 'Киров (Кировская обл.)', NULL, NULL, NULL),
(1005, 28, 'Кирово-Чепецк', NULL, NULL, NULL),
(1006, 28, 'Кирс', NULL, NULL, NULL),
(1007, 28, 'Кобра', NULL, NULL, NULL),
(1008, 28, 'Котельнич', NULL, NULL, NULL),
(1009, 28, 'Кумены', NULL, NULL, NULL),
(1010, 28, 'Ленинское', NULL, NULL, NULL),
(1011, 28, 'Луза', NULL, NULL, NULL),
(1012, 28, 'Малмыж', NULL, NULL, NULL),
(1013, 28, 'Мураши', NULL, NULL, NULL),
(1014, 28, 'Нагорск', NULL, NULL, NULL),
(1015, 28, 'Нема', NULL, NULL, NULL),
(1016, 28, 'Нововятск', NULL, NULL, NULL),
(1017, 28, 'Нолинск', NULL, NULL, NULL),
(1018, 28, 'Омутнинск', NULL, NULL, NULL),
(1019, 28, 'Опарино', NULL, NULL, NULL),
(1020, 28, 'Оричи', NULL, NULL, NULL),
(1021, 28, 'Пижанка', NULL, NULL, NULL),
(1022, 28, 'Подосиновец', NULL, NULL, NULL),
(1023, 28, 'Санчурск', NULL, NULL, NULL),
(1024, 28, 'Свеча', NULL, NULL, NULL),
(1025, 28, 'Слободской', NULL, NULL, NULL),
(1026, 28, 'Советск (Кировская обл.)', NULL, NULL, NULL),
(1027, 28, 'Суна', NULL, NULL, NULL),
(1028, 28, 'Тужа', NULL, NULL, NULL),
(1029, 28, 'Уни', NULL, NULL, NULL),
(1030, 28, 'Уржум', NULL, NULL, NULL),
(1031, 28, 'Фаленки', NULL, NULL, NULL),
(1032, 28, 'Халтурин', NULL, NULL, NULL),
(1033, 28, 'Юрья', NULL, NULL, NULL),
(1034, 28, 'Яранск', NULL, NULL, NULL),
(1035, 29, 'Абезь', NULL, NULL, NULL),
(1036, 29, 'Адзьвавом', NULL, NULL, NULL),
(1037, 29, 'Айкино', NULL, NULL, NULL),
(1038, 29, 'Верхняя Инта', NULL, NULL, NULL),
(1039, 29, 'Визинга', NULL, NULL, NULL),
(1040, 29, 'Водный', NULL, NULL, NULL),
(1041, 29, 'Воркута', NULL, NULL, NULL),
(1042, 29, 'Вуктыл', NULL, NULL, NULL),
(1043, 29, 'Елецкий', NULL, NULL, NULL),
(1044, 29, 'Емва', NULL, NULL, NULL),
(1045, 29, 'Жешарт', NULL, NULL, NULL),
(1046, 29, 'Заполярный', NULL, NULL, NULL),
(1047, 29, 'Ижма', NULL, NULL, NULL),
(1048, 29, 'Инта', NULL, NULL, NULL),
(1049, 29, 'Ираель', NULL, NULL, NULL),
(1050, 29, 'Каджером', NULL, NULL, NULL),
(1051, 29, 'Кажым', NULL, NULL, NULL),
(1052, 29, 'Кожым', NULL, NULL, NULL),
(1053, 29, 'Койгородок', NULL, NULL, NULL),
(1054, 29, 'Корткерос', NULL, NULL, NULL),
(1055, 29, 'Кослан', NULL, NULL, NULL),
(1056, 29, 'Микунь', NULL, NULL, NULL),
(1057, 29, 'Нижний Одес', NULL, NULL, NULL),
(1058, 29, 'Объячево', NULL, NULL, NULL),
(1059, 29, 'Печора', NULL, NULL, NULL),
(1060, 29, 'Сосногорск', NULL, NULL, NULL),
(1061, 29, 'Сыктывкар', NULL, NULL, NULL),
(1062, 29, 'Троицко-Печерск', NULL, NULL, NULL),
(1063, 29, 'Усинск', NULL, NULL, NULL),
(1064, 29, 'Усогорск', NULL, NULL, NULL),
(1065, 29, 'Усть-Кулом', NULL, NULL, NULL),
(1066, 29, 'Усть-Цильма', NULL, NULL, NULL),
(1067, 29, 'Ухта', NULL, NULL, NULL),
(1068, 30, 'Антропово', NULL, NULL, NULL),
(1069, 30, 'Боговарово', NULL, NULL, NULL),
(1070, 30, 'Буй', NULL, NULL, NULL),
(1071, 30, 'Волгореченск', NULL, NULL, NULL),
(1072, 30, 'Галич', NULL, NULL, NULL),
(1073, 30, 'Горчуха', NULL, NULL, NULL),
(1074, 30, 'Зебляки', NULL, NULL, NULL),
(1075, 30, 'Кадый', NULL, NULL, NULL),
(1076, 30, 'Кологрив', NULL, NULL, NULL),
(1077, 30, 'Кострома', NULL, NULL, NULL),
(1078, 30, 'Красное-на-Волге', NULL, NULL, NULL),
(1079, 30, 'Макарьев', NULL, NULL, NULL),
(1080, 30, 'Мантурово', NULL, NULL, NULL),
(1081, 30, 'Нерехта', NULL, NULL, NULL),
(1082, 30, 'Нея', NULL, NULL, NULL),
(1083, 30, 'Островское', NULL, NULL, NULL),
(1084, 30, 'Павино', NULL, NULL, NULL),
(1085, 30, 'Парфентьево', NULL, NULL, NULL),
(1086, 30, 'Поназырево', NULL, NULL, NULL),
(1087, 30, 'Солигалич', NULL, NULL, NULL),
(1088, 30, 'Судиславль', NULL, NULL, NULL),
(1089, 30, 'Сусанино', NULL, NULL, NULL),
(1090, 30, 'Чухлома', NULL, NULL, NULL),
(1091, 30, 'Шарья', NULL, NULL, NULL),
(1092, 30, 'Шемятино', NULL, NULL, NULL),
(1093, 31, 'Абинск', NULL, NULL, NULL),
(1094, 31, 'Абрау-Дюрсо', NULL, NULL, NULL),
(1095, 31, 'Адлер', NULL, NULL, NULL),
(1096, 31, 'Анапа', NULL, NULL, NULL),
(1097, 31, 'Апшеронск', NULL, NULL, NULL),
(1098, 31, 'Армавир', NULL, NULL, NULL),
(1099, 31, 'Архипо-Осиповка', NULL, NULL, NULL),
(1100, 31, 'Афипский', NULL, NULL, NULL),
(1101, 31, 'Ахтырский', NULL, NULL, NULL),
(1102, 31, 'Ачуево', NULL, NULL, NULL),
(1103, 31, 'Белая Глина', NULL, NULL, NULL),
(1104, 31, 'Белореченск', NULL, NULL, NULL),
(1105, 31, 'Верхнебаканский', NULL, NULL, NULL),
(1106, 31, 'Выселки', NULL, NULL, NULL),
(1107, 31, 'Геленджик', NULL, NULL, NULL),
(1108, 31, 'Гиагинская', NULL, NULL, NULL),
(1109, 31, 'Горячий Ключ', NULL, NULL, NULL),
(1110, 31, 'Гулькевичи', NULL, NULL, NULL),
(1111, 31, 'Джубга', NULL, NULL, NULL),
(1112, 31, 'Динская', NULL, NULL, NULL),
(1113, 31, 'Ейск', NULL, NULL, NULL),
(1114, 31, 'Ильский', NULL, NULL, NULL),
(1115, 31, 'Кабардинка', NULL, NULL, NULL),
(1116, 31, 'Калинино', NULL, NULL, NULL),
(1117, 31, 'Калининская', NULL, NULL, NULL),
(1118, 31, 'Каменномостский', NULL, NULL, NULL),
(1119, 31, 'Каневская', NULL, NULL, NULL),
(1120, 31, 'Кореновск', NULL, NULL, NULL),
(1121, 31, 'Красноармейская', NULL, NULL, NULL),
(1122, 31, 'Краснодар', NULL, NULL, NULL),
(1123, 31, 'Кропоткин', NULL, NULL, NULL),
(1124, 31, 'Крыловская', NULL, NULL, NULL),
(1125, 31, 'Крымск', NULL, NULL, NULL),
(1126, 31, 'Курганинск', NULL, NULL, NULL),
(1127, 31, 'Кущевская', NULL, NULL, NULL),
(1128, 31, 'Лабинск', NULL, NULL, NULL),
(1129, 31, 'Лазаревское', NULL, NULL, NULL),
(1130, 31, 'Ленинградская', NULL, NULL, NULL),
(1131, 31, 'Майкоп (Краснодарский край)', NULL, NULL, NULL),
(1132, 31, 'Мостовской', NULL, NULL, NULL),
(1133, 31, 'Новокубанск', NULL, NULL, NULL),
(1134, 31, 'Новороссийск', NULL, NULL, NULL),
(1135, 31, 'Отрадная', NULL, NULL, NULL),
(1136, 31, 'Павловская', NULL, NULL, NULL),
(1137, 31, 'Приморско-Ахтарск', NULL, NULL, NULL),
(1138, 31, 'Северская', NULL, NULL, NULL),
(1139, 31, 'Славянск-на-Кубани', NULL, NULL, NULL),
(1140, 31, 'Сочи', NULL, NULL, NULL),
(1141, 31, 'Староминская', NULL, NULL, NULL),
(1142, 31, 'Старощербиновская', NULL, NULL, NULL),
(1143, 31, 'Тбилисская', NULL, NULL, NULL),
(1144, 31, 'Темрюк', NULL, NULL, NULL),
(1145, 31, 'Тимашевск', NULL, NULL, NULL),
(1146, 31, 'Тихорецк', NULL, NULL, NULL),
(1147, 31, 'Туапсе', NULL, NULL, NULL),
(1148, 31, 'Тульский', NULL, NULL, NULL),
(1149, 31, 'Усть-Лабинск', NULL, NULL, NULL),
(1150, 31, 'Хадыженск', NULL, NULL, NULL),
(1151, 31, 'Хоста', NULL, NULL, NULL),
(1152, 31, 'Шовгеновский', NULL, NULL, NULL),
(1153, 32, 'Абаза', NULL, NULL, NULL),
(1154, 32, 'Абакан', NULL, NULL, NULL),
(1155, 32, 'Агинское', NULL, NULL, NULL),
(1156, 32, 'Артемовск', NULL, NULL, NULL),
(1157, 32, 'Аскиз', NULL, NULL, NULL),
(1158, 32, 'Ачинск', NULL, NULL, NULL),
(1159, 32, 'Байкит', NULL, NULL, NULL),
(1160, 32, 'Балахта', NULL, NULL, NULL),
(1161, 32, 'Балыкса', NULL, NULL, NULL),
(1162, 32, 'Белый Яр', NULL, NULL, NULL),
(1163, 32, 'Бея', NULL, NULL, NULL),
(1164, 32, 'Бискамжа', NULL, NULL, NULL),
(1165, 32, 'Боготол', NULL, NULL, NULL),
(1166, 32, 'Боград', NULL, NULL, NULL),
(1167, 32, 'Богучаны', NULL, NULL, NULL),
(1168, 32, 'Большая Мурта', NULL, NULL, NULL),
(1169, 32, 'Большой Улуй', NULL, NULL, NULL),
(1170, 32, 'Бородино (Красноярский край)', NULL, NULL, NULL),
(1171, 32, 'Ванавара', NULL, NULL, NULL),
(1172, 32, 'Верхнеимбатск', NULL, NULL, NULL),
(1173, 32, 'Горячегорск', NULL, NULL, NULL),
(1174, 32, 'Дзержинское', NULL, NULL, NULL),
(1175, 32, 'Дивногорск', NULL, NULL, NULL),
(1176, 32, 'Диксон', NULL, NULL, NULL),
(1177, 32, 'Дудинка', NULL, NULL, NULL),
(1178, 32, 'Емельяново', NULL, NULL, NULL),
(1179, 32, 'Енисейск', NULL, NULL, NULL),
(1180, 32, 'Ермаковское', NULL, NULL, NULL),
(1181, 32, 'Железногорск', NULL, NULL, NULL),
(1182, 32, 'Заозерный', NULL, NULL, NULL),
(1183, 32, 'Зеленогорск (Красноярский край)', NULL, NULL, NULL),
(1184, 32, 'Игарка', NULL, NULL, NULL),
(1185, 32, 'Идринское', NULL, NULL, NULL),
(1186, 32, 'Иланский', NULL, NULL, NULL),
(1187, 32, 'Ирбейское', NULL, NULL, NULL),
(1188, 32, 'Казачинское  (Красноярский край)', NULL, NULL, NULL),
(1189, 32, 'Канск', NULL, NULL, NULL),
(1190, 32, 'Каратузское', NULL, NULL, NULL),
(1191, 32, 'Караул', NULL, NULL, NULL),
(1192, 32, 'Кодинск', NULL, NULL, NULL),
(1193, 32, 'Козулька', NULL, NULL, NULL),
(1194, 32, 'Копьево', NULL, NULL, NULL),
(1195, 32, 'Краснотуранск', NULL, NULL, NULL),
(1196, 32, 'Красноярск', NULL, NULL, NULL),
(1197, 32, 'Курагино', NULL, NULL, NULL),
(1198, 32, 'Лесосибирск', NULL, NULL, NULL),
(1199, 32, 'Минусинск', NULL, NULL, NULL),
(1200, 32, 'Мотыгино', NULL, NULL, NULL),
(1201, 32, 'Назарово', NULL, NULL, NULL),
(1202, 32, 'Нижний Ингаш', NULL, NULL, NULL),
(1203, 32, 'Новоселово', NULL, NULL, NULL),
(1204, 32, 'Норильск', NULL, NULL, NULL),
(1205, 32, 'Партизанское', NULL, NULL, NULL),
(1206, 32, 'Пировское', NULL, NULL, NULL),
(1207, 32, 'Северо-Енисейский', NULL, NULL, NULL),
(1208, 32, 'Сосновоборск (Красноярский край)', NULL, NULL, NULL),
(1209, 32, 'Тасеево', NULL, NULL, NULL),
(1210, 32, 'Таштып', NULL, NULL, NULL),
(1211, 32, 'Тура', NULL, NULL, NULL),
(1212, 32, 'Туруханск', NULL, NULL, NULL),
(1213, 32, 'Тюхтет', NULL, NULL, NULL),
(1214, 32, 'Ужур', NULL, NULL, NULL),
(1215, 32, 'Уяр', NULL, NULL, NULL),
(1216, 32, 'Хатанга', NULL, NULL, NULL),
(1217, 32, 'Черемушки', NULL, NULL, NULL),
(1218, 32, 'Черногорск', NULL, NULL, NULL),
(1219, 32, 'Шалинское', NULL, NULL, NULL),
(1220, 32, 'Шарыпово  (Красноярский край)', NULL, NULL, NULL),
(1221, 32, 'Шира', NULL, NULL, NULL),
(1222, 32, 'Шушенское', NULL, NULL, NULL),
(1223, 33, 'Варгаши', NULL, NULL, NULL),
(1224, 33, 'Глядянское', NULL, NULL, NULL),
(1225, 33, 'Далматово', NULL, NULL, NULL);
INSERT INTO `region` (`id`, `parent_id`, `name`, `path`, `language`, `grade`) VALUES
(1226, 33, 'Каргаполье', NULL, NULL, NULL),
(1227, 33, 'Катайск', NULL, NULL, NULL),
(1228, 33, 'Кетово', NULL, NULL, NULL),
(1229, 33, 'Курган', NULL, NULL, NULL),
(1230, 33, 'Куртамыш', NULL, NULL, NULL),
(1231, 33, 'Лебяжье', NULL, NULL, NULL),
(1232, 33, 'Макушино', NULL, NULL, NULL),
(1233, 33, 'Мишкино', NULL, NULL, NULL),
(1234, 33, 'Мокроусово', NULL, NULL, NULL),
(1235, 33, 'Петухово', NULL, NULL, NULL),
(1236, 33, 'Половинное', NULL, NULL, NULL),
(1237, 33, 'Сафакулево', NULL, NULL, NULL),
(1238, 33, 'Целинное', NULL, NULL, NULL),
(1239, 33, 'Шадринск', NULL, NULL, NULL),
(1240, 33, 'Шатрово', NULL, NULL, NULL),
(1241, 33, 'Шумиха', NULL, NULL, NULL),
(1242, 33, 'Щучье', NULL, NULL, NULL),
(1243, 33, 'Юргамыш', NULL, NULL, NULL),
(1244, 34, 'Альменево', NULL, NULL, NULL),
(1245, 34, 'Белая', NULL, NULL, NULL),
(1246, 34, 'Большое Солдатское', NULL, NULL, NULL),
(1247, 34, 'Глушково', NULL, NULL, NULL),
(1248, 34, 'Горшечное', NULL, NULL, NULL),
(1249, 34, 'Дмитриев-Льговский', NULL, NULL, NULL),
(1250, 34, 'Железногорск', NULL, NULL, NULL),
(1251, 34, 'Золотухино', NULL, NULL, NULL),
(1252, 34, 'Касторное', NULL, NULL, NULL),
(1253, 34, 'Конышевка', NULL, NULL, NULL),
(1254, 34, 'Коренево', NULL, NULL, NULL),
(1255, 34, 'Курск', NULL, NULL, NULL),
(1256, 34, 'Курчатов', NULL, NULL, NULL),
(1257, 34, 'Кшенский', NULL, NULL, NULL),
(1258, 34, 'Льгов', NULL, NULL, NULL),
(1259, 34, 'Мантурово', NULL, NULL, NULL),
(1260, 34, 'Медвенка', NULL, NULL, NULL),
(1261, 34, 'Обоянь', NULL, NULL, NULL),
(1262, 34, 'Поныри', NULL, NULL, NULL),
(1263, 34, 'Пристень', NULL, NULL, NULL),
(1264, 34, 'Прямицыно', NULL, NULL, NULL),
(1265, 34, 'Рыльск', NULL, NULL, NULL),
(1266, 34, 'Суджа', NULL, NULL, NULL),
(1267, 34, 'Тим', NULL, NULL, NULL),
(1268, 34, 'Фатеж', NULL, NULL, NULL),
(1269, 34, 'Хомутовка', NULL, NULL, NULL),
(1270, 34, 'Черемисиново', NULL, NULL, NULL),
(1271, 34, 'Щигры', NULL, NULL, NULL),
(1272, 35, 'Грязи', NULL, NULL, NULL),
(1273, 35, 'Данков', NULL, NULL, NULL),
(1274, 35, 'Доброе', NULL, NULL, NULL),
(1275, 35, 'Долгоруково', NULL, NULL, NULL),
(1276, 35, 'Елец', NULL, NULL, NULL),
(1277, 35, 'Задонск', NULL, NULL, NULL),
(1278, 35, 'Измалково', NULL, NULL, NULL),
(1279, 35, 'Казинка', NULL, NULL, NULL),
(1280, 35, 'Лебедянь', NULL, NULL, NULL),
(1281, 35, 'Лев Толстой', NULL, NULL, NULL),
(1282, 35, 'Липецк', NULL, NULL, NULL),
(1283, 35, 'Тербуны', NULL, NULL, NULL),
(1284, 35, 'Усмань', NULL, NULL, NULL),
(1285, 35, 'Хлевное', NULL, NULL, NULL),
(1286, 35, 'Чаплыгин', NULL, NULL, NULL),
(1287, 36, 'Анадырь (Магаданская обл.)', NULL, NULL, NULL),
(1288, 36, 'Атка', NULL, NULL, NULL),
(1289, 36, 'Беринговский', NULL, NULL, NULL),
(1290, 36, 'Билибино', NULL, NULL, NULL),
(1291, 36, 'Большевик', NULL, NULL, NULL),
(1292, 36, 'Ванкарем', NULL, NULL, NULL),
(1293, 36, 'Кадыкчан', NULL, NULL, NULL),
(1294, 36, 'Лаврентия', NULL, NULL, NULL),
(1295, 36, 'Магадан', NULL, NULL, NULL),
(1296, 36, 'Мыс Шмидта', NULL, NULL, NULL),
(1297, 36, 'Ола', NULL, NULL, NULL),
(1298, 36, 'Омсукчан', NULL, NULL, NULL),
(1299, 36, 'Палатка', NULL, NULL, NULL),
(1300, 36, 'Певек', NULL, NULL, NULL),
(1301, 36, 'Провидения', NULL, NULL, NULL),
(1302, 36, 'Сеймчан', NULL, NULL, NULL),
(1303, 36, 'Синегорье', NULL, NULL, NULL),
(1304, 36, 'Сусуман', NULL, NULL, NULL),
(1305, 36, 'Усть-Омчуг', NULL, NULL, NULL),
(1306, 36, 'Эвенск', NULL, NULL, NULL),
(1307, 36, 'Эгвекинот', NULL, NULL, NULL),
(1308, 36, 'Ягодное', NULL, NULL, NULL),
(1309, 37, 'Волжск', NULL, NULL, NULL),
(1310, 37, 'Дубовский', NULL, NULL, NULL),
(1311, 37, 'Звенигово', NULL, NULL, NULL),
(1312, 37, 'Йошкар-Ола', NULL, NULL, NULL),
(1313, 37, 'Килемары', NULL, NULL, NULL),
(1314, 37, 'Козьмодемьянск', NULL, NULL, NULL),
(1315, 37, 'Куженер', NULL, NULL, NULL),
(1316, 37, 'Мари-Турек', NULL, NULL, NULL),
(1317, 37, 'Медведево', NULL, NULL, NULL),
(1318, 37, 'Морки', NULL, NULL, NULL),
(1319, 37, 'Новый Торьял', NULL, NULL, NULL),
(1320, 37, 'Оршанка', NULL, NULL, NULL),
(1321, 37, 'Параньга', NULL, NULL, NULL),
(1322, 37, 'Сернур', NULL, NULL, NULL),
(1323, 37, 'Советский (Марий Эл)', NULL, NULL, NULL),
(1324, 37, 'Юрино', NULL, NULL, NULL),
(1325, 38, 'Ардатов', NULL, NULL, NULL),
(1326, 38, 'Атюрьево', NULL, NULL, NULL),
(1327, 38, 'Атяшево', NULL, NULL, NULL),
(1328, 38, 'Большие Березники', NULL, NULL, NULL),
(1329, 38, 'Большое Игнатово', NULL, NULL, NULL),
(1330, 38, 'Выша', NULL, NULL, NULL),
(1331, 38, 'Ельники', NULL, NULL, NULL),
(1332, 38, 'Зубова Поляна', NULL, NULL, NULL),
(1333, 38, 'Инсар', NULL, NULL, NULL),
(1334, 38, 'Кадошкино', NULL, NULL, NULL),
(1335, 38, 'Кемля', NULL, NULL, NULL),
(1336, 38, 'Ковылкино', NULL, NULL, NULL),
(1337, 38, 'Комсомольский (Мордовия)', NULL, NULL, NULL),
(1338, 38, 'Кочкурово', NULL, NULL, NULL),
(1339, 38, 'Краснослободск', NULL, NULL, NULL),
(1340, 38, 'Лямбирь', NULL, NULL, NULL),
(1341, 38, 'Ромоданово', NULL, NULL, NULL),
(1342, 38, 'Рузаевка', NULL, NULL, NULL),
(1343, 38, 'Саранск', NULL, NULL, NULL),
(1344, 38, 'Старое Шайгово', NULL, NULL, NULL),
(1345, 38, 'Темников', NULL, NULL, NULL),
(1346, 38, 'Теньгушево', NULL, NULL, NULL),
(1347, 38, 'Торбеево', NULL, NULL, NULL),
(1348, 38, 'Чамзинка', NULL, NULL, NULL),
(1349, 39, 'Апатиты', NULL, NULL, NULL),
(1350, 39, 'Африканда', NULL, NULL, NULL),
(1351, 39, 'Верхнетуломский', NULL, NULL, NULL),
(1352, 39, 'Видяево', NULL, NULL, NULL),
(1353, 39, 'Гаджиево', NULL, NULL, NULL),
(1354, 39, 'Заозерск', NULL, NULL, NULL),
(1355, 39, 'Заполярный', NULL, NULL, NULL),
(1356, 39, 'Зареченск', NULL, NULL, NULL),
(1357, 39, 'Зашеек', NULL, NULL, NULL),
(1358, 39, 'Зеленоборский', NULL, NULL, NULL),
(1359, 39, 'Кандалакша', NULL, NULL, NULL),
(1360, 39, 'Кильдинстрой', NULL, NULL, NULL),
(1361, 39, 'Кировск', NULL, NULL, NULL),
(1362, 39, 'Ковдор', NULL, NULL, NULL),
(1363, 39, 'Кола', NULL, NULL, NULL),
(1364, 39, 'Конда', NULL, NULL, NULL),
(1365, 39, 'Ловозеро', NULL, NULL, NULL),
(1366, 39, 'Мончегорск', NULL, NULL, NULL),
(1367, 39, 'Мурманск', NULL, NULL, NULL),
(1368, 39, 'Мурмаши', NULL, NULL, NULL),
(1369, 39, 'Никель', NULL, NULL, NULL),
(1370, 39, 'Оленегорск', NULL, NULL, NULL),
(1371, 39, 'Полярные Зори', NULL, NULL, NULL),
(1372, 39, 'Полярный', NULL, NULL, NULL),
(1373, 39, 'Ревда (Мурманская обл.)', NULL, NULL, NULL),
(1374, 39, 'Североморск', NULL, NULL, NULL),
(1375, 39, 'Снежногорск', NULL, NULL, NULL),
(1376, 39, 'Умба', NULL, NULL, NULL),
(1377, 40, 'Ардатов', NULL, NULL, NULL),
(1378, 40, 'Арзамас', NULL, NULL, NULL),
(1379, 40, 'Арья', NULL, NULL, NULL),
(1380, 40, 'Балахна', NULL, NULL, NULL),
(1381, 40, 'Богородск', NULL, NULL, NULL),
(1382, 40, 'Большереченск', NULL, NULL, NULL),
(1383, 40, 'Большое Болдино', NULL, NULL, NULL),
(1384, 40, 'Большое Козино', NULL, NULL, NULL),
(1385, 40, 'Большое Мурашкино', NULL, NULL, NULL),
(1386, 40, 'Большое Пикино', NULL, NULL, NULL),
(1387, 40, 'Бор', NULL, NULL, NULL),
(1388, 40, 'Бутурлино', NULL, NULL, NULL),
(1389, 40, 'Вад', NULL, NULL, NULL),
(1390, 40, 'Варнавино', NULL, NULL, NULL),
(1391, 40, 'Васильсурск', NULL, NULL, NULL),
(1392, 40, 'Вахтан', NULL, NULL, NULL),
(1393, 40, 'Вача', NULL, NULL, NULL),
(1394, 40, 'Ветлуга', NULL, NULL, NULL),
(1395, 40, 'Виля', NULL, NULL, NULL),
(1396, 40, 'Вознесенское', NULL, NULL, NULL),
(1397, 40, 'Володарск', NULL, NULL, NULL),
(1398, 40, 'Воротынец', NULL, NULL, NULL),
(1399, 40, 'Ворсма', NULL, NULL, NULL),
(1400, 40, 'Воскресенское', NULL, NULL, NULL),
(1401, 40, 'Выездное', NULL, NULL, NULL),
(1402, 40, 'Выкса', NULL, NULL, NULL),
(1403, 40, 'Гагино', NULL, NULL, NULL),
(1404, 40, 'Гидроторф', NULL, NULL, NULL),
(1405, 40, 'Горбатов', NULL, NULL, NULL),
(1406, 40, 'Горбатовка', NULL, NULL, NULL),
(1407, 40, 'Городец', NULL, NULL, NULL),
(1408, 40, 'Дальнее Константиново', NULL, NULL, NULL),
(1409, 40, 'Дзержинск', NULL, NULL, NULL),
(1410, 40, 'Дивеево', NULL, NULL, NULL),
(1411, 40, 'Досчатое', NULL, NULL, NULL),
(1412, 40, 'Заволжье', NULL, NULL, NULL),
(1413, 40, 'Керженец', NULL, NULL, NULL),
(1414, 40, 'Княгинино', NULL, NULL, NULL),
(1415, 40, 'Ковернино', NULL, NULL, NULL),
(1416, 40, 'Красные Баки', NULL, NULL, NULL),
(1417, 40, 'Кстово', NULL, NULL, NULL),
(1418, 40, 'Кулебаки', NULL, NULL, NULL),
(1419, 40, 'Лукоянов', NULL, NULL, NULL),
(1420, 40, 'Лысково', NULL, NULL, NULL),
(1421, 40, 'Навашино', NULL, NULL, NULL),
(1422, 40, 'Нижний Новгород', NULL, NULL, NULL),
(1423, 40, 'Новосмолинский', NULL, NULL, NULL),
(1424, 40, 'Павлово', NULL, NULL, NULL),
(1425, 40, 'Первомайск', NULL, NULL, NULL),
(1426, 40, 'Перевоз', NULL, NULL, NULL),
(1427, 40, 'Пильна', NULL, NULL, NULL),
(1428, 40, 'Починки', NULL, NULL, NULL),
(1429, 40, 'Саров (Нижегородская обл.)', NULL, NULL, NULL),
(1430, 40, 'Семенов', NULL, NULL, NULL),
(1431, 40, 'Сергач', NULL, NULL, NULL),
(1432, 40, 'Сеченово', NULL, NULL, NULL),
(1433, 40, 'Сосновское', NULL, NULL, NULL),
(1434, 40, 'Спасское', NULL, NULL, NULL),
(1435, 40, 'Тонкино', NULL, NULL, NULL),
(1436, 40, 'Тоншаево', NULL, NULL, NULL),
(1437, 40, 'Уразовка', NULL, NULL, NULL),
(1438, 40, 'Урень', NULL, NULL, NULL),
(1439, 40, 'Чкаловск', NULL, NULL, NULL),
(1440, 40, 'Шаранга', NULL, NULL, NULL),
(1441, 40, 'Шатки', NULL, NULL, NULL),
(1442, 40, 'Шахунья', NULL, NULL, NULL),
(1443, 41, 'Анциферово', NULL, NULL, NULL),
(1444, 41, 'Батецкий', NULL, NULL, NULL),
(1445, 41, 'Большая Вишера', NULL, NULL, NULL),
(1446, 41, 'Боровичи', NULL, NULL, NULL),
(1447, 41, 'Валдай', NULL, NULL, NULL),
(1448, 41, 'Великий Новгород (Новгород)', NULL, NULL, NULL),
(1449, 41, 'Волот', NULL, NULL, NULL),
(1450, 41, 'Деманск', NULL, NULL, NULL),
(1451, 41, 'Зарубино', NULL, NULL, NULL),
(1452, 41, 'Крестцы', NULL, NULL, NULL),
(1453, 41, 'Любытино', NULL, NULL, NULL),
(1454, 41, 'Малая Вишера', NULL, NULL, NULL),
(1455, 41, 'Марево', NULL, NULL, NULL),
(1456, 41, 'Мошенское', NULL, NULL, NULL),
(1457, 41, 'Окуловка', NULL, NULL, NULL),
(1458, 41, 'Парфино', NULL, NULL, NULL),
(1459, 41, 'Пестово', NULL, NULL, NULL),
(1460, 41, 'Поддорье', NULL, NULL, NULL),
(1461, 41, 'Сольцы', NULL, NULL, NULL),
(1462, 41, 'Старая Русса', NULL, NULL, NULL),
(1463, 41, 'Хвойная', NULL, NULL, NULL),
(1464, 41, 'Холм', NULL, NULL, NULL),
(1465, 41, 'Чудово', NULL, NULL, NULL),
(1466, 41, 'Шимск', NULL, NULL, NULL),
(1467, 42, 'Баган', NULL, NULL, NULL),
(1468, 42, 'Барабинск', NULL, NULL, NULL),
(1469, 42, 'Бердск', NULL, NULL, NULL),
(1470, 42, 'Биаза', NULL, NULL, NULL),
(1471, 42, 'Болотное', NULL, NULL, NULL),
(1472, 42, 'Венгерово', NULL, NULL, NULL),
(1473, 42, 'Довольное', NULL, NULL, NULL),
(1474, 42, 'Завьялово', NULL, NULL, NULL),
(1475, 42, 'Искитим', NULL, NULL, NULL),
(1476, 42, 'Карасук', NULL, NULL, NULL),
(1477, 42, 'Каргат', NULL, NULL, NULL),
(1478, 42, 'Колывань', NULL, NULL, NULL),
(1479, 42, 'Краснозерское', NULL, NULL, NULL),
(1480, 42, 'Крутиха', NULL, NULL, NULL),
(1481, 42, 'Куйбышев (Новосибирская обл.)', NULL, NULL, NULL),
(1482, 42, 'Купино', NULL, NULL, NULL),
(1483, 42, 'Кыштовка', NULL, NULL, NULL),
(1484, 42, 'Маслянино', NULL, NULL, NULL),
(1485, 42, 'Мошково', NULL, NULL, NULL),
(1486, 42, 'Новосибирск', NULL, NULL, NULL),
(1487, 42, 'Норильск', NULL, NULL, NULL),
(1488, 42, 'Обь', NULL, NULL, NULL),
(1489, 42, 'Ордынское', NULL, NULL, NULL),
(1490, 42, 'Северное', NULL, NULL, NULL),
(1491, 42, 'Сузун', NULL, NULL, NULL),
(1492, 42, 'Татарск', NULL, NULL, NULL),
(1493, 42, 'Тогучин', NULL, NULL, NULL),
(1494, 42, 'Убинское', NULL, NULL, NULL),
(1495, 42, 'Усть-Тарка', NULL, NULL, NULL),
(1496, 42, 'Чаны', NULL, NULL, NULL),
(1497, 42, 'Черепаново', NULL, NULL, NULL),
(1498, 42, 'Чистоозерное', NULL, NULL, NULL),
(1499, 42, 'Чулым', NULL, NULL, NULL),
(1500, 43, 'Береговой', NULL, NULL, NULL),
(1501, 43, 'Большеречье', NULL, NULL, NULL),
(1502, 43, 'Большие Уки', NULL, NULL, NULL),
(1503, 43, 'Горьковское', NULL, NULL, NULL),
(1504, 43, 'Знаменское (Омская обл.)', NULL, NULL, NULL),
(1505, 43, 'Исилькуль', NULL, NULL, NULL),
(1506, 43, 'Калачинск', NULL, NULL, NULL),
(1507, 43, 'Колосовка', NULL, NULL, NULL),
(1508, 43, 'Кормиловка', NULL, NULL, NULL),
(1509, 43, 'Крутинка', NULL, NULL, NULL),
(1510, 43, 'Любинский', NULL, NULL, NULL),
(1511, 43, 'Марьяновка', NULL, NULL, NULL),
(1512, 43, 'Муромцево', NULL, NULL, NULL),
(1513, 43, 'Называевск', NULL, NULL, NULL),
(1514, 43, 'Нижняя Омка', NULL, NULL, NULL),
(1515, 43, 'Нововаршавка', NULL, NULL, NULL),
(1516, 43, 'Одесское', NULL, NULL, NULL),
(1517, 43, 'Оконешниково', NULL, NULL, NULL),
(1518, 43, 'Омск', NULL, NULL, NULL),
(1519, 43, 'Павлоградка', NULL, NULL, NULL),
(1520, 43, 'Полтавка', NULL, NULL, NULL),
(1521, 43, 'Русская Поляна', NULL, NULL, NULL),
(1522, 43, 'Саргатское', NULL, NULL, NULL),
(1523, 43, 'Седельниково', NULL, NULL, NULL),
(1524, 43, 'Таврическое', NULL, NULL, NULL),
(1525, 43, 'Тара', NULL, NULL, NULL),
(1526, 43, 'Тевриз', NULL, NULL, NULL),
(1527, 43, 'Тюкалинск', NULL, NULL, NULL),
(1528, 43, 'Усть-Ишим', NULL, NULL, NULL),
(1529, 43, 'Черлак', NULL, NULL, NULL),
(1530, 43, 'Шербакуль', NULL, NULL, NULL),
(1531, 44, 'Абдулино', NULL, NULL, NULL),
(1532, 44, 'Адамовка', NULL, NULL, NULL),
(1533, 44, 'Айдырлинский', NULL, NULL, NULL),
(1534, 44, 'Акбулак', NULL, NULL, NULL),
(1535, 44, 'Аккермановка', NULL, NULL, NULL),
(1536, 44, 'Асекеево', NULL, NULL, NULL),
(1537, 44, 'Беляевка', NULL, NULL, NULL),
(1538, 44, 'Бугуруслан', NULL, NULL, NULL),
(1539, 44, 'Бузулук', NULL, NULL, NULL),
(1540, 44, 'Гай', NULL, NULL, NULL),
(1541, 44, 'Грачевка', NULL, NULL, NULL),
(1542, 44, 'Домбаровский', NULL, NULL, NULL),
(1543, 44, 'Дубенский', NULL, NULL, NULL),
(1544, 44, 'Илек', NULL, NULL, NULL),
(1545, 44, 'Ириклинский', NULL, NULL, NULL),
(1546, 44, 'Кувандык', NULL, NULL, NULL),
(1547, 44, 'Курманаевка', NULL, NULL, NULL),
(1548, 44, 'Матвеевка', NULL, NULL, NULL),
(1549, 44, 'Медногорск', NULL, NULL, NULL),
(1550, 44, 'Новоорск', NULL, NULL, NULL),
(1551, 44, 'Новосергиевка', NULL, NULL, NULL),
(1552, 44, 'Новотроицк', NULL, NULL, NULL),
(1553, 44, 'Октябрьское (Оренбург.)', NULL, NULL, NULL),
(1554, 44, 'Оренбург', NULL, NULL, NULL),
(1555, 44, 'Орск', NULL, NULL, NULL),
(1556, 44, 'Первомайский (Оренбург.)', NULL, NULL, NULL),
(1557, 44, 'Переволоцкий', NULL, NULL, NULL),
(1558, 44, 'Пономаревка', NULL, NULL, NULL),
(1559, 44, 'Саракташ', NULL, NULL, NULL),
(1560, 44, 'Светлый (Оренбургская обл.)', NULL, NULL, NULL),
(1561, 44, 'Северное', NULL, NULL, NULL),
(1562, 44, 'Соль-Илецк', NULL, NULL, NULL),
(1563, 44, 'Сорочинск', NULL, NULL, NULL),
(1564, 44, 'Ташла', NULL, NULL, NULL),
(1565, 44, 'Тоцкое', NULL, NULL, NULL),
(1566, 44, 'Тюльган', NULL, NULL, NULL),
(1567, 44, 'Шарлык', NULL, NULL, NULL),
(1568, 44, 'Энергетик', NULL, NULL, NULL),
(1569, 44, 'Ясный', NULL, NULL, NULL),
(1570, 45, 'Болхов', NULL, NULL, NULL),
(1571, 45, 'Верховье', NULL, NULL, NULL),
(1572, 45, 'Глазуновка', NULL, NULL, NULL),
(1573, 45, 'Дмитровск-Орловский', NULL, NULL, NULL),
(1574, 45, 'Долгое', NULL, NULL, NULL),
(1575, 45, 'Залегощь', NULL, NULL, NULL),
(1576, 45, 'Змиевка', NULL, NULL, NULL),
(1577, 45, 'Знаменское (Орловская обл.)', NULL, NULL, NULL),
(1578, 45, 'Колпны', NULL, NULL, NULL),
(1579, 45, 'Красная Заря', NULL, NULL, NULL),
(1580, 45, 'Кромы', NULL, NULL, NULL),
(1581, 45, 'Ливны', NULL, NULL, NULL),
(1582, 45, 'Малоархангельск', NULL, NULL, NULL),
(1583, 45, 'Мценск', NULL, NULL, NULL),
(1584, 45, 'Нарышкино', NULL, NULL, NULL),
(1585, 45, 'Новосиль', NULL, NULL, NULL),
(1586, 45, 'Орел', NULL, NULL, NULL),
(1587, 45, 'Покровское', NULL, NULL, NULL),
(1588, 45, 'Сосково', NULL, NULL, NULL),
(1589, 45, 'Тросна', NULL, NULL, NULL),
(1590, 45, 'Хомутово', NULL, NULL, NULL),
(1591, 45, 'Хотынец', NULL, NULL, NULL),
(1592, 45, 'Шаблыкино', NULL, NULL, NULL),
(1593, 46, 'Башмаково', NULL, NULL, NULL),
(1594, 46, 'Беднодемьяновск', NULL, NULL, NULL),
(1595, 46, 'Беково', NULL, NULL, NULL),
(1596, 46, 'Белинский', NULL, NULL, NULL),
(1597, 46, 'Бессоновка', NULL, NULL, NULL),
(1598, 46, 'Вадинск', NULL, NULL, NULL),
(1599, 46, 'Верхозим', NULL, NULL, NULL),
(1600, 46, 'Городище (Пензенская обл.)', NULL, NULL, NULL),
(1601, 46, 'Евлашево', NULL, NULL, NULL),
(1602, 46, 'Заречный (Пензенская обл.)', NULL, NULL, NULL),
(1603, 46, 'Земетчино', NULL, NULL, NULL),
(1604, 46, 'Золотаревка', NULL, NULL, NULL),
(1605, 46, 'Исса', NULL, NULL, NULL),
(1606, 46, 'Каменка', NULL, NULL, NULL),
(1607, 46, 'Колышлей', NULL, NULL, NULL),
(1608, 46, 'Кондоль', NULL, NULL, NULL),
(1609, 46, 'Кузнецк', NULL, NULL, NULL),
(1610, 46, 'Лопатино', NULL, NULL, NULL),
(1611, 46, 'Малая Сердоба', NULL, NULL, NULL),
(1612, 46, 'Мокшан', NULL, NULL, NULL),
(1613, 46, 'Наровчат', NULL, NULL, NULL),
(1614, 46, 'Неверкино', NULL, NULL, NULL),
(1615, 46, 'Нижний Ломов', NULL, NULL, NULL),
(1616, 46, 'Никольск (Пензенская обл.)', NULL, NULL, NULL),
(1617, 46, 'Пачелма', NULL, NULL, NULL),
(1618, 46, 'Пенза', NULL, NULL, NULL),
(1619, 46, 'Русский Камешкир', NULL, NULL, NULL),
(1620, 46, 'Сердобск', NULL, NULL, NULL),
(1621, 46, 'Сосновоборск', NULL, NULL, NULL),
(1622, 46, 'Сура', NULL, NULL, NULL),
(1623, 46, 'Тамала', NULL, NULL, NULL),
(1624, 46, 'Шемышейка', NULL, NULL, NULL),
(1625, 47, 'Александровск', NULL, NULL, NULL),
(1626, 47, 'Барда', NULL, NULL, NULL),
(1627, 47, 'Березники', NULL, NULL, NULL),
(1628, 47, 'Большая Соснова', NULL, NULL, NULL),
(1629, 47, 'Верещагино', NULL, NULL, NULL),
(1630, 47, 'Гайны', NULL, NULL, NULL),
(1631, 47, 'Горнозаводск (Пермский край)', NULL, NULL, NULL),
(1632, 47, 'Гремячинск', NULL, NULL, NULL),
(1633, 47, 'Губаха', NULL, NULL, NULL),
(1634, 47, 'Добрянка', NULL, NULL, NULL),
(1635, 47, 'Елово', NULL, NULL, NULL),
(1636, 47, 'Зюкайка', NULL, NULL, NULL),
(1637, 47, 'Ильинский (Пермская обл.)', NULL, NULL, NULL),
(1638, 47, 'Карагай', NULL, NULL, NULL),
(1639, 47, 'Керчевский', NULL, NULL, NULL),
(1640, 47, 'Кизел', NULL, NULL, NULL),
(1641, 47, 'Коса', NULL, NULL, NULL),
(1642, 47, 'Кочево', NULL, NULL, NULL),
(1643, 47, 'Красновишерск', NULL, NULL, NULL),
(1644, 47, 'Краснокамск', NULL, NULL, NULL),
(1645, 47, 'Кудымкар', NULL, NULL, NULL),
(1646, 47, 'Куеда', NULL, NULL, NULL),
(1647, 47, 'Кунгур', NULL, NULL, NULL),
(1648, 47, 'Лысьва', NULL, NULL, NULL),
(1649, 47, 'Ныроб', NULL, NULL, NULL),
(1650, 47, 'Нытва', NULL, NULL, NULL),
(1651, 47, 'Октябрьский', NULL, NULL, NULL),
(1652, 47, 'Орда', NULL, NULL, NULL),
(1653, 47, 'Оса', NULL, NULL, NULL),
(1654, 47, 'Оханск', NULL, NULL, NULL),
(1655, 47, 'Очер', NULL, NULL, NULL),
(1656, 47, 'Пермь', NULL, NULL, NULL),
(1657, 47, 'Соликамск', NULL, NULL, NULL),
(1658, 47, 'Суксун', NULL, NULL, NULL),
(1659, 47, 'Уинское', NULL, NULL, NULL),
(1660, 47, 'Усолье', NULL, NULL, NULL),
(1661, 47, 'Усть-Кишерть', NULL, NULL, NULL),
(1662, 47, 'Чайковский', NULL, NULL, NULL),
(1663, 47, 'Частые', NULL, NULL, NULL),
(1664, 47, 'Чердынь', NULL, NULL, NULL),
(1665, 47, 'Чернореченский', NULL, NULL, NULL),
(1666, 47, 'Чернушка', NULL, NULL, NULL),
(1667, 47, 'Чусовой', NULL, NULL, NULL),
(1668, 47, 'Юрла', NULL, NULL, NULL),
(1669, 47, 'Юсьва', NULL, NULL, NULL),
(1670, 48, 'Анучино', NULL, NULL, NULL),
(1671, 48, 'Арсеньев', NULL, NULL, NULL),
(1672, 48, 'Артем', NULL, NULL, NULL),
(1673, 48, 'Артемовский (Приморский край)', NULL, NULL, NULL),
(1674, 48, 'Большой Камень', NULL, NULL, NULL),
(1675, 48, 'Валентин', NULL, NULL, NULL),
(1676, 48, 'Владивосток', NULL, NULL, NULL),
(1677, 48, 'Высокогорск', NULL, NULL, NULL),
(1678, 48, 'Горные Ключи', NULL, NULL, NULL),
(1679, 48, 'Горный', NULL, NULL, NULL),
(1680, 48, 'Дальнегорск', NULL, NULL, NULL),
(1681, 48, 'Дальнереченск', NULL, NULL, NULL),
(1682, 48, 'Зарубино', NULL, NULL, NULL),
(1683, 48, 'Кавалерово', NULL, NULL, NULL),
(1684, 48, 'Каменка (Приморский край)', NULL, NULL, NULL),
(1685, 48, 'Камень-Рыболов', NULL, NULL, NULL),
(1686, 48, 'Кировский', NULL, NULL, NULL),
(1687, 48, 'Лазо', NULL, NULL, NULL),
(1688, 48, 'Лесозаводск', NULL, NULL, NULL),
(1689, 48, 'Лучегорск', NULL, NULL, NULL),
(1690, 48, 'Михайловка (Приморский край)', NULL, NULL, NULL),
(1691, 48, 'Находка (Приморский край)', NULL, NULL, NULL),
(1692, 48, 'Новопокровка', NULL, NULL, NULL),
(1693, 48, 'Ольга', NULL, NULL, NULL),
(1694, 48, 'Партизанск', NULL, NULL, NULL),
(1695, 48, 'Пластун', NULL, NULL, NULL),
(1696, 48, 'Пограничный', NULL, NULL, NULL),
(1697, 48, 'Покровка', NULL, NULL, NULL),
(1698, 48, 'Посьет', NULL, NULL, NULL),
(1699, 48, 'Русский', NULL, NULL, NULL),
(1700, 48, 'Славянка', NULL, NULL, NULL),
(1701, 48, 'Спасск-Дальний', NULL, NULL, NULL),
(1702, 48, 'Терней', NULL, NULL, NULL),
(1703, 48, 'Уссурийск', NULL, NULL, NULL),
(1704, 48, 'Фокино', NULL, NULL, NULL),
(1705, 48, 'Хасан', NULL, NULL, NULL),
(1706, 48, 'Хороль', NULL, NULL, NULL),
(1707, 48, 'Черниговка', NULL, NULL, NULL),
(1708, 48, 'Чугуевка', NULL, NULL, NULL),
(1709, 48, 'Яковлевка', NULL, NULL, NULL),
(1710, 48, 'Ярославский', NULL, NULL, NULL),
(1711, 49, 'Бежаницы', NULL, NULL, NULL),
(1712, 49, 'Великие Луки', NULL, NULL, NULL),
(1713, 49, 'Гдов', NULL, NULL, NULL),
(1714, 49, 'Дедовичи', NULL, NULL, NULL),
(1715, 49, 'Дно', NULL, NULL, NULL),
(1716, 49, 'Заплюсье', NULL, NULL, NULL),
(1717, 49, 'Идрица', NULL, NULL, NULL),
(1718, 49, 'Красногородское', NULL, NULL, NULL),
(1719, 49, 'Кунья', NULL, NULL, NULL),
(1720, 49, 'Локня', NULL, NULL, NULL),
(1721, 49, 'Невель', NULL, NULL, NULL),
(1722, 49, 'Новоржев', NULL, NULL, NULL),
(1723, 49, 'Новосокольники', NULL, NULL, NULL),
(1724, 49, 'Опочка', NULL, NULL, NULL),
(1725, 49, 'Остров', NULL, NULL, NULL),
(1726, 49, 'Палкино', NULL, NULL, NULL),
(1727, 49, 'Печоры', NULL, NULL, NULL),
(1728, 49, 'Плюсса', NULL, NULL, NULL),
(1729, 49, 'Порхов', NULL, NULL, NULL),
(1730, 49, 'Псков', NULL, NULL, NULL),
(1731, 49, 'Пустошка', NULL, NULL, NULL),
(1732, 49, 'Пушкинские Горы', NULL, NULL, NULL),
(1733, 49, 'Пыталово', NULL, NULL, NULL),
(1734, 49, 'Себеж', NULL, NULL, NULL),
(1735, 49, 'Струги-Красные', NULL, NULL, NULL),
(1736, 49, 'Усвяты', NULL, NULL, NULL),
(1737, 51, 'Азов', NULL, NULL, NULL),
(1738, 51, 'Аксай (Ростовская обл.)', NULL, NULL, NULL),
(1739, 51, 'Алмазный', NULL, NULL, NULL),
(1740, 51, 'Аютинск', NULL, NULL, NULL),
(1741, 51, 'Багаевский', NULL, NULL, NULL),
(1742, 51, 'Батайск', NULL, NULL, NULL),
(1743, 51, 'Белая Калитва', NULL, NULL, NULL),
(1744, 51, 'Боковская', NULL, NULL, NULL),
(1745, 51, 'Большая Мартыновка', NULL, NULL, NULL),
(1746, 51, 'Вешенская', NULL, NULL, NULL),
(1747, 51, 'Волгодонск', NULL, NULL, NULL),
(1748, 51, 'Восход', NULL, NULL, NULL),
(1749, 51, 'Гигант', NULL, NULL, NULL),
(1750, 51, 'Горняцкий', NULL, NULL, NULL),
(1751, 51, 'Гуково', NULL, NULL, NULL),
(1752, 51, 'Донецк', NULL, NULL, NULL),
(1753, 51, 'Донской (Ростовская обл.)', NULL, NULL, NULL),
(1754, 51, 'Дубовское', NULL, NULL, NULL),
(1755, 51, 'Егорлыкская', NULL, NULL, NULL),
(1756, 51, 'Жирнов', NULL, NULL, NULL),
(1757, 51, 'Заветное', NULL, NULL, NULL),
(1758, 51, 'Заводской', NULL, NULL, NULL),
(1759, 51, 'Зверево', NULL, NULL, NULL),
(1760, 51, 'Зерноград', NULL, NULL, NULL),
(1761, 51, 'Зимовники', NULL, NULL, NULL),
(1762, 51, 'Кагальницкая', NULL, NULL, NULL),
(1763, 51, 'Казанская', NULL, NULL, NULL),
(1764, 51, 'Каменоломни', NULL, NULL, NULL),
(1765, 51, 'Каменск-Шахтинский', NULL, NULL, NULL),
(1766, 51, 'Кашары', NULL, NULL, NULL),
(1767, 51, 'Коксовый', NULL, NULL, NULL),
(1768, 51, 'Константиновск', NULL, NULL, NULL),
(1769, 51, 'Красный Сулин', NULL, NULL, NULL),
(1770, 51, 'Куйбышево', NULL, NULL, NULL),
(1771, 51, 'Матвеев Курган', NULL, NULL, NULL),
(1772, 51, 'Мигулинская', NULL, NULL, NULL),
(1773, 51, 'Миллерово', NULL, NULL, NULL),
(1774, 51, 'Милютинская', NULL, NULL, NULL),
(1775, 51, 'Морозовск', NULL, NULL, NULL),
(1776, 51, 'Новочеркасск', NULL, NULL, NULL),
(1777, 51, 'Новошахтинск', NULL, NULL, NULL),
(1778, 51, 'Обливская', NULL, NULL, NULL),
(1779, 51, 'Орловский', NULL, NULL, NULL),
(1780, 51, 'Песчанокопское', NULL, NULL, NULL),
(1781, 51, 'Покровское', NULL, NULL, NULL),
(1782, 51, 'Пролетарск', NULL, NULL, NULL),
(1783, 51, 'Ремонтное', NULL, NULL, NULL),
(1784, 51, 'Родионово-Несветайская', NULL, NULL, NULL),
(1785, 51, 'Ростов-на-Дону', NULL, NULL, NULL),
(1786, 51, 'Сальск', NULL, NULL, NULL),
(1787, 51, 'Семикаракорск', NULL, NULL, NULL),
(1788, 51, 'Таганрог', NULL, NULL, NULL),
(1789, 51, 'Тарасовский', NULL, NULL, NULL),
(1790, 51, 'Тацинский', NULL, NULL, NULL),
(1791, 51, 'Усть-Донецкий', NULL, NULL, NULL),
(1792, 51, 'Целина', NULL, NULL, NULL),
(1793, 51, 'Цимлянск', NULL, NULL, NULL),
(1794, 51, 'Чалтырь', NULL, NULL, NULL),
(1795, 51, 'Чертково', NULL, NULL, NULL),
(1796, 51, 'Шахты', NULL, NULL, NULL),
(1797, 51, 'Шолоховский', NULL, NULL, NULL),
(1798, 51, 'Александро-Невский', NULL, NULL, NULL),
(1799, 51, 'Горняк', NULL, NULL, NULL),
(1800, 51, 'Гусь Железный', NULL, NULL, NULL),
(1801, 51, 'Елатьма', NULL, NULL, NULL),
(1802, 51, 'Ермишь', NULL, NULL, NULL),
(1803, 51, 'Заречный (Рязанская обл.)', NULL, NULL, NULL),
(1804, 51, 'Захарово', NULL, NULL, NULL),
(1805, 51, 'Кадом', NULL, NULL, NULL),
(1806, 51, 'Касимов', NULL, NULL, NULL),
(1807, 51, 'Кораблино', NULL, NULL, NULL),
(1808, 51, 'Милославское', NULL, NULL, NULL),
(1809, 51, 'Михайлов', NULL, NULL, NULL),
(1810, 51, 'Новомичуринск', NULL, NULL, NULL),
(1811, 51, 'Пителино', NULL, NULL, NULL),
(1812, 51, 'Пронск', NULL, NULL, NULL),
(1813, 51, 'Путятино', NULL, NULL, NULL),
(1814, 51, 'Рыбное', NULL, NULL, NULL),
(1815, 51, 'Ряжск', NULL, NULL, NULL),
(1816, 51, 'Рязань', NULL, NULL, NULL),
(1817, 51, 'Сапожок', NULL, NULL, NULL),
(1818, 51, 'Сараи', NULL, NULL, NULL),
(1819, 51, 'Сасово', NULL, NULL, NULL),
(1820, 51, 'Скопин', NULL, NULL, NULL),
(1821, 51, 'Спас-Клепики', NULL, NULL, NULL),
(1822, 51, 'Спасск-Рязанский', NULL, NULL, NULL),
(1823, 51, 'Старожилово', NULL, NULL, NULL),
(1824, 51, 'Ухолово', NULL, NULL, NULL),
(1825, 51, 'Чучково', NULL, NULL, NULL),
(1826, 51, 'Шацк', NULL, NULL, NULL),
(1827, 51, 'Шилово', NULL, NULL, NULL),
(1828, 52, 'Алексеевка (Самарская обл.)', NULL, NULL, NULL),
(1829, 52, 'Безенчук', NULL, NULL, NULL),
(1830, 52, 'Богатое', NULL, NULL, NULL),
(1831, 52, 'Богатырь', NULL, NULL, NULL),
(1832, 52, 'Большая Глушица', NULL, NULL, NULL),
(1833, 52, 'Большая Глущица (Самарск.)', NULL, NULL, NULL),
(1834, 52, 'Большая Черниговка', NULL, NULL, NULL),
(1835, 52, 'Борское', NULL, NULL, NULL),
(1836, 52, 'Волжский (Самарская обл.)', NULL, NULL, NULL),
(1837, 52, 'Жигулевск', NULL, NULL, NULL),
(1838, 52, 'Зольное', NULL, NULL, NULL),
(1839, 52, 'Исаклы', NULL, NULL, NULL),
(1840, 52, 'Камышла', NULL, NULL, NULL),
(1841, 52, 'Кинель', NULL, NULL, NULL),
(1842, 52, 'Кинель-Черкасы', NULL, NULL, NULL),
(1843, 52, 'Клявлино', NULL, NULL, NULL),
(1844, 52, 'Кошки', NULL, NULL, NULL),
(1845, 52, 'Красноармейское (Самарск.)', NULL, NULL, NULL),
(1846, 52, 'Красный Яр (Самарская обл.)', NULL, NULL, NULL),
(1847, 52, 'Куйбышев', NULL, NULL, NULL),
(1848, 52, 'Нефтегорск', NULL, NULL, NULL),
(1849, 52, 'Новокуйбышевск', NULL, NULL, NULL),
(1850, 52, 'Октябрьск', NULL, NULL, NULL),
(1851, 52, 'Отрадный', NULL, NULL, NULL),
(1852, 52, 'Пестравка', NULL, NULL, NULL),
(1853, 52, 'Похвистнево', NULL, NULL, NULL),
(1854, 52, 'Приволжье', NULL, NULL, NULL),
(1855, 52, 'Самара', NULL, NULL, NULL),
(1856, 52, 'Сергиевск', NULL, NULL, NULL),
(1857, 52, 'Сургут (Самарская обл.)', NULL, NULL, NULL),
(1858, 52, 'Сызрань', NULL, NULL, NULL),
(1859, 52, 'Тольятти', NULL, NULL, NULL),
(1860, 52, 'Хворостянка', NULL, NULL, NULL),
(1861, 52, 'Чапаевск', NULL, NULL, NULL),
(1862, 52, 'Челно-Вершины', NULL, NULL, NULL),
(1863, 52, 'Шентала', NULL, NULL, NULL),
(1864, 52, 'Шигоны', NULL, NULL, NULL),
(1865, 53, 'Александров Гай', NULL, NULL, NULL),
(1866, 53, 'Аркадак', NULL, NULL, NULL),
(1867, 53, 'Аткарск', NULL, NULL, NULL),
(1868, 53, 'Базарный Карабулак', NULL, NULL, NULL),
(1869, 53, 'Балаково', NULL, NULL, NULL),
(1870, 53, 'Балашов', NULL, NULL, NULL),
(1871, 53, 'Балтай', NULL, NULL, NULL),
(1872, 53, 'Возрождение', NULL, NULL, NULL),
(1873, 53, 'Вольск', NULL, NULL, NULL),
(1874, 53, 'Воскресенское (Саратовск.)', NULL, NULL, NULL),
(1875, 53, 'Горный', NULL, NULL, NULL),
(1876, 53, 'Дергачи', NULL, NULL, NULL),
(1877, 53, 'Духовницкое', NULL, NULL, NULL),
(1878, 53, 'Екатериновка', NULL, NULL, NULL),
(1879, 53, 'Ершов', NULL, NULL, NULL),
(1880, 53, 'Ивантеевка (Саратовская обл.)', NULL, NULL, NULL),
(1881, 53, 'Калининск', NULL, NULL, NULL),
(1882, 53, 'Каменский', NULL, NULL, NULL),
(1883, 53, 'Красноармейск (Саратовск.)', NULL, NULL, NULL),
(1884, 53, 'Красный Кут', NULL, NULL, NULL),
(1885, 53, 'Лысые Горы', NULL, NULL, NULL),
(1886, 53, 'Маркс', NULL, NULL, NULL),
(1887, 53, 'Мокроус', NULL, NULL, NULL),
(1888, 53, 'Новоузенск', NULL, NULL, NULL),
(1889, 53, 'Новые Бурасы', NULL, NULL, NULL),
(1890, 53, 'Озинки', NULL, NULL, NULL),
(1891, 53, 'Перелюб', NULL, NULL, NULL),
(1892, 53, 'Петровск', NULL, NULL, NULL),
(1893, 53, 'Питерка', NULL, NULL, NULL),
(1894, 53, 'Пугачев', NULL, NULL, NULL),
(1895, 53, 'Ровное', NULL, NULL, NULL),
(1896, 53, 'Романовка', NULL, NULL, NULL),
(1897, 53, 'Ртищево', NULL, NULL, NULL),
(1898, 53, 'Самойловка', NULL, NULL, NULL),
(1899, 53, 'Саратов', NULL, NULL, NULL),
(1900, 53, 'Степное (Саратовская обл.)', NULL, NULL, NULL),
(1901, 53, 'Татищево', NULL, NULL, NULL),
(1902, 53, 'Турки', NULL, NULL, NULL),
(1903, 53, 'Хвалынск', NULL, NULL, NULL),
(1904, 53, 'Энгельс', NULL, NULL, NULL),
(1905, 54, 'Абый', NULL, NULL, NULL),
(1906, 54, 'Айхал', NULL, NULL, NULL),
(1907, 54, 'Алдан', NULL, NULL, NULL),
(1908, 54, 'Амга', NULL, NULL, NULL),
(1909, 54, 'Батагай', NULL, NULL, NULL),
(1910, 54, 'Бердигестях', NULL, NULL, NULL),
(1911, 54, 'Беркакит', NULL, NULL, NULL),
(1912, 54, 'Бестях', NULL, NULL, NULL),
(1913, 54, 'Борогонцы', NULL, NULL, NULL),
(1914, 54, 'Верхневилюйск', NULL, NULL, NULL),
(1915, 54, 'Верхоянск', NULL, NULL, NULL),
(1916, 54, 'Вилюйск', NULL, NULL, NULL),
(1917, 54, 'Витим', NULL, NULL, NULL),
(1918, 54, 'Власово', NULL, NULL, NULL),
(1919, 54, 'Депутатский', NULL, NULL, NULL),
(1920, 54, 'Жиганск', NULL, NULL, NULL),
(1921, 54, 'Зырянка', NULL, NULL, NULL),
(1922, 54, 'Кангалассы', NULL, NULL, NULL),
(1923, 54, 'Ленск', NULL, NULL, NULL),
(1924, 54, 'Майя', NULL, NULL, NULL),
(1925, 54, 'Мирный (Саха)', NULL, NULL, NULL),
(1926, 54, 'Нерюнгри', NULL, NULL, NULL),
(1927, 54, 'Нижний Куранах', NULL, NULL, NULL),
(1928, 54, 'Нюрба', NULL, NULL, NULL),
(1929, 54, 'Олекминск', NULL, NULL, NULL),
(1930, 54, 'Покровск', NULL, NULL, NULL),
(1931, 54, 'Сангар', NULL, NULL, NULL),
(1932, 54, 'Саскылах', NULL, NULL, NULL),
(1933, 54, 'Солнечный', NULL, NULL, NULL),
(1934, 54, 'Среднеколымск', NULL, NULL, NULL),
(1935, 54, 'Сунтар', NULL, NULL, NULL),
(1936, 54, 'Тикси', NULL, NULL, NULL),
(1937, 54, 'Удачный', NULL, NULL, NULL),
(1938, 54, 'Усть-Мая', NULL, NULL, NULL),
(1939, 54, 'Усть-Нера', NULL, NULL, NULL),
(1940, 54, 'Хандыга', NULL, NULL, NULL),
(1941, 54, 'Хонуу', NULL, NULL, NULL),
(1942, 54, 'Чернышевский', NULL, NULL, NULL),
(1943, 54, 'Черский', NULL, NULL, NULL),
(1944, 54, 'Чокурдах', NULL, NULL, NULL),
(1945, 54, 'Чульман', NULL, NULL, NULL),
(1946, 54, 'Чурапча', NULL, NULL, NULL),
(1947, 54, 'Якутск', NULL, NULL, NULL),
(1948, 55, 'Александровск-Сахалинский', NULL, NULL, NULL),
(1949, 55, 'Анбэцу', NULL, NULL, NULL),
(1950, 55, 'Анива', NULL, NULL, NULL),
(1951, 55, 'Бошняково', NULL, NULL, NULL),
(1952, 55, 'Быков', NULL, NULL, NULL),
(1953, 55, 'Вахрушев', NULL, NULL, NULL),
(1954, 55, 'Взморье', NULL, NULL, NULL),
(1955, 55, 'Гастелло', NULL, NULL, NULL),
(1956, 55, 'Горнозаводск (Сахалин)', NULL, NULL, NULL),
(1957, 55, 'Долинск', NULL, NULL, NULL),
(1958, 55, 'Ильинский (Сахалин)', NULL, NULL, NULL),
(1959, 55, 'Катангли', NULL, NULL, NULL),
(1960, 55, 'Корсаков', NULL, NULL, NULL),
(1961, 55, 'Курильск', NULL, NULL, NULL),
(1962, 55, 'Макаров', NULL, NULL, NULL),
(1963, 55, 'Невельск', NULL, NULL, NULL),
(1964, 55, 'Ноглики', NULL, NULL, NULL),
(1965, 55, 'Оха', NULL, NULL, NULL),
(1966, 55, 'Поронайск', NULL, NULL, NULL),
(1967, 55, 'Северо-Курильск', NULL, NULL, NULL),
(1968, 55, 'Смирных', NULL, NULL, NULL),
(1969, 55, 'Томари', NULL, NULL, NULL),
(1970, 55, 'Тымовское', NULL, NULL, NULL),
(1971, 55, 'Углегорск', NULL, NULL, NULL),
(1972, 55, 'Холмск', NULL, NULL, NULL),
(1973, 55, 'Шахтерск', NULL, NULL, NULL),
(1974, 55, 'Южно-Курильск', NULL, NULL, NULL),
(1975, 55, 'Южно-Сахалинск', NULL, NULL, NULL),
(1976, 56, 'Алапаевск', NULL, NULL, NULL),
(1977, 56, 'Алтынай', NULL, NULL, NULL),
(1978, 56, 'Арамиль', NULL, NULL, NULL),
(1979, 56, 'Артемовский (Свердловская обл.)', NULL, NULL, NULL),
(1980, 56, 'Арти', NULL, NULL, NULL),
(1981, 56, 'Асбест', NULL, NULL, NULL),
(1982, 56, 'Ачит', NULL, NULL, NULL),
(1983, 56, 'Байкалово', NULL, NULL, NULL),
(1984, 56, 'Басьяновский', NULL, NULL, NULL),
(1985, 56, 'Белоярский (Свердловская обл.)', NULL, NULL, NULL),
(1986, 56, 'Березовский (Свердловская обл.)', NULL, NULL, NULL),
(1987, 56, 'Бисерть', NULL, NULL, NULL),
(1988, 56, 'Богданович', NULL, NULL, NULL),
(1989, 56, 'Буланаш', NULL, NULL, NULL),
(1990, 56, 'Верхний Тагил', NULL, NULL, NULL),
(1991, 56, 'Верхняя Пышма', NULL, NULL, NULL),
(1992, 56, 'Верхняя Салда', NULL, NULL, NULL),
(1993, 56, 'Верхняя Синячиха', NULL, NULL, NULL),
(1994, 56, 'Верхняя Сысерть', NULL, NULL, NULL),
(1995, 56, 'Верхняя Тура', NULL, NULL, NULL),
(1996, 56, 'Верхотурье', NULL, NULL, NULL),
(1997, 56, 'Висим', NULL, NULL, NULL),
(1998, 56, 'Волчанск', NULL, NULL, NULL),
(1999, 56, 'Гари', NULL, NULL, NULL),
(2000, 56, 'Дегтярск', NULL, NULL, NULL),
(2001, 56, 'Екатеринбург', NULL, NULL, NULL),
(2002, 56, 'Ертарский', NULL, NULL, NULL),
(2003, 56, 'Заводоуспенское', NULL, NULL, NULL),
(2004, 56, 'Заречный', NULL, NULL, NULL),
(2005, 56, 'Ивдель', NULL, NULL, NULL),
(2006, 56, 'Изумруд', NULL, NULL, NULL),
(2007, 56, 'Ирбит', NULL, NULL, NULL),
(2008, 56, 'Ис', NULL, NULL, NULL),
(2009, 56, 'Каменск-Уральский', NULL, NULL, NULL),
(2010, 56, 'Камышлов', NULL, NULL, NULL),
(2011, 56, 'Карпинск', NULL, NULL, NULL),
(2012, 56, 'Качканар', NULL, NULL, NULL),
(2013, 56, 'Кировград', NULL, NULL, NULL),
(2014, 56, 'Краснотурьинск', NULL, NULL, NULL),
(2015, 56, 'Красноуральск', NULL, NULL, NULL),
(2016, 56, 'Красноуфимск', NULL, NULL, NULL),
(2017, 56, 'Кушва', NULL, NULL, NULL),
(2018, 56, 'Лесной', NULL, NULL, NULL),
(2019, 56, 'Михайловск', NULL, NULL, NULL),
(2020, 2, 'Москва', NULL, NULL, NULL),
(2021, 2, 'Абрамцево', NULL, NULL, NULL),
(2022, 2, 'Алабино', NULL, NULL, NULL),
(2023, 2, 'Апрелевка', NULL, NULL, NULL),
(2024, 2, 'Архангельское', NULL, NULL, NULL),
(2025, 2, 'Ашитково', NULL, NULL, NULL),
(2026, 2, 'Байконур', NULL, NULL, NULL),
(2027, 2, 'Бакшеево', NULL, NULL, NULL),
(2028, 2, 'Балашиха', NULL, NULL, NULL),
(2029, 2, 'Барыбино', NULL, NULL, NULL),
(2030, 2, 'Белозёрский', NULL, NULL, NULL),
(2031, 2, 'Белоомут', NULL, NULL, NULL),
(2032, 2, 'Белые Столбы', NULL, NULL, NULL),
(2033, 2, 'Бородино (Московская обл.)', NULL, NULL, NULL),
(2034, 2, 'Бронницы', NULL, NULL, NULL),
(2035, 2, 'Быково (Московская обл.)', NULL, NULL, NULL),
(2036, 2, 'Валуево', NULL, NULL, NULL),
(2037, 2, 'Вербилки', NULL, NULL, NULL),
(2038, 2, 'Верея', NULL, NULL, NULL),
(2039, 2, 'Видное', NULL, NULL, NULL),
(2040, 2, 'Внуково', NULL, NULL, NULL),
(2041, 2, 'Вождь Пролетариата', NULL, NULL, NULL),
(2042, 2, 'Волоколамск', NULL, NULL, NULL),
(2043, 2, 'Вороново', NULL, NULL, NULL),
(2044, 2, 'Воскресенск', NULL, NULL, NULL),
(2045, 2, 'Восточный', NULL, NULL, NULL),
(2046, 2, 'Востряково', NULL, NULL, NULL),
(2047, 2, 'Высоковск', NULL, NULL, NULL),
(2048, 2, 'Голицыно (Московская обл.)', NULL, NULL, NULL),
(2049, 2, 'Деденево', NULL, NULL, NULL),
(2050, 2, 'Дедовск', NULL, NULL, NULL),
(2051, 2, 'Дзержинский', NULL, NULL, NULL),
(2052, 2, 'Дмитров', NULL, NULL, NULL),
(2053, 2, 'Долгопрудный', NULL, NULL, NULL),
(2054, 2, 'Домодедово', NULL, NULL, NULL),
(2055, 2, 'Дорохово', NULL, NULL, NULL),
(2056, 2, 'Дрезна', NULL, NULL, NULL),
(2057, 2, 'Дубки', NULL, NULL, NULL),
(2058, 2, 'Дубна', NULL, NULL, NULL),
(2059, 2, 'Егорьевск', NULL, NULL, NULL),
(2060, 2, 'Железнодорожный (Московск.)', NULL, NULL, NULL),
(2061, 2, 'Жилево', NULL, NULL, NULL),
(2062, 2, 'Жуковка', NULL, NULL, NULL),
(2063, 2, 'Жуковский', NULL, NULL, NULL),
(2064, 2, 'Загорск', NULL, NULL, NULL),
(2065, 2, 'Загорянский', NULL, NULL, NULL),
(2066, 2, 'Запрудная', NULL, NULL, NULL),
(2067, 2, 'Зарайск', NULL, NULL, NULL),
(2068, 2, 'Звенигород', NULL, NULL, NULL),
(2069, 2, 'Зеленоград', NULL, NULL, NULL),
(2070, 2, 'Ивантеевка (Московская обл.)', NULL, NULL, NULL),
(2071, 2, 'Икша', NULL, NULL, NULL),
(2072, 2, 'Ильинский (Московская обл.)', NULL, NULL, NULL),
(2073, 2, 'Истра', NULL, NULL, NULL),
(2074, 2, 'Калининец', NULL, NULL, NULL),
(2075, 2, 'Кашира', NULL, NULL, NULL),
(2076, 2, 'Керва', NULL, NULL, NULL),
(2077, 2, 'Климовск', NULL, NULL, NULL),
(2078, 2, 'Клин', NULL, NULL, NULL),
(2079, 2, 'Клязьма', NULL, NULL, NULL),
(2080, 2, 'Кожино', NULL, NULL, NULL),
(2081, 2, 'Кокошкино', NULL, NULL, NULL),
(2082, 2, 'Коломна', NULL, NULL, NULL),
(2083, 2, 'Колюбакино', NULL, NULL, NULL),
(2084, 2, 'Королев', NULL, NULL, NULL),
(2085, 2, 'Косино', NULL, NULL, NULL),
(2086, 2, 'Котельники', NULL, NULL, NULL),
(2087, 2, 'Красково', NULL, NULL, NULL),
(2088, 2, 'Красноармейск (Московская обл.)', NULL, NULL, NULL),
(2089, 2, 'Красногорск', NULL, NULL, NULL),
(2090, 2, 'Краснозаводск', NULL, NULL, NULL),
(2091, 2, 'Краснознаменск (Московская обл.)', NULL, NULL, NULL),
(2092, 2, 'Красный Ткач', NULL, NULL, NULL),
(2093, 2, 'Крюково', NULL, NULL, NULL),
(2094, 2, 'Кубинка', NULL, NULL, NULL),
(2095, 2, 'Купавна', NULL, NULL, NULL),
(2096, 2, 'Куровское', NULL, NULL, NULL),
(2097, 2, 'Лесной Городок', NULL, NULL, NULL),
(2098, 2, 'Ликино-Дулево', NULL, NULL, NULL),
(2099, 2, 'Лобня', NULL, NULL, NULL),
(2100, 2, 'Лопатинский', NULL, NULL, NULL),
(2101, 2, 'Лосино-Петровский', NULL, NULL, NULL),
(2102, 2, 'Лотошино', NULL, NULL, NULL),
(2103, 2, 'Лукино', NULL, NULL, NULL),
(2104, 2, 'Луховицы', NULL, NULL, NULL),
(2105, 2, 'Лыткарино', NULL, NULL, NULL),
(2106, 2, 'Львовский', NULL, NULL, NULL),
(2107, 2, 'Люберцы', NULL, NULL, NULL),
(2108, 2, 'Малаховка', NULL, NULL, NULL),
(2109, 2, 'Михайловское', NULL, NULL, NULL),
(2110, 2, 'Михнево', NULL, NULL, NULL),
(2111, 2, 'Можайск', NULL, NULL, NULL),
(2112, 2, 'Монино', NULL, NULL, NULL),
(2113, 2, 'Московский', NULL, NULL, NULL),
(2114, 2, 'Муханово', NULL, NULL, NULL),
(2115, 2, 'Мытищи', NULL, NULL, NULL),
(2116, 2, 'Нарофоминск', NULL, NULL, NULL),
(2117, 2, 'Нахабино', NULL, NULL, NULL),
(2118, 2, 'Некрасовка', NULL, NULL, NULL),
(2119, 2, 'Немчиновка', NULL, NULL, NULL),
(2120, 2, 'Новобратцевский', NULL, NULL, NULL),
(2121, 2, 'Новоподрезково', NULL, NULL, NULL),
(2122, 2, 'Ногинск', NULL, NULL, NULL),
(2123, 2, 'Обухово', NULL, NULL, NULL),
(2124, 2, 'Одинцово', NULL, NULL, NULL),
(2125, 2, 'Ожерелье', NULL, NULL, NULL),
(2126, 2, 'Озеры', NULL, NULL, NULL),
(2127, 2, 'Октябрьский (Московская обл.)', NULL, NULL, NULL),
(2128, 2, 'Опалиха', NULL, NULL, NULL),
(2129, 2, 'Орехово-Зуево', NULL, NULL, NULL),
(2130, 2, 'Павловский Посад', NULL, NULL, NULL),
(2131, 2, 'Первомайский (Московская обл.)', NULL, NULL, NULL),
(2132, 2, 'Пески (Московская обл.)', NULL, NULL, NULL),
(2133, 2, 'Пироговский', NULL, NULL, NULL),
(2134, 2, 'Подольск', NULL, NULL, NULL),
(2135, 2, 'Полушкино', NULL, NULL, NULL),
(2136, 2, 'Правдинский', NULL, NULL, NULL),
(2137, 2, 'Привокзальный', NULL, NULL, NULL),
(2138, 2, 'Пролетарский', NULL, NULL, NULL),
(2139, 2, 'Протвино (Московская обл.)', NULL, NULL, NULL),
(2140, 2, 'Пушкино', NULL, NULL, NULL),
(2141, 2, 'Пущино', NULL, NULL, NULL),
(2142, 2, 'Раменское', NULL, NULL, NULL),
(2143, 2, 'Реутов', NULL, NULL, NULL),
(2144, 2, 'Решетниково', NULL, NULL, NULL),
(2145, 2, 'Родники (Московская обл.)', NULL, NULL, NULL),
(2146, 2, 'Рошаль', NULL, NULL, NULL),
(2147, 2, 'Рублево', NULL, NULL, NULL),
(2148, 2, 'Руза', NULL, NULL, NULL),
(2149, 2, 'Салтыковка', NULL, NULL, NULL),
(2150, 2, 'Северный', NULL, NULL, NULL),
(2151, 2, 'Сергиев Посад', NULL, NULL, NULL),
(2152, 2, 'Серебряные Пруды', NULL, NULL, NULL),
(2153, 2, 'Серпухов', NULL, NULL, NULL),
(2154, 2, 'Солнечногорск', NULL, NULL, NULL),
(2155, 2, 'Солнцево', NULL, NULL, NULL),
(2156, 2, 'Софрино', NULL, NULL, NULL),
(2157, 2, 'Старая Купавна', NULL, NULL, NULL),
(2158, 2, 'Старбеево', NULL, NULL, NULL),
(2159, 2, 'Ступино', NULL, NULL, NULL),
(2160, 2, 'Сходня', NULL, NULL, NULL),
(2161, 2, 'Талдом', NULL, NULL, NULL),
(2162, 2, 'Текстильщик', NULL, NULL, NULL),
(2163, 2, 'Темпы', NULL, NULL, NULL),
(2164, 2, 'Томилино', NULL, NULL, NULL),
(2165, 2, 'Троицк', NULL, NULL, NULL),
(2166, 2, 'Туголесский Бор', NULL, NULL, NULL),
(2167, 2, 'Тучково', NULL, NULL, NULL),
(2168, 2, 'Уваровка', NULL, NULL, NULL),
(2169, 2, 'Удельная', NULL, NULL, NULL),
(2170, 2, 'Успенское', NULL, NULL, NULL),
(2171, 2, 'Фирсановка', NULL, NULL, NULL),
(2172, 2, 'Фрязино', NULL, NULL, NULL),
(2173, 2, 'Фряново', NULL, NULL, NULL),
(2174, 2, 'Химки', NULL, NULL, NULL),
(2175, 2, 'Хотьково', NULL, NULL, NULL),
(2176, 2, 'Черкизово', NULL, NULL, NULL),
(2177, 2, 'Черноголовка', NULL, NULL, NULL),
(2178, 2, 'Черусти', NULL, NULL, NULL),
(2179, 2, 'Чехов', NULL, NULL, NULL),
(2180, 2, 'Шарапово', NULL, NULL, NULL),
(2181, 2, 'Шатура', NULL, NULL, NULL),
(2182, 2, 'Шатурторф', NULL, NULL, NULL),
(2183, 2, 'Шаховская', NULL, NULL, NULL),
(2184, 2, 'Шереметьевский', NULL, NULL, NULL),
(2185, 2, 'Щелково', NULL, NULL, NULL),
(2186, 2, 'Щербинка', NULL, NULL, NULL),
(2187, 2, 'Электрогорск', NULL, NULL, NULL),
(2188, 2, 'Электросталь', NULL, NULL, NULL),
(2189, 2, 'Электроугли', NULL, NULL, NULL),
(2190, 2, 'Юбилейный (Московская обл.)', NULL, NULL, NULL),
(2191, 2, 'Яхрома', NULL, NULL, NULL),
(2192, 3, 'Санкт-Петербург', NULL, NULL, NULL),
(2193, 3, 'Александровская', NULL, NULL, NULL),
(2194, 3, 'Бокситогорск', NULL, NULL, NULL),
(2195, 3, 'Большая Ижора', NULL, NULL, NULL),
(2196, 3, 'Будогощь', NULL, NULL, NULL),
(2197, 3, 'Вознесенье', NULL, NULL, NULL),
(2198, 3, 'Волосово', NULL, NULL, NULL),
(2199, 3, 'Волхов', NULL, NULL, NULL),
(2200, 3, 'Всеволожск', NULL, NULL, NULL),
(2201, 3, 'Выборг', NULL, NULL, NULL),
(2202, 3, 'Вырица', NULL, NULL, NULL),
(2203, 3, 'Высоцк', NULL, NULL, NULL),
(2204, 3, 'Гатчина', NULL, NULL, NULL),
(2205, 3, 'Дружная Горка', NULL, NULL, NULL),
(2206, 3, 'Дубровка', NULL, NULL, NULL),
(2207, 3, 'Ефимовский', NULL, NULL, NULL),
(2208, 3, 'Зеленогорск (Ленинградская обл.)', NULL, NULL, NULL),
(2209, 3, 'Ивангород', NULL, NULL, NULL),
(2210, 3, 'Каменногорск', NULL, NULL, NULL),
(2211, 3, 'Кикерино', NULL, NULL, NULL),
(2212, 3, 'Кингисепп', NULL, NULL, NULL),
(2213, 3, 'Кириши', NULL, NULL, NULL),
(2214, 3, 'Кировск', NULL, NULL, NULL),
(2215, 3, 'Кобринское', NULL, NULL, NULL),
(2216, 3, 'Колпино', NULL, NULL, NULL),
(2217, 3, 'Коммунар', NULL, NULL, NULL),
(2218, 3, 'Коммунар', NULL, NULL, NULL),
(2219, 3, 'Кронштадт', NULL, NULL, NULL),
(2220, 3, 'Лисий Нос', NULL, NULL, NULL),
(2221, 3, 'Лодейное Поле', NULL, NULL, NULL),
(2222, 3, 'Ломоносов', NULL, NULL, NULL),
(2223, 3, 'Луга', NULL, NULL, NULL),
(2224, 3, 'Павловск (Ленинградская обл.)', NULL, NULL, NULL),
(2225, 3, 'Парголово', NULL, NULL, NULL),
(2226, 3, 'Петродворец', NULL, NULL, NULL),
(2227, 3, 'Пикалёво', NULL, NULL, NULL),
(2228, 3, 'Подпорожье', NULL, NULL, NULL),
(2229, 3, 'Приозерск', NULL, NULL, NULL),
(2230, 3, 'Пушкин', NULL, NULL, NULL),
(2231, 3, 'Светогорск', NULL, NULL, NULL),
(2232, 3, 'Сертолово', NULL, NULL, NULL),
(2233, 3, 'Сестрорецк', NULL, NULL, NULL),
(2234, 3, 'Сланцы', NULL, NULL, NULL),
(2235, 3, 'Сосновый Бор', NULL, NULL, NULL),
(2236, 3, 'Тихвин', NULL, NULL, NULL),
(2237, 3, 'Тосно', NULL, NULL, NULL),
(2238, 3, 'Шлиссельбург', NULL, NULL, NULL),
(2239, 4, 'Адыгейск', NULL, NULL, NULL),
(2240, 4, 'Майкоп (Адыгея)', NULL, NULL, NULL),
(2241, 5, 'Акташ', NULL, NULL, NULL),
(2242, 5, 'Акутиха', NULL, NULL, NULL),
(2243, 5, 'Алейск', NULL, NULL, NULL),
(2244, 5, 'Алтайский', NULL, NULL, NULL),
(2245, 5, 'Баево', NULL, NULL, NULL),
(2246, 5, 'Барнаул', NULL, NULL, NULL),
(2247, 5, 'Белово (Алтайский край)', NULL, NULL, NULL),
(2248, 5, 'Белокуриха', NULL, NULL, NULL),
(2249, 5, 'Белоярск', NULL, NULL, NULL),
(2250, 5, 'Бийск', NULL, NULL, NULL),
(2251, 5, 'Благовещенск', NULL, NULL, NULL),
(2252, 5, 'Боровлянка', NULL, NULL, NULL),
(2253, 5, 'Бурла', NULL, NULL, NULL),
(2254, 5, 'Бурсоль', NULL, NULL, NULL),
(2255, 5, 'Быстрый Исток', NULL, NULL, NULL),
(2256, 5, 'Волчиха', NULL, NULL, NULL),
(2257, 5, 'Горно-Алтайск', NULL, NULL, NULL),
(2258, 5, 'Горняк', NULL, NULL, NULL),
(2259, 5, 'Ельцовка', NULL, NULL, NULL),
(2260, 5, 'Залесово', NULL, NULL, NULL),
(2261, 5, 'Заринск', NULL, NULL, NULL),
(2262, 5, 'Заток', NULL, NULL, NULL),
(2263, 5, 'Змеиногорск', NULL, NULL, NULL),
(2264, 5, 'Камень-на-Оби', NULL, NULL, NULL),
(2265, 5, 'Ключи (Алтайский край)', NULL, NULL, NULL),
(2266, 5, 'Кош-Агач', NULL, NULL, NULL),
(2267, 5, 'Красногорское (Алтайский край)', NULL, NULL, NULL),
(2268, 5, 'Краснощеково', NULL, NULL, NULL),
(2269, 5, 'Кулунда', NULL, NULL, NULL),
(2270, 5, 'Кытманово', NULL, NULL, NULL),
(2271, 5, 'Мамонтово', NULL, NULL, NULL),
(2272, 5, 'Новичиха', NULL, NULL, NULL),
(2273, 5, 'Новоалтайск', NULL, NULL, NULL),
(2274, 5, 'Онгудай', NULL, NULL, NULL),
(2275, 5, 'Павловск (Алтайский край)', NULL, NULL, NULL),
(2276, 5, 'Петропавловское', NULL, NULL, NULL),
(2277, 5, 'Поспелиха', NULL, NULL, NULL),
(2278, 5, 'Ребриха', NULL, NULL, NULL),
(2279, 5, 'Родино', NULL, NULL, NULL),
(2280, 5, 'Рубцовск', NULL, NULL, NULL),
(2281, 5, 'Славгород', NULL, NULL, NULL),
(2282, 5, 'Смоленское', NULL, NULL, NULL),
(2283, 5, 'Солонешное', NULL, NULL, NULL),
(2284, 5, 'Солтон', NULL, NULL, NULL),
(2285, 5, 'Староаллейское', NULL, NULL, NULL),
(2286, 5, 'Табуны', NULL, NULL, NULL),
(2287, 5, 'Тальменка', NULL, NULL, NULL),
(2288, 5, 'Тогул', NULL, NULL, NULL),
(2289, 5, 'Топчиха', NULL, NULL, NULL),
(2290, 5, 'Троицкое (Алтайский край)', NULL, NULL, NULL),
(2291, 5, 'Турочак', NULL, NULL, NULL),
(2292, 5, 'Тюменцево', NULL, NULL, NULL),
(2293, 5, 'Угловское', NULL, NULL, NULL),
(2294, 5, 'Усть-Калманка', NULL, NULL, NULL),
(2295, 5, 'Усть-Кан', NULL, NULL, NULL),
(2296, 5, 'Усть-Кокса', NULL, NULL, NULL),
(2297, 5, 'Усть-Улаган', NULL, NULL, NULL),
(2298, 5, 'Усть-Чарышская Пристань', NULL, NULL, NULL),
(2299, 5, 'Хабары', NULL, NULL, NULL),
(2300, 5, 'Целинное', NULL, NULL, NULL),
(2301, 5, 'Чарышское', NULL, NULL, NULL),
(2302, 5, 'Шебалино', NULL, NULL, NULL),
(2303, 5, 'Шелаболиха', NULL, NULL, NULL),
(2304, 5, 'Шипуново', NULL, NULL, NULL),
(2305, 6, 'Айгунь', NULL, NULL, NULL),
(2306, 6, 'Архара', NULL, NULL, NULL),
(2307, 6, 'Белогорск', NULL, NULL, NULL),
(2308, 6, 'Благовещенск (Амурская обл.)', NULL, NULL, NULL),
(2309, 6, 'Бурея', NULL, NULL, NULL),
(2310, 6, 'Возжаевка', NULL, NULL, NULL),
(2311, 6, 'Екатеринославка', NULL, NULL, NULL),
(2312, 6, 'Ерофей Павлович', NULL, NULL, NULL),
(2313, 6, 'Завитинск', NULL, NULL, NULL),
(2314, 6, 'Зея', NULL, NULL, NULL),
(2315, 6, 'Златоустовск', NULL, NULL, NULL),
(2316, 6, 'Ивановка', NULL, NULL, NULL),
(2317, 6, 'Коболдо', NULL, NULL, NULL),
(2318, 6, 'Магдагачи', NULL, NULL, NULL),
(2319, 6, 'Новобурейский', NULL, NULL, NULL),
(2320, 6, 'Поярково', NULL, NULL, NULL),
(2321, 6, 'Райчихинск', NULL, NULL, NULL),
(2322, 6, 'Ромны', NULL, NULL, NULL),
(2323, 6, 'Свободный', NULL, NULL, NULL),
(2324, 6, 'Серышево', NULL, NULL, NULL),
(2325, 6, 'Сковородино', NULL, NULL, NULL),
(2326, 6, 'Стойба', NULL, NULL, NULL),
(2327, 6, 'Тамбовка', NULL, NULL, NULL),
(2328, 6, 'Тында', NULL, NULL, NULL),
(2329, 6, 'Февральск', NULL, NULL, NULL),
(2330, 6, 'Шимановск', NULL, NULL, NULL),
(2331, 6, 'Экимчан', NULL, NULL, NULL),
(2332, 6, 'Ядрино', NULL, NULL, NULL),
(2333, 7, 'Амдерма', NULL, NULL, NULL),
(2334, 7, 'Архангельск', NULL, NULL, NULL),
(2335, 7, 'Березник', NULL, NULL, NULL),
(2336, 7, 'Вельск', NULL, NULL, NULL),
(2337, 7, 'Верхняя Тойма', NULL, NULL, NULL),
(2338, 7, 'Волошка', NULL, NULL, NULL),
(2339, 7, 'Вычегодский', NULL, NULL, NULL),
(2340, 7, 'Емца', NULL, NULL, NULL),
(2341, 7, 'Илеза', NULL, NULL, NULL),
(2342, 7, 'Ильинско-Подомское', NULL, NULL, NULL),
(2343, 7, 'Каргополь (Архангельская обл.)', NULL, NULL, NULL),
(2344, 7, 'Карпогоры', NULL, NULL, NULL),
(2345, 7, 'Кодино', NULL, NULL, NULL),
(2346, 7, 'Коноша', NULL, NULL, NULL),
(2347, 7, 'Коряжма', NULL, NULL, NULL),
(2348, 7, 'Котлас', NULL, NULL, NULL),
(2349, 7, 'Красноборск', NULL, NULL, NULL),
(2350, 7, 'Лешуконское', NULL, NULL, NULL),
(2351, 7, 'Мезень', NULL, NULL, NULL),
(2352, 7, 'Мирный (Архангельская обл.)', NULL, NULL, NULL),
(2353, 7, 'Нарьян-Мар', NULL, NULL, NULL),
(2354, 7, 'Новодвинск', NULL, NULL, NULL),
(2355, 7, 'Няндома', NULL, NULL, NULL),
(2356, 7, 'Онега', NULL, NULL, NULL),
(2357, 7, 'Пинега', NULL, NULL, NULL),
(2358, 7, 'Плесецк', NULL, NULL, NULL),
(2359, 7, 'Савинск', NULL, NULL, NULL),
(2360, 7, 'Северодвинск', NULL, NULL, NULL),
(2361, 7, 'Сольвычегодск', NULL, NULL, NULL),
(2362, 7, 'Холмогоры', NULL, NULL, NULL),
(2363, 7, 'Шенкурск', NULL, NULL, NULL),
(2364, 7, 'Яренск', NULL, NULL, NULL),
(2365, 8, 'Астрахань', NULL, NULL, NULL),
(2366, 8, 'Ахтубинск', NULL, NULL, NULL),
(2367, 8, 'Верхний Баскунчак', NULL, NULL, NULL),
(2368, 8, 'Володарский', NULL, NULL, NULL),
(2369, 8, 'Енотаевка', NULL, NULL, NULL),
(2370, 8, 'Икряное', NULL, NULL, NULL),
(2371, 8, 'Камызяк', NULL, NULL, NULL),
(2372, 8, 'Капустин Яр', NULL, NULL, NULL),
(2373, 8, 'Красный Яр (Астраханская обл.)', NULL, NULL, NULL),
(2374, 8, 'Лиман', NULL, NULL, NULL),
(2375, 8, 'Началово', NULL, NULL, NULL),
(2376, 8, 'Харабали', NULL, NULL, NULL),
(2377, 8, 'Черный Яр', NULL, NULL, NULL),
(2378, 9, 'Агидель', NULL, NULL, NULL),
(2379, 9, 'Аксаково', NULL, NULL, NULL),
(2380, 9, 'Амзя', NULL, NULL, NULL),
(2381, 9, 'Архангелькое', NULL, NULL, NULL),
(2382, 9, 'Аскарово', NULL, NULL, NULL),
(2383, 9, 'Аскино', NULL, NULL, NULL),
(2384, 9, 'Баймак', NULL, NULL, NULL),
(2385, 9, 'Бакалы', NULL, NULL, NULL),
(2386, 9, 'Белебей', NULL, NULL, NULL),
(2387, 9, 'Белорецк', NULL, NULL, NULL),
(2388, 9, 'Бижбуляк', NULL, NULL, NULL),
(2389, 9, 'Бирск', NULL, NULL, NULL),
(2390, 9, 'Благовещенск (Башкирия)', NULL, NULL, NULL),
(2391, 9, 'Большеустьикинское', NULL, NULL, NULL),
(2392, 9, 'Бураево', NULL, NULL, NULL),
(2393, 9, 'Верхнеяркеево', NULL, NULL, NULL),
(2394, 9, 'Верхние Киги', NULL, NULL, NULL),
(2395, 9, 'Верхние Татышлы', NULL, NULL, NULL),
(2396, 9, 'Верхний Авзян', NULL, NULL, NULL),
(2397, 9, 'Давлеканово', NULL, NULL, NULL),
(2398, 9, 'Дуван', NULL, NULL, NULL),
(2399, 9, 'Дюртюли', NULL, NULL, NULL),
(2400, 9, 'Ермекеево', NULL, NULL, NULL),
(2401, 9, 'Ермолаево', NULL, NULL, NULL),
(2402, 9, 'Зилаир', NULL, NULL, NULL),
(2403, 9, 'Зирган', NULL, NULL, NULL),
(2404, 9, 'Иглино', NULL, NULL, NULL),
(2405, 9, 'Инзер', NULL, NULL, NULL),
(2406, 9, 'Исянгулово', NULL, NULL, NULL),
(2407, 9, 'Ишимбай', NULL, NULL, NULL),
(2408, 9, 'Калтасы', NULL, NULL, NULL),
(2409, 9, 'Кананикольское', NULL, NULL, NULL),
(2410, 9, 'Кандры', NULL, NULL, NULL),
(2411, 9, 'Караидель', NULL, NULL, NULL),
(2412, 9, 'Караидельский', NULL, NULL, NULL),
(2413, 9, 'Киргиз-Мияки', NULL, NULL, NULL),
(2414, 9, 'Красноусольский', NULL, NULL, NULL),
(2415, 9, 'Кумертау', NULL, NULL, NULL),
(2416, 9, 'Кушнаренково', NULL, NULL, NULL),
(2417, 9, 'Малояз', NULL, NULL, NULL),
(2418, 9, 'Межгорье', NULL, NULL, NULL),
(2419, 9, 'Мелеуз', NULL, NULL, NULL),
(2420, 9, 'Месягутово', NULL, NULL, NULL),
(2421, 9, 'Мраково', NULL, NULL, NULL),
(2422, 9, 'Нефтекамск', NULL, NULL, NULL),
(2423, 9, 'Октябрьский (Башкирия)', NULL, NULL, NULL),
(2424, 9, 'Приютово', NULL, NULL, NULL),
(2425, 9, 'Раевский', NULL, NULL, NULL),
(2426, 9, 'Салават', NULL, NULL, NULL),
(2427, 9, 'Сибай', NULL, NULL, NULL),
(2428, 9, 'Старобалтачево', NULL, NULL, NULL),
(2429, 9, 'Старосубхангулово', NULL, NULL, NULL),
(2430, 9, 'Стерлибашево', NULL, NULL, NULL),
(2431, 9, 'Стерлитамак', NULL, NULL, NULL),
(2432, 9, 'Туймазы', NULL, NULL, NULL),
(2433, 9, 'Уфа', NULL, NULL, NULL),
(2434, 9, 'Учалы', NULL, NULL, NULL),
(2435, 9, 'Федоровка (Башкирия)', NULL, NULL, NULL),
(2436, 9, 'Чекмагуш', NULL, NULL, NULL),
(2437, 9, 'Чишмы', NULL, NULL, NULL);
INSERT INTO `region` (`id`, `parent_id`, `name`, `path`, `language`, `grade`) VALUES
(2438, 9, 'Шаран', NULL, NULL, NULL),
(2439, 9, 'Янаул', NULL, NULL, NULL),
(2440, 10, 'Алексеевка (Белгородская обл.)', NULL, NULL, NULL),
(2441, 10, 'Белгород', NULL, NULL, NULL),
(2442, 10, 'Борисовка', NULL, NULL, NULL),
(2443, 10, 'Валуйки', NULL, NULL, NULL),
(2444, 10, 'Вейделевка', NULL, NULL, NULL),
(2445, 10, 'Волоконовка', NULL, NULL, NULL),
(2446, 10, 'Грайворон', NULL, NULL, NULL),
(2447, 10, 'Губкин', NULL, NULL, NULL),
(2448, 10, 'Ивня', NULL, NULL, NULL),
(2449, 10, 'Короча', NULL, NULL, NULL),
(2450, 10, 'Красногвардейское (Белгород.)', NULL, NULL, NULL),
(2451, 10, 'Новый Оскол', NULL, NULL, NULL),
(2452, 10, 'Ракитное', NULL, NULL, NULL),
(2453, 10, 'Ровеньки', NULL, NULL, NULL),
(2454, 10, 'Старый Оскол', NULL, NULL, NULL),
(2455, 10, 'Строитель', NULL, NULL, NULL),
(2456, 10, 'Чернянка', NULL, NULL, NULL),
(2457, 10, 'Шебекино', NULL, NULL, NULL),
(2458, 11, 'Алтухово', NULL, NULL, NULL),
(2459, 11, 'Белая Березка', NULL, NULL, NULL),
(2460, 11, 'Белые Берега', NULL, NULL, NULL),
(2461, 11, 'Большое Полпино', NULL, NULL, NULL),
(2462, 11, 'Брянск', NULL, NULL, NULL),
(2463, 11, 'Бытошь', NULL, NULL, NULL),
(2464, 11, 'Выгоничи', NULL, NULL, NULL),
(2465, 11, 'Вышков', NULL, NULL, NULL),
(2466, 11, 'Гордеевка', NULL, NULL, NULL),
(2467, 11, 'Дубровка (Брянская обл.)', NULL, NULL, NULL),
(2468, 11, 'Дятьково', NULL, NULL, NULL),
(2469, 11, 'Дятьково', NULL, NULL, NULL),
(2470, 11, 'Жирятино', NULL, NULL, NULL),
(2471, 11, 'Жуковка', NULL, NULL, NULL),
(2472, 11, 'Злынка', NULL, NULL, NULL),
(2473, 11, 'Ивот', NULL, NULL, NULL),
(2474, 11, 'Карачев', NULL, NULL, NULL),
(2475, 11, 'Клетня', NULL, NULL, NULL),
(2476, 11, 'Климово', NULL, NULL, NULL),
(2477, 11, 'Клинцы', NULL, NULL, NULL),
(2478, 11, 'Кокаревка', NULL, NULL, NULL),
(2479, 11, 'Комаричи', NULL, NULL, NULL),
(2480, 11, 'Красная Гора', NULL, NULL, NULL),
(2481, 11, 'Локоть (Брянская обл.)', NULL, NULL, NULL),
(2482, 11, 'Мглин', NULL, NULL, NULL),
(2483, 11, 'Навля', NULL, NULL, NULL),
(2484, 11, 'Новозыбков', NULL, NULL, NULL),
(2485, 11, 'Погар', NULL, NULL, NULL),
(2486, 11, 'Почеп', NULL, NULL, NULL),
(2487, 11, 'Ржаница', NULL, NULL, NULL),
(2488, 11, 'Рогнедино', NULL, NULL, NULL),
(2489, 11, 'Севск', NULL, NULL, NULL),
(2490, 11, 'Стародуб', NULL, NULL, NULL),
(2491, 11, 'Суземка', NULL, NULL, NULL),
(2492, 11, 'Сураж', NULL, NULL, NULL),
(2493, 11, 'Трубчевск', NULL, NULL, NULL),
(2494, 11, 'Унеча', NULL, NULL, NULL),
(2495, 12, 'Бабушкин', NULL, NULL, NULL),
(2496, 12, 'Багдарин', NULL, NULL, NULL),
(2497, 12, 'Баргузин', NULL, NULL, NULL),
(2498, 12, 'Баянгол', NULL, NULL, NULL),
(2499, 12, 'Бичура', NULL, NULL, NULL),
(2500, 12, 'Выдрино', NULL, NULL, NULL),
(2501, 12, 'Гусиное Озеро', NULL, NULL, NULL),
(2502, 12, 'Гусиноозерск', NULL, NULL, NULL),
(2503, 12, 'Заиграево', NULL, NULL, NULL),
(2504, 12, 'Закаменск', NULL, NULL, NULL),
(2505, 12, 'Иволгинск', NULL, NULL, NULL),
(2506, 12, 'Илька', NULL, NULL, NULL),
(2507, 12, 'Кабанск', NULL, NULL, NULL),
(2508, 12, 'Каменск', NULL, NULL, NULL),
(2509, 12, 'Кижинга', NULL, NULL, NULL),
(2510, 12, 'Курумкан', NULL, NULL, NULL),
(2511, 12, 'Кырен', NULL, NULL, NULL),
(2512, 12, 'Кяхта', NULL, NULL, NULL),
(2513, 12, 'Монды', NULL, NULL, NULL),
(2514, 12, 'Мухоршибирь', NULL, NULL, NULL),
(2515, 12, 'Нижнеангарск', NULL, NULL, NULL),
(2516, 12, 'Орлик', NULL, NULL, NULL),
(2517, 12, 'Петропавловка (Бурятия)', NULL, NULL, NULL),
(2518, 12, 'Романовка (Бурятия)', NULL, NULL, NULL),
(2519, 12, 'Северобайкальск (Бурятия)', NULL, NULL, NULL),
(2520, 12, 'Селенгинск', NULL, NULL, NULL),
(2521, 12, 'Сосново-Озерское', NULL, NULL, NULL),
(2522, 12, 'Таксимо (Бурятия)', NULL, NULL, NULL),
(2523, 12, 'Турунтаево', NULL, NULL, NULL),
(2524, 12, 'Улан-Удэ', NULL, NULL, NULL),
(2525, 12, 'Хоринск', NULL, NULL, NULL),
(2526, 13, 'Александров', NULL, NULL, NULL),
(2527, 13, 'Андреево', NULL, NULL, NULL),
(2528, 13, 'Анопино', NULL, NULL, NULL),
(2529, 13, 'Бавлены', NULL, NULL, NULL),
(2530, 13, 'Балакирево', NULL, NULL, NULL),
(2531, 13, 'Боголюбово', NULL, NULL, NULL),
(2532, 13, 'Великодворский', NULL, NULL, NULL),
(2533, 13, 'Вербовский', NULL, NULL, NULL),
(2534, 13, 'Владимир', NULL, NULL, NULL),
(2535, 13, 'Вязники', NULL, NULL, NULL),
(2536, 13, 'Городищи (Владимирская обл.)', NULL, NULL, NULL),
(2537, 13, 'Гороховец', NULL, NULL, NULL),
(2538, 13, 'Гусевский', NULL, NULL, NULL),
(2539, 13, 'Гусь Хрустальный', NULL, NULL, NULL),
(2540, 13, 'Гусь-Хрустальный', NULL, NULL, NULL),
(2541, 13, 'Золотково', NULL, NULL, NULL),
(2542, 13, 'Иванищи', NULL, NULL, NULL),
(2543, 13, 'Камешково', NULL, NULL, NULL),
(2544, 13, 'Карабаново', NULL, NULL, NULL),
(2545, 13, 'Киржач', NULL, NULL, NULL),
(2546, 13, 'Ковров', NULL, NULL, NULL),
(2547, 13, 'Кольчугино', NULL, NULL, NULL),
(2548, 13, 'Красная Горбатка', NULL, NULL, NULL),
(2549, 13, 'Лакинск', NULL, NULL, NULL),
(2550, 13, 'Меленки', NULL, NULL, NULL),
(2551, 13, 'Муром', NULL, NULL, NULL),
(2552, 13, 'Петушки', NULL, NULL, NULL),
(2553, 13, 'Покров', NULL, NULL, NULL),
(2554, 13, 'Радужный (Владимирская обл.)', NULL, NULL, NULL),
(2555, 13, 'Собинка', NULL, NULL, NULL),
(2556, 13, 'Судогда', NULL, NULL, NULL),
(2557, 13, 'Суздаль', NULL, NULL, NULL),
(2558, 13, 'Юрьев-Польский', NULL, NULL, NULL),
(2559, 14, 'Алексеевская', NULL, NULL, NULL),
(2560, 14, 'Алущевск', NULL, NULL, NULL),
(2561, 14, 'Быково (Волгоградская обл.)', NULL, NULL, NULL),
(2562, 14, 'Волгоград', NULL, NULL, NULL),
(2563, 14, 'Волжский (Волгоградская обл.)', NULL, NULL, NULL),
(2564, 14, 'Городище (Волгоградская обл.)', NULL, NULL, NULL),
(2565, 14, 'Дубовка (Волгоградская обл.)', NULL, NULL, NULL),
(2566, 14, 'Елань', NULL, NULL, NULL),
(2567, 14, 'Жирновск', NULL, NULL, NULL),
(2568, 14, 'Иловля', NULL, NULL, NULL),
(2569, 14, 'Калач-на-Дону', NULL, NULL, NULL),
(2570, 14, 'Камышин', NULL, NULL, NULL),
(2571, 14, 'Кириллов', NULL, NULL, NULL),
(2572, 14, 'Клетский', NULL, NULL, NULL),
(2573, 14, 'Котельниково', NULL, NULL, NULL),
(2574, 14, 'Котово', NULL, NULL, NULL),
(2575, 14, 'Кумылженская', NULL, NULL, NULL),
(2576, 14, 'Ленинск', NULL, NULL, NULL),
(2577, 14, 'Михайловка', NULL, NULL, NULL),
(2578, 14, 'Нехаевский', NULL, NULL, NULL),
(2579, 14, 'Николаевск', NULL, NULL, NULL),
(2580, 14, 'Новоаннинский', NULL, NULL, NULL),
(2581, 14, 'Новониколаевский', NULL, NULL, NULL),
(2582, 14, 'Ольховка', NULL, NULL, NULL),
(2583, 14, 'Палласовка (Волгоградская обл.)', NULL, NULL, NULL),
(2584, 14, 'Рудня (Волгоградская обл.)', NULL, NULL, NULL),
(2585, 14, 'Светлый Яр', NULL, NULL, NULL),
(2586, 14, 'Серафимович', NULL, NULL, NULL),
(2587, 14, 'Средняя Ахтуба', NULL, NULL, NULL),
(2588, 14, 'Сталинград', NULL, NULL, NULL),
(2589, 14, 'Старая Полтавка', NULL, NULL, NULL),
(2590, 14, 'Суровикино', NULL, NULL, NULL),
(2591, 14, 'Урюпинск', NULL, NULL, NULL),
(2592, 14, 'Фролово', NULL, NULL, NULL),
(2593, 14, 'Чернышковский', NULL, NULL, NULL),
(2594, 15, 'Бабаево', NULL, NULL, NULL),
(2595, 15, 'Белозерск', NULL, NULL, NULL),
(2596, 15, 'Великий Устюг', NULL, NULL, NULL),
(2597, 15, 'Верховажье', NULL, NULL, NULL),
(2598, 15, 'Вожега', NULL, NULL, NULL),
(2599, 15, 'Вологда', NULL, NULL, NULL),
(2600, 15, 'Вохтога', NULL, NULL, NULL),
(2601, 15, 'Вытегра', NULL, NULL, NULL),
(2602, 15, 'Грязовец', NULL, NULL, NULL),
(2603, 15, 'Кадников', NULL, NULL, NULL),
(2604, 15, 'Кадуй', NULL, NULL, NULL),
(2605, 15, 'Кириллов', NULL, NULL, NULL),
(2606, 15, 'Кичменгский Городок', NULL, NULL, NULL),
(2607, 15, 'Липин Бор', NULL, NULL, NULL),
(2608, 15, 'Никольск', NULL, NULL, NULL),
(2609, 15, 'Нюксеница', NULL, NULL, NULL),
(2610, 15, 'Сокол', NULL, NULL, NULL),
(2611, 15, 'Сямжа', NULL, NULL, NULL),
(2612, 15, 'Тарногский Городок', NULL, NULL, NULL),
(2613, 15, 'Тотьма', NULL, NULL, NULL),
(2614, 15, 'Устюжна', NULL, NULL, NULL),
(2615, 15, 'Харовск', NULL, NULL, NULL),
(2616, 15, 'Чагода', NULL, NULL, NULL),
(2617, 15, 'Череповец', NULL, NULL, NULL),
(2618, 15, 'Шексна', NULL, NULL, NULL),
(2619, 15, 'Шуйское', NULL, NULL, NULL),
(2620, 16, 'Анна', NULL, NULL, NULL),
(2621, 16, 'Бобров', NULL, NULL, NULL),
(2622, 16, 'Богучар', NULL, NULL, NULL),
(2623, 16, 'Борисоглебск', NULL, NULL, NULL),
(2624, 16, 'Бутурлиновка', NULL, NULL, NULL),
(2625, 16, 'Верхний Мамон', NULL, NULL, NULL),
(2626, 16, 'Верхняя Хава', NULL, NULL, NULL),
(2627, 16, 'Воробьевка', NULL, NULL, NULL),
(2628, 16, 'Воронеж', NULL, NULL, NULL),
(2629, 16, 'Грибановский', NULL, NULL, NULL),
(2630, 16, 'Давыдовка', NULL, NULL, NULL),
(2631, 16, 'Елань-Коленовский', NULL, NULL, NULL),
(2632, 16, 'Калач', NULL, NULL, NULL),
(2633, 16, 'Кантемировка', NULL, NULL, NULL),
(2634, 16, 'Лиски (Воронежская обл.)', NULL, NULL, NULL),
(2635, 16, 'Нижнедевицк', NULL, NULL, NULL),
(2636, 16, 'Новая Усмань', NULL, NULL, NULL),
(2637, 16, 'Нововоронеж', NULL, NULL, NULL),
(2638, 16, 'Новохоперск', NULL, NULL, NULL),
(2639, 16, 'Ольховатка', NULL, NULL, NULL),
(2640, 16, 'Острогожск', NULL, NULL, NULL),
(2641, 16, 'Павловск (Воронежская обл.)', NULL, NULL, NULL),
(2642, 16, 'Панино', NULL, NULL, NULL),
(2643, 16, 'Петропавловка', NULL, NULL, NULL),
(2644, 16, 'Поворино', NULL, NULL, NULL),
(2645, 16, 'Подгоренский', NULL, NULL, NULL),
(2646, 16, 'Рамонь', NULL, NULL, NULL),
(2647, 16, 'Репьевка', NULL, NULL, NULL),
(2648, 16, 'Россошь', NULL, NULL, NULL),
(2649, 16, 'Семилуки', NULL, NULL, NULL),
(2650, 16, 'Таловая', NULL, NULL, NULL),
(2651, 16, 'Терновка', NULL, NULL, NULL),
(2652, 16, 'Хохольский', NULL, NULL, NULL),
(2653, 16, 'Эртиль', NULL, NULL, NULL),
(2654, 17, 'Агвали', NULL, NULL, NULL),
(2655, 17, 'Акуша', NULL, NULL, NULL),
(2656, 17, 'Ахты', NULL, NULL, NULL),
(2657, 17, 'Ачису', NULL, NULL, NULL),
(2658, 17, 'Бабаюрт', NULL, NULL, NULL),
(2659, 17, 'Бежта', NULL, NULL, NULL),
(2660, 17, 'Ботлих', NULL, NULL, NULL),
(2661, 17, 'Буйнакск', NULL, NULL, NULL),
(2662, 17, 'Вачи', NULL, NULL, NULL),
(2663, 17, 'Гергебиль', NULL, NULL, NULL),
(2664, 17, 'Гуниб', NULL, NULL, NULL),
(2665, 17, 'Дагестанские Огни', NULL, NULL, NULL),
(2666, 17, 'Дербент', NULL, NULL, NULL),
(2667, 17, 'Дылым', NULL, NULL, NULL),
(2668, 17, 'Ершовка', NULL, NULL, NULL),
(2669, 17, 'Избербаш', NULL, NULL, NULL),
(2670, 17, 'Карабудахкент', NULL, NULL, NULL),
(2671, 17, 'Карата', NULL, NULL, NULL),
(2672, 17, 'Каспийск', NULL, NULL, NULL),
(2673, 17, 'Касумкент', NULL, NULL, NULL),
(2674, 17, 'Кизилюрт', NULL, NULL, NULL),
(2675, 17, 'Кизляр', NULL, NULL, NULL),
(2676, 17, 'Кочубей', NULL, NULL, NULL),
(2677, 17, 'Кумух', NULL, NULL, NULL),
(2678, 17, 'Курах', NULL, NULL, NULL),
(2679, 17, 'Магарамкент', NULL, NULL, NULL),
(2680, 17, 'Маджалис', NULL, NULL, NULL),
(2681, 17, 'Махачкала', NULL, NULL, NULL),
(2682, 17, 'Мехельта', NULL, NULL, NULL),
(2683, 17, 'Новолакское', NULL, NULL, NULL),
(2684, 17, 'Рутул', NULL, NULL, NULL),
(2685, 17, 'Советское (Дагестан)', NULL, NULL, NULL),
(2686, 17, 'Тарумовка', NULL, NULL, NULL),
(2687, 17, 'Терекли-Мектеб', NULL, NULL, NULL),
(2688, 17, 'Тлярата', NULL, NULL, NULL),
(2689, 17, 'Тпиг', NULL, NULL, NULL),
(2690, 17, 'Унцукуль', NULL, NULL, NULL),
(2691, 17, 'Уркарах', NULL, NULL, NULL),
(2692, 17, 'Хасавюрт', NULL, NULL, NULL),
(2693, 17, 'Хив', NULL, NULL, NULL),
(2694, 17, 'Хунзах', NULL, NULL, NULL),
(2695, 17, 'Цуриб', NULL, NULL, NULL),
(2696, 17, 'Южно-Сухокумск', NULL, NULL, NULL),
(2697, 18, 'Биробиджан', NULL, NULL, NULL),
(2698, 19, 'Архиповка', NULL, NULL, NULL),
(2699, 19, 'Верхний Ландех', NULL, NULL, NULL),
(2700, 19, 'Вичуга', NULL, NULL, NULL),
(2701, 19, 'Гаврилов Посад', NULL, NULL, NULL),
(2702, 19, 'Долматовский', NULL, NULL, NULL),
(2703, 19, 'Дуляпино', NULL, NULL, NULL),
(2704, 19, 'Заволжск', NULL, NULL, NULL),
(2705, 19, 'Заречный (Ивановская обл.)', NULL, NULL, NULL),
(2706, 19, 'Иваново', NULL, NULL, NULL),
(2707, 19, 'Иваньковский', NULL, NULL, NULL),
(2708, 19, 'Ильинское-Хованское', NULL, NULL, NULL),
(2709, 19, 'Каминский', NULL, NULL, NULL),
(2710, 19, 'Кинешма', NULL, NULL, NULL),
(2711, 19, 'Комсомольск', NULL, NULL, NULL),
(2712, 19, 'Кохма', NULL, NULL, NULL),
(2713, 19, 'Лух', NULL, NULL, NULL),
(2714, 19, 'Палех', NULL, NULL, NULL),
(2715, 19, 'Пестяки', NULL, NULL, NULL),
(2716, 19, 'Приволжск', NULL, NULL, NULL),
(2717, 19, 'Пучеж', NULL, NULL, NULL),
(2718, 19, 'Родники (Ивановская обл.)', NULL, NULL, NULL),
(2719, 19, 'Савино', NULL, NULL, NULL),
(2720, 19, 'Сокольское', NULL, NULL, NULL),
(2721, 19, 'Тейково', NULL, NULL, NULL),
(2722, 19, 'Фурманов', NULL, NULL, NULL),
(2723, 19, 'Шуя', NULL, NULL, NULL),
(2724, 19, 'Южа', NULL, NULL, NULL),
(2725, 19, 'Юрьевец', NULL, NULL, NULL),
(2726, 20, 'Алексеевск', NULL, NULL, NULL),
(2727, 20, 'Алзамай', NULL, NULL, NULL),
(2728, 20, 'Алыгжер', NULL, NULL, NULL),
(2729, 20, 'Ангарск', NULL, NULL, NULL),
(2730, 20, 'Артемовский (Иркутская обл.)', NULL, NULL, NULL),
(2731, 20, 'Байкал', NULL, NULL, NULL),
(2732, 20, 'Байкальск', NULL, NULL, NULL),
(2733, 20, 'Балаганск', NULL, NULL, NULL),
(2734, 20, 'Баяндай', NULL, NULL, NULL),
(2735, 20, 'Бирюсинск', NULL, NULL, NULL),
(2736, 20, 'Бодайбо', NULL, NULL, NULL),
(2737, 20, 'Большая Речка', NULL, NULL, NULL),
(2738, 20, 'Большой Луг', NULL, NULL, NULL),
(2739, 20, 'Бохан', NULL, NULL, NULL),
(2740, 20, 'Братск', NULL, NULL, NULL),
(2741, 20, 'Видим', NULL, NULL, NULL),
(2742, 20, 'Витимский', NULL, NULL, NULL),
(2743, 20, 'Вихоревка', NULL, NULL, NULL),
(2744, 20, 'Еланцы', NULL, NULL, NULL),
(2745, 20, 'Ербогачен', NULL, NULL, NULL),
(2746, 20, 'Железногорск-Илимский', NULL, NULL, NULL),
(2747, 20, 'Жигалово', NULL, NULL, NULL),
(2748, 20, 'Забитуй', NULL, NULL, NULL),
(2749, 20, 'Залари', NULL, NULL, NULL),
(2750, 20, 'Звездный', NULL, NULL, NULL),
(2751, 20, 'Зима', NULL, NULL, NULL),
(2752, 20, 'Иркутск', NULL, NULL, NULL),
(2753, 20, 'Казачинское (Иркутская обл.)', NULL, NULL, NULL),
(2754, 20, 'Качуг', NULL, NULL, NULL),
(2755, 20, 'Квиток', NULL, NULL, NULL),
(2756, 20, 'Киренск', NULL, NULL, NULL),
(2757, 20, 'Куйтун', NULL, NULL, NULL),
(2758, 20, 'Култук', NULL, NULL, NULL),
(2759, 20, 'Кутулик', NULL, NULL, NULL),
(2760, 20, 'Мама', NULL, NULL, NULL),
(2761, 20, 'Нижнеудинск', NULL, NULL, NULL),
(2762, 20, 'Оса', NULL, NULL, NULL),
(2763, 20, 'Саянск', NULL, NULL, NULL),
(2764, 20, 'Слюдянка', NULL, NULL, NULL),
(2765, 20, 'Тайшет', NULL, NULL, NULL),
(2766, 20, 'Тулун', NULL, NULL, NULL),
(2767, 20, 'Усолье-Сибирское (Иркутская обл.)', NULL, NULL, NULL),
(2768, 20, 'Усть-Илимск', NULL, NULL, NULL),
(2769, 20, 'Усть-Кут', NULL, NULL, NULL),
(2770, 20, 'Усть-Ордынский', NULL, NULL, NULL),
(2771, 20, 'Усть-Уда', NULL, NULL, NULL),
(2772, 20, 'Черемхово', NULL, NULL, NULL),
(2773, 20, 'Чунский', NULL, NULL, NULL),
(2774, 20, 'Шелехов', NULL, NULL, NULL),
(2775, 21, 'Баксан', NULL, NULL, NULL),
(2776, 21, 'Майский', NULL, NULL, NULL),
(2777, 21, 'Нальчик', NULL, NULL, NULL),
(2778, 21, 'Нарткала', NULL, NULL, NULL),
(2779, 21, 'Прохладный', NULL, NULL, NULL),
(2780, 21, 'Советское (Кабардино-Балкария)', NULL, NULL, NULL),
(2781, 21, 'Терек', NULL, NULL, NULL),
(2782, 21, 'Тырныауз', NULL, NULL, NULL),
(2783, 21, 'Чегем-Первый', NULL, NULL, NULL),
(2784, 22, 'Багратионовск', NULL, NULL, NULL),
(2785, 22, 'Балтийск', NULL, NULL, NULL),
(2786, 22, 'Гвардейск', NULL, NULL, NULL),
(2787, 22, 'Гурьевск (Калининградская обл.)', NULL, NULL, NULL),
(2788, 22, 'Гусев', NULL, NULL, NULL),
(2789, 22, 'Железнодорожный (Калининград.)', NULL, NULL, NULL),
(2790, 22, 'Зеленоградск', NULL, NULL, NULL),
(2791, 22, 'Знаменск', NULL, NULL, NULL),
(2792, 22, 'Калининград (Кенигсберг)', NULL, NULL, NULL),
(2793, 22, 'Краснознаменск (Калининград.)', NULL, NULL, NULL),
(2794, 22, 'Ладушкин', NULL, NULL, NULL),
(2795, 22, 'Мамоново', NULL, NULL, NULL),
(2796, 22, 'Неман', NULL, NULL, NULL),
(2797, 22, 'Нестеров', NULL, NULL, NULL),
(2798, 22, 'Озерск(Калининградская обл.)', NULL, NULL, NULL),
(2799, 22, 'Пионерск', NULL, NULL, NULL),
(2800, 22, 'Полесск', NULL, NULL, NULL),
(2801, 22, 'Правдинск', NULL, NULL, NULL),
(2802, 22, 'Светлогорск', NULL, NULL, NULL),
(2803, 22, 'Светлый (Калининградская обл.)', NULL, NULL, NULL),
(2804, 22, 'Славск', NULL, NULL, NULL),
(2805, 22, 'Советск (Калининградская обл.)', NULL, NULL, NULL),
(2806, 22, 'Черняховск', NULL, NULL, NULL),
(2807, 23, 'Аршань', NULL, NULL, NULL),
(2808, 23, 'Городовиковск', NULL, NULL, NULL),
(2809, 23, 'Каспийский', NULL, NULL, NULL),
(2810, 23, 'Комсомольский (Калмыкия)', NULL, NULL, NULL),
(2811, 23, 'Малые Дербеты', NULL, NULL, NULL),
(2812, 23, 'Приютное', NULL, NULL, NULL),
(2813, 23, 'Советское (Калмыкия)', NULL, NULL, NULL),
(2814, 23, 'Троицкое (Калмыкия)', NULL, NULL, NULL),
(2815, 23, 'Утта', NULL, NULL, NULL),
(2816, 23, 'Цаган-Аман', NULL, NULL, NULL),
(2817, 23, 'Элиста', NULL, NULL, NULL),
(2818, 23, 'Юста', NULL, NULL, NULL),
(2819, 23, 'Яшалта', NULL, NULL, NULL),
(2820, 23, 'Яшкуль', NULL, NULL, NULL),
(2821, 24, 'Бабынино', NULL, NULL, NULL),
(2822, 24, 'Балабаново', NULL, NULL, NULL),
(2823, 24, 'Барятино', NULL, NULL, NULL),
(2824, 24, 'Белоусово', NULL, NULL, NULL),
(2825, 24, 'Бетлица', NULL, NULL, NULL),
(2826, 24, 'Боровск', NULL, NULL, NULL),
(2827, 24, 'Дудоровский', NULL, NULL, NULL),
(2828, 24, 'Думиничи', NULL, NULL, NULL),
(2829, 24, 'Еленский', NULL, NULL, NULL),
(2830, 24, 'Жиздра', NULL, NULL, NULL),
(2831, 24, 'Жуков', NULL, NULL, NULL),
(2832, 24, 'Износки', NULL, NULL, NULL),
(2833, 24, 'Калуга', NULL, NULL, NULL),
(2834, 24, 'Киров (Калужская обл.)', NULL, NULL, NULL),
(2835, 24, 'Козельск', NULL, NULL, NULL),
(2836, 24, 'Кондрово', NULL, NULL, NULL),
(2837, 24, 'Кремёнки', NULL, NULL, NULL),
(2838, 24, 'Людиново', NULL, NULL, NULL),
(2839, 24, 'Малоярославец', NULL, NULL, NULL),
(2840, 24, 'Медынь', NULL, NULL, NULL),
(2841, 24, 'Мещовск', NULL, NULL, NULL),
(2842, 24, 'Мосальск', NULL, NULL, NULL),
(2843, 24, 'Обнинск', NULL, NULL, NULL),
(2844, 24, 'Перемышль', NULL, NULL, NULL),
(2845, 24, 'Спас-Деменск', NULL, NULL, NULL),
(2846, 24, 'Сухиничи', NULL, NULL, NULL),
(2847, 24, 'Таруса', NULL, NULL, NULL),
(2848, 24, 'Ульяново', NULL, NULL, NULL),
(2849, 24, 'Ферзиково', NULL, NULL, NULL),
(2850, 24, 'Хвастовичи', NULL, NULL, NULL),
(2851, 24, 'Юхнов', NULL, NULL, NULL),
(2852, 25, 'Атласово', NULL, NULL, NULL),
(2853, 25, 'Аянка', NULL, NULL, NULL),
(2854, 25, 'Большерецк', NULL, NULL, NULL),
(2855, 25, 'Вилючинск', NULL, NULL, NULL),
(2856, 25, 'Елизово (Камчатская обл.)', NULL, NULL, NULL),
(2857, 25, 'Ильпырский', NULL, NULL, NULL),
(2858, 25, 'Каменское', NULL, NULL, NULL),
(2859, 25, 'Кировский', NULL, NULL, NULL),
(2860, 25, 'Ключи (Камчатская обл.)', NULL, NULL, NULL),
(2861, 25, 'Крапивная', NULL, NULL, NULL),
(2862, 25, 'Мильково', NULL, NULL, NULL),
(2863, 25, 'Никольское', NULL, NULL, NULL),
(2864, 25, 'Озерновский', NULL, NULL, NULL),
(2865, 25, 'Оссора', NULL, NULL, NULL),
(2866, 25, 'Палана', NULL, NULL, NULL),
(2867, 25, 'Парень', NULL, NULL, NULL),
(2868, 25, 'Пахачи', NULL, NULL, NULL),
(2869, 25, 'Петропавловск-Камчатский', NULL, NULL, NULL),
(2870, 25, 'Тигиль', NULL, NULL, NULL),
(2871, 25, 'Тиличики', NULL, NULL, NULL),
(2872, 25, 'Усть-Большерецк', NULL, NULL, NULL),
(2873, 25, 'Усть-Камчатск', NULL, NULL, NULL),
(2874, 26, 'Амбарный', NULL, NULL, NULL),
(2875, 26, 'Беломорск', NULL, NULL, NULL),
(2876, 26, 'Валаам', NULL, NULL, NULL),
(2877, 26, 'Вирандозеро', NULL, NULL, NULL),
(2878, 26, 'Гирвас', NULL, NULL, NULL),
(2879, 26, 'Деревянка', NULL, NULL, NULL),
(2880, 26, 'Идель', NULL, NULL, NULL),
(2881, 26, 'Ильинский (Карелия)', NULL, NULL, NULL),
(2882, 26, 'Калевала', NULL, NULL, NULL),
(2883, 26, 'Кемь', NULL, NULL, NULL),
(2884, 26, 'Кестеньга', NULL, NULL, NULL),
(2885, 26, 'Кондопога', NULL, NULL, NULL),
(2886, 26, 'Костомукша', NULL, NULL, NULL),
(2887, 26, 'Лахденпохья', NULL, NULL, NULL),
(2888, 26, 'Лоухи', NULL, NULL, NULL),
(2889, 26, 'Медвежьегорск', NULL, NULL, NULL),
(2890, 26, 'Муезерский', NULL, NULL, NULL),
(2891, 26, 'Олонец', NULL, NULL, NULL),
(2892, 26, 'Петрозаводск', NULL, NULL, NULL),
(2893, 26, 'Питкяранта', NULL, NULL, NULL),
(2894, 26, 'Повенец', NULL, NULL, NULL),
(2895, 26, 'Пряжа', NULL, NULL, NULL),
(2896, 26, 'Пудож', NULL, NULL, NULL),
(2897, 26, 'Сегежа', NULL, NULL, NULL),
(2898, 26, 'Сортавала', NULL, NULL, NULL),
(2899, 26, 'Суоярви', NULL, NULL, NULL),
(2900, 26, 'Хийденсельга', NULL, NULL, NULL),
(2901, 27, 'Анжеро-Судженск', NULL, NULL, NULL),
(2902, 27, 'Барзас', NULL, NULL, NULL),
(2903, 27, 'Белово', NULL, NULL, NULL),
(2904, 27, 'Белогорск', NULL, NULL, NULL),
(2905, 27, 'Березовский (Кемеровская обл.)', NULL, NULL, NULL),
(2906, 27, 'Грамотеино', NULL, NULL, NULL),
(2907, 27, 'Гурьевск', NULL, NULL, NULL),
(2908, 27, 'Ижморский', NULL, NULL, NULL),
(2909, 27, 'Итатский', NULL, NULL, NULL),
(2910, 27, 'Калтан', NULL, NULL, NULL),
(2911, 27, 'Кедровка', NULL, NULL, NULL),
(2912, 27, 'Кемерово', NULL, NULL, NULL),
(2913, 27, 'Киселевск', NULL, NULL, NULL),
(2914, 27, 'Крапивинский', NULL, NULL, NULL),
(2915, 27, 'Ленинск-Кузнецкий', NULL, NULL, NULL),
(2916, 27, 'Мариинск', NULL, NULL, NULL),
(2917, 27, 'Междуреченск', NULL, NULL, NULL),
(2918, 27, 'Мыски', NULL, NULL, NULL),
(2919, 27, 'Новокузнецк', NULL, NULL, NULL),
(2920, 27, 'Осинники', NULL, NULL, NULL),
(2921, 27, 'Полысаево', NULL, NULL, NULL),
(2922, 27, 'Прокопьевск', NULL, NULL, NULL),
(2923, 27, 'Промышленная', NULL, NULL, NULL),
(2924, 27, 'Тайга', NULL, NULL, NULL),
(2925, 27, 'Таштагол', NULL, NULL, NULL),
(2926, 27, 'Тисуль', NULL, NULL, NULL),
(2927, 27, 'Топки', NULL, NULL, NULL),
(2928, 27, 'Тяжинский', NULL, NULL, NULL),
(2929, 27, 'Юрга', NULL, NULL, NULL),
(2930, 27, 'Яшкино', NULL, NULL, NULL),
(2931, 27, 'Яя', NULL, NULL, NULL),
(2932, 28, 'Арбаж', NULL, NULL, NULL),
(2933, 28, 'Аркуль', NULL, NULL, NULL),
(2934, 28, 'Белая Холуница', NULL, NULL, NULL),
(2935, 28, 'Богородское (Кировская обл.)', NULL, NULL, NULL),
(2936, 28, 'Боровой', NULL, NULL, NULL),
(2937, 28, 'Верхошижемье', NULL, NULL, NULL),
(2938, 28, 'Вятские Поляны (Кировская обл.)', NULL, NULL, NULL),
(2939, 28, 'Зуевка', NULL, NULL, NULL),
(2940, 28, 'Каринторф', NULL, NULL, NULL),
(2941, 28, 'Кикнур', NULL, NULL, NULL),
(2942, 28, 'Кильмезь', NULL, NULL, NULL),
(2943, 28, 'Киров (Кировская обл.)', NULL, NULL, NULL),
(2944, 28, 'Кирово-Чепецк', NULL, NULL, NULL),
(2945, 28, 'Кирс', NULL, NULL, NULL),
(2946, 28, 'Кобра', NULL, NULL, NULL),
(2947, 28, 'Котельнич', NULL, NULL, NULL),
(2948, 28, 'Кумены', NULL, NULL, NULL),
(2949, 28, 'Ленинское', NULL, NULL, NULL),
(2950, 28, 'Луза', NULL, NULL, NULL),
(2951, 28, 'Малмыж', NULL, NULL, NULL),
(2952, 28, 'Мураши', NULL, NULL, NULL),
(2953, 28, 'Нагорск', NULL, NULL, NULL),
(2954, 28, 'Нема', NULL, NULL, NULL),
(2955, 28, 'Нововятск', NULL, NULL, NULL),
(2956, 28, 'Нолинск', NULL, NULL, NULL),
(2957, 28, 'Омутнинск', NULL, NULL, NULL),
(2958, 28, 'Опарино', NULL, NULL, NULL),
(2959, 28, 'Оричи', NULL, NULL, NULL),
(2960, 28, 'Пижанка', NULL, NULL, NULL),
(2961, 28, 'Подосиновец', NULL, NULL, NULL),
(2962, 28, 'Санчурск', NULL, NULL, NULL),
(2963, 28, 'Свеча', NULL, NULL, NULL),
(2964, 28, 'Слободской', NULL, NULL, NULL),
(2965, 28, 'Советск (Кировская обл.)', NULL, NULL, NULL),
(2966, 28, 'Суна', NULL, NULL, NULL),
(2967, 28, 'Тужа', NULL, NULL, NULL),
(2968, 28, 'Уни', NULL, NULL, NULL),
(2969, 28, 'Уржум', NULL, NULL, NULL),
(2970, 28, 'Фаленки', NULL, NULL, NULL),
(2971, 28, 'Халтурин', NULL, NULL, NULL),
(2972, 28, 'Юрья', NULL, NULL, NULL),
(2973, 28, 'Яранск', NULL, NULL, NULL),
(2974, 29, 'Абезь', NULL, NULL, NULL),
(2975, 29, 'Адзьвавом', NULL, NULL, NULL),
(2976, 29, 'Айкино', NULL, NULL, NULL),
(2977, 29, 'Верхняя Инта', NULL, NULL, NULL),
(2978, 29, 'Визинга', NULL, NULL, NULL),
(2979, 29, 'Водный', NULL, NULL, NULL),
(2980, 29, 'Воркута', NULL, NULL, NULL),
(2981, 29, 'Вуктыл', NULL, NULL, NULL),
(2982, 29, 'Елецкий', NULL, NULL, NULL),
(2983, 29, 'Емва', NULL, NULL, NULL),
(2984, 29, 'Жешарт', NULL, NULL, NULL),
(2985, 29, 'Заполярный', NULL, NULL, NULL),
(2986, 29, 'Ижма', NULL, NULL, NULL),
(2987, 29, 'Инта', NULL, NULL, NULL),
(2988, 29, 'Ираель', NULL, NULL, NULL),
(2989, 29, 'Каджером', NULL, NULL, NULL),
(2990, 29, 'Кажым', NULL, NULL, NULL),
(2991, 29, 'Кожым', NULL, NULL, NULL),
(2992, 29, 'Койгородок', NULL, NULL, NULL),
(2993, 29, 'Корткерос', NULL, NULL, NULL),
(2994, 29, 'Кослан', NULL, NULL, NULL),
(2995, 29, 'Микунь', NULL, NULL, NULL),
(2996, 29, 'Нижний Одес', NULL, NULL, NULL),
(2997, 29, 'Объячево', NULL, NULL, NULL),
(2998, 29, 'Печора', NULL, NULL, NULL),
(2999, 29, 'Сосногорск', NULL, NULL, NULL),
(3000, 29, 'Сыктывкар', NULL, NULL, NULL),
(3001, 29, 'Троицко-Печерск', NULL, NULL, NULL),
(3002, 29, 'Усинск', NULL, NULL, NULL),
(3003, 29, 'Усогорск', NULL, NULL, NULL),
(3004, 29, 'Усть-Кулом', NULL, NULL, NULL),
(3005, 29, 'Усть-Цильма', NULL, NULL, NULL),
(3006, 29, 'Ухта', NULL, NULL, NULL),
(3007, 30, 'Антропово', NULL, NULL, NULL),
(3008, 30, 'Боговарово', NULL, NULL, NULL),
(3009, 30, 'Буй', NULL, NULL, NULL),
(3010, 30, 'Волгореченск', NULL, NULL, NULL),
(3011, 30, 'Галич', NULL, NULL, NULL),
(3012, 30, 'Горчуха', NULL, NULL, NULL),
(3013, 30, 'Зебляки', NULL, NULL, NULL),
(3014, 30, 'Кадый', NULL, NULL, NULL),
(3015, 30, 'Кологрив', NULL, NULL, NULL),
(3016, 30, 'Кострома', NULL, NULL, NULL),
(3017, 30, 'Красное-на-Волге', NULL, NULL, NULL),
(3018, 30, 'Макарьев', NULL, NULL, NULL),
(3019, 30, 'Мантурово', NULL, NULL, NULL),
(3020, 30, 'Нерехта', NULL, NULL, NULL),
(3021, 30, 'Нея', NULL, NULL, NULL),
(3022, 30, 'Островское', NULL, NULL, NULL),
(3023, 30, 'Павино', NULL, NULL, NULL),
(3024, 30, 'Парфентьево', NULL, NULL, NULL),
(3025, 30, 'Поназырево', NULL, NULL, NULL),
(3026, 30, 'Солигалич', NULL, NULL, NULL),
(3027, 30, 'Судиславль', NULL, NULL, NULL),
(3028, 30, 'Сусанино', NULL, NULL, NULL),
(3029, 30, 'Чухлома', NULL, NULL, NULL),
(3030, 30, 'Шарья', NULL, NULL, NULL),
(3031, 30, 'Шемятино', NULL, NULL, NULL),
(3032, 31, 'Абинск', NULL, NULL, NULL),
(3033, 31, 'Абрау-Дюрсо', NULL, NULL, NULL),
(3034, 31, 'Адлер', NULL, NULL, NULL),
(3035, 31, 'Анапа', NULL, NULL, NULL),
(3036, 31, 'Апшеронск', NULL, NULL, NULL),
(3037, 31, 'Армавир', NULL, NULL, NULL),
(3038, 31, 'Архипо-Осиповка', NULL, NULL, NULL),
(3039, 31, 'Афипский', NULL, NULL, NULL),
(3040, 31, 'Ахтырский', NULL, NULL, NULL),
(3041, 31, 'Ачуево', NULL, NULL, NULL),
(3042, 31, 'Белая Глина', NULL, NULL, NULL),
(3043, 31, 'Белореченск', NULL, NULL, NULL),
(3044, 31, 'Верхнебаканский', NULL, NULL, NULL),
(3045, 31, 'Выселки', NULL, NULL, NULL),
(3046, 31, 'Геленджик', NULL, NULL, NULL),
(3047, 31, 'Гиагинская', NULL, NULL, NULL),
(3048, 31, 'Горячий Ключ', NULL, NULL, NULL),
(3049, 31, 'Гулькевичи', NULL, NULL, NULL),
(3050, 31, 'Джубга', NULL, NULL, NULL),
(3051, 31, 'Динская', NULL, NULL, NULL),
(3052, 31, 'Ейск', NULL, NULL, NULL),
(3053, 31, 'Ильский', NULL, NULL, NULL),
(3054, 31, 'Кабардинка', NULL, NULL, NULL),
(3055, 31, 'Калинино', NULL, NULL, NULL),
(3056, 31, 'Калининская', NULL, NULL, NULL),
(3057, 31, 'Каменномостский', NULL, NULL, NULL),
(3058, 31, 'Каневская', NULL, NULL, NULL),
(3059, 31, 'Кореновск', NULL, NULL, NULL),
(3060, 31, 'Красноармейская', NULL, NULL, NULL),
(3061, 31, 'Краснодар', NULL, NULL, NULL),
(3062, 31, 'Кропоткин', NULL, NULL, NULL),
(3063, 31, 'Крыловская', NULL, NULL, NULL),
(3064, 31, 'Крымск', NULL, NULL, NULL),
(3065, 31, 'Курганинск', NULL, NULL, NULL),
(3066, 31, 'Кущевская', NULL, NULL, NULL),
(3067, 31, 'Лабинск', NULL, NULL, NULL),
(3068, 31, 'Лазаревское', NULL, NULL, NULL),
(3069, 31, 'Ленинградская', NULL, NULL, NULL),
(3070, 31, 'Майкоп (Краснодарский край)', NULL, NULL, NULL),
(3071, 31, 'Мостовской', NULL, NULL, NULL),
(3072, 31, 'Новокубанск', NULL, NULL, NULL),
(3073, 31, 'Новороссийск', NULL, NULL, NULL),
(3074, 31, 'Отрадная', NULL, NULL, NULL),
(3075, 31, 'Павловская', NULL, NULL, NULL),
(3076, 31, 'Приморско-Ахтарск', NULL, NULL, NULL),
(3077, 31, 'Северская', NULL, NULL, NULL),
(3078, 31, 'Славянск-на-Кубани', NULL, NULL, NULL),
(3079, 31, 'Сочи', NULL, NULL, NULL),
(3080, 31, 'Староминская', NULL, NULL, NULL),
(3081, 31, 'Старощербиновская', NULL, NULL, NULL),
(3082, 31, 'Тбилисская', NULL, NULL, NULL),
(3083, 31, 'Темрюк', NULL, NULL, NULL),
(3084, 31, 'Тимашевск', NULL, NULL, NULL),
(3085, 31, 'Тихорецк', NULL, NULL, NULL),
(3086, 31, 'Туапсе', NULL, NULL, NULL),
(3087, 31, 'Тульский', NULL, NULL, NULL),
(3088, 31, 'Усть-Лабинск', NULL, NULL, NULL),
(3089, 31, 'Хадыженск', NULL, NULL, NULL),
(3090, 31, 'Хоста', NULL, NULL, NULL),
(3091, 31, 'Шовгеновский', NULL, NULL, NULL),
(3092, 32, 'Абаза', NULL, NULL, NULL),
(3093, 32, 'Абакан', NULL, NULL, NULL),
(3094, 32, 'Агинское', NULL, NULL, NULL),
(3095, 32, 'Артемовск', NULL, NULL, NULL),
(3096, 32, 'Аскиз', NULL, NULL, NULL),
(3097, 32, 'Ачинск', NULL, NULL, NULL),
(3098, 32, 'Байкит', NULL, NULL, NULL),
(3099, 32, 'Балахта', NULL, NULL, NULL),
(3100, 32, 'Балыкса', NULL, NULL, NULL),
(3101, 32, 'Белый Яр', NULL, NULL, NULL),
(3102, 32, 'Бея', NULL, NULL, NULL),
(3103, 32, 'Бискамжа', NULL, NULL, NULL),
(3104, 32, 'Боготол', NULL, NULL, NULL),
(3105, 32, 'Боград', NULL, NULL, NULL),
(3106, 32, 'Богучаны', NULL, NULL, NULL),
(3107, 32, 'Большая Мурта', NULL, NULL, NULL),
(3108, 32, 'Большой Улуй', NULL, NULL, NULL),
(3109, 32, 'Бородино (Красноярский край)', NULL, NULL, NULL),
(3110, 32, 'Ванавара', NULL, NULL, NULL),
(3111, 32, 'Верхнеимбатск', NULL, NULL, NULL),
(3112, 32, 'Горячегорск', NULL, NULL, NULL),
(3113, 32, 'Дзержинское', NULL, NULL, NULL),
(3114, 32, 'Дивногорск', NULL, NULL, NULL),
(3115, 32, 'Диксон', NULL, NULL, NULL),
(3116, 32, 'Дудинка', NULL, NULL, NULL),
(3117, 32, 'Емельяново', NULL, NULL, NULL),
(3118, 32, 'Енисейск', NULL, NULL, NULL),
(3119, 32, 'Ермаковское', NULL, NULL, NULL),
(3120, 32, 'Железногорск', NULL, NULL, NULL),
(3121, 32, 'Заозерный', NULL, NULL, NULL),
(3122, 32, 'Зеленогорск (Красноярский край)', NULL, NULL, NULL),
(3123, 32, 'Игарка', NULL, NULL, NULL),
(3124, 32, 'Идринское', NULL, NULL, NULL),
(3125, 32, 'Иланский', NULL, NULL, NULL),
(3126, 32, 'Ирбейское', NULL, NULL, NULL),
(3127, 32, 'Казачинское  (Красноярский край)', NULL, NULL, NULL),
(3128, 32, 'Канск', NULL, NULL, NULL),
(3129, 32, 'Каратузское', NULL, NULL, NULL),
(3130, 32, 'Караул', NULL, NULL, NULL),
(3131, 32, 'Кодинск', NULL, NULL, NULL),
(3132, 32, 'Козулька', NULL, NULL, NULL),
(3133, 32, 'Копьево', NULL, NULL, NULL),
(3134, 32, 'Краснотуранск', NULL, NULL, NULL),
(3135, 32, 'Красноярск', NULL, NULL, NULL),
(3136, 32, 'Курагино', NULL, NULL, NULL),
(3137, 32, 'Лесосибирск', NULL, NULL, NULL),
(3138, 32, 'Минусинск', NULL, NULL, NULL),
(3139, 32, 'Мотыгино', NULL, NULL, NULL),
(3140, 32, 'Назарово', NULL, NULL, NULL),
(3141, 32, 'Нижний Ингаш', NULL, NULL, NULL),
(3142, 32, 'Новоселово', NULL, NULL, NULL),
(3143, 32, 'Норильск', NULL, NULL, NULL),
(3144, 32, 'Партизанское', NULL, NULL, NULL),
(3145, 32, 'Пировское', NULL, NULL, NULL),
(3146, 32, 'Северо-Енисейский', NULL, NULL, NULL),
(3147, 32, 'Сосновоборск (Красноярский край)', NULL, NULL, NULL),
(3148, 32, 'Тасеево', NULL, NULL, NULL),
(3149, 32, 'Таштып', NULL, NULL, NULL),
(3150, 32, 'Тура', NULL, NULL, NULL),
(3151, 32, 'Туруханск', NULL, NULL, NULL),
(3152, 32, 'Тюхтет', NULL, NULL, NULL),
(3153, 32, 'Ужур', NULL, NULL, NULL),
(3154, 32, 'Уяр', NULL, NULL, NULL),
(3155, 32, 'Хатанга', NULL, NULL, NULL),
(3156, 32, 'Черемушки', NULL, NULL, NULL),
(3157, 32, 'Черногорск', NULL, NULL, NULL),
(3158, 32, 'Шалинское', NULL, NULL, NULL),
(3159, 32, 'Шарыпово  (Красноярский край)', NULL, NULL, NULL),
(3160, 32, 'Шира', NULL, NULL, NULL),
(3161, 32, 'Шушенское', NULL, NULL, NULL),
(3162, 33, 'Варгаши', NULL, NULL, NULL),
(3163, 33, 'Глядянское', NULL, NULL, NULL),
(3164, 33, 'Далматово', NULL, NULL, NULL),
(3165, 33, 'Каргаполье', NULL, NULL, NULL),
(3166, 33, 'Катайск', NULL, NULL, NULL),
(3167, 33, 'Кетово', NULL, NULL, NULL),
(3168, 33, 'Курган', NULL, NULL, NULL),
(3169, 33, 'Куртамыш', NULL, NULL, NULL),
(3170, 33, 'Лебяжье', NULL, NULL, NULL),
(3171, 33, 'Макушино', NULL, NULL, NULL),
(3172, 33, 'Мишкино', NULL, NULL, NULL),
(3173, 33, 'Мокроусово', NULL, NULL, NULL),
(3174, 33, 'Петухово', NULL, NULL, NULL),
(3175, 33, 'Половинное', NULL, NULL, NULL),
(3176, 33, 'Сафакулево', NULL, NULL, NULL),
(3177, 33, 'Целинное', NULL, NULL, NULL),
(3178, 33, 'Шадринск', NULL, NULL, NULL),
(3179, 33, 'Шатрово', NULL, NULL, NULL),
(3180, 33, 'Шумиха', NULL, NULL, NULL),
(3181, 33, 'Щучье', NULL, NULL, NULL),
(3182, 33, 'Юргамыш', NULL, NULL, NULL),
(3183, 34, 'Альменево', NULL, NULL, NULL),
(3184, 34, 'Белая', NULL, NULL, NULL),
(3185, 34, 'Большое Солдатское', NULL, NULL, NULL),
(3186, 34, 'Глушково', NULL, NULL, NULL),
(3187, 34, 'Горшечное', NULL, NULL, NULL),
(3188, 34, 'Дмитриев-Льговский', NULL, NULL, NULL),
(3189, 34, 'Железногорск', NULL, NULL, NULL),
(3190, 34, 'Золотухино', NULL, NULL, NULL),
(3191, 34, 'Касторное', NULL, NULL, NULL),
(3192, 34, 'Конышевка', NULL, NULL, NULL),
(3193, 34, 'Коренево', NULL, NULL, NULL),
(3194, 34, 'Курск', NULL, NULL, NULL),
(3195, 34, 'Курчатов', NULL, NULL, NULL),
(3196, 34, 'Кшенский', NULL, NULL, NULL),
(3197, 34, 'Льгов', NULL, NULL, NULL),
(3198, 34, 'Мантурово', NULL, NULL, NULL),
(3199, 34, 'Медвенка', NULL, NULL, NULL),
(3200, 34, 'Обоянь', NULL, NULL, NULL),
(3201, 34, 'Поныри', NULL, NULL, NULL),
(3202, 34, 'Пристень', NULL, NULL, NULL),
(3203, 34, 'Прямицыно', NULL, NULL, NULL),
(3204, 34, 'Рыльск', NULL, NULL, NULL),
(3205, 34, 'Суджа', NULL, NULL, NULL),
(3206, 34, 'Тим', NULL, NULL, NULL),
(3207, 34, 'Фатеж', NULL, NULL, NULL),
(3208, 34, 'Хомутовка', NULL, NULL, NULL),
(3209, 34, 'Черемисиново', NULL, NULL, NULL),
(3210, 34, 'Щигры', NULL, NULL, NULL),
(3211, 35, 'Грязи', NULL, NULL, NULL),
(3212, 35, 'Данков', NULL, NULL, NULL),
(3213, 35, 'Доброе', NULL, NULL, NULL),
(3214, 35, 'Долгоруково', NULL, NULL, NULL),
(3215, 35, 'Елец', NULL, NULL, NULL),
(3216, 35, 'Задонск', NULL, NULL, NULL),
(3217, 35, 'Измалково', NULL, NULL, NULL),
(3218, 35, 'Казинка', NULL, NULL, NULL),
(3219, 35, 'Лебедянь', NULL, NULL, NULL),
(3220, 35, 'Лев Толстой', NULL, NULL, NULL),
(3221, 35, 'Липецк', NULL, NULL, NULL),
(3222, 35, 'Тербуны', NULL, NULL, NULL),
(3223, 35, 'Усмань', NULL, NULL, NULL),
(3224, 35, 'Хлевное', NULL, NULL, NULL),
(3225, 35, 'Чаплыгин', NULL, NULL, NULL),
(3226, 36, 'Анадырь (Магаданская обл.)', NULL, NULL, NULL),
(3227, 36, 'Атка', NULL, NULL, NULL),
(3228, 36, 'Беринговский', NULL, NULL, NULL),
(3229, 36, 'Билибино', NULL, NULL, NULL),
(3230, 36, 'Большевик', NULL, NULL, NULL),
(3231, 36, 'Ванкарем', NULL, NULL, NULL),
(3232, 36, 'Кадыкчан', NULL, NULL, NULL),
(3233, 36, 'Лаврентия', NULL, NULL, NULL),
(3234, 36, 'Магадан', NULL, NULL, NULL),
(3235, 36, 'Мыс Шмидта', NULL, NULL, NULL),
(3236, 36, 'Ола', NULL, NULL, NULL),
(3237, 36, 'Омсукчан', NULL, NULL, NULL),
(3238, 36, 'Палатка', NULL, NULL, NULL),
(3239, 36, 'Певек', NULL, NULL, NULL),
(3240, 36, 'Провидения', NULL, NULL, NULL),
(3241, 36, 'Сеймчан', NULL, NULL, NULL),
(3242, 36, 'Синегорье', NULL, NULL, NULL),
(3243, 36, 'Сусуман', NULL, NULL, NULL),
(3244, 36, 'Усть-Омчуг', NULL, NULL, NULL),
(3245, 36, 'Эвенск', NULL, NULL, NULL),
(3246, 36, 'Эгвекинот', NULL, NULL, NULL),
(3247, 36, 'Ягодное', NULL, NULL, NULL),
(3248, 37, 'Волжск', NULL, NULL, NULL),
(3249, 37, 'Дубовский', NULL, NULL, NULL),
(3250, 37, 'Звенигово', NULL, NULL, NULL),
(3251, 37, 'Йошкар-Ола', NULL, NULL, NULL),
(3252, 37, 'Килемары', NULL, NULL, NULL),
(3253, 37, 'Козьмодемьянск', NULL, NULL, NULL),
(3254, 37, 'Куженер', NULL, NULL, NULL),
(3255, 37, 'Мари-Турек', NULL, NULL, NULL),
(3256, 37, 'Медведево', NULL, NULL, NULL),
(3257, 37, 'Морки', NULL, NULL, NULL),
(3258, 37, 'Новый Торьял', NULL, NULL, NULL),
(3259, 37, 'Оршанка', NULL, NULL, NULL),
(3260, 37, 'Параньга', NULL, NULL, NULL),
(3261, 37, 'Сернур', NULL, NULL, NULL),
(3262, 37, 'Советский (Марий Эл)', NULL, NULL, NULL),
(3263, 37, 'Юрино', NULL, NULL, NULL),
(3264, 38, 'Ардатов', NULL, NULL, NULL),
(3265, 38, 'Атюрьево', NULL, NULL, NULL),
(3266, 38, 'Атяшево', NULL, NULL, NULL),
(3267, 38, 'Большие Березники', NULL, NULL, NULL),
(3268, 38, 'Большое Игнатово', NULL, NULL, NULL),
(3269, 38, 'Выша', NULL, NULL, NULL),
(3270, 38, 'Ельники', NULL, NULL, NULL),
(3271, 38, 'Зубова Поляна', NULL, NULL, NULL),
(3272, 38, 'Инсар', NULL, NULL, NULL),
(3273, 38, 'Кадошкино', NULL, NULL, NULL),
(3274, 38, 'Кемля', NULL, NULL, NULL),
(3275, 38, 'Ковылкино', NULL, NULL, NULL),
(3276, 38, 'Комсомольский (Мордовия)', NULL, NULL, NULL),
(3277, 38, 'Кочкурово', NULL, NULL, NULL),
(3278, 38, 'Краснослободск', NULL, NULL, NULL),
(3279, 38, 'Лямбирь', NULL, NULL, NULL),
(3280, 38, 'Ромоданово', NULL, NULL, NULL),
(3281, 38, 'Рузаевка', NULL, NULL, NULL),
(3282, 38, 'Саранск', NULL, NULL, NULL),
(3283, 38, 'Старое Шайгово', NULL, NULL, NULL),
(3284, 38, 'Темников', NULL, NULL, NULL),
(3285, 38, 'Теньгушево', NULL, NULL, NULL),
(3286, 38, 'Торбеево', NULL, NULL, NULL),
(3287, 38, 'Чамзинка', NULL, NULL, NULL),
(3288, 39, 'Апатиты', NULL, NULL, NULL),
(3289, 39, 'Африканда', NULL, NULL, NULL),
(3290, 39, 'Верхнетуломский', NULL, NULL, NULL),
(3291, 39, 'Видяево', NULL, NULL, NULL),
(3292, 39, 'Гаджиево', NULL, NULL, NULL),
(3293, 39, 'Заозерск', NULL, NULL, NULL),
(3294, 39, 'Заполярный', NULL, NULL, NULL),
(3295, 39, 'Зареченск', NULL, NULL, NULL),
(3296, 39, 'Зашеек', NULL, NULL, NULL),
(3297, 39, 'Зеленоборский', NULL, NULL, NULL),
(3298, 39, 'Кандалакша', NULL, NULL, NULL),
(3299, 39, 'Кильдинстрой', NULL, NULL, NULL),
(3300, 39, 'Кировск', NULL, NULL, NULL),
(3301, 39, 'Ковдор', NULL, NULL, NULL),
(3302, 39, 'Кола', NULL, NULL, NULL),
(3303, 39, 'Конда', NULL, NULL, NULL),
(3304, 39, 'Ловозеро', NULL, NULL, NULL),
(3305, 39, 'Мончегорск', NULL, NULL, NULL),
(3306, 39, 'Мурманск', NULL, NULL, NULL),
(3307, 39, 'Мурмаши', NULL, NULL, NULL),
(3308, 39, 'Никель', NULL, NULL, NULL),
(3309, 39, 'Оленегорск', NULL, NULL, NULL),
(3310, 39, 'Полярные Зори', NULL, NULL, NULL),
(3311, 39, 'Полярный', NULL, NULL, NULL),
(3312, 39, 'Ревда (Мурманская обл.)', NULL, NULL, NULL),
(3313, 39, 'Североморск', NULL, NULL, NULL),
(3314, 39, 'Снежногорск', NULL, NULL, NULL),
(3315, 39, 'Умба', NULL, NULL, NULL),
(3316, 40, 'Ардатов', NULL, NULL, NULL),
(3317, 40, 'Арзамас', NULL, NULL, NULL),
(3318, 40, 'Арья', NULL, NULL, NULL),
(3319, 40, 'Балахна', NULL, NULL, NULL),
(3320, 40, 'Богородск', NULL, NULL, NULL),
(3321, 40, 'Большереченск', NULL, NULL, NULL),
(3322, 40, 'Большое Болдино', NULL, NULL, NULL),
(3323, 40, 'Большое Козино', NULL, NULL, NULL),
(3324, 40, 'Большое Мурашкино', NULL, NULL, NULL),
(3325, 40, 'Большое Пикино', NULL, NULL, NULL),
(3326, 40, 'Бор', NULL, NULL, NULL),
(3327, 40, 'Бутурлино', NULL, NULL, NULL),
(3328, 40, 'Вад', NULL, NULL, NULL),
(3329, 40, 'Варнавино', NULL, NULL, NULL),
(3330, 40, 'Васильсурск', NULL, NULL, NULL),
(3331, 40, 'Вахтан', NULL, NULL, NULL),
(3332, 40, 'Вача', NULL, NULL, NULL),
(3333, 40, 'Ветлуга', NULL, NULL, NULL),
(3334, 40, 'Виля', NULL, NULL, NULL),
(3335, 40, 'Вознесенское', NULL, NULL, NULL),
(3336, 40, 'Володарск', NULL, NULL, NULL),
(3337, 40, 'Воротынец', NULL, NULL, NULL),
(3338, 40, 'Ворсма', NULL, NULL, NULL),
(3339, 40, 'Воскресенское', NULL, NULL, NULL),
(3340, 40, 'Выездное', NULL, NULL, NULL),
(3341, 40, 'Выкса', NULL, NULL, NULL),
(3342, 40, 'Гагино', NULL, NULL, NULL),
(3343, 40, 'Гидроторф', NULL, NULL, NULL),
(3344, 40, 'Горбатов', NULL, NULL, NULL),
(3345, 40, 'Горбатовка', NULL, NULL, NULL),
(3346, 40, 'Городец', NULL, NULL, NULL),
(3347, 40, 'Дальнее Константиново', NULL, NULL, NULL),
(3348, 40, 'Дзержинск', NULL, NULL, NULL),
(3349, 40, 'Дивеево', NULL, NULL, NULL),
(3350, 40, 'Досчатое', NULL, NULL, NULL),
(3351, 40, 'Заволжье', NULL, NULL, NULL),
(3352, 40, 'Керженец', NULL, NULL, NULL),
(3353, 40, 'Княгинино', NULL, NULL, NULL),
(3354, 40, 'Ковернино', NULL, NULL, NULL),
(3355, 40, 'Красные Баки', NULL, NULL, NULL),
(3356, 40, 'Кстово', NULL, NULL, NULL),
(3357, 40, 'Кулебаки', NULL, NULL, NULL),
(3358, 40, 'Лукоянов', NULL, NULL, NULL),
(3359, 40, 'Лысково', NULL, NULL, NULL),
(3360, 40, 'Навашино', NULL, NULL, NULL),
(3361, 40, 'Нижний Новгород', NULL, NULL, NULL),
(3362, 40, 'Новосмолинский', NULL, NULL, NULL),
(3363, 40, 'Павлово', NULL, NULL, NULL),
(3364, 40, 'Первомайск', NULL, NULL, NULL),
(3365, 40, 'Перевоз', NULL, NULL, NULL),
(3366, 40, 'Пильна', NULL, NULL, NULL),
(3367, 40, 'Починки', NULL, NULL, NULL),
(3368, 40, 'Саров (Нижегородская обл.)', NULL, NULL, NULL),
(3369, 40, 'Семенов', NULL, NULL, NULL),
(3370, 40, 'Сергач', NULL, NULL, NULL),
(3371, 40, 'Сеченово', NULL, NULL, NULL),
(3372, 40, 'Сосновское', NULL, NULL, NULL),
(3373, 40, 'Спасское', NULL, NULL, NULL),
(3374, 40, 'Тонкино', NULL, NULL, NULL),
(3375, 40, 'Тоншаево', NULL, NULL, NULL),
(3376, 40, 'Уразовка', NULL, NULL, NULL),
(3377, 40, 'Урень', NULL, NULL, NULL),
(3378, 40, 'Чкаловск', NULL, NULL, NULL),
(3379, 40, 'Шаранга', NULL, NULL, NULL),
(3380, 40, 'Шатки', NULL, NULL, NULL),
(3381, 40, 'Шахунья', NULL, NULL, NULL),
(3382, 41, 'Анциферово', NULL, NULL, NULL),
(3383, 41, 'Батецкий', NULL, NULL, NULL),
(3384, 41, 'Большая Вишера', NULL, NULL, NULL),
(3385, 41, 'Боровичи', NULL, NULL, NULL),
(3386, 41, 'Валдай', NULL, NULL, NULL),
(3387, 41, 'Великий Новгород (Новгород)', NULL, NULL, NULL),
(3388, 41, 'Волот', NULL, NULL, NULL),
(3389, 41, 'Деманск', NULL, NULL, NULL),
(3390, 41, 'Зарубино', NULL, NULL, NULL),
(3391, 41, 'Крестцы', NULL, NULL, NULL),
(3392, 41, 'Любытино', NULL, NULL, NULL),
(3393, 41, 'Малая Вишера', NULL, NULL, NULL),
(3394, 41, 'Марево', NULL, NULL, NULL),
(3395, 41, 'Мошенское', NULL, NULL, NULL),
(3396, 41, 'Окуловка', NULL, NULL, NULL),
(3397, 41, 'Парфино', NULL, NULL, NULL),
(3398, 41, 'Пестово', NULL, NULL, NULL),
(3399, 41, 'Поддорье', NULL, NULL, NULL),
(3400, 41, 'Сольцы', NULL, NULL, NULL),
(3401, 41, 'Старая Русса', NULL, NULL, NULL),
(3402, 41, 'Хвойная', NULL, NULL, NULL),
(3403, 41, 'Холм', NULL, NULL, NULL),
(3404, 41, 'Чудово', NULL, NULL, NULL),
(3405, 41, 'Шимск', NULL, NULL, NULL),
(3406, 42, 'Баган', NULL, NULL, NULL),
(3407, 42, 'Барабинск', NULL, NULL, NULL),
(3408, 42, 'Бердск', NULL, NULL, NULL),
(3409, 42, 'Биаза', NULL, NULL, NULL),
(3410, 42, 'Болотное', NULL, NULL, NULL),
(3411, 42, 'Венгерово', NULL, NULL, NULL),
(3412, 42, 'Довольное', NULL, NULL, NULL),
(3413, 42, 'Завьялово', NULL, NULL, NULL),
(3414, 42, 'Искитим', NULL, NULL, NULL),
(3415, 42, 'Карасук', NULL, NULL, NULL),
(3416, 42, 'Каргат', NULL, NULL, NULL),
(3417, 42, 'Колывань', NULL, NULL, NULL),
(3418, 42, 'Краснозерское', NULL, NULL, NULL),
(3419, 42, 'Крутиха', NULL, NULL, NULL),
(3420, 42, 'Куйбышев (Новосибирская обл.)', NULL, NULL, NULL),
(3421, 42, 'Купино', NULL, NULL, NULL),
(3422, 42, 'Кыштовка', NULL, NULL, NULL),
(3423, 42, 'Маслянино', NULL, NULL, NULL),
(3424, 42, 'Мошково', NULL, NULL, NULL),
(3425, 42, 'Новосибирск', NULL, NULL, NULL),
(3426, 42, 'Норильск', NULL, NULL, NULL),
(3427, 42, 'Обь', NULL, NULL, NULL),
(3428, 42, 'Ордынское', NULL, NULL, NULL),
(3429, 42, 'Северное', NULL, NULL, NULL),
(3430, 42, 'Сузун', NULL, NULL, NULL),
(3431, 42, 'Татарск', NULL, NULL, NULL),
(3432, 42, 'Тогучин', NULL, NULL, NULL),
(3433, 42, 'Убинское', NULL, NULL, NULL),
(3434, 42, 'Усть-Тарка', NULL, NULL, NULL),
(3435, 42, 'Чаны', NULL, NULL, NULL),
(3436, 42, 'Черепаново', NULL, NULL, NULL),
(3437, 42, 'Чистоозерное', NULL, NULL, NULL),
(3438, 42, 'Чулым', NULL, NULL, NULL),
(3439, 43, 'Береговой', NULL, NULL, NULL),
(3440, 43, 'Большеречье', NULL, NULL, NULL),
(3441, 43, 'Большие Уки', NULL, NULL, NULL),
(3442, 43, 'Горьковское', NULL, NULL, NULL),
(3443, 43, 'Знаменское (Омская обл.)', NULL, NULL, NULL),
(3444, 43, 'Исилькуль', NULL, NULL, NULL),
(3445, 43, 'Калачинск', NULL, NULL, NULL),
(3446, 43, 'Колосовка', NULL, NULL, NULL),
(3447, 43, 'Кормиловка', NULL, NULL, NULL),
(3448, 43, 'Крутинка', NULL, NULL, NULL),
(3449, 43, 'Любинский', NULL, NULL, NULL),
(3450, 43, 'Марьяновка', NULL, NULL, NULL),
(3451, 43, 'Муромцево', NULL, NULL, NULL),
(3452, 43, 'Называевск', NULL, NULL, NULL),
(3453, 43, 'Нижняя Омка', NULL, NULL, NULL),
(3454, 43, 'Нововаршавка', NULL, NULL, NULL),
(3455, 43, 'Одесское', NULL, NULL, NULL),
(3456, 43, 'Оконешниково', NULL, NULL, NULL),
(3457, 43, 'Омск', NULL, NULL, NULL),
(3458, 43, 'Павлоградка', NULL, NULL, NULL),
(3459, 43, 'Полтавка', NULL, NULL, NULL),
(3460, 43, 'Русская Поляна', NULL, NULL, NULL),
(3461, 43, 'Саргатское', NULL, NULL, NULL),
(3462, 43, 'Седельниково', NULL, NULL, NULL),
(3463, 43, 'Таврическое', NULL, NULL, NULL),
(3464, 43, 'Тара', NULL, NULL, NULL),
(3465, 43, 'Тевриз', NULL, NULL, NULL),
(3466, 43, 'Тюкалинск', NULL, NULL, NULL),
(3467, 43, 'Усть-Ишим', NULL, NULL, NULL),
(3468, 43, 'Черлак', NULL, NULL, NULL),
(3469, 43, 'Шербакуль', NULL, NULL, NULL),
(3470, 44, 'Абдулино', NULL, NULL, NULL),
(3471, 44, 'Адамовка', NULL, NULL, NULL),
(3472, 44, 'Айдырлинский', NULL, NULL, NULL),
(3473, 44, 'Акбулак', NULL, NULL, NULL),
(3474, 44, 'Аккермановка', NULL, NULL, NULL),
(3475, 44, 'Асекеево', NULL, NULL, NULL),
(3476, 44, 'Беляевка', NULL, NULL, NULL),
(3477, 44, 'Бугуруслан', NULL, NULL, NULL),
(3478, 44, 'Бузулук', NULL, NULL, NULL),
(3479, 44, 'Гай', NULL, NULL, NULL),
(3480, 44, 'Грачевка', NULL, NULL, NULL),
(3481, 44, 'Домбаровский', NULL, NULL, NULL),
(3482, 44, 'Дубенский', NULL, NULL, NULL),
(3483, 44, 'Илек', NULL, NULL, NULL),
(3484, 44, 'Ириклинский', NULL, NULL, NULL),
(3485, 44, 'Кувандык', NULL, NULL, NULL),
(3486, 44, 'Курманаевка', NULL, NULL, NULL),
(3487, 44, 'Матвеевка', NULL, NULL, NULL),
(3488, 44, 'Медногорск', NULL, NULL, NULL),
(3489, 44, 'Новоорск', NULL, NULL, NULL),
(3490, 44, 'Новосергиевка', NULL, NULL, NULL),
(3491, 44, 'Новотроицк', NULL, NULL, NULL),
(3492, 44, 'Октябрьское (Оренбург.)', NULL, NULL, NULL),
(3493, 44, 'Оренбург', NULL, NULL, NULL),
(3494, 44, 'Орск', NULL, NULL, NULL),
(3495, 44, 'Первомайский (Оренбург.)', NULL, NULL, NULL),
(3496, 44, 'Переволоцкий', NULL, NULL, NULL),
(3497, 44, 'Пономаревка', NULL, NULL, NULL),
(3498, 44, 'Саракташ', NULL, NULL, NULL),
(3499, 44, 'Светлый (Оренбургская обл.)', NULL, NULL, NULL),
(3500, 44, 'Северное', NULL, NULL, NULL),
(3501, 44, 'Соль-Илецк', NULL, NULL, NULL),
(3502, 44, 'Сорочинск', NULL, NULL, NULL),
(3503, 44, 'Ташла', NULL, NULL, NULL),
(3504, 44, 'Тоцкое', NULL, NULL, NULL),
(3505, 44, 'Тюльган', NULL, NULL, NULL),
(3506, 44, 'Шарлык', NULL, NULL, NULL),
(3507, 44, 'Энергетик', NULL, NULL, NULL),
(3508, 44, 'Ясный', NULL, NULL, NULL),
(3509, 45, 'Болхов', NULL, NULL, NULL),
(3510, 45, 'Верховье', NULL, NULL, NULL),
(3511, 45, 'Глазуновка', NULL, NULL, NULL),
(3512, 45, 'Дмитровск-Орловский', NULL, NULL, NULL),
(3513, 45, 'Долгое', NULL, NULL, NULL),
(3514, 45, 'Залегощь', NULL, NULL, NULL),
(3515, 45, 'Змиевка', NULL, NULL, NULL),
(3516, 45, 'Знаменское (Орловская обл.)', NULL, NULL, NULL),
(3517, 45, 'Колпны', NULL, NULL, NULL),
(3518, 45, 'Красная Заря', NULL, NULL, NULL),
(3519, 45, 'Кромы', NULL, NULL, NULL),
(3520, 45, 'Ливны', NULL, NULL, NULL),
(3521, 45, 'Малоархангельск', NULL, NULL, NULL),
(3522, 45, 'Мценск', NULL, NULL, NULL),
(3523, 45, 'Нарышкино', NULL, NULL, NULL),
(3524, 45, 'Новосиль', NULL, NULL, NULL),
(3525, 45, 'Орел', NULL, NULL, NULL),
(3526, 45, 'Покровское', NULL, NULL, NULL),
(3527, 45, 'Сосково', NULL, NULL, NULL),
(3528, 45, 'Тросна', NULL, NULL, NULL),
(3529, 45, 'Хомутово', NULL, NULL, NULL),
(3530, 45, 'Хотынец', NULL, NULL, NULL),
(3531, 45, 'Шаблыкино', NULL, NULL, NULL),
(3532, 46, 'Башмаково', NULL, NULL, NULL),
(3533, 46, 'Беднодемьяновск', NULL, NULL, NULL),
(3534, 46, 'Беково', NULL, NULL, NULL),
(3535, 46, 'Белинский', NULL, NULL, NULL),
(3536, 46, 'Бессоновка', NULL, NULL, NULL),
(3537, 46, 'Вадинск', NULL, NULL, NULL),
(3538, 46, 'Верхозим', NULL, NULL, NULL),
(3539, 46, 'Городище (Пензенская обл.)', NULL, NULL, NULL),
(3540, 46, 'Евлашево', NULL, NULL, NULL),
(3541, 46, 'Заречный (Пензенская обл.)', NULL, NULL, NULL),
(3542, 46, 'Земетчино', NULL, NULL, NULL),
(3543, 46, 'Золотаревка', NULL, NULL, NULL),
(3544, 46, 'Исса', NULL, NULL, NULL),
(3545, 46, 'Каменка', NULL, NULL, NULL),
(3546, 46, 'Колышлей', NULL, NULL, NULL),
(3547, 46, 'Кондоль', NULL, NULL, NULL),
(3548, 46, 'Кузнецк', NULL, NULL, NULL),
(3549, 46, 'Лопатино', NULL, NULL, NULL),
(3550, 46, 'Малая Сердоба', NULL, NULL, NULL),
(3551, 46, 'Мокшан', NULL, NULL, NULL),
(3552, 46, 'Наровчат', NULL, NULL, NULL),
(3553, 46, 'Неверкино', NULL, NULL, NULL),
(3554, 46, 'Нижний Ломов', NULL, NULL, NULL),
(3555, 46, 'Никольск (Пензенская обл.)', NULL, NULL, NULL),
(3556, 46, 'Пачелма', NULL, NULL, NULL),
(3557, 46, 'Пенза', NULL, NULL, NULL),
(3558, 46, 'Русский Камешкир', NULL, NULL, NULL),
(3559, 46, 'Сердобск', NULL, NULL, NULL),
(3560, 46, 'Сосновоборск', NULL, NULL, NULL),
(3561, 46, 'Сура', NULL, NULL, NULL),
(3562, 46, 'Тамала', NULL, NULL, NULL),
(3563, 46, 'Шемышейка', NULL, NULL, NULL),
(3564, 47, 'Александровск', NULL, NULL, NULL),
(3565, 47, 'Барда', NULL, NULL, NULL),
(3566, 47, 'Березники', NULL, NULL, NULL),
(3567, 47, 'Большая Соснова', NULL, NULL, NULL),
(3568, 47, 'Верещагино', NULL, NULL, NULL),
(3569, 47, 'Гайны', NULL, NULL, NULL),
(3570, 47, 'Горнозаводск (Пермский край)', NULL, NULL, NULL),
(3571, 47, 'Гремячинск', NULL, NULL, NULL),
(3572, 47, 'Губаха', NULL, NULL, NULL),
(3573, 47, 'Добрянка', NULL, NULL, NULL),
(3574, 47, 'Елово', NULL, NULL, NULL),
(3575, 47, 'Зюкайка', NULL, NULL, NULL),
(3576, 47, 'Ильинский (Пермская обл.)', NULL, NULL, NULL),
(3577, 47, 'Карагай', NULL, NULL, NULL),
(3578, 47, 'Керчевский', NULL, NULL, NULL),
(3579, 47, 'Кизел', NULL, NULL, NULL),
(3580, 47, 'Коса', NULL, NULL, NULL),
(3581, 47, 'Кочево', NULL, NULL, NULL),
(3582, 47, 'Красновишерск', NULL, NULL, NULL),
(3583, 47, 'Краснокамск', NULL, NULL, NULL),
(3584, 47, 'Кудымкар', NULL, NULL, NULL),
(3585, 47, 'Куеда', NULL, NULL, NULL),
(3586, 47, 'Кунгур', NULL, NULL, NULL),
(3587, 47, 'Лысьва', NULL, NULL, NULL),
(3588, 47, 'Ныроб', NULL, NULL, NULL),
(3589, 47, 'Нытва', NULL, NULL, NULL),
(3590, 47, 'Октябрьский', NULL, NULL, NULL),
(3591, 47, 'Орда', NULL, NULL, NULL),
(3592, 47, 'Оса', NULL, NULL, NULL),
(3593, 47, 'Оханск', NULL, NULL, NULL),
(3594, 47, 'Очер', NULL, NULL, NULL),
(3595, 47, 'Пермь', NULL, NULL, NULL),
(3596, 47, 'Соликамск', NULL, NULL, NULL),
(3597, 47, 'Суксун', NULL, NULL, NULL),
(3598, 47, 'Уинское', NULL, NULL, NULL),
(3599, 47, 'Усолье', NULL, NULL, NULL),
(3600, 47, 'Усть-Кишерть', NULL, NULL, NULL),
(3601, 47, 'Чайковский', NULL, NULL, NULL),
(3602, 47, 'Частые', NULL, NULL, NULL),
(3603, 47, 'Чердынь', NULL, NULL, NULL),
(3604, 47, 'Чернореченский', NULL, NULL, NULL),
(3605, 47, 'Чернушка', NULL, NULL, NULL),
(3606, 47, 'Чусовой', NULL, NULL, NULL),
(3607, 47, 'Юрла', NULL, NULL, NULL),
(3608, 47, 'Юсьва', NULL, NULL, NULL),
(3609, 48, 'Анучино', NULL, NULL, NULL),
(3610, 48, 'Арсеньев', NULL, NULL, NULL),
(3611, 48, 'Артем', NULL, NULL, NULL),
(3612, 48, 'Артемовский (Приморский край)', NULL, NULL, NULL),
(3613, 48, 'Большой Камень', NULL, NULL, NULL),
(3614, 48, 'Валентин', NULL, NULL, NULL),
(3615, 48, 'Владивосток', NULL, NULL, NULL),
(3616, 48, 'Высокогорск', NULL, NULL, NULL),
(3617, 48, 'Горные Ключи', NULL, NULL, NULL),
(3618, 48, 'Горный', NULL, NULL, NULL),
(3619, 48, 'Дальнегорск', NULL, NULL, NULL),
(3620, 48, 'Дальнереченск', NULL, NULL, NULL),
(3621, 48, 'Зарубино', NULL, NULL, NULL),
(3622, 48, 'Кавалерово', NULL, NULL, NULL),
(3623, 48, 'Каменка (Приморский край)', NULL, NULL, NULL),
(3624, 48, 'Камень-Рыболов', NULL, NULL, NULL),
(3625, 48, 'Кировский', NULL, NULL, NULL),
(3626, 48, 'Лазо', NULL, NULL, NULL),
(3627, 48, 'Лесозаводск', NULL, NULL, NULL),
(3628, 48, 'Лучегорск', NULL, NULL, NULL),
(3629, 48, 'Михайловка (Приморский край)', NULL, NULL, NULL),
(3630, 48, 'Находка (Приморский край)', NULL, NULL, NULL),
(3631, 48, 'Новопокровка', NULL, NULL, NULL),
(3632, 48, 'Ольга', NULL, NULL, NULL),
(3633, 48, 'Партизанск', NULL, NULL, NULL),
(3634, 48, 'Пластун', NULL, NULL, NULL),
(3635, 48, 'Пограничный', NULL, NULL, NULL),
(3636, 48, 'Покровка', NULL, NULL, NULL),
(3637, 48, 'Посьет', NULL, NULL, NULL),
(3638, 48, 'Русский', NULL, NULL, NULL),
(3639, 48, 'Славянка', NULL, NULL, NULL),
(3640, 48, 'Спасск-Дальний', NULL, NULL, NULL),
(3641, 48, 'Терней', NULL, NULL, NULL),
(3642, 48, 'Уссурийск', NULL, NULL, NULL),
(3643, 48, 'Фокино', NULL, NULL, NULL),
(3644, 48, 'Хасан', NULL, NULL, NULL);
INSERT INTO `region` (`id`, `parent_id`, `name`, `path`, `language`, `grade`) VALUES
(3645, 48, 'Хороль', NULL, NULL, NULL),
(3646, 48, 'Черниговка', NULL, NULL, NULL),
(3647, 48, 'Чугуевка', NULL, NULL, NULL),
(3648, 48, 'Яковлевка', NULL, NULL, NULL),
(3649, 48, 'Ярославский', NULL, NULL, NULL),
(3650, 49, 'Бежаницы', NULL, NULL, NULL),
(3651, 49, 'Великие Луки', NULL, NULL, NULL),
(3652, 49, 'Гдов', NULL, NULL, NULL),
(3653, 49, 'Дедовичи', NULL, NULL, NULL),
(3654, 49, 'Дно', NULL, NULL, NULL),
(3655, 49, 'Заплюсье', NULL, NULL, NULL),
(3656, 49, 'Идрица', NULL, NULL, NULL),
(3657, 49, 'Красногородское', NULL, NULL, NULL),
(3658, 49, 'Кунья', NULL, NULL, NULL),
(3659, 49, 'Локня', NULL, NULL, NULL),
(3660, 49, 'Невель', NULL, NULL, NULL),
(3661, 49, 'Новоржев', NULL, NULL, NULL),
(3662, 49, 'Новосокольники', NULL, NULL, NULL),
(3663, 49, 'Опочка', NULL, NULL, NULL),
(3664, 49, 'Остров', NULL, NULL, NULL),
(3665, 49, 'Палкино', NULL, NULL, NULL),
(3666, 49, 'Печоры', NULL, NULL, NULL),
(3667, 49, 'Плюсса', NULL, NULL, NULL),
(3668, 49, 'Порхов', NULL, NULL, NULL),
(3669, 49, 'Псков', NULL, NULL, NULL),
(3670, 49, 'Пустошка', NULL, NULL, NULL),
(3671, 49, 'Пушкинские Горы', NULL, NULL, NULL),
(3672, 49, 'Пыталово', NULL, NULL, NULL),
(3673, 49, 'Себеж', NULL, NULL, NULL),
(3674, 49, 'Струги-Красные', NULL, NULL, NULL),
(3675, 49, 'Усвяты', NULL, NULL, NULL),
(3676, 51, 'Азов', NULL, NULL, NULL),
(3677, 51, 'Аксай (Ростовская обл.)', NULL, NULL, NULL),
(3678, 51, 'Алмазный', NULL, NULL, NULL),
(3679, 51, 'Аютинск', NULL, NULL, NULL),
(3680, 51, 'Багаевский', NULL, NULL, NULL),
(3681, 51, 'Батайск', NULL, NULL, NULL),
(3682, 51, 'Белая Калитва', NULL, NULL, NULL),
(3683, 51, 'Боковская', NULL, NULL, NULL),
(3684, 51, 'Большая Мартыновка', NULL, NULL, NULL),
(3685, 51, 'Вешенская', NULL, NULL, NULL),
(3686, 51, 'Волгодонск', NULL, NULL, NULL),
(3687, 51, 'Восход', NULL, NULL, NULL),
(3688, 51, 'Гигант', NULL, NULL, NULL),
(3689, 51, 'Горняцкий', NULL, NULL, NULL),
(3690, 51, 'Гуково', NULL, NULL, NULL),
(3691, 51, 'Донецк', NULL, NULL, NULL),
(3692, 51, 'Донской (Ростовская обл.)', NULL, NULL, NULL),
(3693, 51, 'Дубовское', NULL, NULL, NULL),
(3694, 51, 'Егорлыкская', NULL, NULL, NULL),
(3695, 51, 'Жирнов', NULL, NULL, NULL),
(3696, 51, 'Заветное', NULL, NULL, NULL),
(3697, 51, 'Заводской', NULL, NULL, NULL),
(3698, 51, 'Зверево', NULL, NULL, NULL),
(3699, 51, 'Зерноград', NULL, NULL, NULL),
(3700, 51, 'Зимовники', NULL, NULL, NULL),
(3701, 51, 'Кагальницкая', NULL, NULL, NULL),
(3702, 51, 'Казанская', NULL, NULL, NULL),
(3703, 51, 'Каменоломни', NULL, NULL, NULL),
(3704, 51, 'Каменск-Шахтинский', NULL, NULL, NULL),
(3705, 51, 'Кашары', NULL, NULL, NULL),
(3706, 51, 'Коксовый', NULL, NULL, NULL),
(3707, 51, 'Константиновск', NULL, NULL, NULL),
(3708, 51, 'Красный Сулин', NULL, NULL, NULL),
(3709, 51, 'Куйбышево', NULL, NULL, NULL),
(3710, 51, 'Матвеев Курган', NULL, NULL, NULL),
(3711, 51, 'Мигулинская', NULL, NULL, NULL),
(3712, 51, 'Миллерово', NULL, NULL, NULL),
(3713, 51, 'Милютинская', NULL, NULL, NULL),
(3714, 51, 'Морозовск', NULL, NULL, NULL),
(3715, 51, 'Новочеркасск', NULL, NULL, NULL),
(3716, 51, 'Новошахтинск', NULL, NULL, NULL),
(3717, 51, 'Обливская', NULL, NULL, NULL),
(3718, 51, 'Орловский', NULL, NULL, NULL),
(3719, 51, 'Песчанокопское', NULL, NULL, NULL),
(3720, 51, 'Покровское', NULL, NULL, NULL),
(3721, 51, 'Пролетарск', NULL, NULL, NULL),
(3722, 51, 'Ремонтное', NULL, NULL, NULL),
(3723, 51, 'Родионово-Несветайская', NULL, NULL, NULL),
(3724, 51, 'Ростов-на-Дону', NULL, NULL, NULL),
(3725, 51, 'Сальск', NULL, NULL, NULL),
(3726, 51, 'Семикаракорск', NULL, NULL, NULL),
(3727, 51, 'Таганрог', NULL, NULL, NULL),
(3728, 51, 'Тарасовский', NULL, NULL, NULL),
(3729, 51, 'Тацинский', NULL, NULL, NULL),
(3730, 51, 'Усть-Донецкий', NULL, NULL, NULL),
(3731, 51, 'Целина', NULL, NULL, NULL),
(3732, 51, 'Цимлянск', NULL, NULL, NULL),
(3733, 51, 'Чалтырь', NULL, NULL, NULL),
(3734, 51, 'Чертково', NULL, NULL, NULL),
(3735, 51, 'Шахты', NULL, NULL, NULL),
(3736, 51, 'Шолоховский', NULL, NULL, NULL),
(3737, 51, 'Александро-Невский', NULL, NULL, NULL),
(3738, 51, 'Горняк', NULL, NULL, NULL),
(3739, 51, 'Гусь Железный', NULL, NULL, NULL),
(3740, 51, 'Елатьма', NULL, NULL, NULL),
(3741, 51, 'Ермишь', NULL, NULL, NULL),
(3742, 51, 'Заречный (Рязанская обл.)', NULL, NULL, NULL),
(3743, 51, 'Захарово', NULL, NULL, NULL),
(3744, 51, 'Кадом', NULL, NULL, NULL),
(3745, 51, 'Касимов', NULL, NULL, NULL),
(3746, 51, 'Кораблино', NULL, NULL, NULL),
(3747, 51, 'Милославское', NULL, NULL, NULL),
(3748, 51, 'Михайлов', NULL, NULL, NULL),
(3749, 51, 'Новомичуринск', NULL, NULL, NULL),
(3750, 51, 'Пителино', NULL, NULL, NULL),
(3751, 51, 'Пронск', NULL, NULL, NULL),
(3752, 51, 'Путятино', NULL, NULL, NULL),
(3753, 51, 'Рыбное', NULL, NULL, NULL),
(3754, 51, 'Ряжск', NULL, NULL, NULL),
(3755, 51, 'Рязань', NULL, NULL, NULL),
(3756, 51, 'Сапожок', NULL, NULL, NULL),
(3757, 51, 'Сараи', NULL, NULL, NULL),
(3758, 51, 'Сасово', NULL, NULL, NULL),
(3759, 51, 'Скопин', NULL, NULL, NULL),
(3760, 51, 'Спас-Клепики', NULL, NULL, NULL),
(3761, 51, 'Спасск-Рязанский', NULL, NULL, NULL),
(3762, 51, 'Старожилово', NULL, NULL, NULL),
(3763, 51, 'Ухолово', NULL, NULL, NULL),
(3764, 51, 'Чучково', NULL, NULL, NULL),
(3765, 51, 'Шацк', NULL, NULL, NULL),
(3766, 51, 'Шилово', NULL, NULL, NULL),
(3767, 52, 'Алексеевка (Самарская обл.)', NULL, NULL, NULL),
(3768, 52, 'Безенчук', NULL, NULL, NULL),
(3769, 52, 'Богатое', NULL, NULL, NULL),
(3770, 52, 'Богатырь', NULL, NULL, NULL),
(3771, 52, 'Большая Глушица', NULL, NULL, NULL),
(3772, 52, 'Большая Глущица (Самарск.)', NULL, NULL, NULL),
(3773, 52, 'Большая Черниговка', NULL, NULL, NULL),
(3774, 52, 'Борское', NULL, NULL, NULL),
(3775, 52, 'Волжский (Самарская обл.)', NULL, NULL, NULL),
(3776, 52, 'Жигулевск', NULL, NULL, NULL),
(3777, 52, 'Зольное', NULL, NULL, NULL),
(3778, 52, 'Исаклы', NULL, NULL, NULL),
(3779, 52, 'Камышла', NULL, NULL, NULL),
(3780, 52, 'Кинель', NULL, NULL, NULL),
(3781, 52, 'Кинель-Черкасы', NULL, NULL, NULL),
(3782, 52, 'Клявлино', NULL, NULL, NULL),
(3783, 52, 'Кошки', NULL, NULL, NULL),
(3784, 52, 'Красноармейское (Самарск.)', NULL, NULL, NULL),
(3785, 52, 'Красный Яр (Самарская обл.)', NULL, NULL, NULL),
(3786, 52, 'Куйбышев', NULL, NULL, NULL),
(3787, 52, 'Нефтегорск', NULL, NULL, NULL),
(3788, 52, 'Новокуйбышевск', NULL, NULL, NULL),
(3789, 52, 'Октябрьск', NULL, NULL, NULL),
(3790, 52, 'Отрадный', NULL, NULL, NULL),
(3791, 52, 'Пестравка', NULL, NULL, NULL),
(3792, 52, 'Похвистнево', NULL, NULL, NULL),
(3793, 52, 'Приволжье', NULL, NULL, NULL),
(3794, 52, 'Самара', NULL, NULL, NULL),
(3795, 52, 'Сергиевск', NULL, NULL, NULL),
(3796, 52, 'Сургут (Самарская обл.)', NULL, NULL, NULL),
(3797, 52, 'Сызрань', NULL, NULL, NULL),
(3798, 52, 'Тольятти', NULL, NULL, NULL),
(3799, 52, 'Хворостянка', NULL, NULL, NULL),
(3800, 52, 'Чапаевск', NULL, NULL, NULL),
(3801, 52, 'Челно-Вершины', NULL, NULL, NULL),
(3802, 52, 'Шентала', NULL, NULL, NULL),
(3803, 52, 'Шигоны', NULL, NULL, NULL),
(3804, 53, 'Александров Гай', NULL, NULL, NULL),
(3805, 53, 'Аркадак', NULL, NULL, NULL),
(3806, 53, 'Аткарск', NULL, NULL, NULL),
(3807, 53, 'Базарный Карабулак', NULL, NULL, NULL),
(3808, 53, 'Балаково', NULL, NULL, NULL),
(3809, 53, 'Балашов', NULL, NULL, NULL),
(3810, 53, 'Балтай', NULL, NULL, NULL),
(3811, 53, 'Возрождение', NULL, NULL, NULL),
(3812, 53, 'Вольск', NULL, NULL, NULL),
(3813, 53, 'Воскресенское (Саратовск.)', NULL, NULL, NULL),
(3814, 53, 'Горный', NULL, NULL, NULL),
(3815, 53, 'Дергачи', NULL, NULL, NULL),
(3816, 53, 'Духовницкое', NULL, NULL, NULL),
(3817, 53, 'Екатериновка', NULL, NULL, NULL),
(3818, 53, 'Ершов', NULL, NULL, NULL),
(3819, 53, 'Ивантеевка (Саратовская обл.)', NULL, NULL, NULL),
(3820, 53, 'Калининск', NULL, NULL, NULL),
(3821, 53, 'Каменский', NULL, NULL, NULL),
(3822, 53, 'Красноармейск (Саратовск.)', NULL, NULL, NULL),
(3823, 53, 'Красный Кут', NULL, NULL, NULL),
(3824, 53, 'Лысые Горы', NULL, NULL, NULL),
(3825, 53, 'Маркс', NULL, NULL, NULL),
(3826, 53, 'Мокроус', NULL, NULL, NULL),
(3827, 53, 'Новоузенск', NULL, NULL, NULL),
(3828, 53, 'Новые Бурасы', NULL, NULL, NULL),
(3829, 53, 'Озинки', NULL, NULL, NULL),
(3830, 53, 'Перелюб', NULL, NULL, NULL),
(3831, 53, 'Петровск', NULL, NULL, NULL),
(3832, 53, 'Питерка', NULL, NULL, NULL),
(3833, 53, 'Пугачев', NULL, NULL, NULL),
(3834, 53, 'Ровное', NULL, NULL, NULL),
(3835, 53, 'Романовка', NULL, NULL, NULL),
(3836, 53, 'Ртищево', NULL, NULL, NULL),
(3837, 53, 'Самойловка', NULL, NULL, NULL),
(3838, 53, 'Саратов', NULL, NULL, NULL),
(3839, 53, 'Степное (Саратовская обл.)', NULL, NULL, NULL),
(3840, 53, 'Татищево', NULL, NULL, NULL),
(3841, 53, 'Турки', NULL, NULL, NULL),
(3842, 53, 'Хвалынск', NULL, NULL, NULL),
(3843, 53, 'Энгельс', NULL, NULL, NULL),
(3844, 54, 'Абый', NULL, NULL, NULL),
(3845, 54, 'Айхал', NULL, NULL, NULL),
(3846, 54, 'Алдан', NULL, NULL, NULL),
(3847, 54, 'Амга', NULL, NULL, NULL),
(3848, 54, 'Батагай', NULL, NULL, NULL),
(3849, 54, 'Бердигестях', NULL, NULL, NULL),
(3850, 54, 'Беркакит', NULL, NULL, NULL),
(3851, 54, 'Бестях', NULL, NULL, NULL),
(3852, 54, 'Борогонцы', NULL, NULL, NULL),
(3853, 54, 'Верхневилюйск', NULL, NULL, NULL),
(3854, 54, 'Верхоянск', NULL, NULL, NULL),
(3855, 54, 'Вилюйск', NULL, NULL, NULL),
(3856, 54, 'Витим', NULL, NULL, NULL),
(3857, 54, 'Власово', NULL, NULL, NULL),
(3858, 54, 'Депутатский', NULL, NULL, NULL),
(3859, 54, 'Жиганск', NULL, NULL, NULL),
(3860, 54, 'Зырянка', NULL, NULL, NULL),
(3861, 54, 'Кангалассы', NULL, NULL, NULL),
(3862, 54, 'Ленск', NULL, NULL, NULL),
(3863, 54, 'Майя', NULL, NULL, NULL),
(3864, 54, 'Мирный (Саха)', NULL, NULL, NULL),
(3865, 54, 'Нерюнгри', NULL, NULL, NULL),
(3866, 54, 'Нижний Куранах', NULL, NULL, NULL),
(3867, 54, 'Нюрба', NULL, NULL, NULL),
(3868, 54, 'Олекминск', NULL, NULL, NULL),
(3869, 54, 'Покровск', NULL, NULL, NULL),
(3870, 54, 'Сангар', NULL, NULL, NULL),
(3871, 54, 'Саскылах', NULL, NULL, NULL),
(3872, 54, 'Солнечный', NULL, NULL, NULL),
(3873, 54, 'Среднеколымск', NULL, NULL, NULL),
(3874, 54, 'Сунтар', NULL, NULL, NULL),
(3875, 54, 'Тикси', NULL, NULL, NULL),
(3876, 54, 'Удачный', NULL, NULL, NULL),
(3877, 54, 'Усть-Мая', NULL, NULL, NULL),
(3878, 54, 'Усть-Нера', NULL, NULL, NULL),
(3879, 54, 'Хандыга', NULL, NULL, NULL),
(3880, 54, 'Хонуу', NULL, NULL, NULL),
(3881, 54, 'Чернышевский', NULL, NULL, NULL),
(3882, 54, 'Черский', NULL, NULL, NULL),
(3883, 54, 'Чокурдах', NULL, NULL, NULL),
(3884, 54, 'Чульман', NULL, NULL, NULL),
(3885, 54, 'Чурапча', NULL, NULL, NULL),
(3886, 54, 'Якутск', NULL, NULL, NULL),
(3887, 55, 'Александровск-Сахалинский', NULL, NULL, NULL),
(3888, 55, 'Анбэцу', NULL, NULL, NULL),
(3889, 55, 'Анива', NULL, NULL, NULL),
(3890, 55, 'Бошняково', NULL, NULL, NULL),
(3891, 55, 'Быков', NULL, NULL, NULL),
(3892, 55, 'Вахрушев', NULL, NULL, NULL),
(3893, 55, 'Взморье', NULL, NULL, NULL),
(3894, 55, 'Гастелло', NULL, NULL, NULL),
(3895, 55, 'Горнозаводск (Сахалин)', NULL, NULL, NULL),
(3896, 55, 'Долинск', NULL, NULL, NULL),
(3897, 55, 'Ильинский (Сахалин)', NULL, NULL, NULL),
(3898, 55, 'Катангли', NULL, NULL, NULL),
(3899, 55, 'Корсаков', NULL, NULL, NULL),
(3900, 55, 'Курильск', NULL, NULL, NULL),
(3901, 55, 'Макаров', NULL, NULL, NULL),
(3902, 55, 'Невельск', NULL, NULL, NULL),
(3903, 55, 'Ноглики', NULL, NULL, NULL),
(3904, 55, 'Оха', NULL, NULL, NULL),
(3905, 55, 'Поронайск', NULL, NULL, NULL),
(3906, 55, 'Северо-Курильск', NULL, NULL, NULL),
(3907, 55, 'Смирных', NULL, NULL, NULL),
(3908, 55, 'Томари', NULL, NULL, NULL),
(3909, 55, 'Тымовское', NULL, NULL, NULL),
(3910, 55, 'Углегорск', NULL, NULL, NULL),
(3911, 55, 'Холмск', NULL, NULL, NULL),
(3912, 55, 'Шахтерск', NULL, NULL, NULL),
(3913, 55, 'Южно-Курильск', NULL, NULL, NULL),
(3914, 55, 'Южно-Сахалинск', NULL, NULL, NULL),
(3915, 56, 'Алапаевск', NULL, NULL, NULL),
(3916, 56, 'Алтынай', NULL, NULL, NULL),
(3917, 56, 'Арамиль', NULL, NULL, NULL),
(3918, 56, 'Артемовский (Свердловская обл.)', NULL, NULL, NULL),
(3919, 56, 'Арти', NULL, NULL, NULL),
(3920, 56, 'Асбест', NULL, NULL, NULL),
(3921, 56, 'Ачит', NULL, NULL, NULL),
(3922, 56, 'Байкалово', NULL, NULL, NULL),
(3923, 56, 'Басьяновский', NULL, NULL, NULL),
(3924, 56, 'Белоярский (Свердловская обл.)', NULL, NULL, NULL),
(3925, 56, 'Березовский (Свердловская обл.)', NULL, NULL, NULL),
(3926, 56, 'Бисерть', NULL, NULL, NULL),
(3927, 56, 'Богданович', NULL, NULL, NULL),
(3928, 56, 'Буланаш', NULL, NULL, NULL),
(3929, 56, 'Верхний Тагил', NULL, NULL, NULL),
(3930, 56, 'Верхняя Пышма', NULL, NULL, NULL),
(3931, 56, 'Верхняя Салда', NULL, NULL, NULL),
(3932, 56, 'Верхняя Синячиха', NULL, NULL, NULL),
(3933, 56, 'Верхняя Сысерть', NULL, NULL, NULL),
(3934, 56, 'Верхняя Тура', NULL, NULL, NULL),
(3935, 56, 'Верхотурье', NULL, NULL, NULL),
(3936, 56, 'Висим', NULL, NULL, NULL),
(3937, 56, 'Волчанск', NULL, NULL, NULL),
(3938, 56, 'Гари', NULL, NULL, NULL),
(3939, 56, 'Дегтярск', NULL, NULL, NULL),
(3940, 56, 'Екатеринбург', NULL, NULL, NULL),
(3941, 56, 'Ертарский', NULL, NULL, NULL),
(3942, 56, 'Заводоуспенское', NULL, NULL, NULL),
(3943, 56, 'Заречный', NULL, NULL, NULL),
(3944, 56, 'Ивдель', NULL, NULL, NULL),
(3945, 56, 'Изумруд', NULL, NULL, NULL),
(3946, 56, 'Ирбит', NULL, NULL, NULL),
(3947, 56, 'Ис', NULL, NULL, NULL),
(3948, 56, 'Каменск-Уральский', NULL, NULL, NULL),
(3949, 56, 'Камышлов', NULL, NULL, NULL),
(3950, 56, 'Карпинск', NULL, NULL, NULL),
(3951, 56, 'Качканар', NULL, NULL, NULL),
(3952, 56, 'Кировград', NULL, NULL, NULL),
(3953, 56, 'Краснотурьинск', NULL, NULL, NULL),
(3954, 56, 'Красноуральск', NULL, NULL, NULL),
(3955, 56, 'Красноуфимск', NULL, NULL, NULL),
(3956, 56, 'Кушва', NULL, NULL, NULL),
(3957, 56, 'Лесной', NULL, NULL, NULL),
(3958, 56, 'Михайловск', NULL, NULL, NULL),
(3959, 56, 'Невьянск', NULL, NULL, NULL),
(3960, 56, 'Нижние Серги', NULL, NULL, NULL),
(3961, 56, 'Нижний Тагил', NULL, NULL, NULL),
(3962, 56, 'Нижняя Салда', NULL, NULL, NULL),
(3963, 56, 'Нижняя Тура', NULL, NULL, NULL),
(3964, 56, 'Новая Ляля', NULL, NULL, NULL),
(3965, 56, 'Новоуральск', NULL, NULL, NULL),
(3966, 56, 'Новоуральск (Свердловская обл.)', NULL, NULL, NULL),
(3967, 56, 'Оус', NULL, NULL, NULL),
(3968, 56, 'Первоуральск', NULL, NULL, NULL),
(3969, 56, 'Полевской', NULL, NULL, NULL),
(3970, 56, 'Пышма', NULL, NULL, NULL),
(3971, 56, 'Ревда (Свердловская обл.)', NULL, NULL, NULL),
(3972, 56, 'Реж', NULL, NULL, NULL),
(3973, 56, 'Рефтинск', NULL, NULL, NULL),
(3974, 56, 'Свердловск', NULL, NULL, NULL),
(3975, 56, 'Североуральск', NULL, NULL, NULL),
(3976, 56, 'Серов', NULL, NULL, NULL),
(3977, 56, 'Сосьва', NULL, NULL, NULL),
(3978, 56, 'Среднеуральск', NULL, NULL, NULL),
(3979, 56, 'Сухой Лог', NULL, NULL, NULL),
(3980, 56, 'Сысерть', NULL, NULL, NULL),
(3981, 56, 'Таборы', NULL, NULL, NULL),
(3982, 56, 'Тавда', NULL, NULL, NULL),
(3983, 56, 'Талица', NULL, NULL, NULL),
(3984, 56, 'Тугулым', NULL, NULL, NULL),
(3985, 56, 'Туринск', NULL, NULL, NULL),
(3986, 56, 'Туринская Слобода', NULL, NULL, NULL),
(3987, 57, 'Алагир', NULL, NULL, NULL),
(3988, 57, 'Ардон', NULL, NULL, NULL),
(3989, 57, 'Беслан', NULL, NULL, NULL),
(3990, 57, 'Бурон', NULL, NULL, NULL),
(3991, 57, 'Владикавказ', NULL, NULL, NULL),
(3992, 57, 'Дигора', NULL, NULL, NULL),
(3993, 57, 'Моздок', NULL, NULL, NULL),
(3994, 57, 'Орджоникидзе', NULL, NULL, NULL),
(3995, 57, 'Чикола', NULL, NULL, NULL),
(3996, 58, 'Велиж', NULL, NULL, NULL),
(3997, 58, 'Верхнеднепровский', NULL, NULL, NULL),
(3998, 58, 'Ворга', NULL, NULL, NULL),
(3999, 58, 'Вязьма', NULL, NULL, NULL),
(4000, 58, 'Гагарин', NULL, NULL, NULL),
(4001, 58, 'Глинка', NULL, NULL, NULL),
(4002, 58, 'Голынки', NULL, NULL, NULL),
(4003, 58, 'Демидов', NULL, NULL, NULL),
(4004, 58, 'Десногорск', NULL, NULL, NULL),
(4005, 58, 'Дорогобуж', NULL, NULL, NULL),
(4006, 58, 'Духовщина', NULL, NULL, NULL),
(4007, 58, 'Ельня', NULL, NULL, NULL),
(4008, 58, 'Ершичи', NULL, NULL, NULL),
(4009, 58, 'Издешково', NULL, NULL, NULL),
(4010, 58, 'Кардымово', NULL, NULL, NULL),
(4011, 58, 'Красный', NULL, NULL, NULL),
(4012, 58, 'Монастырщина', NULL, NULL, NULL),
(4013, 58, 'Новодугино', NULL, NULL, NULL),
(4014, 58, 'Починок', NULL, NULL, NULL),
(4015, 58, 'Рославль', NULL, NULL, NULL),
(4016, 58, 'Рудня', NULL, NULL, NULL),
(4017, 58, 'Сафоново', NULL, NULL, NULL),
(4018, 58, 'Смоленск', NULL, NULL, NULL),
(4019, 58, 'Сычевка', NULL, NULL, NULL),
(4020, 58, 'Угра', NULL, NULL, NULL),
(4021, 58, 'Хиславичи', NULL, NULL, NULL),
(4022, 58, 'Холм-Жирковский', NULL, NULL, NULL),
(4023, 58, 'Шумячи', NULL, NULL, NULL),
(4024, 58, 'Ярцево', NULL, NULL, NULL),
(4025, 59, 'Александровское (Ставрополь.)', NULL, NULL, NULL),
(4026, 59, 'Арзгир', NULL, NULL, NULL),
(4027, 59, 'Благодарный', NULL, NULL, NULL),
(4028, 59, 'Буденновск', NULL, NULL, NULL),
(4029, 59, 'Георгиевск', NULL, NULL, NULL),
(4030, 59, 'Дивное (Ставропольский край)', NULL, NULL, NULL),
(4031, 59, 'Домбай', NULL, NULL, NULL),
(4032, 59, 'Донское', NULL, NULL, NULL),
(4033, 59, 'Ессентуки', NULL, NULL, NULL),
(4034, 59, 'Железноводск(Ставропольский)', NULL, NULL, NULL),
(4035, 59, 'Зеленокумск', NULL, NULL, NULL),
(4036, 59, 'Изобильный', NULL, NULL, NULL),
(4037, 59, 'Иноземцево', NULL, NULL, NULL),
(4038, 59, 'Ипатово', NULL, NULL, NULL),
(4039, 59, 'Карачаевск', NULL, NULL, NULL),
(4040, 59, 'Кисловодск', NULL, NULL, NULL),
(4041, 59, 'Кочубеевское', NULL, NULL, NULL),
(4042, 59, 'Красногвардейское (Ставрополь.)', NULL, NULL, NULL),
(4043, 59, 'Курсавка', NULL, NULL, NULL),
(4044, 59, 'Левокумское', NULL, NULL, NULL),
(4045, 59, 'Лермонтов', NULL, NULL, NULL),
(4046, 59, 'Минеральные Воды', NULL, NULL, NULL),
(4047, 59, 'Михайловск', NULL, NULL, NULL),
(4048, 59, 'Невинномысск', NULL, NULL, NULL),
(4049, 59, 'Нефтекумск', NULL, NULL, NULL),
(4050, 59, 'Новоалександровск', NULL, NULL, NULL),
(4051, 59, 'Новоалександровская', NULL, NULL, NULL),
(4052, 59, 'Новопавловск', NULL, NULL, NULL),
(4053, 59, 'Новоселицкое', NULL, NULL, NULL),
(4054, 59, 'Преградная', NULL, NULL, NULL),
(4055, 59, 'Пятигорск', NULL, NULL, NULL),
(4056, 59, 'Светлоград', NULL, NULL, NULL),
(4057, 59, 'Солнечнодольск', NULL, NULL, NULL),
(4058, 59, 'Ставрополь', NULL, NULL, NULL),
(4059, 59, 'Степное (Ставропольский край)', NULL, NULL, NULL),
(4060, 59, 'Теберда', NULL, NULL, NULL),
(4061, 59, 'Усть-Джегута', NULL, NULL, NULL),
(4062, 59, 'Хабез', NULL, NULL, NULL),
(4063, 59, 'Черкесск', NULL, NULL, NULL),
(4064, 60, 'Бондари', NULL, NULL, NULL),
(4065, 60, 'Гавриловка Вторая', NULL, NULL, NULL),
(4066, 60, 'Жердевка', NULL, NULL, NULL),
(4067, 60, 'Знаменка', NULL, NULL, NULL),
(4068, 60, 'Инжавино', NULL, NULL, NULL),
(4069, 60, 'Кирсанов', NULL, NULL, NULL),
(4070, 60, 'Котовск', NULL, NULL, NULL),
(4071, 60, 'Мичуринск', NULL, NULL, NULL),
(4072, 60, 'Мордово', NULL, NULL, NULL),
(4073, 60, 'Моршанск', NULL, NULL, NULL),
(4074, 60, 'Мучкапский', NULL, NULL, NULL),
(4075, 60, 'Первомайский (Тамбовская обл.)', NULL, NULL, NULL),
(4076, 60, 'Петровское', NULL, NULL, NULL),
(4077, 60, 'Пичаево', NULL, NULL, NULL),
(4078, 60, 'Рассказово', NULL, NULL, NULL),
(4079, 60, 'Ржакса', NULL, NULL, NULL),
(4080, 60, 'Сосновка', NULL, NULL, NULL),
(4081, 60, 'Староюрьево', NULL, NULL, NULL),
(4082, 60, 'Тамбов', NULL, NULL, NULL),
(4083, 60, 'Токаревка', NULL, NULL, NULL),
(4084, 60, 'Уварово', NULL, NULL, NULL),
(4085, 60, 'Умет', NULL, NULL, NULL),
(4086, 61, 'Агрыз', NULL, NULL, NULL),
(4087, 61, 'Азнакаево', NULL, NULL, NULL),
(4088, 61, 'Аксубаево', NULL, NULL, NULL),
(4089, 61, 'Актаныш', NULL, NULL, NULL),
(4090, 61, 'Актюбинский', NULL, NULL, NULL),
(4091, 61, 'Алексеевское', NULL, NULL, NULL),
(4092, 61, 'Альметьевск', NULL, NULL, NULL),
(4093, 61, 'Апастово', NULL, NULL, NULL),
(4094, 61, 'Арск', NULL, NULL, NULL),
(4095, 61, 'Бавлы', NULL, NULL, NULL),
(4096, 61, 'Базарные Матаки', NULL, NULL, NULL),
(4097, 61, 'Балтаси', NULL, NULL, NULL),
(4098, 61, 'Богатые Сабы', NULL, NULL, NULL),
(4099, 61, 'Брежнев', NULL, NULL, NULL),
(4100, 61, 'Бугульма', NULL, NULL, NULL),
(4101, 61, 'Буинск', NULL, NULL, NULL),
(4102, 61, 'Васильево', NULL, NULL, NULL),
(4103, 61, 'Верхний Услон', NULL, NULL, NULL),
(4104, 61, 'Высокая Гора', NULL, NULL, NULL),
(4105, 61, 'Дербешкинский', NULL, NULL, NULL),
(4106, 61, 'Елабуга', NULL, NULL, NULL),
(4107, 61, 'Заинск', NULL, NULL, NULL),
(4108, 61, 'Зеленодольск', NULL, NULL, NULL),
(4109, 61, 'Казань', NULL, NULL, NULL),
(4110, 61, 'Камское Устье', NULL, NULL, NULL),
(4111, 61, 'Карабаш (Татарстан)', NULL, NULL, NULL),
(4112, 61, 'Куйбышев (Татарстан)', NULL, NULL, NULL),
(4113, 61, 'Кукмод', NULL, NULL, NULL),
(4114, 61, 'Кукмор', NULL, NULL, NULL),
(4115, 61, 'Лаишево', NULL, NULL, NULL),
(4116, 61, 'Лениногорск', NULL, NULL, NULL),
(4117, 61, 'Мамадыш', NULL, NULL, NULL),
(4118, 61, 'Менделеевск', NULL, NULL, NULL),
(4119, 61, 'Мензелинск', NULL, NULL, NULL),
(4120, 61, 'Муслюмово', NULL, NULL, NULL),
(4121, 61, 'Набережные Челны', NULL, NULL, NULL),
(4122, 61, 'Нижнекамск', NULL, NULL, NULL),
(4123, 61, 'Новошешминск', NULL, NULL, NULL),
(4124, 61, 'Нурлат', NULL, NULL, NULL),
(4125, 61, 'Пестрецы', NULL, NULL, NULL),
(4126, 61, 'Рыбная Слобода', NULL, NULL, NULL),
(4127, 61, 'Сарманово', NULL, NULL, NULL),
(4128, 61, 'Старое Дрожжаное', NULL, NULL, NULL),
(4129, 61, 'Тетюши', NULL, NULL, NULL),
(4130, 61, 'Черемшан', NULL, NULL, NULL),
(4131, 61, 'Чистополь', NULL, NULL, NULL),
(4132, 62, 'Андреаполь', NULL, NULL, NULL),
(4133, 62, 'Бежецк', NULL, NULL, NULL),
(4134, 62, 'Белый', NULL, NULL, NULL),
(4135, 62, 'Белый Городок', NULL, NULL, NULL),
(4136, 62, 'Березайка', NULL, NULL, NULL),
(4137, 62, 'Бологое', NULL, NULL, NULL),
(4138, 62, 'Васильевский Мох', NULL, NULL, NULL),
(4139, 62, 'Весьегонск', NULL, NULL, NULL),
(4140, 62, 'Выползово', NULL, NULL, NULL),
(4141, 62, 'Вышний Волочек', NULL, NULL, NULL),
(4142, 62, 'Жарковский', NULL, NULL, NULL),
(4143, 62, 'Западная Двина', NULL, NULL, NULL),
(4144, 62, 'Зубцов', NULL, NULL, NULL),
(4145, 62, 'Изоплит', NULL, NULL, NULL),
(4146, 62, 'Калашниково', NULL, NULL, NULL),
(4147, 62, 'Калинин', NULL, NULL, NULL),
(4148, 62, 'Калязин', NULL, NULL, NULL),
(4149, 62, 'Кашин', NULL, NULL, NULL),
(4150, 62, 'Кесова Гора', NULL, NULL, NULL),
(4151, 62, 'Кимры', NULL, NULL, NULL),
(4152, 62, 'Конаково', NULL, NULL, NULL),
(4153, 62, 'Красный Холм', NULL, NULL, NULL),
(4154, 62, 'Кувшиново', NULL, NULL, NULL),
(4155, 62, 'Лесное', NULL, NULL, NULL),
(4156, 62, 'Лихославль', NULL, NULL, NULL),
(4157, 62, 'Максатиха', NULL, NULL, NULL),
(4158, 62, 'Молоково', NULL, NULL, NULL),
(4159, 62, 'Нелидово', NULL, NULL, NULL),
(4160, 62, 'Оленино', NULL, NULL, NULL),
(4161, 62, 'Осташков', NULL, NULL, NULL),
(4162, 62, 'Пено', NULL, NULL, NULL),
(4163, 62, 'Рамешки', NULL, NULL, NULL),
(4164, 62, 'Ржев', NULL, NULL, NULL),
(4165, 62, 'Сандово', NULL, NULL, NULL),
(4166, 62, 'Селижарово', NULL, NULL, NULL),
(4167, 62, 'Сонково', NULL, NULL, NULL),
(4168, 62, 'Спирово', NULL, NULL, NULL),
(4169, 62, 'Старица', NULL, NULL, NULL),
(4170, 62, 'Тверь', NULL, NULL, NULL),
(4171, 62, 'Торжок', NULL, NULL, NULL),
(4172, 62, 'Торопец', NULL, NULL, NULL),
(4173, 62, 'Удомля', NULL, NULL, NULL),
(4174, 62, 'Фирово', NULL, NULL, NULL),
(4175, 63, 'Александровское (Томская обл.)', NULL, NULL, NULL),
(4176, 63, 'Асино', NULL, NULL, NULL),
(4177, 63, 'Бакчар', NULL, NULL, NULL),
(4178, 63, 'Батурино', NULL, NULL, NULL),
(4179, 63, 'Белый Яр', NULL, NULL, NULL),
(4180, 63, 'Зырянское', NULL, NULL, NULL),
(4181, 63, 'Итатка', NULL, NULL, NULL),
(4182, 63, 'Каргасок', NULL, NULL, NULL),
(4183, 63, 'Катайга', NULL, NULL, NULL),
(4184, 63, 'Кожевниково', NULL, NULL, NULL),
(4185, 63, 'Колпашево', NULL, NULL, NULL),
(4186, 63, 'Кривошеино', NULL, NULL, NULL),
(4187, 63, 'Мельниково', NULL, NULL, NULL),
(4188, 63, 'Молчаново', NULL, NULL, NULL),
(4189, 63, 'Парабель', NULL, NULL, NULL),
(4190, 63, 'Первомайское', NULL, NULL, NULL),
(4191, 63, 'Подгорное', NULL, NULL, NULL),
(4192, 63, 'Северск', NULL, NULL, NULL),
(4193, 63, 'Стрежевой', NULL, NULL, NULL),
(4194, 63, 'Томск', NULL, NULL, NULL),
(4195, 63, 'Тымск', NULL, NULL, NULL),
(4196, 64, 'Ак-Довурак', NULL, NULL, NULL),
(4197, 64, 'Бай Хаак', NULL, NULL, NULL),
(4198, 64, 'Кызыл', NULL, NULL, NULL),
(4199, 64, 'Самагалтай', NULL, NULL, NULL),
(4200, 64, 'Сарыг-Сеп', NULL, NULL, NULL),
(4201, 64, 'Суть-Холь', NULL, NULL, NULL),
(4202, 64, 'Тоора-Хем', NULL, NULL, NULL),
(4203, 64, 'Туран', NULL, NULL, NULL),
(4204, 64, 'Тээли', NULL, NULL, NULL),
(4205, 64, 'Хову-Аксы', NULL, NULL, NULL),
(4206, 64, 'Чадан', NULL, NULL, NULL),
(4207, 64, 'Шагонар', NULL, NULL, NULL),
(4208, 64, 'Эрзин', NULL, NULL, NULL),
(4209, 65, 'Агеево', NULL, NULL, NULL),
(4210, 65, 'Алексин', NULL, NULL, NULL),
(4211, 65, 'Арсеньево', NULL, NULL, NULL),
(4212, 65, 'Барсуки', NULL, NULL, NULL),
(4213, 65, 'Белев', NULL, NULL, NULL),
(4214, 65, 'Богородицк', NULL, NULL, NULL),
(4215, 65, 'Болохово', NULL, NULL, NULL),
(4216, 65, 'Велегож', NULL, NULL, NULL),
(4217, 65, 'Венев', NULL, NULL, NULL),
(4218, 65, 'Волово', NULL, NULL, NULL),
(4219, 65, 'Горелки', NULL, NULL, NULL),
(4220, 65, 'Донской', NULL, NULL, NULL),
(4221, 65, 'Дубна (Тульская обл.)', NULL, NULL, NULL),
(4222, 65, 'Епифань', NULL, NULL, NULL),
(4223, 65, 'Ефремов', NULL, NULL, NULL),
(4224, 65, 'Заокский', NULL, NULL, NULL),
(4225, 65, 'Казановка', NULL, NULL, NULL),
(4226, 65, 'Кимовск', NULL, NULL, NULL),
(4227, 65, 'Киреевск', NULL, NULL, NULL),
(4228, 65, 'Куркино', NULL, NULL, NULL),
(4229, 65, 'Ленинский', NULL, NULL, NULL),
(4230, 65, 'Лянтор', NULL, NULL, NULL),
(4231, 65, 'Новомосковск', NULL, NULL, NULL),
(4232, 65, 'Одоев', NULL, NULL, NULL),
(4233, 65, 'Плавск', NULL, NULL, NULL),
(4234, 65, 'Советск (Тульская обл.)', NULL, NULL, NULL),
(4235, 65, 'Суворов', NULL, NULL, NULL),
(4236, 65, 'Тула', NULL, NULL, NULL),
(4237, 65, 'Узловая', NULL, NULL, NULL),
(4238, 65, 'Щекино', NULL, NULL, NULL),
(4239, 65, 'Ясногорск', NULL, NULL, NULL),
(4240, 66, 'Абатский', NULL, NULL, NULL),
(4241, 66, 'Аган', NULL, NULL, NULL),
(4242, 66, 'Аксарка', NULL, NULL, NULL),
(4243, 66, 'Армизонское', NULL, NULL, NULL),
(4244, 66, 'Аромашево', NULL, NULL, NULL),
(4245, 66, 'Белоярский (Тюменская обл.)', NULL, NULL, NULL),
(4246, 66, 'Бердюжье', NULL, NULL, NULL),
(4247, 66, 'Березово', NULL, NULL, NULL),
(4248, 66, 'Большое Сорокино', NULL, NULL, NULL),
(4249, 66, 'Вагай', NULL, NULL, NULL),
(4250, 66, 'Викулово', NULL, NULL, NULL),
(4251, 66, 'Винзили', NULL, NULL, NULL),
(4252, 66, 'Голышманово', NULL, NULL, NULL),
(4253, 66, 'Губкинский (Тюменская обл.)', NULL, NULL, NULL),
(4254, 66, 'Заводопетровский', NULL, NULL, NULL),
(4255, 66, 'Заводоуковск', NULL, NULL, NULL),
(4256, 66, 'Игрим', NULL, NULL, NULL),
(4257, 66, 'Излучинск', NULL, NULL, NULL),
(4258, 66, 'Исетское', NULL, NULL, NULL),
(4259, 66, 'Ишим', NULL, NULL, NULL),
(4260, 66, 'Казанское', NULL, NULL, NULL),
(4261, 66, 'Казым-Мыс', NULL, NULL, NULL),
(4262, 66, 'Когалым (Тюменская обл.)', NULL, NULL, NULL),
(4263, 66, 'Кондинское', NULL, NULL, NULL),
(4264, 66, 'Красноселькуп', NULL, NULL, NULL),
(4265, 66, 'Лабытнанги', NULL, NULL, NULL),
(4266, 66, 'Лангепас', NULL, NULL, NULL),
(4267, 66, 'Ларьяк', NULL, NULL, NULL),
(4268, 66, 'Лянторский', NULL, NULL, NULL),
(4269, 66, 'Мегион', NULL, NULL, NULL),
(4270, 66, 'Междуреченский', NULL, NULL, NULL),
(4271, 66, 'Мужи', NULL, NULL, NULL),
(4272, 66, 'Муравленко (Тюменская обл.)', NULL, NULL, NULL),
(4273, 66, 'Надым (Тюменская обл.)', NULL, NULL, NULL),
(4274, 66, 'Находка (Тюменская обл.)', NULL, NULL, NULL),
(4275, 66, 'Нефтеюганск', NULL, NULL, NULL),
(4276, 66, 'Нижневартовск', NULL, NULL, NULL),
(4277, 66, 'Нижняя Тавда', NULL, NULL, NULL),
(4278, 66, 'Новоаганск', NULL, NULL, NULL),
(4279, 66, 'Новый Уренгой (Тюменская обл.)', NULL, NULL, NULL),
(4280, 66, 'Ноябрьск (Тюменская обл.)', NULL, NULL, NULL),
(4281, 66, 'Нягань', NULL, NULL, NULL),
(4282, 66, 'Октябрьское (Тюменская обл.)', NULL, NULL, NULL),
(4283, 66, 'Омутинский', NULL, NULL, NULL),
(4284, 66, 'Покачи (Тюменская обл.)', NULL, NULL, NULL),
(4285, 66, 'Приобье', NULL, NULL, NULL),
(4286, 66, 'Пыть-Ях', NULL, NULL, NULL),
(4287, 66, 'Радужный (Ханты-Мансийский АО)', NULL, NULL, NULL),
(4288, 66, 'Салехард', NULL, NULL, NULL),
(4289, 66, 'Сладково', NULL, NULL, NULL),
(4290, 66, 'Советский (Тюменская обл.)', NULL, NULL, NULL),
(4291, 66, 'Сургут', NULL, NULL, NULL),
(4292, 66, 'Тазовский', NULL, NULL, NULL),
(4293, 66, 'Тобольск', NULL, NULL, NULL),
(4294, 66, 'Тюмень', NULL, NULL, NULL),
(4295, 66, 'Уват', NULL, NULL, NULL),
(4296, 66, 'Унъюган', NULL, NULL, NULL),
(4297, 66, 'Упорово', NULL, NULL, NULL),
(4298, 66, 'Урай', NULL, NULL, NULL),
(4299, 66, 'Ханты-Мансийск', NULL, NULL, NULL),
(4300, 66, 'Югорск', NULL, NULL, NULL),
(4301, 66, 'Юрибей', NULL, NULL, NULL),
(4302, 66, 'Ялуторовск', NULL, NULL, NULL),
(4303, 66, 'Яр-Сале', NULL, NULL, NULL),
(4304, 66, 'Ярково', NULL, NULL, NULL),
(4305, 67, 'Алнаши', NULL, NULL, NULL),
(4306, 67, 'Балезино', NULL, NULL, NULL),
(4307, 67, 'Вавож', NULL, NULL, NULL),
(4308, 67, 'Воткинск', NULL, NULL, NULL),
(4309, 67, 'Глазов', NULL, NULL, NULL),
(4310, 67, 'Грахово', NULL, NULL, NULL),
(4311, 67, 'Дебесы', NULL, NULL, NULL),
(4312, 67, 'Завьялово', NULL, NULL, NULL),
(4313, 67, 'Игра', NULL, NULL, NULL),
(4314, 67, 'Ижевск', NULL, NULL, NULL),
(4315, 67, 'Кама', NULL, NULL, NULL),
(4316, 67, 'Камбарка', NULL, NULL, NULL),
(4317, 67, 'Каракулино', NULL, NULL, NULL),
(4318, 67, 'Кез', NULL, NULL, NULL),
(4319, 67, 'Кизнер', NULL, NULL, NULL),
(4320, 67, 'Киясово', NULL, NULL, NULL),
(4321, 67, 'Красногорское (Удмуртия)', NULL, NULL, NULL),
(4322, 67, 'Можга', NULL, NULL, NULL),
(4323, 67, 'Сарапул', NULL, NULL, NULL),
(4324, 67, 'Селты', NULL, NULL, NULL),
(4325, 67, 'Сюмси', NULL, NULL, NULL),
(4326, 67, 'Ува', NULL, NULL, NULL),
(4327, 67, 'Устинов', NULL, NULL, NULL),
(4328, 67, 'Шаркан', NULL, NULL, NULL),
(4329, 67, 'Юкаменское', NULL, NULL, NULL),
(4330, 67, 'Якшур-Бодья', NULL, NULL, NULL),
(4331, 67, 'Яр', NULL, NULL, NULL),
(4332, 68, 'Базарный Сызган', NULL, NULL, NULL),
(4333, 68, 'Барыш', NULL, NULL, NULL),
(4334, 68, 'Большое Нагаткино', NULL, NULL, NULL),
(4335, 68, 'Вешкайма', NULL, NULL, NULL),
(4336, 68, 'Глотовка', NULL, NULL, NULL),
(4337, 68, 'Димитровград', NULL, NULL, NULL),
(4338, 68, 'Игнатовка', NULL, NULL, NULL),
(4339, 68, 'Измайлово', NULL, NULL, NULL),
(4340, 68, 'Инза', NULL, NULL, NULL),
(4341, 68, 'Ишеевка', NULL, NULL, NULL),
(4342, 68, 'Канадей', NULL, NULL, NULL),
(4343, 68, 'Карсун', NULL, NULL, NULL),
(4344, 68, 'Кузоватово', NULL, NULL, NULL),
(4345, 68, 'Майна', NULL, NULL, NULL),
(4346, 68, 'Новая Малыкла', NULL, NULL, NULL),
(4347, 68, 'Новоспасское', NULL, NULL, NULL),
(4348, 68, 'Новоульяновск', NULL, NULL, NULL),
(4349, 68, 'Павловка', NULL, NULL, NULL),
(4350, 68, 'Радищево', NULL, NULL, NULL),
(4351, 68, 'Сенгилей', NULL, NULL, NULL),
(4352, 68, 'Старая Кулатка', NULL, NULL, NULL),
(4353, 68, 'Старая Майна', NULL, NULL, NULL),
(4354, 68, 'Сурское', NULL, NULL, NULL),
(4355, 68, 'Тереньга', NULL, NULL, NULL),
(4356, 68, 'Ульяновск', NULL, NULL, NULL),
(4357, 68, 'Чердаклы', NULL, NULL, NULL),
(4358, 69, 'Аксай (Уральская обл.)', NULL, NULL, NULL),
(4359, 69, 'Дарьинское', NULL, NULL, NULL),
(4360, 69, 'Деркул', NULL, NULL, NULL),
(4361, 69, 'Джамбейты', NULL, NULL, NULL),
(4362, 69, 'Переметное', NULL, NULL, NULL),
(4363, 69, 'Уральск', NULL, NULL, NULL),
(4364, 69, 'Федоровка (Уральская обл.)', NULL, NULL, NULL),
(4365, 69, 'Фурманово', NULL, NULL, NULL),
(4366, 69, 'Чапаев', NULL, NULL, NULL),
(4367, 70, 'Амурск', NULL, NULL, NULL),
(4368, 70, 'Аян', NULL, NULL, NULL),
(4369, 70, 'Березовый', NULL, NULL, NULL),
(4370, 70, 'Бикин', NULL, NULL, NULL),
(4371, 70, 'Бира', NULL, NULL, NULL),
(4372, 70, 'Биракан', NULL, NULL, NULL),
(4373, 70, 'Богородское (Хабаровский край)', NULL, NULL, NULL),
(4374, 70, 'Ванино', NULL, NULL, NULL),
(4375, 70, 'Волочаевка Вторая', NULL, NULL, NULL),
(4376, 70, 'Высокогорный', NULL, NULL, NULL),
(4377, 70, 'Вяземский', NULL, NULL, NULL),
(4378, 70, 'Горный', NULL, NULL, NULL),
(4379, 70, 'Гурское', NULL, NULL, NULL),
(4380, 70, 'Дормидонтовка', NULL, NULL, NULL),
(4381, 70, 'Заветы Ильича', NULL, NULL, NULL),
(4382, 70, 'Известковый', NULL, NULL, NULL),
(4383, 70, 'Иннокентьевка', NULL, NULL, NULL),
(4384, 70, 'Комсомольск-на-Амуре', NULL, NULL, NULL),
(4385, 70, 'Ленинское', NULL, NULL, NULL),
(4386, 70, 'Нелькан', NULL, NULL, NULL),
(4387, 70, 'Николаевск-на-Амуре', NULL, NULL, NULL),
(4388, 70, 'Облучье', NULL, NULL, NULL),
(4389, 70, 'Охотск', NULL, NULL, NULL),
(4390, 70, 'Переяславка', NULL, NULL, NULL),
(4391, 70, 'Смидович', NULL, NULL, NULL),
(4392, 70, 'Советская Гавань', NULL, NULL, NULL),
(4393, 70, 'Софийск', NULL, NULL, NULL),
(4394, 70, 'Троицкое', NULL, NULL, NULL),
(4395, 70, 'Тугур', NULL, NULL, NULL),
(4396, 70, 'Хабаровск', NULL, NULL, NULL),
(4397, 70, 'Чегдомын', NULL, NULL, NULL),
(4398, 70, 'Чумикан', NULL, NULL, NULL),
(4399, 71, 'Абакан', NULL, NULL, NULL),
(4400, 71, 'Саяногорск', NULL, NULL, NULL),
(4401, 71, 'Черногорск', NULL, NULL, NULL),
(4402, 72, 'Агаповка', NULL, NULL, NULL),
(4403, 72, 'Аргаяш', NULL, NULL, NULL),
(4404, 72, 'Аша', NULL, NULL, NULL),
(4405, 72, 'Бакал', NULL, NULL, NULL),
(4406, 72, 'Бреды', NULL, NULL, NULL),
(4407, 72, 'Варна', NULL, NULL, NULL),
(4408, 72, 'Верхнеуральск', NULL, NULL, NULL),
(4409, 72, 'Верхний Уфалей', NULL, NULL, NULL),
(4410, 72, 'Еманжелинск', NULL, NULL, NULL),
(4411, 72, 'Златоуст', NULL, NULL, NULL),
(4412, 72, 'Карабаш', NULL, NULL, NULL),
(4413, 72, 'Карталы', NULL, NULL, NULL),
(4414, 72, 'Касли', NULL, NULL, NULL),
(4415, 72, 'Катав-Ивановск', NULL, NULL, NULL),
(4416, 72, 'Копейск', NULL, NULL, NULL),
(4417, 72, 'Коркино', NULL, NULL, NULL),
(4418, 72, 'Красногорский', NULL, NULL, NULL),
(4419, 72, 'Кунашак', NULL, NULL, NULL),
(4420, 72, 'Куса', NULL, NULL, NULL),
(4421, 72, 'Кыштым', NULL, NULL, NULL),
(4422, 72, 'Магнитогорск', NULL, NULL, NULL),
(4423, 72, 'Миасс', NULL, NULL, NULL),
(4424, 72, 'Миньяр', NULL, NULL, NULL),
(4425, 72, 'Озерск(Челябинская обл.)', NULL, NULL, NULL),
(4426, 72, 'Октябрьское (Челябинская обл.)', NULL, NULL, NULL),
(4427, 72, 'Пласт', NULL, NULL, NULL),
(4428, 72, 'Сатка', NULL, NULL, NULL),
(4429, 72, 'Сим', NULL, NULL, NULL),
(4430, 72, 'Снежинск (Челябинская обл.)', NULL, NULL, NULL),
(4431, 72, 'Трехгорный', NULL, NULL, NULL),
(4432, 72, 'Троицк', NULL, NULL, NULL),
(4433, 72, 'Увельский', NULL, NULL, NULL),
(4434, 72, 'Уйское', NULL, NULL, NULL),
(4435, 72, 'Усть-Катав', NULL, NULL, NULL),
(4436, 72, 'Фершампенуаз', NULL, NULL, NULL),
(4437, 72, 'Чебаркуль', NULL, NULL, NULL),
(4438, 72, 'Челябинск', NULL, NULL, NULL),
(4439, 72, 'Чесма', NULL, NULL, NULL),
(4440, 72, 'Южно-Уральск', NULL, NULL, NULL),
(4441, 72, 'Юрюзань', NULL, NULL, NULL),
(4442, 73, 'Аргун', NULL, NULL, NULL),
(4443, 73, 'Грозный', NULL, NULL, NULL),
(4444, 73, 'Гудермес', NULL, NULL, NULL),
(4445, 73, 'Знаменское', NULL, NULL, NULL),
(4446, 73, 'Малгобек', NULL, NULL, NULL),
(4447, 73, 'Назрань', NULL, NULL, NULL),
(4448, 73, 'Наурская', NULL, NULL, NULL),
(4449, 73, 'Ножай-Юрт', NULL, NULL, NULL),
(4450, 73, 'Орджоникидзевская', NULL, NULL, NULL),
(4451, 73, 'Советское (Чечено-Ингушетия)', NULL, NULL, NULL),
(4452, 73, 'Урус-Мартан', NULL, NULL, NULL),
(4453, 73, 'Шали', NULL, NULL, NULL),
(4454, 74, 'Агинское', NULL, NULL, NULL),
(4455, 74, 'Аксеново-Зиловское', NULL, NULL, NULL),
(4456, 74, 'Акша', NULL, NULL, NULL),
(4457, 74, 'Арбагар', NULL, NULL, NULL),
(4458, 74, 'Атамановка', NULL, NULL, NULL),
(4459, 74, 'Балей', NULL, NULL, NULL),
(4460, 74, 'Борзя', NULL, NULL, NULL),
(4461, 74, 'Букачача', NULL, NULL, NULL),
(4462, 74, 'Газимурский Завод', NULL, NULL, NULL),
(4463, 74, 'Давенда', NULL, NULL, NULL),
(4464, 74, 'Дарасун', NULL, NULL, NULL),
(4465, 74, 'Домна', NULL, NULL, NULL),
(4466, 74, 'Дровяная', NULL, NULL, NULL),
(4467, 74, 'Дульдурга', NULL, NULL, NULL),
(4468, 74, 'Забайкальск', NULL, NULL, NULL),
(4469, 74, 'Карымское', NULL, NULL, NULL),
(4470, 74, 'Ключевский', NULL, NULL, NULL),
(4471, 74, 'Кокуй', NULL, NULL, NULL),
(4472, 74, 'Краснокаменск', NULL, NULL, NULL),
(4473, 74, 'Красный Чикой', NULL, NULL, NULL),
(4474, 74, 'Кыра', NULL, NULL, NULL),
(4475, 74, 'Моготуй', NULL, NULL, NULL),
(4476, 74, 'Могоча', NULL, NULL, NULL),
(4477, 74, 'Нерчинск', NULL, NULL, NULL),
(4478, 74, 'Нерчинский Завод', NULL, NULL, NULL),
(4479, 74, 'Нижний Цасучей', NULL, NULL, NULL),
(4480, 74, 'Оловянная', NULL, NULL, NULL),
(4481, 74, 'Первомайский (Читинская обл.)', NULL, NULL, NULL),
(4482, 74, 'Петровск-Забайкальский', NULL, NULL, NULL),
(4483, 74, 'Приаргунск', NULL, NULL, NULL),
(4484, 74, 'Сретенск', NULL, NULL, NULL),
(4485, 74, 'Тупик', NULL, NULL, NULL),
(4486, 74, 'Улеты', NULL, NULL, NULL),
(4487, 74, 'Хилок', NULL, NULL, NULL),
(4488, 74, 'Чара', NULL, NULL, NULL),
(4489, 74, 'Чернышевск', NULL, NULL, NULL),
(4490, 74, 'Чита', NULL, NULL, NULL),
(4491, 74, 'Шелопугино', NULL, NULL, NULL),
(4492, 74, 'Шилка', NULL, NULL, NULL),
(4493, 75, 'Алатырь', NULL, NULL, NULL),
(4494, 75, 'Аликово', NULL, NULL, NULL),
(4495, 75, 'Батырева', NULL, NULL, NULL),
(4496, 75, 'Буинск', NULL, NULL, NULL),
(4497, 75, 'Вурнары', NULL, NULL, NULL),
(4498, 75, 'Ибреси', NULL, NULL, NULL),
(4499, 75, 'Канаш', NULL, NULL, NULL),
(4500, 75, 'Киря', NULL, NULL, NULL),
(4501, 75, 'Комсомольское', NULL, NULL, NULL),
(4502, 75, 'Красноармейское (Чувашия)', NULL, NULL, NULL),
(4503, 75, 'Красные Четаи', NULL, NULL, NULL),
(4504, 75, 'Кугеси', NULL, NULL, NULL),
(4505, 75, 'Мариинский Посад', NULL, NULL, NULL),
(4506, 75, 'Моргауши', NULL, NULL, NULL),
(4507, 75, 'Новочебоксарск', NULL, NULL, NULL),
(4508, 75, 'Порецкое', NULL, NULL, NULL),
(4509, 75, 'Урмары', NULL, NULL, NULL),
(4510, 75, 'Цивильск', NULL, NULL, NULL),
(4511, 75, 'Чебоксары', NULL, NULL, NULL),
(4512, 75, 'Шемурша', NULL, NULL, NULL),
(4513, 75, 'Шумерля', NULL, NULL, NULL),
(4514, 75, 'Ядрин', NULL, NULL, NULL),
(4515, 75, 'Яльчики', NULL, NULL, NULL),
(4516, 75, 'Янтиково', NULL, NULL, NULL),
(4517, 76, 'Анадырь (Чукотский АО)', NULL, NULL, NULL),
(4518, 76, 'Билибино', NULL, NULL, NULL),
(4519, 76, 'ПЕВЕК', NULL, NULL, NULL),
(4520, 77, 'Губкинский (Ямало-Ненецкий АО)', NULL, NULL, NULL),
(4521, 77, 'Заполярный (Ямало-Ненецкий АО)', NULL, NULL, NULL),
(4522, 77, 'Муравленко', NULL, NULL, NULL),
(4523, 77, 'Надым', NULL, NULL, NULL),
(4524, 77, 'Новый Уренгой', NULL, NULL, NULL),
(4525, 77, 'Ноябрьск', NULL, NULL, NULL),
(4526, 77, 'Пангоды', NULL, NULL, NULL),
(4527, 77, 'Пуровск', NULL, NULL, NULL),
(4528, 77, 'Салехард', NULL, NULL, NULL),
(4529, 77, 'Тазовский', NULL, NULL, NULL),
(4530, 77, 'Тарко-Сале', NULL, NULL, NULL),
(4531, 78, 'Андропов', NULL, NULL, NULL),
(4532, 78, 'Берендеево', NULL, NULL, NULL),
(4533, 78, 'Большое Село', NULL, NULL, NULL),
(4534, 78, 'Борисоглебский', NULL, NULL, NULL),
(4535, 78, 'Брейтово', NULL, NULL, NULL),
(4536, 78, 'Бурмакино', NULL, NULL, NULL),
(4537, 78, 'Варегово', NULL, NULL, NULL),
(4538, 78, 'Волга', NULL, NULL, NULL),
(4539, 78, 'Гаврилов Ям', NULL, NULL, NULL),
(4540, 78, 'Данилов', NULL, NULL, NULL),
(4541, 78, 'Любим', NULL, NULL, NULL),
(4542, 78, 'Мышкин', NULL, NULL, NULL),
(4543, 78, 'Некрасовское', NULL, NULL, NULL),
(4544, 78, 'Новый Некоуз', NULL, NULL, NULL),
(4545, 78, 'Переславль-Залесский', NULL, NULL, NULL),
(4546, 78, 'Пошехонье-Володарск', NULL, NULL, NULL),
(4547, 78, 'Ростов', NULL, NULL, NULL),
(4548, 78, 'Рыбинск', NULL, NULL, NULL),
(4549, 78, 'Тутаев', NULL, NULL, NULL),
(4550, 78, 'Углич', NULL, NULL, NULL),
(4551, 78, 'Ярославль', NULL, NULL, NULL),
(4552, 79, 'Черкесск', NULL, NULL, NULL),
(4553, 80, 'Азовское', NULL, NULL, NULL),
(4554, 80, 'Алупка', NULL, NULL, NULL),
(4555, 80, 'Алушта', NULL, NULL, NULL),
(4556, 80, 'Армянск', NULL, NULL, NULL),
(4557, 80, 'Багерово', NULL, NULL, NULL),
(4558, 80, 'Балаклава', NULL, NULL, NULL),
(4559, 80, 'Бахчисарай', NULL, NULL, NULL),
(4560, 80, 'Белогорск', NULL, NULL, NULL),
(4561, 80, 'Гаспра', NULL, NULL, NULL),
(4562, 80, 'Гвардейское', NULL, NULL, NULL),
(4563, 80, 'Гурзуф', NULL, NULL, NULL),
(4564, 80, 'Джанкой', NULL, NULL, NULL),
(4565, 80, 'Евпатория', NULL, NULL, NULL),
(4566, 80, 'Зуя', NULL, NULL, NULL),
(4567, 80, 'Керчь', NULL, NULL, NULL),
(4568, 80, 'Кировское', NULL, NULL, NULL),
(4569, 80, 'Коктебель', NULL, NULL, NULL),
(4570, 80, 'Красногвардейское', NULL, NULL, NULL),
(4571, 80, 'Красноперекопск', NULL, NULL, NULL),
(4572, 80, 'Ленино', NULL, NULL, NULL),
(4573, 80, 'Массандра', NULL, NULL, NULL),
(4574, 80, 'Нижнегорский', NULL, NULL, NULL),
(4575, 80, 'Первомайское', NULL, NULL, NULL),
(4576, 80, 'Раздольное', NULL, NULL, NULL),
(4577, 80, 'Саки', NULL, NULL, NULL),
(4578, 80, 'Севастополь', NULL, NULL, NULL),
(4579, 80, 'Симеиз', NULL, NULL, NULL),
(4580, 80, 'Симферополь', NULL, NULL, NULL),
(4581, 80, 'Советский', NULL, NULL, NULL),
(4582, 80, 'Судак', NULL, NULL, NULL),
(4583, 80, 'Феодосия', NULL, NULL, NULL),
(4584, 80, 'Форос', NULL, NULL, NULL),
(4585, 80, 'Черноморское', NULL, NULL, NULL),
(4586, 80, 'Щёлкино', NULL, NULL, NULL),
(4587, 80, 'Ялта', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `same_category`
--

CREATE TABLE `same_category` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sub_cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `same_category`
--

INSERT INTO `same_category` (`id`, `cat_id`, `sub_cat_id`) VALUES
(1, 1, 6),
(2, 1, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `search_log`
--

CREATE TABLE `search_log` (
  `id` int(11) NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `keyword` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `search_log`
--

INSERT INTO `search_log` (`id`, `session_id`, `user_id`, `keyword`, `ip`, `created_at`, `updated_at`) VALUES
(1, 'ap7r18c1vffq8l433s7hv8k3p4', 4, 'mac', '127.0.0.1', 1425889884, 1425889884),
(2, 'ap7r18c1vffq8l433s7hv8k3p4', 4, 'mac', '127.0.0.1', 1425889902, 1425889902),
(3, 'ap7r18c1vffq8l433s7hv8k3p4', 4, 'iphone', '127.0.0.1', 1425889907, 1425889907),
(4, 'ae4ebbfhfg228a7b0gtqpubds5', NULL, 'mate', '127.0.0.1', 1425890119, 1425890119),
(5, '0riaesian6o41iicraqvrbber3', 4, 'mac', '127.0.0.1', 1426217392, 1426217392),
(6, '0riaesian6o41iicraqvrbber3', 4, 'mac', '127.0.0.1', 1426217489, 1426217489),
(7, '0riaesian6o41iicraqvrbber3', 4, 'mac', '127.0.0.1', 1426217492, 1426217492),
(8, '0riaesian6o41iicraqvrbber3', 4, 'mac', '127.0.0.1', 1426217502, 1426217502),
(9, '0riaesian6o41iicraqvrbber3', 4, 'mac', '127.0.0.1', 1426217503, 1426217503),
(10, 'nqer0v2l90hqecitl7bjpjstdq', NULL, 'sd', '127.0.0.1', 1536479468, 1536479468),
(11, 'nqer0v2l90hqecitl7bjpjstdq', NULL, 'sd', '127.0.0.1', 1536479928, 1536479928),
(12, 'jj8h58075e04ap31fplmgsiq4l', 18, 'sd', '127.0.0.1', 1537025801, 1537025801),
(13, '3gffaph0hosl8is8i98p3pe0go', NULL, 'sd', '127.0.0.1', 1538415327, 1538415327),
(14, '3gffaph0hosl8is8i98p3pe0go', NULL, 'sd', '127.0.0.1', 1538416435, 1538416435),
(15, '3gffaph0hosl8is8i98p3pe0go', NULL, 'sd', '127.0.0.1', 1538416516, 1538416516),
(16, '3gffaph0hosl8is8i98p3pe0go', NULL, 'sd', '127.0.0.1', 1538416535, 1538416535),
(17, '3gffaph0hosl8is8i98p3pe0go', NULL, 'sd', '127.0.0.1', 1538416962, 1538416962),
(18, '3gffaph0hosl8is8i98p3pe0go', NULL, 'sd', '127.0.0.1', 1538417474, 1538417474),
(19, '3gffaph0hosl8is8i98p3pe0go', NULL, 'sd', '127.0.0.1', 1538417609, 1538417609),
(20, '3gffaph0hosl8is8i98p3pe0go', NULL, 'sd', '127.0.0.1', 1538417643, 1538417643);

-- --------------------------------------------------------

--
-- Структура таблицы `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `store_range` varchar(255) DEFAULT NULL,
  `store_dir` varchar(255) DEFAULT NULL,
  `value` text,
  `sort_order` int(11) NOT NULL DEFAULT '50'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `setting`
--

INSERT INTO `setting` (`id`, `parent_id`, `code`, `type`, `store_range`, `store_dir`, `value`, `sort_order`) VALUES
(11, 0, 'info', 'group', '', '', '', 50),
(21, 0, 'basic', 'group', '', '', '', 50),
(31, 0, 'smtp', 'group', '', '', '', 50),
(1111, 11, 'siteName', 'text', '', '', 'Your Site', 50),
(1112, 11, 'siteTitle', 'text', '', '', 'Your Site Title', 50),
(1113, 11, 'siteKeyword', 'text', '', '', 'Your Site Keyword', 50),
(2111, 21, 'timezone', 'select', '-12,-11,-10,-9,-8,-7,-6,-5,-4,-3.5,-3,-2,-1,0,1,2,3,3.5,4,4.5,5,5.5,5.75,6,6.5,7,8,9,9.5,10,11,12', '', '8', 50),
(2112, 21, 'commentCheck', 'select', '0,1', '', '1', 50),
(3111, 31, 'smtpHost', 'text', '', '', 'localhost', 50),
(3112, 31, 'smtpPort', 'text', '', '', '', 50),
(3113, 31, 'smtpUser', 'text', '', '', '', 50),
(3114, 31, 'smtpPassword', 'password', '', '', '', 50),
(3115, 31, 'smtpMail', 'text', '', '', '', 50);

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(3) DEFAULT '1',
  `description` text,
  `logo` varchar(255) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `policy` text,
  `address` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `work_hours` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_description` text,
  `seo_categories_title` varchar(255) DEFAULT NULL,
  `seo_categories_keywords` varchar(255) DEFAULT NULL,
  `contact_info` text,
  `seo_categories_description` text,
  `lat_log` varchar(45) DEFAULT NULL,
  `cost_departure` text,
  `cost_delivery` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `name`, `status`, `description`, `logo`, `phone`, `email`, `policy`, `address`, `facebook`, `google`, `linkedin`, `twitter`, `youtube`, `work_hours`, `created_at`, `seo_title`, `seo_keywords`, `seo_description`, `seo_categories_title`, `seo_categories_keywords`, `contact_info`, `seo_categories_description`, `lat_log`, `cost_departure`, `cost_delivery`) VALUES
(7, 'Ru-parket', 1, 'Ru-parket online store', 'upload/settings/201810120135363242.svg', '+7 (495) 662-98-97', 'info@ru-parket.ru', '<p>Обращаясь в наш магазин, вы даете согласие<br />\r\nна обработку ваших персональных данных.<br />\r\nОбратите внимание: изображение товара на сайте<br />\r\nможет отличаться от фактического изображения товара.<br />\r\nИнформация на сайте xn--80akosecqc.ru не является публичной офертой.</p>\r\n', 'Москва, Каширское шоссе, Д.2, корп.1', '', '', '', '', '', '<p>Пн-Сб:9:00 - 19:00Вс:9:00 - 17:00</p>\r\n', '2018-09-16 12:02:19', 'SEO-Текст', '', '<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна</p>\r\n\r\n<p><img alt=\"seo picture\" class=\"float float-left\" src=\"/img/seo-pic.png\" /></p>\r\n\r\n<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми.</p>\r\n\r\n<ul>\r\n	<li>Далеко-далеко за словесными горами</li>\r\n	<li>Маленький ручеек Даль журчит по всей стране</li>\r\n	<li>Далеко-далеко за словесными горами</li>\r\n</ul>\r\n\r\n<h2>SEO-Текст</h2>\r\n\r\n<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна, в которой жаренные члены предложения залетают прямо в рот. Даже всемогущая пунктуация не имеет власти над рыбными текстами, ведущими безорфографичный образ жизни. Однажды одна маленькая строчка рыбного текста по имени Lorem ipsum.</p>\r\n\r\n<p><a class=\"border-bottom\" href=\"#\" title=\"Перейти\">Подробнее... </a></p>\r\n', 'SEO-Текст', '', '<div class=\"col-12 contacts__map\">\r\n<div class=\"border border-primary\" id=\"map\"><!--<figure class=\"map\"><img src=\"/assets/img/map.jpg\" class=\"img-fluid\" alt=\"map\"></figure>--></div>\r\n</div>\r\n<!-- .contacts-map -->\r\n\r\n<div class=\"col-md-6 mt-4 contacts__bottom\">\r\n<div class=\"h2\">Как добраться от метро &quot;Нагатинская&quot;</div>\r\n\r\n<p>Выход - первый вагон из центра.<br />\r\nМаршрутное такси: 242м, 275м, 364м, 694м.<br />\r\nАвтобусы: 742, 147, 164, 275, 298.<br />\r\nТрамваи: 3, 16.<br />\r\nТроллейбусы: &nbsp;40, 71<br />\r\nДо остановки &quot;Хлебозаводской проезд - Каширский двор&quot;<br />\r\nВремя движения около 12-15 минут.</p>\r\n</div>\r\n\r\n<div class=\"col-md-6 mt-4 contacts__bottom\">\r\n<div class=\"h2\">Как добраться от метро &quot;Каширская&quot;</div>\r\n\r\n<p>Выход - первый вагон из центра.<br />\r\nМаршрутное такси: 242м, 275м, 364м, 694м.<br />\r\nАвтобусы: 742, 147, 164, 275, 298.<br />\r\nТроллейбусы: 71<br />\r\nДо остановки &quot;Хлебозаводской проезд - Каширский двор&quot;<br />\r\nВремя движения около 12-15 минут.</p>\r\n</div>\r\n\r\n<div class=\"col-12 my-2 my-lg-4 contacts__bottom\">\r\n<p>Юридическая информация: Общество с ограниченной ответственностью Производственно-Коммерческий Центр &ldquo;ТУРЛЮКС&rdquo; ОГРН 1037739433258</p>\r\n</div>\r\n', '<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна</p>\r\n\r\n<p><img alt=\"seo picture\" class=\"float float-left\" src=\"/img/seo-pic.png\" /></p>\r\n\r\n<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми.</p>\r\n\r\n<ul>\r\n	<li>Далеко-далеко за словесными горами</li>\r\n	<li>Маленький ручеек Даль журчит по всей стране</li>\r\n	<li>Далеко-далеко за словесными горами</li>\r\n</ul>\r\n\r\n<h2>SEO-Текст</h2>\r\n\r\n<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна, в которой жаренные члены предложения залетают прямо в рот. Даже всемогущая пунктуация не имеет власти над рыбными текстами, ведущими безорфографичный образ жизни. Однажды одна маленькая строчка рыбного текста по имени Lorem ipsum.</p>\r\n\r\n<p><a class=\"border-bottom\" href=\"#\" title=\"Перейти\">Подробнее... </a></p>\r\n', '', '<p>Стоимость выезда:<br />\r\nПо Москве в предедах МКАД - 1500 руб.<br />\r\nЗа МКАД до 20 км - 2000 руб., свыше - 2000 руб. + 30 руб./км.<br />\r\nЗа МКАД свыше 100 км - по договоренности.</p>\r\n\r\n<p>При заключении договора на монтаж оплата выезда компенсируется за счет скидки на стоимость выезда технолога.</p>\r\n', '<p>По Москве в предедах МКАД - 1500 ₽<br />\r\nЗа МКАД до 20 км - 2000 ₽, свыше - 2000 ₽ + 30 ₽/км.<br />\r\nЗа МКАД свыше 100 км - по договоренности.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>При покупке от 30 м2 в пределах 30 км доставка БЕСПЛАТНА!</p>\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `shipment`
--

CREATE TABLE `shipment` (
  `id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `config` text,
  `print` text,
  `is_cod` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shipment`
--

INSERT INTO `shipment` (`id`, `code`, `name`, `description`, `url`, `config`, `print`, `is_cod`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'SFKD', '顺丰快递', '', 'http://www.sf-express.com', '', '', 0, 50, 1, 1427870846, 1427870882);

-- --------------------------------------------------------

--
-- Структура таблицы `static_pages`
--

CREATE TABLE `static_pages` (
  `id` int(11) NOT NULL,
  `header` varchar(255) DEFAULT NULL,
  `header_down` varchar(255) DEFAULT NULL,
  `status` int(3) DEFAULT '1',
  `alias` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `static_pages`
--

INSERT INTO `static_pages` (`id`, `header`, `header_down`, `status`, `alias`, `body`, `created_at`) VALUES
(7, 'О компании', 'Наши преимущества', 1, 'about', '<div class=\"col-sm-6 col-lg-5\">\n                <article class=\"clearfix post\">\n                    <figure class=\"post-img\">\n                        <img src=\"/img/about-1.jpg\" class=\"\" alt=\"seo picture\">\n                    </figure>\n                    <h2>Огромный ассортимент товара</h2>\n                    <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна зыкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна. Эта парадигматическая страна</p>\n                    <br>\n                    <h2>Профессионализм сотрудников</h2>\n                    <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна, в которой жаренные члены предложения залетают прямо в рот. Даже всемогущая пунктуация не имеет власти над рыбными текстами, ведущими безорфографичный образ жизни. Однажды одна маленькая строчка рыбного текста по имени Lorem ipsum. Однажды одна маленькая строчка рыбного текста по имени Lorem ipsum по имени Lorem ipsum.</p>\n                    <br>\n                    <h2>Цены</h2>\n                    <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Вдали от всех живут они в буквенных домах на берегу...</p>\n                </article>\n            </div>\n            <div class=\"col-sm-6 col-lg-5\">\n                <article class=\"clearfix post\">\n                    <figure class=\"post-img\">\n                        <img src=\"/img/about-2.jpg\" class=\"\" alt=\"seo picture\">\n                    </figure>\n                    <h2>Честность и прозрачность для покупателя</h2>\n                    <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна</p>\n                    <h2>Комплексное сопровождение заказов</h2>\n                    <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна, в которой жаренные члены предложения залетают прямо в рот. Даже всемогущая пунктуация не имеет власти над рыбными текстами, ведущими безорфографичный образ жизни. Однажды одна маленькая строчка рыбного текста по имени Lorem ipsum.</p>\n                </article>\n            </div>', '2018-09-10 20:54:00'),
(8, 'Наши клиенти', NULL, 1, 'our-clients', '<div class=\"col-lg-10\">\n                    <div class=\"row\">\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-1.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название клиента (фирмы)</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-2.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название клиента (фирмы)</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-1.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название клиента (фирмы)</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные\n                                    тексты.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-2.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название клиента (фирмы)</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                    </div>\n                </div>', '2018-09-10 20:54:00'),
(9, 'Наши партнеры', NULL, 1, 'our-partners', '<div class=\"col-lg-10\">\n                    <div class=\"row\">\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-1.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название партнеры (фирмы)</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-2.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название партнеры (фирмы)</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-1.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название партнеры (фирмы)</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные\n                                    тексты.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-2.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название партнеры (фирмы)</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                    </div>\n                </div>', '2018-09-10 20:54:00'),
(10, 'Наши проекти', NULL, 1, 'our-projects', '<div class=\"col-lg-10\">\n                    <div class=\"row\">\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-1.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название проекта</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-2.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название проекта</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-1.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название проекта</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные\n                                    тексты.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <figure class=\"post-img\">\n                                    <img src=\"/img/about-2.jpg\" alt=\"\">\n                                </figure>\n                                <h2>Название проекта</h2>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                    </div>\n                </div>', '2018-09-10 20:54:00'),
(11, 'Оплата и доставка', NULL, 1, 'payment-delivery', '<div class=\"col-lg-10\">\n                    <div class=\"h2 text-center\">Семь причин заказать \"Паркетные работы\" именно у нас.</div>\n                    <div class=\"row\">\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">1</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">2</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">3</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные\n                                    тексты.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">4</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">5</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные\n                                    тексты.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">6</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">7</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные\n                                    тексты.</p>\n                            </article>\n                        </div>\n                    </div>\n                </div>', '2018-09-10 20:54:00'),
(12, 'Сервис', NULL, 1, 'service', '<div class=\"col-lg-10\">\n                    <div class=\"h2 text-center\">Семь причин заказать \"Паркетные работы\" именно у нас.</div>\n                    <div class=\"row\">\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">1</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">2</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">3</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные\n                                    тексты.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">4</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">5</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные\n                                    тексты.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">6</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты.\n                                    Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового\n                                    океана.</p>\n                            </article>\n                        </div>\n                        <div class=\"col-sm-6\">\n                            <article class=\"clearfix post\">\n                                <span class=\"service-num\">7</span>\n                                <p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные\n                                    тексты.</p>\n                            </article>\n                        </div>\n                    </div>\n                </div>', '2018-09-10 20:54:00'),
(13, 'Гарантия', 'Качество товара и гарантия на товар', 1, 'warranty', '<div class=\"col-lg-5\">\n			<article class=\"clearfix post\">\n				<figure class=\"post-img\">\n					<img src=\"..//img/about-1.jpg\" class=\"\" alt=\"seo picture\">\n				</figure>\n				<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна</p>\n				<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна, в которой жаренные члены предложения залетают прямо в рот. Даже всемогущая пунктуация не имеет власти над рыбными текстами, ведущими безорфографичный образ жизни. Однажды одна маленькая строчка рыбного текста по имени Lorem ipsum.</p>\n			</article>\n		</div>\n		<div class=\"col-lg-5\">\n			<article class=\"clearfix post\">\n				<figure class=\"post-img\">\n					<img src=\"..//img/about-2.jpg\" class=\"\" alt=\"seo picture\">\n				</figure>\n				<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна</p>\n				<p>Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами. Эта парадигматическая страна, в которой жаренные члены предложения залетают прямо в рот. Даже всемогущая пунктуация не имеет власти над рыбными текстами, ведущими безорфографичный образ жизни. Однажды одна маленькая строчка рыбного текста по имени Lorem ipsum.</p>\n			</article>\n		</div>', '2018-09-10 20:54:00');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `point` int(11) NOT NULL DEFAULT '0',
  `recommended_by` int(11) NOT NULL DEFAULT '0',
  `recommended_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supported_by` int(11) NOT NULL DEFAULT '1',
  `auth_role` int(11) DEFAULT NULL,
  `role` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `status` smallint(6) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `token`, `access_token`, `password_hash`, `password_reset_token`, `email`, `balance`, `point`, `recommended_by`, `recommended_name`, `supported_by`, `auth_role`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'bPdqSVmrWdkx-x7_hplXE_Y0Ak9mwdoE', NULL, NULL, '$2y$13$ut4ZP/sHdTmTEYQG4HeZdui1SczDdBUcWwAuYfy30ht95mlThLjBi', '', 'admin@demo.com', '0.00', 92, 0, NULL, 1, NULL, 'user', 1, 1422844005, 1426671417),
(4, 'shflg1234', 'Q23gMd-bAM9zAjAMXctUKZTAg5FO6zSm', NULL, '', '$2y$13$qd721qcGi4mX8K8dzJsiuOPm9lqQTKKQMtP0hqrct7ZjtN6fS9ASW', NULL, 'shflg1234@163.com', '0.00', 0, 0, NULL, 1, NULL, 'user', 1, 1424760732, 1426650201),
(17, 'kemo', 'YOtFZ6eb_eKBmFoULUhOMyGKvlV2ifnX', NULL, NULL, '$2y$13$ut4ZP/sHdTmTEYQG4HeZdui1SczDdBUcWwAuYfy30ht95mlThLjBi', '7mbYScV-ZP1VgpsfXhSFIWGgJ9Yz8VNH_1539168152', 'kemolife1990@gmail.com', '0.00', 0, 0, NULL, 1, NULL, 'user', 10, 1535910713, 1539168152),
(18, 'kemoAdmin', 'RRvi6FXT-B8pcGs7X-neJLvKPRA4Ahhg', NULL, NULL, '$2y$13$ut4ZP/sHdTmTEYQG4HeZdui1SczDdBUcWwAuYfy30ht95mlThLjBi', NULL, 'kemolife1991@gmail.com', '0.00', 0, 0, NULL, 1, 1, 'admin', 10, 1536483509, 1536483509),
(19, 'kemoTest', 'Bucdj2O7T6cCTdDKxmGgMpXVPpXu2ZNT', NULL, NULL, '$2y$13$Lv9uanqAbDuoDOIXWme1UeJpNVHA2XWtb9pd/YgA0gBqZU8UcoyfS', NULL, 'kemolife1992@gmail.com', '0.00', 0, 0, NULL, 1, NULL, 'user', 10, 1538332779, 1538332779),
(20, 'kemoTest1', 'N01ICUd7Mxr8b_mESuEQdYUgAwA12K_v', NULL, NULL, '$2y$13$gKQs5Q.GB7OULHgY9Qx2aOGL4NeovUhal9j8l50TsVozwnmbocZO6', NULL, 'cubeonlinegmb@gmail.com', '0.00', 0, 0, NULL, 1, NULL, 'user', 10, 1538333342, 1538333342),
(21, 'kemoTest2', '_5ZFo7vgPh6c0mTl91RWAMOT_YLBu3Or', NULL, NULL, '$2y$13$uVqAPpkYzhCYXHGdGM2qu.IC.po9Z2zuS7qltIiM7Qc.6YIR3e1CC', NULL, 'kemolife19945@gmail.com', '0.00', 0, 0, NULL, 1, NULL, 'user', 10, 1538333623, 1538333623),
(22, 'kemo122336565', '9tqaUmzS2433HmMdORO5kh0dvi3u2iQC', NULL, NULL, '$2y$13$QJJ9oejIIXxZBWHiCZozq.UjUpXrc91929zOPYWtvJEevrZYIao5u', NULL, 'cubeonlinegmb123@gmail.com', '0.00', 0, 0, NULL, 1, NULL, 'user', 10, 1539361038, 1539361038);

-- --------------------------------------------------------

--
-- Структура таблицы `user_email`
--

CREATE TABLE `user_email` (
  `user_id` int(11) NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_fk_1` (`user_id`);

--
-- Индексы таблицы `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `auth_operation`
--
ALTER TABLE `auth_operation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `auth_role`
--
ALTER TABLE `auth_role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `blog_catalog`
--
ALTER TABLE `blog_catalog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_nav` (`is_nav`),
  ADD KEY `sort_order` (`sort_order`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Индексы таблицы `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Индексы таблицы `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_id` (`catalog_id`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `FK_post_user` (`user_id`);

--
-- Индексы таблицы `blog_tag`
--
ALTER TABLE `blog_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frequency` (`frequency`);

--
-- Индексы таблицы `bonus`
--
ALTER TABLE `bonus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bonus_fk_1` (`user_id`),
  ADD KEY `bonus_fk_2` (`bonus_type_id`);

--
-- Индексы таблицы `bonus_type`
--
ALTER TABLE `bonus_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_fk_1` (`user_id`),
  ADD KEY `cart_fk_2` (`session_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client_messages`
--
ALTER TABLE `client_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cms_catalog`
--
ALTER TABLE `cms_catalog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_nav` (`is_nav`),
  ADD KEY `sort_order` (`sort_order`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Индексы таблицы `cms_show`
--
ALTER TABLE `cms_show`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_id` (`catalog_id`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_fk_1` (`user_id`),
  ADD KEY `comment_fk_2` (`product_id`),
  ADD KEY `comment_fk_3` (`order_id`);

--
-- Индексы таблицы `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consultation_fk_1` (`user_id`),
  ADD KEY `consultation_fk_2` (`product_id`);

--
-- Индексы таблицы `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_fk_1` (`user_id`),
  ADD KEY `coupon_fk_2` (`coupon_type_id`);

--
-- Индексы таблицы `coupon_type`
--
ALTER TABLE `coupon_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorite_fk_1` (`user_id`),
  ADD KEY `favorite_fk_2` (`product_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_fk_1` (`user_id`);

--
-- Индексы таблицы `order_log`
--
ALTER TABLE `order_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_log_fk_1` (`order_id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_fk_1` (`order_id`),
  ADD KEY `order_product_fk_2` (`product_id`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `point_log`
--
ALTER TABLE `point_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `point_fk_1` (`user_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_fk_1` (`category_id`);

--
-- Индексы таблицы `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`);

--
-- Индексы таблицы `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`product_id`,`option_id`);

--
-- Индексы таблицы `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `same_category`
--
ALTER TABLE `same_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `search_log`
--
ALTER TABLE `search_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `point_fk_1` (`user_id`);

--
-- Индексы таблицы `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `code` (`code`),
  ADD KEY `sort_order` (`sort_order`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role` (`role`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Индексы таблицы `user_email`
--
ALTER TABLE `user_email`
  ADD PRIMARY KEY (`user_id`,`token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `auth_operation`
--
ALTER TABLE `auth_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11406;

--
-- AUTO_INCREMENT для таблицы `auth_role`
--
ALTER TABLE `auth_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `blog_catalog`
--
ALTER TABLE `blog_catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `blog_tag`
--
ALTER TABLE `blog_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `bonus`
--
ALTER TABLE `bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000017;

--
-- AUTO_INCREMENT для таблицы `bonus_type`
--
ALTER TABLE `bonus_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `client_messages`
--
ALTER TABLE `client_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `cms_catalog`
--
ALTER TABLE `cms_catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `cms_show`
--
ALTER TABLE `cms_show`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `consultation`
--
ALTER TABLE `consultation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000021;

--
-- AUTO_INCREMENT для таблицы `coupon_type`
--
ALTER TABLE `coupon_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT для таблицы `order_log`
--
ALTER TABLE `order_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `point_log`
--
ALTER TABLE `point_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `profile`
--
ALTER TABLE `profile`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4588;

--
-- AUTO_INCREMENT для таблицы `same_category`
--
ALTER TABLE `same_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `search_log`
--
ALTER TABLE `search_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3116;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `shipment`
--
ALTER TABLE `shipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `blog_post`
--
ALTER TABLE `blog_post`
  ADD CONSTRAINT `FK_post_catalog` FOREIGN KEY (`catalog_id`) REFERENCES `blog_catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `bonus`
--
ALTER TABLE `bonus`
  ADD CONSTRAINT `bonus_fk2` FOREIGN KEY (`bonus_type_id`) REFERENCES `bonus_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `cms_show`
--
ALTER TABLE `cms_show`
  ADD CONSTRAINT `FK_cms_catalog` FOREIGN KEY (`catalog_id`) REFERENCES `cms_catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comment_fk2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comment_fk3` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `consultation_fk2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `coupon_fk2` FOREIGN KEY (`coupon_type_id`) REFERENCES `coupon_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `favorite_fk2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `order_log`
--
ALTER TABLE `order_log`
  ADD CONSTRAINT `order_log_fk1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_fk1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_product_fk2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `point_log`
--
ALTER TABLE `point_log`
  ADD CONSTRAINT `point_fk1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_fk1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `FK_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_email`
--
ALTER TABLE `user_email`
  ADD CONSTRAINT `FK_user_email_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
