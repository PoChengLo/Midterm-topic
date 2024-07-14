-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-07-14 18:58:52
-- 伺服器版本： 8.4.0
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `activities`
--

-- --------------------------------------------------------

--
-- 資料表結構 `actbook`
--

CREATE TABLE `actbook` (
  `act_book_id` int NOT NULL,
  `act_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_score` int DEFAULT NULL,
  `sign_in` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `actbook`
--

INSERT INTO `actbook` (`act_book_id`, `act_id`, `user_id`, `user_score`, `sign_in`) VALUES
(25, 3, 5, 4, 1),
(26, 3, 1, 5, 1),
(27, 4, 2, 4, 0),
(28, 4, 3, 3, 1),
(29, 5, 4, 5, 1),
(30, 5, 5, 5, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `actlist`
--

CREATE TABLE `actlist` (
  `act_id` int NOT NULL,
  `act_name` varchar(255) NOT NULL,
  `act_date` date NOT NULL,
  `user_id` int NOT NULL,
  `act_type` varchar(255) DEFAULT NULL,
  `act_create` datetime NOT NULL,
  `act_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `actlist`
--

INSERT INTO `actlist` (`act_id`, `act_name`, `act_date`, `user_id`, `act_type`, `act_create`, `act_desc`) VALUES
(3, 'Music Concert', '2024-07-20', 3, 'Entertainment', '2024-07-03 12:00:00', 'Live concert at the park'),
(4, 'Art Exhibition', '2024-07-25', 4, 'Arts', '2024-07-04 13:00:00', 'Modern art exhibition'),
(5, 'Yoga Class', '2024-07-10', 5, 'Health', '2024-07-05 14:00:00', '123'),
(6, '55555555555', '2024-07-01', 5, 'Health', '2024-07-05 14:00:00', '123456789'),
(7, 'Basketball Game', '2024-07-10', 1, 'Sports', '2024-07-01 10:00:00', 'Friendly match at the local gym'),
(8, 'Coding Workshop', '2024-07-15', 2, 'Education', '2024-07-02 11:00:00', 'Introduction to PHP programming'),
(9, 'Music Concert', '2024-07-20', 3, 'Entertainment', '2024-07-03 12:00:00', 'Live concert at the park'),
(10, 'Art Exhibition', '2024-07-25', 4, 'Arts', '2024-07-04 13:00:00', 'Modern art exhibition'),
(11, 'Yoga Class', '2024-07-30', 5, 'Health', '2024-07-05 14:00:00', '56248'),
(12, 'Yoga Class', '2024-07-30', 5, 'Health', '2024-07-05 14:00:00', 'Morning yoga session'),
(13, '狼人殺', '2024-07-15', 1, 'your_default_value_for_act_type', '2024-07-15 00:18:42', '3112'),
(14, '寶可夢聯盟大賽', '2024-07-15', 1, 'default_value_for_act_type', '2024-07-14 18:24:00', '514564'),
(15, '123456', '2024-07-15', 5, 'default_value_for_act_type', '2024-07-14 18:24:23', '123456'),
(17, '123456', '2024-07-15', 3, 'default_value_for_act_type', '2024-07-14 18:46:16', '123456');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Mike Brown', 'mike@example.com'),
(4, 'Emily White', 'emily@example.com'),
(5, 'Chris Green', 'chris@example.com');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `actbook`
--
ALTER TABLE `actbook`
  ADD PRIMARY KEY (`act_book_id`),
  ADD KEY `act_id` (`act_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `actlist`
--
ALTER TABLE `actlist`
  ADD PRIMARY KEY (`act_id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `actbook`
--
ALTER TABLE `actbook`
  MODIFY `act_book_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `actlist`
--
ALTER TABLE `actlist`
  MODIFY `act_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `actbook`
--
ALTER TABLE `actbook`
  ADD CONSTRAINT `actbook_ibfk_1` FOREIGN KEY (`act_id`) REFERENCES `actlist` (`act_id`),
  ADD CONSTRAINT `actbook_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
