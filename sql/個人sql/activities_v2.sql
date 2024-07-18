-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-07-16 05:13:00
-- 伺服器版本： 9.0.0
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
(25, 3, 20240001, 4, 1),
(26, 3, 20240002, 5, 1),
(27, 4, 20240003, 4, 0),
(28, 4, 20240004, 3, 1),
(29, 5, 20240005, 5, 1),
(30, 5, 20240006, 5, 0);

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
(3, '桌遊-阿瓦隆', '2024-06-30', 20240011, 'Entertainment', '2024-07-03 12:00:00', '遊戲中玩家分成兩大陣營，每個陣營內有能力者和普通角色，玩家要通過邏輯推理和對話來試探彼此的陣營。和狼人殺不同的是，遊戲中玩家不會被殺出局。'),
(4, '密室逃脫-埃及', '2024-09-28', 20240041, 'Arts', '2024-07-04 13:00:00', '探索古埃及金字塔的秘密，解開法老的詛咒，破解謎題逃脫。挑戰你的智慧與膽識，享受驚險刺激的冒險旅程。'),
(5, 'TCG-遊戲王店家賽', '2024-05-18', 20240043, 'Health', '2024-07-05 14:00:00', '除了遊戲用的規則, 官方活動和比賽有自己的官方規則維護公平和友好的遊戲環境。\r\n為了避免任何誤解, 強烈建議在比賽前閱讀規則。'),
(6, '密室逃脫-冒險王', '2024-04-20', 20240039, 'Health', '2024-07-05 14:00:00', '玩家們直呼這個價格可以玩到此等高規格的遊戲根本超值，《冒險王》才推出短短數個月已成為玩家口中的台中必玩密室第一名，在小編行文的當下據說接下來三個月的假日場次都已經額滿！'),
(7, '狼人殺-8人局', '2024-05-25', 20240042, 'Sports', '2024-07-01 10:00:00', '諸神黃昏:預言家+女巫+獵人+守衛+白痴/狼王+白狼王+惡靈騎士\r\n雙身分:預言家+女巫+獵人+守衛+白癡+禁言長老+6平民/2狼人+潛行狼\r\n末日狂徒:預言家+守衛+騎士+2平民/3狼人'),
(8, 'TCG-闇影詩章', '2024-07-15', 20240008, 'Education', '2024-07-02 11:00:00', '參加闇影詩章卡牌對戰，展示你的戰術與策略，與其他玩家一較高下，爭奪勝利與榮譽，贏取豐厚獎勵。\r\n'),
(9, '桌遊-矮人礦坑', '2024-08-26', 20240006, 'Entertainment', '2024-07-03 12:00:00', '透過每個人的行動來判斷對方的意圖，並適時的迴避或陷害對方，進而完成自己的目的。\r\n即便你自己埋頭苦幹也沒用！你還得把自己的隊員們通通喚醒，要小心自己千萬別成為那個搞不清楚狀況的小矮人。'),
(10, 'TCG-WS銀包賽12人', '2024-06-20', 20240020, 'Arts', '2024-07-04 13:00:00', '參加12人卡牌對戰比賽，展現你的策略與實力，爭奪冠軍榮耀，贏取豐厚獎品。快來挑戰你的對手吧！'),
(11, 'TCG-寶可夢城市大賽', '2024-09-30', 20240040, 'Health', '2024-07-05 14:00:00', '城市聯盟賽，並於300名以下玩家參賽的城市聯盟中賽獲得前 8 名，或300名以上玩家參賽的城市聯盟賽獲得前 16 名的玩家，無須參加抽籤即可受邀參賽。獲得資格選手請務必填寫優勝選手表單，以確認參加資訊'),
(12, '狼人殺-12人局', '2024-02-25', 20240021, 'Health', '2024-07-05 14:00:00', '狼人陣營：2小狼，2大狼（狼王，白狼王，惡靈騎士，狼美人，石像鬼，隱狼，血月使徒，當中隨機選擇2個大狼發放）\r\n\r\n好人陣營：3平民，5神職（預言家，女巫，獵人，守衛，白痴，騎士，攝夢人，魔術師，守墓人，烏鴉，獵魔人，當中隨機選擇5個神職發放）'),
(13, '狼人殺-6人菜雞版', '2024-10-25', 20240003, 'your_default_value_for_act_type', '2024-07-15 00:18:42', '明牌局:預言家+獵人+2平民/2狼人\r\n暗牌局:預言家+守衛+2平民/2狼人'),
(14, 'TCG-寶可夢聯盟大賽', '2024-06-30', 20240022, 'default_value_for_act_type', '2024-07-14 18:24:00', '期間所舉辦的城市聯盟賽，並於300名以下玩家參賽的城市聯盟中賽獲得前 8 名，或300名以上玩家參賽的城市聯盟賽獲得前 16 名的玩家，無須參加抽籤即可受邀參賽。'),
(15, '密室逃脫-辛亥隧道', '2024-07-25', 20240007, 'default_value_for_act_type', '2024-07-14 18:24:23', '玩家必須真的在隧道中自行開車，而狹長看不見盡頭的隧道場景更是營造出一種無處可逃的絕望氣氛，讓所有上車的玩家印象深刻。雖然說是恐怖遊戲，但劇情的部分也絲毫不馬虎，遊戲途中使用的每一項道具都背後都藏著一段悲傷的故事，無怪乎能夠獲得「劇情最優」、「機關最強」、「場景最狂」、「氣氛最佳」等多項第一。'),
(17, '劇本殺-病毒在跳舞', '2024-05-24', 20240023, 'default_value_for_act_type', '2024-07-14 18:46:16', '每名玩家皆各自扮演在前線做防疫工作的人員，必須透過適合的藥物卡，來醫治被病毒卡感染的器官，也能適時打出各種強大的醫療卡，來改變與其他玩家間的狀態，而最先擁有四個不同健康器官的玩家即可獲勝。\r\n'),
(18, '狼人殺-12人局', '2024-07-10', 20240009, 'default_value_for_act_type', '2024-07-15 04:38:50', '3小狼，1大狼（狼王，白狼王，惡靈騎士，狼美人，石像鬼，隱狼，血月使徒，噩夢之影，當中隨機選擇一個大狼發放）\r\n\r\n4平民，4神職（預言家，女巫，獵人，守衛，白痴，騎士，攝夢人，魔術師，守墓人，烏鴉，獵魔人，奇蹟商人，當中隨機選擇4個神職發放）'),
(19, '狼人殺-9人局', '2024-03-18', 20240024, 'default_value_for_act_type', '2024-07-15 05:13:02', '暗牌局:預言家+女巫+獵人+3平民/3狼人\r\n飯局狼人殺:熊+女巫+獵人+3平民+高級村民/狼人+種狼'),
(20, '狼人殺-10人局', '2024-03-15', 20240025, 'default_value_for_act_type', '2024-07-15 05:14:07', '十人局是一個不平衡的板子，一般配置為三神四民三狼，狼隊殺剩一民可視為屠民獲勝。'),
(21, '劇本殺-微笑謎藏', '2024-05-10', 20240026, 'default_value_for_act_type', '2024-07-15 05:16:47', '在《微笑謎藏》中，不僅需要進行角色個人任務，更需要在緊張的氣氛中協助其他隊友完成任務，避開潛伏在暗處且隨時可能出現的危機。此遊戲還有多重結局，許多玩家在玩過第一次後當場決定二刷三刷，因為實在太想以別的角色視角了解劇情，並且看看不同路線的結局到底還有什麼花樣可玩！'),
(22, '劇本殺-禁錮之宅', '2024-09-18', 20240005, 'default_value_for_act_type', '2024-07-15 05:18:03', '《壹零玖伍：禁錮之宅》遊玩過程充滿歡笑，有著大空間、多房間、爬上爬下的特性。工作室主打這款主題是「微恐歡樂又健身」，多找幾個膽子大的朋友一起來玩這款台中必玩密室逃脫：《壹零玖伍：禁錮之宅》吧！'),
(23, '密室逃脫-陰緣', '2024-06-05', 20240027, 'default_value_for_act_type', '2024-07-15 05:19:07', '《陰緣》有分開行動的「合作版」以及共同行動（四人限定）的「沈浸版」，可依據玩家人數選擇適合的版本。下回來宜蘭玩時，不妨也將《陰緣》排進行程吧！'),
(24, '密室逃脫-百鬼夜行', '2024-02-22', 20240028, 'default_value_for_act_type', '2024-07-15 05:20:03', '《百鬼夜行》在本屆選拔賽初賽中各類別都獲得不錯的名次，可惜稍微差一些就能夠進入決賽。'),
(25, '密室逃脫-地心任務', '2024-02-28', 20240029, 'default_value_for_act_type', '2024-07-15 05:20:44', '這款遊戲不僅歷經多個場景，而且每個場景的做工都非常細緻，就算是比較不擅長解謎的朋友，光是來看看這場景都會不由自主發出讚嘆！'),
(26, 'TCG-寶可夢店家賽', '2024-03-08', 20240030, 'default_value_for_act_type', '2024-07-15 05:23:28', '參加12人卡牌對戰比賽，展現你的策略與實力，爭奪冠軍榮耀，贏取豐厚獎品。快來挑戰你的對手吧！'),
(27, 'TCG-WS銀包賽32人', '2024-04-18', 20240031, 'default_value_for_act_type', '2024-07-15 05:24:34', '參加32人卡牌對戰比賽，展現你的策略與實力，爭奪冠軍榮耀，贏取豐厚獎品。快來挑戰你的對手吧！'),
(28, 'TCG-遊戲王地區', '2024-06-18', 20240032, 'Health', '2024-07-05 14:00:00', '除了遊戲用的規則, 官方活動和比賽有自己的官方規則維護公平和友好的遊戲環境。\r\n為了避免任何誤解, 強烈建議在比賽前閱讀規則。'),
(29, 'TCG-闇影詩章店家賽', '2024-10-15', 20240004, 'Education', '2024-07-02 11:00:00', '參加闇影詩章卡牌對戰，展示你的戰術與策略，與其他玩家一較高下，爭奪勝利與榮譽，贏取豐厚獎勵。\r\n'),
(30, '桌遊-UNO', '2024-11-05', 20240002, 'default_value_for_act_type', '2024-07-15 05:32:41', '我是經典 不用解釋吧!'),
(31, '桌遊-13道線索', '2024-04-10', 20240033, 'default_value_for_act_type', '2024-07-15 05:34:50', '數起兇殘的犯罪案件震驚了1899年的倫敦，謎樣的案情掩蓋了真相，蘇格蘭警場在黑暗中摸索，號召一群優秀的偵探前來協助破案。'),
(32, '桌遊-遵命！黑魔王', '2024-07-06', 20240010, 'default_value_for_act_type', '2024-07-15 05:35:41', '「黑魔王」雷格．魔提斯冷眼看著他匍匐在地上發抖的黑小鬼們，他的邪惡計劃又再次受挫，有人必須為這次的失敗付出代價，黑小鬼們需要敏捷的思緒和流利的口才，方能避免被黑魔王的怒火化為灰燼！'),
(33, '密室逃脫-黑城堡', '2024-05-08', 20240001, 'default_value_for_act_type', '2024-07-15 05:41:36', '「黑魔王」雷格．魔提斯冷眼看著他匍匐在地上發抖的黑小鬼們，他的邪惡計劃又再次受挫，有人必須為這次的失敗付出代價，黑小鬼們需要敏捷的思緒和流利的口才，方能避免被黑魔王的怒火化為灰燼！');

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
  ADD PRIMARY KEY (`act_id`),
  ADD KEY `actbook_ibfk_3` (`user_id`);

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
-- 使用資料表自動遞增(AUTO_INCREMENT) `actbook`
--
ALTER TABLE `actbook`
  MODIFY `act_book_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `actlist`
--
ALTER TABLE `actlist`
  MODIFY `act_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
-- 資料表的限制式 `actbook`
--
ALTER TABLE `actbook`
  ADD CONSTRAINT `actbook_ibfk_1` FOREIGN KEY (`act_id`) REFERENCES `actlist` (`act_id`),
  ADD CONSTRAINT `actbook_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 資料表的限制式 `actlist`
--
ALTER TABLE `actlist`
  ADD CONSTRAINT `actbook_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

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
