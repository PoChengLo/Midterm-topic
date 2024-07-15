-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-07-15 05:51:38
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
(3, '桌遊-阿瓦隆', '2024-06-30', 5, 'Entertainment', '2024-07-03 12:00:00', '遊戲中玩家分成兩大陣營，每個陣營內有能力者和普通角色，玩家要通過邏輯推理和對話來試探彼此的陣營。和狼人殺不同的是，遊戲中玩家不會被殺出局。'),
(4, '密室逃脫-埃及', '2024-09-28', 4, 'Arts', '2024-07-04 13:00:00', '探索古埃及金字塔的秘密，解開法老的詛咒，破解謎題逃脫。挑戰你的智慧與膽識，享受驚險刺激的冒險旅程。'),
(5, 'TCG-遊戲王店家賽', '2024-05-18', 5, 'Health', '2024-07-05 14:00:00', '除了遊戲用的規則, 官方活動和比賽有自己的官方規則維護公平和友好的遊戲環境。\r\n為了避免任何誤解, 強烈建議在比賽前閱讀規則。'),
(6, '密室逃脫-冒險王', '2024-04-20', 1, 'Health', '2024-07-05 14:00:00', '玩家們直呼這個價格可以玩到此等高規格的遊戲根本超值，《冒險王》才推出短短數個月已成為玩家口中的台中必玩密室第一名，在小編行文的當下據說接下來三個月的假日場次都已經額滿！'),
(7, '狼人殺-8人局', '2024-05-25', 4, 'Sports', '2024-07-01 10:00:00', '諸神黃昏:預言家+女巫+獵人+守衛+白痴/狼王+白狼王+惡靈騎士\r\n雙身分:預言家+女巫+獵人+守衛+白癡+禁言長老+6平民/2狼人+潛行狼\r\n末日狂徒:預言家+守衛+騎士+2平民/3狼人'),
(8, 'TCG-闇影詩章', '2024-07-15', 3, 'Education', '2024-07-02 11:00:00', '參加闇影詩章卡牌對戰，展示你的戰術與策略，與其他玩家一較高下，爭奪勝利與榮譽，贏取豐厚獎勵。\r\n'),
(9, '桌遊-矮人礦坑', '2024-08-26', 2, 'Entertainment', '2024-07-03 12:00:00', '透過每個人的行動來判斷對方的意圖，並適時的迴避或陷害對方，進而完成自己的目的。\r\n即便你自己埋頭苦幹也沒用！你還得把自己的隊員們通通喚醒，要小心自己千萬別成為那個搞不清楚狀況的小矮人。'),
(10, 'TCG-WS銀包賽12人', '2024-06-20', 1, 'Arts', '2024-07-04 13:00:00', '參加12人卡牌對戰比賽，展現你的策略與實力，爭奪冠軍榮耀，贏取豐厚獎品。快來挑戰你的對手吧！'),
(11, 'TCG-寶可夢城市大賽', '2024-09-30', 1, 'Health', '2024-07-05 14:00:00', '城市聯盟賽，並於300名以下玩家參賽的城市聯盟中賽獲得前 8 名，或300名以上玩家參賽的城市聯盟賽獲得前 16 名的玩家，無須參加抽籤即可受邀參賽。獲得資格選手請務必填寫優勝選手表單，以確認參加資訊'),
(12, '狼人殺-12人局', '2024-02-25', 3, 'Health', '2024-07-05 14:00:00', '狼人陣營：2小狼，2大狼（狼王，白狼王，惡靈騎士，狼美人，石像鬼，隱狼，血月使徒，當中隨機選擇2個大狼發放）\r\n\r\n好人陣營：3平民，5神職（預言家，女巫，獵人，守衛，白痴，騎士，攝夢人，魔術師，守墓人，烏鴉，獵魔人，當中隨機選擇5個神職發放）'),
(13, '狼人殺-6人菜雞版', '2024-10-25', 2, 'your_default_value_for_act_type', '2024-07-15 00:18:42', '明牌局:預言家+獵人+2平民/2狼人\r\n暗牌局:預言家+守衛+2平民/2狼人'),
(14, 'TCG-寶可夢聯盟大賽', '2024-06-30', 3, 'default_value_for_act_type', '2024-07-14 18:24:00', '期間所舉辦的城市聯盟賽，並於300名以下玩家參賽的城市聯盟中賽獲得前 8 名，或300名以上玩家參賽的城市聯盟賽獲得前 16 名的玩家，無須參加抽籤即可受邀參賽。'),
(15, '密室逃脫-辛亥隧道', '2024-07-25', 2, 'default_value_for_act_type', '2024-07-14 18:24:23', '玩家必須真的在隧道中自行開車，而狹長看不見盡頭的隧道場景更是營造出一種無處可逃的絕望氣氛，讓所有上車的玩家印象深刻。雖然說是恐怖遊戲，但劇情的部分也絲毫不馬虎，遊戲途中使用的每一項道具都背後都藏著一段悲傷的故事，無怪乎能夠獲得「劇情最優」、「機關最強」、「場景最狂」、「氣氛最佳」等多項第一。'),
(17, '劇本殺-病毒在跳舞', '2024-05-24', 3, 'default_value_for_act_type', '2024-07-14 18:46:16', '每名玩家皆各自扮演在前線做防疫工作的人員，必須透過適合的藥物卡，來醫治被病毒卡感染的器官，也能適時打出各種強大的醫療卡，來改變與其他玩家間的狀態，而最先擁有四個不同健康器官的玩家即可獲勝。\r\n'),
(18, '狼人殺-12人局', '2024-07-10', 4, 'default_value_for_act_type', '2024-07-15 04:38:50', '3小狼，1大狼（狼王，白狼王，惡靈騎士，狼美人，石像鬼，隱狼，血月使徒，噩夢之影，當中隨機選擇一個大狼發放）\r\n\r\n4平民，4神職（預言家，女巫，獵人，守衛，白痴，騎士，攝夢人，魔術師，守墓人，烏鴉，獵魔人，奇蹟商人，當中隨機選擇4個神職發放）'),
(19, '狼人殺-9人局', '2024-03-18', 1, 'default_value_for_act_type', '2024-07-15 05:13:02', '暗牌局:預言家+女巫+獵人+3平民/3狼人\r\n飯局狼人殺:熊+女巫+獵人+3平民+高級村民/狼人+種狼'),
(20, '狼人殺-10人局', '2024-03-15', 2, 'default_value_for_act_type', '2024-07-15 05:14:07', '十人局是一個不平衡的板子，一般配置為三神四民三狼，狼隊殺剩一民可視為屠民獲勝。'),
(21, '劇本殺-微笑謎藏', '2024-05-10', 4, 'default_value_for_act_type', '2024-07-15 05:16:47', '在《微笑謎藏》中，不僅需要進行角色個人任務，更需要在緊張的氣氛中協助其他隊友完成任務，避開潛伏在暗處且隨時可能出現的危機。此遊戲還有多重結局，許多玩家在玩過第一次後當場決定二刷三刷，因為實在太想以別的角色視角了解劇情，並且看看不同路線的結局到底還有什麼花樣可玩！'),
(22, '劇本殺-禁錮之宅', '2024-09-18', 5, 'default_value_for_act_type', '2024-07-15 05:18:03', '《壹零玖伍：禁錮之宅》遊玩過程充滿歡笑，有著大空間、多房間、爬上爬下的特性。工作室主打這款主題是「微恐歡樂又健身」，多找幾個膽子大的朋友一起來玩這款台中必玩密室逃脫：《壹零玖伍：禁錮之宅》吧！'),
(23, '密室逃脫-陰緣', '2024-06-05', 1, 'default_value_for_act_type', '2024-07-15 05:19:07', '《陰緣》有分開行動的「合作版」以及共同行動（四人限定）的「沈浸版」，可依據玩家人數選擇適合的版本。下回來宜蘭玩時，不妨也將《陰緣》排進行程吧！'),
(24, '密室逃脫-百鬼夜行', '2024-02-22', 1, 'default_value_for_act_type', '2024-07-15 05:20:03', '《百鬼夜行》在本屆選拔賽初賽中各類別都獲得不錯的名次，可惜稍微差一些就能夠進入決賽。'),
(25, '密室逃脫-地心任務', '2024-02-28', 2, 'default_value_for_act_type', '2024-07-15 05:20:44', '這款遊戲不僅歷經多個場景，而且每個場景的做工都非常細緻，就算是比較不擅長解謎的朋友，光是來看看這場景都會不由自主發出讚嘆！'),
(26, 'TCG-寶可夢店家賽', '2024-03-08', 1, 'default_value_for_act_type', '2024-07-15 05:23:28', '參加12人卡牌對戰比賽，展現你的策略與實力，爭奪冠軍榮耀，贏取豐厚獎品。快來挑戰你的對手吧！'),
(27, 'TCG-WS銀包賽32人', '2024-04-18', 3, 'default_value_for_act_type', '2024-07-15 05:24:34', '參加32人卡牌對戰比賽，展現你的策略與實力，爭奪冠軍榮耀，贏取豐厚獎品。快來挑戰你的對手吧！'),
(28, 'TCG-遊戲王地區', '2024-06-18', 5, 'Health', '2024-07-05 14:00:00', '除了遊戲用的規則, 官方活動和比賽有自己的官方規則維護公平和友好的遊戲環境。\r\n為了避免任何誤解, 強烈建議在比賽前閱讀規則。'),
(29, 'TCG-闇影詩章店家賽', '2024-10-15', 3, 'Education', '2024-07-02 11:00:00', '參加闇影詩章卡牌對戰，展示你的戰術與策略，與其他玩家一較高下，爭奪勝利與榮譽，贏取豐厚獎勵。\r\n'),
(30, '桌遊-UNO', '2024-11-05', 1, 'default_value_for_act_type', '2024-07-15 05:32:41', '啊!我就經典 不用解釋吧!'),
(31, '桌遊-13道線索', '2024-04-10', 3, 'default_value_for_act_type', '2024-07-15 05:34:50', '數起兇殘的犯罪案件震驚了1899年的倫敦，謎樣的案情掩蓋了真相，蘇格蘭警場在黑暗中摸索，號召一群優秀的偵探前來協助破案。'),
(32, '桌遊-遵命！黑魔王', '2024-07-06', 1, 'default_value_for_act_type', '2024-07-15 05:35:41', '「黑魔王」雷格．魔提斯冷眼看著他匍匐在地上發抖的黑小鬼們，他的邪惡計劃又再次受挫，有人必須為這次的失敗付出代價，黑小鬼們需要敏捷的思緒和流利的口才，方能避免被黑魔王的怒火化為灰燼！'),
(33, '密室逃脫-黑城堡', '2024-05-08', 1, 'default_value_for_act_type', '2024-07-15 05:41:36', '「黑魔王」雷格．魔提斯冷眼看著他匍匐在地上發抖的黑小鬼們，他的邪惡計劃又再次受挫，有人必須為這次的失敗付出代價，黑小鬼們需要敏捷的思緒和流利的口才，方能避免被黑魔王的怒火化為灰燼！');

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
(1, '書蒸娼天', 'john@example.com'),
(2, '螞寶國師', 'jane@example.com'),
(3, '皇國娼生', 'mike@example.com'),
(4, '猴友姨媽', 'emily@example.com'),
(5, '晨騎麥香', 'chris@example.com');

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
  MODIFY `act_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
