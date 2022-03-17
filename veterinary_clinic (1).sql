-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 17 2022 г., 14:07
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `veterinary_clinic`
--

-- --------------------------------------------------------

--
-- Структура таблицы `animals`
--

CREATE TABLE `animals` (
  `animalID` int UNSIGNED NOT NULL,
  `animal_species` varchar(30) NOT NULL,
  `breed` varchar(30) NOT NULL,
  `animal_name` varchar(50) NOT NULL,
  `exterior_color` varchar(30) NOT NULL,
  `sex` enum('male','famale') NOT NULL,
  `weight` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `clinic`
--

CREATE TABLE `clinic` (
  `clinicID` int NOT NULL,
  `name_clinic` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(20) NOT NULL,
  `street` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `number_phone` char(15) NOT NULL,
  `number_house` int NOT NULL,
  `email_clinic` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `doctors`
--

CREATE TABLE `doctors` (
  `doctorID` int UNSIGNED NOT NULL,
  `specialization` enum('Вакцинація','Косметичні процедури','Огляд','Лікування') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `employeeID` int UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `subname` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `age` int UNSIGNED NOT NULL,
  `position` varchar(50) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `number_clinic` int NOT NULL,
  `number_phone` char(15) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `owners`
--

CREATE TABLE `owners` (
  `ownerID` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `visit`
--

CREATE TABLE `visit` (
  `visitID` int UNSIGNED NOT NULL,
  `nameID` int UNSIGNED NOT NULL,
  `name` int NOT NULL,
  `surname` varchar(30) NOT NULL,
  `reason_for_visit` enum('Вакцинація','Косметичні процедури','Огляд','Лікування') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `number_phone` varchar(50) NOT NULL,
  `messageText` varchar(255) DEFAULT NULL,
  `test` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`animalID`);

--
-- Индексы таблицы `clinic`
--
ALTER TABLE `clinic`
  ADD PRIMARY KEY (`clinicID`),
  ADD KEY `number_clinic_em` (`number_house`);

--
-- Индексы таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctorID`),
  ADD KEY `specialization_visit` (`specialization`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employeeID`),
  ADD KEY `number_clinic_em` (`number_clinic`);

--
-- Индексы таблицы `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`ownerID`);

--
-- Индексы таблицы `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`visitID`),
  ADD UNIQUE KEY `UQ` (`test`),
  ADD KEY `spec` (`reason_for_visit`),
  ADD KEY `visit_owner` (`nameID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `animals`
--
ALTER TABLE `animals`
  MODIFY `animalID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `clinic`
--
ALTER TABLE `clinic`
  MODIFY `clinicID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctorID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `employeeID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `owners`
--
ALTER TABLE `owners`
  MODIFY `ownerID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `visit`
--
ALTER TABLE `visit`
  MODIFY `visitID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animal_owner` FOREIGN KEY (`animalID`) REFERENCES `owners` (`ownerID`);

--
-- Ограничения внешнего ключа таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_emp` FOREIGN KEY (`doctorID`) REFERENCES `employees` (`employeeID`),
  ADD CONSTRAINT `specialization_visit` FOREIGN KEY (`specialization`) REFERENCES `visit` (`reason_for_visit`);

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `number_clinic_em` FOREIGN KEY (`number_clinic`) REFERENCES `clinic` (`number_house`);

--
-- Ограничения внешнего ключа таблицы `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_owner` FOREIGN KEY (`nameID`) REFERENCES `owners` (`ownerID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
