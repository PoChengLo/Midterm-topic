-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-07-15 21:40:28
-- 伺服器版本： 8.4.0
-- PHP 版本： 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `user_database`
--

-- --------------------------------------------------------

--
-- 資料表結構 `favorlist`
--

CREATE TABLE `favorlist` (
  `favor_id` int NOT NULL,
  `user_id` int NOT NULL,
  `prod_id` int DEFAULT NULL,
  `add_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `order_history`
--

CREATE TABLE `order_history` (
  `history_id` int NOT NULL,
  `user_id` int NOT NULL,
  `ord_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `userinfo`
--

CREATE TABLE `userinfo` (
  `user_id` int NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `create_day` datetime NOT NULL,
  `last_date` datetime DEFAULT NULL,
  `qr_img` varchar(255) DEFAULT NULL,
  `mobile` int DEFAULT NULL,
  `line_id` varchar(255) DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `contact_number` int DEFAULT NULL,
  `store_firm` varchar(255) DEFAULT NULL,
  `store_id` varchar(255) DEFAULT NULL,
  `history_id` int DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `userinfo`
--

INSERT INTO `userinfo` (`user_id`, `user_name`, `email`, `password`, `nick_name`, `user_img`, `birthday`, `create_day`, `last_date`, `qr_img`, `mobile`, `line_id`, `postal_code`, `address`, `recipient`, `contact_number`, `store_firm`, `store_id`, `history_id`, `note`) VALUES
(20240001, '王小明', 'alice@example.com', 'a1b2c3d4', '活潑松鼠', 'image01.jpg', '1985-05-15', '2024-07-01 00:00:00', NULL, 'qr_code01.jpg', 912345678, 'line_alice', 10001, '台北市', '王小明', 912345678, '全家', '12345678', 12, 'Note here'),
(20240002, '李華', 'bob@example.com', 'e5f6g7h8', '神秘貓頭鷹', 'image02.jpg', '1992-03-22', '2024-07-01 00:00:00', NULL, 'qr_code02.jpg', 912345679, 'line_bob', 20002, '新北市', '李華', 912345679, '711', '23456789', 23, 'Note here'),
(20240003, '陳大同', 'charlie@example.com', 'i9j0k1l2', '優雅孔雀', 'image03.jpg', '1987-07-13', '2024-07-01 00:00:00', NULL, 'qr_code03.jpg', 912345680, 'line_charlie', 30003, '桃園市', '陳大同', 912345680, '萊爾富', '34567890', 34, 'Note here'),
(20240004, '張美麗', 'david@example.com', 'm3n4o5p6', '靈巧狐狸', 'image04.jpg', '1995-10-30', '2024-07-01 00:00:00', NULL, 'qr_code04.jpg', 912345681, 'line_david', 40004, '台中市', '張美麗', 912345681, 'OK', '45678901', 45, 'Note here'),
(20240005, '林俊傑', 'eve@example.com', 'q7r8s9t0', '勇敢獅子', 'image05.jpg', '2000-01-20', '2024-07-01 00:00:00', NULL, 'qr_code05.jpg', 912345682, 'line_eve', 50005, '台南市', '林俊傑', 912345682, '全家', '56789012', 56, 'Note here'),
(20240006, '黃小華', 'frank@example.com', 'u1v2w3x4', '魅惑豹', 'image06.jpg', '1988-04-25', '2024-07-01 00:00:00', NULL, 'qr_code06.jpg', 912345683, 'line_frank', 60006, '高雄市', '黃小華', 912345683, '711', '67890123', 67, 'Note here'),
(20240007, '周大志', 'grace@example.com', 'y5z6a7b8', '神聖箭', 'image07.jpg', '1991-09-09', '2024-07-01 00:00:00', NULL, 'qr_code07.jpg', 912345684, 'line_grace', 70007, '基隆市', '周大志', 912345684, '萊爾富', '78901234', 78, 'Note here'),
(20240008, '鄭麗娟', 'hannah@example.com', 'c1d2e3f4', '俏皮海獺', 'image08.jpg', '1983-11-27', '2024-07-01 00:00:00', NULL, 'qr_code08.jpg', 912345685, 'line_hannah', 80008, '新竹市', '鄭麗娟', 912345685, 'OK', '89012345', 89, 'Note here'),
(20240009, '趙小龍', 'isaac@example.com', 'g5h6i7j8', '驚艷紅鶴', 'image09.jpg', '1994-02-14', '2024-07-01 00:00:00', NULL, 'qr_code09.jpg', 912345686, 'line_isaac', 90009, '台中市', '趙小龍', 912345686, '全家', '90123456', 90, 'Note here'),
(20240010, '劉小婷', 'jack@example.com', 'k9l0m1n2', '獨立貓', 'image10.jpg', '1986-12-01', '2024-07-01 00:00:00', NULL, 'qr_code10.jpg', 912345687, 'line_jack', 10010, '台南市', '劉小婷', 912345687, '711', '01234567', 11, 'Note here'),
(20240011, '徐建國', 'kate@example.com', 'o3p4q5r6', '強壯水牛', 'image11.jpg', '1990-06-16', '2024-07-01 00:00:00', NULL, 'qr_code11.jpg', 912345688, 'line_kate', 20011, '高雄市', '徐建國', 912345688, '萊爾富', '12345678', 22, 'Note here'),
(20240012, '吳美珍', 'linda@example.com', 's7t8u9v0', '靜謐天鵝', 'image12.jpg', '1989-08-08', '2024-07-01 00:00:00', NULL, 'qr_code12.jpg', 912345689, 'line_linda', 30012, '台北市', '吳美珍', 912345689, 'OK', '23456789', 33, 'Note here'),
(20240013, '何大海', 'mike@example.com', 'w1x2y3z4', '火焰劍', 'image13.jpg', '1997-04-01', '2024-07-01 00:00:00', NULL, 'qr_code13.jpg', 912345690, 'line_mike', 40013, '新北市', '何大海', 912345690, '全家', '34567890', 44, 'Note here'),
(20240014, '高雅琴', 'nancy@example.com', 'a5b6c7d8', '雷電盾', 'image14.jpg', '1982-10-15', '2024-07-01 00:00:00', NULL, 'qr_code14.jpg', 912345691, 'line_nancy', 50014, '桃園市', '高雅琴', 912345691, '711', '45678901', 55, 'Note here'),
(20240015, '梁志偉', 'oliver@example.com', 'e9f0g1h2', '黑暗匕首', 'image15.jpg', '1993-03-18', '2024-07-01 00:00:00', NULL, 'qr_code15.jpg', 912345692, 'line_oliver', 60015, '台中市', '梁志偉', 912345692, '萊爾富', '56789012', 66, 'Note here'),
(20240016, '潘曉華', 'peter@example.com', 'i3j4k5l6', '魔法鎧', 'image16.jpg', '1984-07-07', '2024-07-01 00:00:00', NULL, 'qr_code16.jpg', 912345693, 'line_peter', 70016, '台南市', '潘曉華', 912345693, 'OK', '67890123', 77, 'Note here'),
(20240017, '馮麗華', 'quincy@example.com', 'm7n8o9p0', '冰霜矛', 'image17.jpg', '1998-12-24', '2024-07-01 00:00:00', NULL, 'qr_code17.jpg', 912345694, 'line_quincy', 80017, '高雄市', '馮麗華', 912345694, '全家', '78901234', 88, 'Note here'),
(20240018, '曹建華', 'rachel@example.com', 'q1r2s3t4', '狂野鎚', 'image18.jpg', '1981-05-03', '2024-07-01 00:00:00', NULL, 'qr_code18.jpg', 912345695, 'line_rachel', 90018, '基隆市', '曹建華', 912345695, '711', '89012345', 99, 'Note here'),
(20240019, '蔣小明', 'steve@example.com', 'u5v6w7x8', '虛空劍', 'image19.jpg', '1996-08-29', '2024-07-01 00:00:00', NULL, 'qr_code19.jpg', 912345696, 'line_steve', 10019, '新竹市', '蔣小明', 912345696, '萊爾富', '90123456', 10, 'Note here'),
(20240020, '楊小莉', 'tina@example.com', 'y9z0a1b2', '迅捷靴', 'image20.jpg', '1999-01-11', '2024-07-01 00:00:00', NULL, 'qr_code20.jpg', 912345697, 'line_tina', 20020, '台北市', '楊小莉', 912345697, 'OK', '01234567', 21, 'Note here'),
(20240021, '王一', 'alice1@example.com', 'a1b2c3d4', '快樂海豚', 'image21.jpg', '1985-05-15', '2024-07-01 00:00:00', NULL, 'qr_code21.jpg', 912345700, 'line_alice1', 10021, '台北市', '王一', 912345700, '全家', '23456789', 12, 'Note here'),
(20240022, '李二', 'bob1@example.com', 'e5f6g7h8', '神秘貓頭鷹', 'image22.jpg', '1992-03-22', '2024-07-01 00:00:00', NULL, 'qr_code22.jpg', 912345701, 'line_bob1', 20022, '新北市', '李二', 912345701, '711', '34567890', 23, 'Note here'),
(20240023, '陳三', 'charlie1@example.com', 'i9j0k1l2', '優雅孔雀', 'image23.jpg', '1987-07-13', '2024-07-01 00:00:00', NULL, 'qr_code23.jpg', 912345702, 'line_charlie1', 30023, '桃園市', '陳三', 912345702, '萊爾富', '45678901', 34, 'Note here'),
(20240024, '張四', 'david1@example.com', 'm3n4o5p6', '靈巧狐狸', 'image24.jpg', '1995-10-30', '2024-07-01 00:00:00', NULL, 'qr_code24.jpg', 912345703, 'line_david1', 40024, '台中市', '張四', 912345703, 'OK', '56789012', 45, 'Note here'),
(20240025, '林五', 'eve1@example.com', 'q7r8s9t0', '勇敢獅子', 'image25.jpg', '2000-01-20', '2024-07-01 00:00:00', NULL, 'qr_code25.jpg', 912345704, 'line_eve1', 50025, '台南市', '林五', 912345704, '全家', '67890123', 56, 'Note here'),
(20240026, '黃六', 'frank1@example.com', 'u1v2w3x4', '魅惑豹', 'image26.jpg', '1988-04-25', '2024-07-01 00:00:00', NULL, 'qr_code26.jpg', 912345705, 'line_frank1', 60026, '高雄市', '黃六', 912345705, '711', '78901234', 67, 'Note here'),
(20240027, '周七', 'grace1@example.com', 'y5z6a7b8', '神聖箭', 'image27.jpg', '1991-09-09', '2024-07-01 00:00:00', NULL, 'qr_code27.jpg', 912345706, 'line_grace1', 70027, '基隆市', '周七', 912345706, '萊爾富', '89012345', 78, 'Note here'),
(20240028, '鄭八', 'hannah1@example.com', 'c1d2e3f4', '俏皮海獺', 'image28.jpg', '1983-11-27', '2024-07-01 00:00:00', NULL, 'qr_code28.jpg', 912345707, 'line_hannah1', 80028, '新竹市', '鄭八', 912345707, 'OK', '90123456', 89, 'Note here'),
(20240029, '趙九', 'isaac1@example.com', 'g5h6i7j8', '驚艷紅鶴', 'image29.jpg', '1994-02-14', '2024-07-01 00:00:00', NULL, 'qr_code29.jpg', 912345708, 'line_isaac1', 90029, '台中市', '趙九', 912345708, '全家', '01234567', 90, 'Note here'),
(20240030, '劉十', 'jack1@example.com', 'k9l0m1n2', '獨立貓', 'image30.jpg', '1986-12-01', '2024-07-01 00:00:00', NULL, 'qr_code30.jpg', 912345709, 'line_jack1', 10030, '台南市', '劉十', 912345709, '711', '12345678', 11, 'Note here'),
(20240031, '徐十一', 'kate1@example.com', 'o3p4q5r6', '強壯水牛', 'image31.jpg', '1990-06-16', '2024-07-01 00:00:00', NULL, 'qr_code31.jpg', 912345710, 'line_kate1', 20031, '高雄市', '徐十一', 912345710, '萊爾富', '23456789', 22, 'Note here'),
(20240032, '吳十二', 'linda1@example.com', 's7t8u9v0', '靜謐天鵝', 'image32.jpg', '1989-08-08', '2024-07-01 00:00:00', NULL, 'qr_code32.jpg', 912345711, 'line_linda1', 30032, '台北市', '吳十二', 912345711, 'OK', '34567890', 33, 'Note here'),
(20240033, '何十三', 'mike1@example.com', 'w1x2y3z4', '火焰劍', 'image33.jpg', '1997-04-01', '2024-07-01 00:00:00', NULL, 'qr_code33.jpg', 912345712, 'line_mike1', 40033, '新北市', '何十三', 912345712, '全家', '45678901', 44, 'Note here'),
(20240034, '高十四', 'nancy1@example.com', 'a5b6c7d8', '雷電盾', 'image34.jpg', '1982-10-15', '2024-07-01 00:00:00', NULL, 'qr_code34.jpg', 912345713, 'line_nancy1', 50034, '桃園市', '高十四', 912345713, '711', '56789012', 55, 'Note here'),
(20240035, '梁十五', 'oliver1@example.com', 'e9f0g1h2', '黑暗匕首', 'image35.jpg', '1993-03-18', '2024-07-01 00:00:00', NULL, 'qr_code35.jpg', 912345714, 'line_oliver1', 60035, '台中市', '梁十五', 912345714, '萊爾富', '67890123', 66, 'Note here'),
(20240036, '潘十六', 'peter1@example.com', 'i3j4k5l6', '魔法鎧', 'image36.jpg', '1984-07-07', '2024-07-01 00:00:00', NULL, 'qr_code36.jpg', 912345715, 'line_peter1', 70036, '台南市', '潘十六', 912345715, 'OK', '78901234', 77, 'Note here'),
(20240037, '馮十七', 'quincy1@example.com', 'm7n8o9p0', '冰霜矛', 'image37.jpg', '1998-12-24', '2024-07-01 00:00:00', NULL, 'qr_code37.jpg', 912345716, 'line_quincy1', 80037, '高雄市', '馮十七', 912345716, '全家', '89012345', 88, 'Note here'),
(20240038, '曹十八', 'rachel1@example.com', 'q1r2s3t4', '狂野鎚', 'image38.jpg', '1981-05-03', '2024-07-01 00:00:00', NULL, 'qr_code38.jpg', 912345717, 'line_rachel1', 90038, '基隆市', '曹十八', 912345717, '711', '90123456', 99, 'Note here'),
(20240039, '丁十九', 'sam1@example.com', 'u5v6w7x8', '迅捷弓', 'image39.jpg', '1996-08-29', '2024-07-01 00:00:00', NULL, 'qr_code39.jpg', 912345718, 'line_sam1', 10039, '新竹市', '丁十九', 912345718, '萊爾富', '01234567', 10, 'Note here'),
(20240040, '鄧二十', 'tina1@example.com', 'y9z0a1b2', '閃電矛', 'image40.jpg', '1999-01-11', '2024-07-01 00:00:00', NULL, 'qr_code40.jpg', 912345719, 'line_tina1', 20040, '台北市', '鄧二十', 912345719, 'OK', '12345678', 21, 'Note here'),
(20240041, '田二十一', 'ursula1@example.com', 'c3d4e5f6', '烈焰弓', 'image41.jpg', '1992-04-21', '2024-07-01 00:00:00', NULL, 'qr_code41.jpg', 912345720, 'line_ursula1', 30041, '新北市', '田二十一', 912345720, '全家', '23456789', 32, 'Note here'),
(20240042, '朱二十二', 'victor1@example.com', 'g7h8i9j0', '暗影盾', 'image42.jpg', '1988-12-30', '2024-07-01 00:00:00', NULL, 'qr_code42.jpg', 912345721, 'line_victor1', 40042, '桃園市', '朱二十二', 912345721, '711', '34567890', 43, 'Note here'),
(20240043, '江二十三', 'wendy1@example.com', 'k1l2m3n4', '光明劍', 'image43.jpg', '1984-09-17', '2024-07-01 00:00:00', NULL, 'qr_code43.jpg', 912345722, 'line_wendy1', 50043, '台中市', '江二十三', 912345722, '萊爾富', '23456789', 32, 'Note here');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `favorlist`
--
ALTER TABLE `favorlist`
  ADD PRIMARY KEY (`favor_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `qr_img` (`qr_img`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `line_id` (`line_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `favorlist`
--
ALTER TABLE `favorlist`
  MODIFY `favor_id` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_history`
--
ALTER TABLE `order_history`
  MODIFY `history_id` int NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20240046;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `favorlist`
--
ALTER TABLE `favorlist`
  ADD CONSTRAINT `favorlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`);

--
-- 資料表的限制式 `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
