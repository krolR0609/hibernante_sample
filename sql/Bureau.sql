-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Окт 21 2016 г., 16:46
-- Версия сервера: 5.7.15-0ubuntu0.16.04.1
-- Версия PHP: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Bureau`
--

-- --------------------------------------------------------

--
-- Структура таблицы `EMPLOYEE`
--

CREATE TABLE `EMPLOYEE` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`id`, `first_name`, `last_name`, `salary`) VALUES
(1, 'Zara', 'Ali', 5000),
(3, 'John', 'Paul', 10000);

-- --------------------------------------------------------

--
-- Структура таблицы `Stuff`
--

CREATE TABLE `Stuff` (
  `Id` int(11) NOT NULL,
  `Type` text NOT NULL COMMENT 'Тип находки',
  `Description` text NOT NULL COMMENT 'Описание находки',
  `Date` date NOT NULL COMMENT 'Дата находки'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Stuff`
--

INSERT INTO `Stuff` (`Id`, `Type`, `Description`, `Date`) VALUES
(1, 'Phone', 'Yellow phone ', '2016-10-20'),
(3, 'Wallet', 'Green wallet with 30$ in there ', '2016-10-20');

-- --------------------------------------------------------

--
-- Структура таблицы `Types`
--

CREATE TABLE `Types` (
  `Id` int(11) NOT NULL,
  `Name` text NOT NULL COMMENT 'Тип находки',
  `Description` text NOT NULL COMMENT 'Описания типа находки'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Types`
--

INSERT INTO `Types` (`Id`, `Name`, `Description`) VALUES
(1, 'Phone', 'Is a portable telephone that can make and receive calls over a radio frequency carrier while the user is moving within a telephone service area.'),
(2, 'Headphone', 'Headphones are a pair of small listening devices that are designed to be worn on..'),
(3, 'Wallet', 'A wallet, pouch or billfold, is a small, flat case that is used to carry such personal items as cash'),
(5, 'Passport', 'A passport is a travel document, usually issued by a country\'s government'),
(4, 'Watch', 'A watch is a small timepiece intended to be carried or worn by a person.');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Stuff`
--
ALTER TABLE `Stuff`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `Types`
--
ALTER TABLE `Types`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `Stuff`
--
ALTER TABLE `Stuff`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `Types`
--
ALTER TABLE `Types`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
