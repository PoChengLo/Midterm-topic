-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-07-29 07:48:28
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
  `prod_id` int NOT NULL,
  `add_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `orderlist`
--

CREATE TABLE `orderlist` (
  `ord_id` int NOT NULL,
  `ord_date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `ord_total` decimal(8,0) NOT NULL,
  `ord_pay` tinyint(1) NOT NULL,
  `ship_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='訂單列表';

--
-- 傾印資料表的資料 `orderlist`
--

INSERT INTO `orderlist` (`ord_id`, `ord_date`, `user_id`, `ord_total`, `ord_pay`, `ship_date`) VALUES
(1, '2024-01-12 13:22:34', 23, 1500, 1, '2024-01-15 10:22:34'),
(2, '2023-05-17 11:45:23', 76, 3000, 0, '2023-05-20 14:45:23'),
(3, '2023-11-29 16:33:12', 98, 2100, 1, '2023-12-02 13:33:12'),
(4, '2024-03-08 10:09:45', 12, 800, 1, '2024-03-11 13:09:45'),
(5, '2024-02-21 15:12:01', 53, 3500, 0, '2024-02-24 12:12:01'),
(6, '2023-04-04 09:34:22', 89, 1200, 1, '2023-04-07 12:34:22'),
(7, '2023-07-23 14:56:19', 35, 2700, 1, '2023-07-26 11:56:19'),
(8, '2024-06-14 18:23:56', 15, 1900, 0, '2024-06-17 15:23:56'),
(9, '2023-12-25 11:44:33', 62, 4000, 1, '2023-12-28 14:44:33'),
(10, '2024-01-05 12:33:21', 97, 1600, 0, '2024-01-08 15:33:21');

-- --------------------------------------------------------

--
-- 資料表結構 `order_history`
--

CREATE TABLE `order_history` (
  `history_id` int NOT NULL,
  `user_id` int NOT NULL,
  `ord_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `order_history`
--

INSERT INTO `order_history` (`history_id`, `user_id`, `ord_id`) VALUES
(1, 20240023, 10),
(2, 20240024, 9),
(3, 20240025, 8),
(4, 20240026, 7),
(5, 20240027, 6),
(6, 20240028, 5),
(7, 20240029, 4),
(8, 20240030, 3),
(9, 20240031, 2),
(10, 20240032, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `prodlist`
--

CREATE TABLE `prodlist` (
  `prod_id` int NOT NULL,
  `prod_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_tag_id` int DEFAULT NULL,
  `prod_price` decimal(8,0) DEFAULT NULL,
  `prod_stock` decimal(8,0) DEFAULT NULL,
  `prod_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_disc` decimal(3,2) DEFAULT NULL,
  `prod_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='桌遊商品列表';

--
-- 傾印資料表的資料 `prodlist`
--

INSERT INTO `prodlist` (`prod_id`, `prod_name`, `prod_tag_id`, `prod_price`, `prod_stock`, `prod_img`, `prod_desc`, `prod_disc`, `prod_update`) VALUES
(1, '龍之遺跡 (Dragon’s Legacy)', 1, 1200, 20, '001.jpeg', '背景故事：在遙遠的大陸上，有一座神秘的城堡，據說裡面藏著龍的寶藏。這座城堡被稱為「龍之遺跡」。傳說中，這位巨龍曾是一位強大的魔法師，他的寶藏包含了無數的寶石、魔法物品和知識。冒險者們聞風而至，希望能夠一探究竟，但城堡充滿了陷阱、謎題和神秘的魔法，只有最勇敢的人才能夠成功。', 1.00, '2024-06-01 09:00:00'),
(2, '幽靈船 (Ghost Ship))', 2, 900, 20, '002.jpeg', '背景故事：在一個風暴肆虐的夜晚，一艘幽靈船漂浮在海上。這艘船曾經是可怕的海盜船，現在卻成了鬼魂的家。船上的幽靈船員試圖找到失散的寶藏，但他們必須面對詛咒和鬼魂的威脅。每個角落都隱藏著危險，但寶藏就在眼前。', 0.90, '2024-02-11 12:00:00'),
(3, '奇幻競技場 (Fantasy Arena)', 3, 1500, 10, '003.jpeg', '背景故事：在一個神秘的競技場中，不同種族的戰士、法師和怪物聚集在一起，為了榮譽和寶物而戰。這個競技場由神秘的魔法師創造，中央有一個傳送門，通向其他世界。每個角色都有獨特的技能，每場比賽都是一場驚心動魄的戰鬥。', 0.85, '2023-11-11 11:11:11'),
(4, '時光迷宮 (Chrono Labyrinth)', 4, 2500, 13, '004.jpeg', '背景故事：在一個神秘的森林深處，有一座古老的迷宮，被稱為「時光迷宮」。這個迷宮不僅是空間的迷宮，還是時間的迷宮。每個房間都通往不同的時代，從史前時代到遙遠的未來，甚至是平行宇宙。傳說中，時光迷宮的中心藏著一個能夠改變歷史的神秘寶物。', 1.00, '2023-05-02 09:15:00'),
(5, '魔法糖果工廠 (Enchanted Candy Factory)', 5, 2100, 20, '005.jpeg', '背景故事：在一個彩色繽紛的世界中，有一座神奇的糖果工廠，名為「魔法糖果工廠」。這個工廠由一位古老的糖果師傅創立，他擁有神秘的魔法技能，能夠製作出令人驚艷的糖果。這些糖果不僅美味，還具有奇幻的效果，例如讓人飛行、變小或甚至穿越時空。', 0.75, '2023-05-05 15:10:00'),
(6, '魔法餐廳 (Enchanted Bistro)', 6, 1300, 13, '006.jpeg', '故事背景：在一個隱藏於森林深處的神秘餐廳，糖果、藥草和魔法交織成美味佳餚。這裡的廚師是糖果精靈和烹飪巫師，他們的料理能夠賦予食客不同的魔法效果。每道菜都是一場奇幻的冒險，每個客人都是一位冒險者。', 0.95, '2024-09-09 09:00:00'),
(7, '詭異時光錶 (Eerie Hourglass)', 7, 1950, 19, '007.jpeg', '背景故事： 一個神秘的沙漏能夠穿越時空，將人們帶到不同的年代。但每次使用都會引發詭異事件，需要解開謎題才能回到現實。這款神秘的時光錶是一位古老的時間守護者所創造。它看似一個普通的沙漏，但卻擁有非凡的力量。每當你翻轉它，你就能夠穿越到不同的年代，體驗過去和未來的奇幻世界。然而，使用時光錶總是伴隨著詭異事件，需要解開謎題才能回到現實。', 1.00, '2024-03-22 15:00:00'),
(8, '笑話大亂鬥 (Joke Brawl)', 8, 1440, 14, '008.jpeg', '背景故事：在一個詼諧的競技場上，各種笑話角色爭奪笑聲之冠。這裡有說冷笑話的小丑、搞笑的外星人、諷刺的詩人，甚至是一位神秘的笑聲使者。每個人都想成為最有趣的人，贏得觀眾的掌聲。你是一位年輕的笑話師，渴望在「笑話大亂鬥」中嶄露頭角。你的目標是成為最搞笑的人，贏得笑聲之冠。在競技場上，你遇到了其他笑話角色，例如「謎語大師」和「語言戰士」。每個人都有自己獨特的笑話技能，例如「語言戰士」可以用文字創造出最詼諧的場景。', 0.70, '2023-06-15 08:00:00'),
(9, '怪獸養成所 (Monster Nursery)', 9, 1600, 15, '009.jpeg', '背景故事： 在一個神秘的怪獸養成所，你是怪獸訓練師。這個養成所位於一座隱藏在樹林中的古老城堡，被魔法結界保護著。你的目標是培養出最可愛、最詭異、最厲害的怪獸，並讓它們成為世界上最受歡迎的寵物。在養成所裡，你遇到了各種奇特的怪獸，例如「毛絨龍」和「幻影貓」。你必須學會如何餵食、訓練和照顧它們，並與其他訓練師交流經驗。', 1.00, '2024-02-22 14:00:00'),
(10, '魔法鬥拳 (Mystic Fisticuffs)', 10, 2400, 5, '010.jpeg', '背景故事： 在一個魔法世界中，各種奇特的生物參加鬥拳比賽，使用魔法技能和特殊招式。這個競技場由神秘的魔法使者創造，中央有一個神奇的鬥拳之石，據說能夠賦予戰士無限的力量。你是一位年輕的戰士，渴望在「魔法鬥拳」中證明自己的實力。你的目標是成為最強的鬥拳戰士，贏得鬥拳之石。', 0.95, '2024-01-01 13:00:00'),
(11, '死亡遊戲 (Game of Mortality)', 11, 3000, 8, '011.jpeg', '背景故事： 艾莉絲·哈珀（Alice Harper）是一位突然得到大量遺產的寡婦。她的丈夫，一位富有的收藏家，意外身亡，留下了一個神秘的遺囑。遺囑中提到了「死亡遊戲」，一場超越生死的詭異競賽。這場遊戲的規則是：參賽者必須在一個古老的莊園中生存下去，找出遊戲的創造者，並打破詛咒。每個參與者都有自己的動機和秘密，而莊園充滿了危險、謎團和不可思議的力量。艾莉絲決定參加這場遊戲，不僅為了解開丈夫的死亡之謎，也是為了尋找自己的目的和意義。她必須在莊園中探索，與其他參與者競爭，並解開遊戲的謎團。但是，每個人都是潛在的兇手，每個線索都是關鍵。在這場生死之間的遊戲中，艾莉絲將面臨極限挑戰，揭示遊戲的真正目的，並找到自己的答案。她的命運與莊園的詭譎之間交織，而她的選擇將決定她的生死。', 1.00, '2024-02-01 13:00:00'),
(12, '推理之夜 (Night of Deduction)', 12, 2800, 11, '012.jpeg', '背景故事： 1841年的倫敦，陰霾籠罩著街頭巷尾。即將退休的老警探亨利·福斯特（Henry Foster）在一生中解決了無數謎團，但他的最後一個案件卻是他職業生涯中最棘手的。這次，他被召集到一座古老的莊園，參加了一場名為「推理之夜」的神秘晚宴。莊園主人是一位神秘的富商，名叫阿爾伯特·蒙哥馬利（Albert Montgomery）。蒙哥馬利先生是一位熱愛謎題和謀殺案的收藏家，他邀請了一群天才推理者、神秘學家和犯罪心理學家參加這場晚宴。每個參與者都有自己的動機和秘密，而蒙哥馬利先生的目的只有一個：解開一個看似不可能的謀殺之謎。在這個古老的莊園中，福斯特老警探必須收集線索、訪問其他參與者，並在晚宴上揭示兇手的身份。但是，每個人都是潛在的兇手，每個線索都是關鍵。而時間在不斷流逝，福斯特老警探必須在退休前解開這個謎團，否則這將成為他職業生涯中的一個遺憾。', 1.00, '2024-03-01 12:00:00'),
(13, '驚悚列車 (Thriller Express)', 13, 1700, 22, '013.jpeg', '背景故事： 剛成年的孤兒，艾娃（Eva），正要前往匈牙利尋找她失散多年的父親。她的唯一線索是一封古老的信，其中提到父親曾在一趟名為「驚悚列車」的火車上工作。這列車並非普通的交通工具，而是一個神秘的移動世界。它穿越歷史、文化和超自然的境界，載著各式各樣的乘客：從神秘的旅行者到危險的犯罪份子，每個人都有自己的目的和秘密。艾娃登上了「驚悚列車」，她的心跳加速，因為她知道這是她與父親重逢的唯一機會。但是，這列車並非只是一趟普通的旅程。在其中，她將面對超自然現象、謎團和危險，而每個車廂都是一個新的挑戰。艾娃必須解開列車上的謎團，找到父親，並揭示驚悚列車背後的真相。她的命運與這趟列車緊密相連，而她的選擇將決定她的未來。', 1.00, '2024-04-01 12:00:00'),
(14, '克蘇魯的遺產 (Cthulhu’s Legacy)', 14, 1900, 12, '014.jpeg', '背景故事： 艾莉森·格雷（Allison Gray）是一位年輕的小說家，她的作品以神秘和超自然元素為主題。某天，她在一個寒冷的冬夜中，做了一個奇怪的夢。在這個夢中，她置身於一個古老的神廟，四周是腐朽的雕像和神秘的符號。在夢中，艾莉森遇見了一位神秘的長者，他名為克蘇魯。克蘇魯是一個失落的神祇，被囚禁在地球上的沉沒城市拉萊耶之下。他的存在超越了人類的理解，他的眼睛閃爍著宇宙的秘密。艾莉森醒來時，她感到自己被這個夢境深深吸引。她開始研究克蘇魯神話，追尋這個失落的神秘世界。她的小說開始受到克蘇魯的影響，她的文字中充滿了古老的符號、禁忌的知識和不可名狀的恐怖。艾莉森的小說逐漸引起了讀者的注意，但同時也引來了危險。她的作品似乎喚醒了克蘇魯，而他的遺產開始影響現實世界。艾莉森必須解開克蘇魯的謎團，找到真相，並保護自己和她所愛的人。', 1.00, '2024-05-01 14:00:00'),
(15, '靈異審判 (Spectral Tribunal)', 15, 2200, 15, '015.jpeg', '背景故事： 在一個被詛咒的小鎮上，靈異現象層出不窮。你是一位靈媒，被召集到一座古老的法庭，解決靈魂的紛爭。每個案件都涉及詭異的事件和不可思議的證據。這座法庭位於一座荒廢的教堂，其木質長椅上仍殘留著靈魂的氣息，而法官則是一位神秘的長者，他的眼睛能洞察靈魂的真相。', 1.00, '2024-04-10 09:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `userinfo`
--

CREATE TABLE `userinfo` (
  `user_id` int NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '$2y$10$VdDD5gG8/YhOVyFde/gICeRQ7H870h46ELekpRE1NXRAfBvH9Huki',
  `nick_name` varchar(255) DEFAULT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `create_day` datetime NOT NULL,
  `last_date` datetime DEFAULT NULL,
  `qr_img` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `line_id` varchar(255) DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `store_firm` varchar(255) DEFAULT NULL,
  `store_id` varchar(255) DEFAULT NULL,
  `history_id` int DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `userinfo`
--

INSERT INTO `userinfo` (`user_id`, `user_name`, `email`, `password`, `nick_name`, `user_img`, `birthday`, `create_day`, `last_date`, `qr_img`, `mobile`, `line_id`, `postal_code`, `address`, `recipient`, `contact_number`, `store_firm`, `store_id`, `history_id`, `note`) VALUES
(20240023, '賣草鞋的', 'alice@example.com', '7dcf407fa84a0e0519c7991154c4148de0244d7589020c0d9842db9efad82094', '活潑松鼠', 'image09.jpg', '1985-05-15', '2024-07-01 00:00:00', NULL, 'qr_code01.jpg', '0912345678', 'line_alice', 10001, '台北市', '王小明', '0912345678', '全家', '12345678', 1, 'Note here'),
(20240024, '嘟嘟', 'bob@example.com', '8bb4c01cc43f617ccfd1d4745b19b5a6030d15b12750b39d60479ae7504a7387', '神秘貓頭鷹', 'image02.jpg', '1992-03-22', '2024-07-01 00:00:00', NULL, 'qr_code02.jpg', '0912345679', 'line_bob', 20002, '新北市', '李華', '0912345679', '711', '23456789', 2, 'Note here'),
(20240025, '大膽曹賊', 'charlie@example.com', 'b2220233e90770a24fbb70547bffab2bacf447aecf6551bf9e3c8a016769cd7f', '優雅孔雀', 'image03.jpg', '1987-07-13', '2024-07-01 00:00:00', NULL, 'qr_code03.jpg', '0912345680', 'line_charlie', 30003, '桃園市', '陳大同', '0912345680', '萊爾富', '34567890', 3, 'Note here'),
(20240026, '孫家的', 'david@example.com', '61da1bf4b810347c76923eb525e4a29d410770807cbb4f560371d7509f55b78f', '靈巧狐狸', 'image04.jpg', '1995-10-30', '2024-07-01 00:00:00', NULL, 'qr_code04.jpg', '0912345681', 'line_david', 40004, '台中市', '張美麗', '0912345681', 'OK', '45678901', 4, 'Note here'),
(20240027, '三弟', 'eve@example.com', '2e338461aafd52d1978df6c609b25fd094e89d454e82fd87c86f8d40e743ea2f', '勇敢獅子', 'image05.jpg', '2000-01-20', '2024-07-01 00:00:00', NULL, 'qr_code05.jpg', '0912345682', 'line_eve', 50005, '台南市', '林俊傑', '0912345682', '全家', '56789012', 5, 'Note here'),
(20240028, '二哥', 'frank@example.com', 'bd83e5076d73480b48661c9220edc29f890e4113f7757b69683edee5c753a966', '魅惑豹', 'image06.jpg', '1988-04-25', '2024-07-01 00:00:00', NULL, 'qr_code06.jpg', '0912345683', 'line_frank', 60006, '高雄市', '黃小華', '0912345683', '711', '67890123', 6, 'Note here'),
(20240029, '子龍', 'grace@example.com', '7d1164dfc3783575e47abde7fea70cdbce9f77a7d75ebbf7d34b196fe2ea8ec2', '神聖箭', 'image07.jpg', '1991-09-09', '2024-07-01 00:00:00', NULL, 'qr_code07.jpg', '0912345684', 'line_grace', 70007, '基隆市', '周大志', '0912345684', '萊爾富', '78901234', 7, 'Note here'),
(20240030, '諸葛村夫', 'hannah@example.com', '46538aba4b44e223f69213017aad5f6894dffb7a78fa1cde7ea80371d350106f', '俏皮海獺', 'image08.jpg', '1983-11-27', '2024-07-01 00:00:00', NULL, 'qr_code08.jpg', '0912345685', 'line_hannah', 80008, '新竹市', '鄭麗娟', '0912345685', 'OK', '89012345', 8, 'Note here'),
(20240031, '趙小龍', 'isaac@example.com', 'b40719631cc05459f82bb41788aee341f7bcda4bb58d4657d60d524fef9349d6', '驚艷紅鶴', 'image01.jpg', '1994-02-14', '2024-07-01 00:00:00', NULL, 'qr_code09.jpg', '0912345686', 'line_isaac', 90009, '台中市', '趙小龍', '0912345686', '全家', '90123456', 9, 'Note here'),
(20240032, '劉小婷', 'jack@example.com', 'e9bd5c83d5f890bab491e1ddc17f9983f7ecc678de0d457f83c4ac1c19a366ce', '獨立貓', 'image01.jpg', '1986-12-01', '2024-07-01 00:00:00', NULL, 'qr_code10.jpg', '0912345687', 'line_jack', 10010, '台南市', '劉小婷', '0912345687', '711', '01234567', 10, 'Note here'),
(20240033, '徐建國', 'kate@example.com', '26254f06ab6f2dda8c89fe5a42a6a790ddcb8582046cc3a9fc8c6633d185052c', '強壯水牛', 'image01.jpg', '1990-06-16', '2024-07-01 00:00:00', NULL, 'qr_code11.jpg', '0912345688', 'line_kate', 20011, '高雄市', '徐建國', '0912345688', '萊爾富', '12345678', NULL, 'Note here'),
(20240034, '吳美珍', 'linda@example.com', 'df60f092d27e794f107542c9fa0396cdec9d95a36e9642188fba7f607d6f5533', '靜謐天鵝', 'image01.jpg', '1989-08-08', '2024-07-01 00:00:00', NULL, 'qr_code12.jpg', '0912345689', 'line_linda', 30012, '台北市', '吳美珍', '0912345689', 'OK', '23456789', NULL, 'Note here'),
(20240035, '何大海', 'mike@example.com', '45a5f5c40fcb4e2f998d446c5b9eb1295ae77fcf080d573f04a3f68c9af76137', '火焰劍', 'image01.jpg', '1997-04-01', '2024-07-01 00:00:00', NULL, 'qr_code13.jpg', '0912345690', 'line_mike', 40013, '新北市', '何大海', '0912345690', '全家', '34567890', NULL, 'Note here'),
(20240036, '高雅琴', 'nancy@example.com', '8fe8d13022752e11aa2fee544f3353fdc2cfda0b7130283a24c4d6699b6870cd', '雷電盾', 'image01.jpg', '1982-10-15', '2024-07-01 00:00:00', NULL, 'qr_code14.jpg', '0912345691', 'line_nancy', 50014, '桃園市', '高雅琴', '0912345691', '711', '45678901', NULL, 'Note here'),
(20240037, '梁志偉', 'oliver@example.com', '073598265fc480bf2312373e87bdab981fde31baf7dac0fcb368e130adfabccc', '黑暗匕首', 'image01.jpg', '1993-03-18', '2024-07-01 00:00:00', NULL, 'qr_code15.jpg', '0912345692', 'line_oliver', 60015, '台中市', '梁志偉', '0912345692', '萊爾富', '56789012', NULL, 'Note here'),
(20240038, '潘曉華', 'peter@example.com', '9880b747574af80a56f633b8a0e8c0d789f21928d42748abec59603d9cf53515', '魔法鎧', 'image01.jpg', '1984-07-07', '2024-07-01 00:00:00', NULL, 'qr_code16.jpg', '0912345693', 'line_peter', 70016, '台南市', '潘曉華', '0912345693', 'OK', '67890123', NULL, 'Note here'),
(20240039, '馮麗華', 'quincy@example.com', 'f22f7100aa20266be42e99e316daa020bc0aae3e653500a04692258458b1b10d', '冰霜矛', 'image01.jpg', '1998-12-24', '2024-07-01 00:00:00', NULL, 'qr_code17.jpg', '0912345694', 'line_quincy', 80017, '高雄市', '馮麗華', '0912345694', '全家', '78901234', NULL, 'Note here'),
(20240040, '曹建華', 'rachel@example.com', '8fad21ced0bdcfca7c69da3267b9c452376004c44c639e803e3098317a64ea02', '狂野鎚', 'image01.jpg', '1981-05-03', '2024-07-01 00:00:00', NULL, 'qr_code18.jpg', '0912345695', 'line_rachel', 90018, '基隆市', '曹建華', '0912345695', '711', '89012345', NULL, 'Note here'),
(20240041, '蔣小明', 'steve@example.com', '0751cfc3d65da7f440b8f5c1df2a9c5f79e893c4b6fa8a3b79b3ed00a154f6c7', '虛空劍', 'image01.jpg', '1996-08-29', '2024-07-01 00:00:00', NULL, 'qr_code19.jpg', '0912345696', 'line_steve', 10019, '新竹市', '蔣小明', '0912345696', '萊爾富', '90123456', NULL, 'Note here'),
(20240042, '楊小莉', 'tina@example.com', '8116b0dee91cc32f544cf9cbcf5fa7625a8609d79c8ba75f6cd92dd86ace687b', '迅捷靴', 'image01.jpg', '1999-01-11', '2024-07-01 00:00:00', NULL, 'qr_code20.jpg', '0912345697', 'line_tina', 20020, '台北市', '楊小莉', '0912345697', 'OK', '01234567', NULL, 'Note here'),
(20240043, '王一', 'alice1@example.com', '7dcf407fa84a0e0519c7991154c4148de0244d7589020c0d9842db9efad82094', '快樂海豚', 'image01.jpg', '1985-05-15', '2024-07-01 00:00:00', NULL, 'qr_code21.jpg', '0912345700', 'line_alice1', 10021, '台北市', '王一', '0912345700', '全家', '23456789', NULL, 'Note here'),
(20240044, '李二', 'bob1@example.com', '8bb4c01cc43f617ccfd1d4745b19b5a6030d15b12750b39d60479ae7504a7387', '神秘貓頭鷹', 'image01.jpg', '1992-03-22', '2024-07-01 00:00:00', NULL, 'qr_code22.jpg', '0912345701', 'line_bob1', 20022, '新北市', '李二', '0912345701', '711', '34567890', NULL, 'Note here'),
(20240045, '陳三', 'charlie1@example.com', 'b2220233e90770a24fbb70547bffab2bacf447aecf6551bf9e3c8a016769cd7f', '優雅孔雀', 'image01.jpg', '1987-07-13', '2024-07-01 00:00:00', NULL, 'qr_code23.jpg', '0912345702', 'line_charlie1', 30023, '桃園市', '陳三', '0912345702', '萊爾富', '45678901', NULL, 'Note here'),
(20240046, '張四', 'david1@example.com', '61da1bf4b810347c76923eb525e4a29d410770807cbb4f560371d7509f55b78f', '靈巧狐狸', 'image01.jpg', '1995-10-30', '2024-07-01 00:00:00', NULL, 'qr_code24.jpg', '0912345703', 'line_david1', 40024, '台中市', '張四', '0912345703', 'OK', '56789012', NULL, 'Note here'),
(20240047, '林五', 'eve1@example.com', '2e338461aafd52d1978df6c609b25fd094e89d454e82fd87c86f8d40e743ea2f', '勇敢獅子', 'image01.jpg', '2000-01-20', '2024-07-01 00:00:00', NULL, 'qr_code25.jpg', '0912345704', 'line_eve1', 50025, '台南市', '林五', '0912345704', '全家', '67890123', NULL, 'Note here'),
(20240048, '黃六', 'frank1@example.com', 'bd83e5076d73480b48661c9220edc29f890e4113f7757b69683edee5c753a966', '魅惑豹', 'image01.jpg', '1988-04-25', '2024-07-01 00:00:00', NULL, 'qr_code26.jpg', '0912345705', 'line_frank1', 60026, '高雄市', '黃六', '0912345705', '711', '78901234', NULL, 'Note here'),
(20240049, '周七', 'grace1@example.com', '7d1164dfc3783575e47abde7fea70cdbce9f77a7d75ebbf7d34b196fe2ea8ec2', '神聖箭', 'image01.jpg', '1991-09-09', '2024-07-01 00:00:00', NULL, 'qr_code27.jpg', '0912345706', 'line_grace1', 70027, '基隆市', '周七', '0912345706', '萊爾富', '89012345', NULL, 'Note here'),
(20240050, '鄭八', 'hannah1@example.com', '46538aba4b44e223f69213017aad5f6894dffb7a78fa1cde7ea80371d350106f', '俏皮海獺', 'image01.jpg', '1983-11-27', '2024-07-01 00:00:00', NULL, 'qr_code28.jpg', '0912345707', 'line_hannah1', 80028, '新竹市', '鄭八', '0912345707', 'OK', '90123456', NULL, 'Note here'),
(20240051, '趙九', 'isaac1@example.com', 'b40719631cc05459f82bb41788aee341f7bcda4bb58d4657d60d524fef9349d6', '驚艷紅鶴', 'image01.jpg', '1994-02-14', '2024-07-01 00:00:00', NULL, 'qr_code29.jpg', '0912345708', 'line_isaac1', 90029, '台中市', '趙九', '0912345708', '全家', '01234567', NULL, 'Note here'),
(20240052, '劉十', 'jack1@example.com', 'e9bd5c83d5f890bab491e1ddc17f9983f7ecc678de0d457f83c4ac1c19a366ce', '獨立貓', 'image01.jpg', '1986-12-01', '2024-07-01 00:00:00', NULL, 'qr_code30.jpg', '0912345709', 'line_jack1', 10030, '台南市', '劉十', '0912345709', '711', '12345678', NULL, 'Note here'),
(20240053, '汪品晉', 'kate1@example.com', '26254f06ab6f2dda8c89fe5a42a6a790ddcb8582046cc3a9fc8c6633d185052c', '強壯水牛', 'image01.jpg', '1990-06-16', '2024-07-01 00:00:00', NULL, 'qr_code31.jpg', '0912345710', 'line_kate1', 20031, '高雄市', '汪品晉', '0912345710', '萊爾富', '23456789', NULL, 'Note here'),
(20240054, '盧坤理', 'linda1@example.com', 'df60f092d27e794f107542c9fa0396cdec9d95a36e9642188fba7f607d6f5533', '靜謐天鵝', 'image01.jpg', '1989-08-08', '2024-07-01 00:00:00', NULL, 'qr_code32.jpg', '0912345711', 'line_linda1', 30032, '台北市', '盧坤理', '0912345711', 'OK', '34567890', NULL, 'Note here'),
(20240055, '洪修琦', 'mike1@example.com', '45a5f5c40fcb4e2f998d446c5b9eb1295ae77fcf080d573f04a3f68c9af76137', '火焰劍', 'image01.jpg', '1997-04-01', '2024-07-01 00:00:00', NULL, 'qr_code33.jpg', '0912345712', 'line_mike1', 40033, '新北市', '洪修琦', '0912345712', '全家', '45678901', NULL, 'Note here'),
(20240056, '張安瑄', 'nancy1@example.com', '8fe8d13022752e11aa2fee544f3353fdc2cfda0b7130283a24c4d6699b6870cd', '雷電盾', 'image01.jpg', '1982-10-15', '2024-07-01 00:00:00', NULL, 'qr_code34.jpg', '0912345713', 'line_nancy1', 50034, '桃園市', '張安瑄', '0912345713', '711', '56789012', NULL, 'Note here'),
(20240057, '林嬋美', 'oliver1@example.com', '073598265fc480bf2312373e87bdab981fde31baf7dac0fcb368e130adfabccc', '黑暗匕首', 'image01.jpg', '1993-03-18', '2024-07-01 00:00:00', NULL, 'qr_code35.jpg', '0912345714', 'line_oliver1', 60035, '台中市', '林嬋美', '0912345714', '萊爾富', '67890123', NULL, 'Note here'),
(20240058, '劉敬景', 'peter1@example.com', '9880b747574af80a56f633b8a0e8c0d789f21928d42748abec59603d9cf53515', '魔法鎧', 'image01.jpg', '1984-07-07', '2024-07-01 00:00:00', NULL, 'qr_code36.jpg', '0912345715', 'line_peter1', 70036, '台南市', '劉敬景', '0912345715', 'OK', '78901234', NULL, 'Note here'),
(20240059, '鄧凡瑋', 'quincy1@example.com', 'f22f7100aa20266be42e99e316daa020bc0aae3e653500a04692258458b1b10d', '冰霜矛', 'image01.jpg', '1998-12-24', '2024-07-01 00:00:00', NULL, 'qr_code37.jpg', '0912345716', 'line_quincy1', 80037, '高雄市', '鄧凡瑋', '0912345716', '全家', '89012345', NULL, 'Note here'),
(20240060, '范任良', 'rachel1@example.com', '8fad21ced0bdcfca7c69da3267b9c452376004c44c639e803e3098317a64ea02', '狂野鎚', 'image01.jpg', '1981-05-03', '2024-07-01 00:00:00', NULL, 'qr_code38.jpg', '0912345717', 'line_rachel1', 90038, '基隆市', '范任良', '0912345717', '711', '90123456', NULL, 'Note here'),
(20240061, '廖孝安', 'sam1@example.com', '0751cfc3d65da7f440b8f5c1df2a9c5f79e893c4b6fa8a3b79b3ed00a154f6c7', '迅捷弓', 'image01.jpg', '1996-08-29', '2024-07-01 00:00:00', NULL, 'qr_code39.jpg', '0912345718', 'line_sam1', 10039, '新竹市', '廖孝安', '0912345718', '萊爾富', '01234567', NULL, 'Note here'),
(20240062, '林瑤黛', 'tina1@example.com', '8116b0dee91cc32f544cf9cbcf5fa7625a8609d79c8ba75f6cd92dd86ace687b', '閃電矛', 'image01.jpg', '1999-01-11', '2024-07-01 00:00:00', NULL, 'qr_code40.jpg', '0912345719', 'line_tina1', 20040, '台北市', '林瑤黛', '0912345719', 'OK', '12345678', NULL, 'Note here'),
(20240063, '江恆恩', 'ursula1@example.com', '3a1f3d21393be4b8e74e39955b2c2a3512e10830bd78d30f3cb1454e0df13c3f', '烈焰弓', 'image01.jpg', '1992-04-21', '2024-07-01 00:00:00', NULL, 'qr_code41.jpg', '0912345720', 'line_ursula1', 30041, '新北市', '江恆恩', '0912345720', '全家', '23456789', NULL, 'Note here'),
(20240064, '程均棟', 'victor1@example.com', '34464be34dd678136545b97ea5833c4740a8fc7095597e60fa16c5bb0d1ef7f1', '暗影盾', 'image01.jpg', '1988-12-30', '2024-07-01 00:00:00', NULL, 'qr_code42.jpg', '0912345721', 'line_victor1', 40042, '桃園市', '程均棟', '0912345721', '711', '34567890', NULL, 'Note here'),
(20240065, '賴容文', 'wendy1@example.com', '82bd9486604046d9b3955a6983d924bfc1ecfd6489a0e48189e3cb653a6854a2', '光明劍', 'image01.jpg', '1984-09-17', '2024-07-01 00:00:00', NULL, 'qr_code43.jpg', '0912345722', 'line_wendy1', 50043, '台中市', '賴容文', '0912345722', '萊爾富', '23456789', NULL, 'Note here'),
(20240636, '涂慶萬', 'alice12@example.com', '7dcf407fa84a0e0519c7991154c4148de0244d7589020c0d9842db9efad82094', '快樂海豚', 'image01.jpg', '1985-05-15', '2024-07-01 00:00:00', NULL, 'qr_code44.jpg', '0912445709', 'line_alice12', 10001, '台北市', '涂慶萬', '0912445709', '全家', '23456789', NULL, 'Note here'),
(20240637, '陳依修', 'bob12@example.com', '8bb4c01cc43f617ccfd1d4745b19b5a6030d15b12750b39d60479ae7504a7387', '神秘貓頭鷹', 'image01.jpg', '1992-03-22', '2024-07-01 00:00:00', NULL, 'qr_code45.jpg', '0910045701', 'line_bob12', 10002, '新北市', '陳依修', '0910045701', '711', '34567890', NULL, 'Note here'),
(20240638, '曾業樂', 'charlie12@example.com', 'b2220233e90770a24fbb70547bffab2bacf447aecf6551bf9e3c8a016769cd7f', '優雅孔雀', 'image01.jpg', '1987-07-13', '2024-07-01 00:00:00', NULL, 'qr_code46.jpg', '0910045702', 'line_charlie12', 10003, '桃園市', '曾業樂', '0910045702', '萊爾富', '45678901', NULL, 'Note here'),
(20240639, '鐘淑瑤', 'david12@example.com', '61da1bf4b810347c76923eb525e4a29d410770807cbb4f560371d7509f55b78f', '靈活狐貍', 'image01.jpg', '1994-11-02', '2024-07-01 00:00:00', NULL, 'qr_code47.jpg', '0910045703', 'line_david12', 10004, '台中市', '鐘淑瑤', '0910045703', 'OK', '56789012', NULL, 'Note here'),
(20240640, '田尹悦', 'ella12@example.com', '2e338461aafd52d1978df6c609b25fd094e89d454e82fd87c86f8d40e743ea2f', '勇敢鯨魚', 'image01.jpg', '1990-08-19', '2024-07-01 00:00:00', NULL, 'qr_code48.jpg', '0910045704', 'line_ella12', 10005, '台南市', '田尹悦', '0910045704', '全家', '67890100', NULL, 'Note here'),
(20240641, '陳昱璐', 'frank12@example.com', 'bd83e5076d73480b48661c9220edc29f890e4113f7757b69683edee5c753a966', '溫暖熊貓', 'image01.jpg', '1997-04-10', '2024-07-01 00:00:00', NULL, 'qr_code49.jpg', '0910045705', 'line_frank12', 10006, '高雄市', '陳昱璐', '0910045705', '711', '78901004', NULL, 'Note here'),
(20240642, '詹睿育', 'george12@example.com', '7d1164dfc3783575e47abde7fea70cdbce9f77a7d75ebbf7d34b196fe2ea8ec2', '聰明狗狗', 'image01.jpg', '1983-06-24', '2024-07-01 00:00:00', NULL, 'qr_code50.jpg', '0910045706', 'line_george12', 10007, '基隆市', '詹睿育', '0910045706', '萊爾富', '89010045', NULL, 'Note here'),
(20240643, '羅峯瑞', 'hannah12@example.com', 'fd7b620c35cb32eb0336b9906b46834864413c8737f7460fc3dce560c94a1a86', '堅強獅子', 'image01.jpg', '1988-09-01', '2024-07-01 00:00:00', NULL, 'qr_code51.jpg', '0910045707', 'line_hannah12', 10008, '新竹市', '羅峯瑞', '0910045707', 'OK', '90100456', NULL, 'Note here'),
(20240644, '吳恆雲', 'ian12@example.com', '84de69d49eca0b7f004a3fd764ab350d312f83b59d885b28c719dfd5620a8df3', '敏捷豹', 'image01.jpg', '1991-01-28', '2024-07-01 00:00:00', NULL, 'qr_code52.jpg', '0910045708', 'line_ian12', 10009, '嘉義市', '吳恆雲', '0910045708', '全家', '01004567', NULL, 'Note here'),
(20240645, '方杉樂', 'jane12@example.com', 'fc618beca8c6779999d83c2038faa2a508a3c2df7056988d732a269679d1bc53', '迅捷狼', 'image01.jpg', '1995-12-14', '2024-07-01 00:00:00', NULL, 'qr_code53.jpg', '0910045709', 'line_jane12', 10010, '苗栗縣', '方杉樂', '0910045709', '711', '10045678', NULL, 'Note here'),
(20240646, '劉洢濤', 'kevin12@example.com', '2536c5cd548e0bc5b7a644abd2efc9f9d867593364d6831f55aa8cf89da380f1', '英勇鷹', 'image01.jpg', '1986-03-09', '2024-07-01 00:00:00', NULL, 'qr_code54.jpg', '0910045710', 'line_kevin12', 10011, '彰化縣', '劉洢濤', '0910045710', '萊爾富', '23456789', NULL, 'Note here'),
(20240647, '林君樹', 'laura12@example.com', '047bba255ef8d9752e8a4dbb8cf6bd0a88d82a581fb215341e1117d890872b12', '睿智鷹', 'image01.jpg', '1984-10-21', '2024-07-01 00:00:00', NULL, 'qr_code55.jpg', '0910045711', 'line_laura21', 10012, '南投縣', '林君樹', '0910045711', 'OK', '34567890', NULL, 'Note here'),
(20240648, '陳禧運', 'michael12@example.com', '8275e063ba10f070282d27284b32f5db5379013757c6965e5a74c5b86ac05689', '威猛虎', 'image01.jpg', '1998-05-27', '2024-07-01 00:00:00', NULL, 'qr_code56.jpg', '0910045712', 'line_michael12', 10013, '雲林縣', '陳禧運', '0910045712', '全家', '45678901', NULL, 'Note here'),
(20240649, '曾然玉', 'nancy12@example.com', '17e25f9af239c703f62cb286a55454019785761621ace760bbcfdedb064a1a7c', '靈巧蛇', 'image01.jpg', '1989-12-11', '2024-07-01 00:00:00', NULL, 'qr_code57.jpg', '0910045713', 'line_nancy12', 10014, '台東縣', '曾然玉', '0910045713', '711', '56789012', NULL, 'Note here'),
(20240650, '巫冉孝', 'oscar12@example.com', '34dd923cc3af58d2a5a534fbeb66a9d4f6384eaa50689930b4a51be53b8e261c', '魅力狐', 'image01.jpg', '1981-07-03', '2024-07-01 00:00:00', NULL, 'qr_code58.jpg', '0910045714', 'line_oscar12', 10015, '花蓮縣', '巫冉孝', '0910045714', '萊爾富', '67890100', NULL, 'Note here'),
(20240651, '吳俊濤', 'paul12@example.com', '899496ec6ab74a871a8edd71f0ea3cb1e6c5aa2d76cae5331c7feaa7933a182b', '無畏豹', 'image01.jpg', '1983-08-17', '2024-07-01 00:00:00', NULL, 'qr_code59.jpg', '0910045715', 'line_paul12', 10016, '宜蘭縣', '吳俊濤', '0910045715', 'OK', '78901004', NULL, 'Note here'),
(20240652, '王興雅', 'quincy12@example.com', 'fb038f65fb096838c1cd69b5486cce9f0e21996e02f2787dd1df6b702732df18', '迅捷魚', 'image01.jpg', '1990-11-30', '2024-07-01 00:00:00', NULL, 'qr_code60.jpg', '0910045716', 'line_quincy12', 10017, '屏東縣', '王興雅', '0910045716', '全家', '89010045', NULL, 'Note here'),
(20240653, '童博奕', 'rose12@example.com', '21acf8aba212f3e66cd5056dd756fb76b5028ef003e9cb8ed2bd8787dfeb9670', '敏捷兔', 'image01.jpg', '1987-09-16', '2024-07-01 00:00:00', NULL, 'qr_code61.jpg', '0910045717', 'line_rose12', 10018, '澎湖縣', '童博奕', '0910045717', '711', '90100456', NULL, 'Note here'),
(20240654, '尤帆筱', 'steve12@example.com', '13b2846e97048500d71a6b72351d54edc941e42c72b43fad110244a0136e4655', '智勇鷹', 'image01.jpg', '1991-02-05', '2024-07-01 00:00:00', NULL, 'qr_code62.jpg', '0910045718', 'line_steve12', 10019, '金門縣', '尤帆筱', '0910045718', '萊爾富', '01004567', NULL, 'Note here'),
(20240655, '蔡嚴義', 'tina12@example.com', 'df0f35a1f854581dcb7131afbb5d7094b082f4fd6192f368341294a2d41aa89b', '優雅鹿', 'image01.jpg', '1986-12-20', '2024-07-01 00:00:00', NULL, 'qr_code63.jpg', '0910045719', 'line_tina12', 10020, '連江縣', '蔡嚴義', '0910045719', 'OK', '10045678', NULL, 'Note here'),
(20240656, '葉城穎', 'uma12@example.com', '46538aba4b44e223f69213017aad5f6894dffb7a78fa1cde7ea80371d350106f', '智慧羊', 'image01.jpg', '1993-06-07', '2024-07-01 00:00:00', NULL, 'qr_code64.jpg', '0910045720', 'line_uma12', 10021, '台北市', '葉城穎', '0910045720', '全家', '23456789', NULL, 'Note here'),
(20240657, '許功銘', 'vince12@example.com', 'b40719631cc05459f82bb41788aee341f7bcda4bb58d4657d60d524fef9349d6', '靈巧鷹', 'image01.jpg', '1988-04-19', '2024-07-01 00:00:00', NULL, 'qr_code65.jpg', '0910045721', 'line_vince12', 10022, '新北市', '許功銘', '0910045721', '711', '34567890', NULL, 'Note here'),
(20240658, '吳元晨', 'wanda12@example.com', 'e9bd5c83d5f890bab491e1ddc17f9983f7ecc678de0d457f83c4ac1c19a366ce', '聰明魚', 'image01.jpg', '1990-01-14', '2024-07-01 00:00:00', NULL, 'qr_code66.jpg', '0910045722', 'line_wanda12', 10023, '桃園市', '吳元晨', '0910045722', '萊爾富', '45678901', NULL, 'Note here'),
(20240659, '詹海清', 'xander12@example.com', '26254f06ab6f2dda8c89fe5a42a6a790ddcb8582046cc3a9fc8c6633d185052c', '迅捷兔', 'image01.jpg', '1989-10-27', '2024-07-01 00:00:00', NULL, 'qr_code67.jpg', '0910045723', 'line_xander12', 10024, '台中市', '詹海清', '0910045723', 'OK', '56789012', NULL, 'Note here'),
(20240660, '蔡思辛', 'yara12@example.com', 'df60f092d27e794f107542c9fa0396cdec9d95a36e9642188fba7f607d6f5533', '靈活虎', 'image01.jpg', '1985-03-11', '2024-07-01 00:00:00', NULL, 'qr_code68.jpg', '0910045724', 'line_yara12', 10025, '台南市', '蔡思辛', '0910045724', '全家', '67890100', NULL, 'Note here'),
(20240661, '陳慧揚', 'zack12@example.com', '45a5f5c40fcb4e2f998d446c5b9eb1295ae77fcf080d573f04a3f68c9af76137', '優雅狐', 'image01.jpg', '1997-08-03', '2024-07-01 00:00:00', NULL, 'qr_code69.jpg', '0910045725', 'line_zack12', 10026, '高雄市', '陳慧揚', '0910045725', '711', '78901004', NULL, 'Note here'),
(20240662, '張勳慈', 'alice2@example.com', '705164cf38ca5abcb84534584882b5f18719ba9d34bd07e710afa234d44e9196', '勇敢熊', 'image01.jpg', '1983-11-19', '2024-07-01 00:00:00', NULL, 'qr_code70.jpg', '0910045726', 'line_alice2', 10027, '基隆市', '張勳慈', '0910045726', '萊爾富', '89010045', NULL, 'Note here'),
(20240663, '姜光瞻', 'bob2@example.com', '59a0772c22c1216d167e98cebc861a67eee8ed3745dd7ff8ac51688cb7630281', '敏捷狗', 'image01.jpg', '1986-07-22', '2024-07-01 00:00:00', NULL, 'qr_code71.jpg', '0910045727', 'line_bob2', 10028, '新竹市', '姜光瞻', '0910045727', 'OK', '90100456', NULL, 'Note here'),
(20240664, '王益碧', 'charlie2@example.com', '3a6a6a6d40a49598741f80ba98c238e6dd762105aac7c01c21a38611b754dae6', '堅強豹', 'image01.jpg', '1994-02-15', '2024-07-01 00:00:00', NULL, 'qr_code72.jpg', '0910045728', 'line_charlie2', 10029, '嘉義市', '王益碧', '0910045728', '全家', '01004567', NULL, 'Note here'),
(20240665, '黃悟業', 'david2@example.com', '470651bce7e5e8be428616384b7462bf151401d26edeee65f4848ab64bab9f16', '靈活羊', 'image01.jpg', '1982-05-12', '2024-07-01 00:00:00', NULL, 'qr_code73.jpg', '0910045729', 'line_david2', 10030, '苗栗縣', '黃悟業', '0910045729', '711', '10045678', NULL, 'Note here'),
(20240666, '杜優榕', 'ella2@example.com', '71af46c4449e604fa3d467a731e50ff7a8cfc0c64aea95eddfdcebd999b675f0', '溫暖魚', 'image01.jpg', '1989-09-28', '2024-07-01 00:00:00', NULL, 'qr_code74.jpg', '0910045730', 'line_ella2', 10031, '彰化縣', '杜優榕', '0910045730', '萊爾富', '23456789', NULL, 'Note here'),
(20240667, '周採聰', 'frank2@example.com', 'c4fdb9df6a75a0cd791757492de99080bcde74f6150f58406f3c764c2102ce19', '威猛豹', 'image01.jpg', '1984-12-01', '2024-07-01 00:00:00', NULL, 'qr_code75.jpg', '0910045731', 'line_frank2', 10032, '南投縣', '周採聰', '0910045731', 'OK', '34567890', NULL, 'Note here'),
(20240668, '童常晗', 'george2@example.com', '86a391786640b653431af1f9f154d433fcd59fe42b4b64f2a830737eb44f9327', '迅捷兔', 'image01.jpg', '1992-08-11', '2024-07-01 00:00:00', NULL, 'qr_code76.jpg', '0910045732', 'line_george2', 10033, '雲林縣', '童常晗', '0910045732', '全家', '45678901', NULL, 'Note here'),
(20240669, '阮歆石', 'hannah2@example.com', '8e1d5a53144486defef5c8ccf8d98eade1e2ed01d2f9dbfff5cac3f1e953e2e7', '聰明豬', 'image01.jpg', '1988-04-05', '2024-07-01 00:00:00', NULL, 'qr_code77.jpg', '0910045733', 'line_hannah2', 10034, '台東縣', '阮歆石', '0910045733', '711', '56789012', NULL, 'Note here'),
(20240670, '廖禎越', 'ian2@example.com', '4a8fd1b5f40bc39ba88b40de5bfa50fd0dca1484ef37703580cb6a4ff807eeea', '無畏獅', 'image01.jpg', '1996-06-13', '2024-07-01 00:00:00', NULL, 'qr_code78.jpg', '0910045734', 'line_ian2', 10035, '花蓮縣', '廖禎越', '0910045734', '萊爾富', '67890100', NULL, 'Note here'),
(20240671, '詹卿欣', 'jane2@example.com', '0811b4d20b26494e099e487b49bb68af39f8e0a9eb364a66e56f3c2f8ceebcdd', '智勇鹿', 'image01.jpg', '1981-01-24', '2024-07-01 00:00:00', NULL, 'qr_code79.jpg', '0910045735', 'line_jane2', 10036, '宜蘭縣', '詹卿欣', '0910045735', 'OK', '78901004', NULL, 'Note here'),
(20240672, '楊利康', 'kevin2@example.com', '0c0da9963af3f12d216d641c0d5e7ab4edb1e82f86bf53a1d044c9b350898f0e', '靈巧熊', 'image01.jpg', '1987-10-09', '2024-07-01 00:00:00', NULL, 'qr_code80.jpg', '0910045736', 'line_kevin2', 10037, '屏東縣', '楊利康', '0910045736', '全家', '89010045', NULL, 'Note here'),
(20240673, '錢睿韻', 'laura2@example.com', '92afdf02f31024faad03b6925a529857fef62e8621c1d21389a9a7b0391b8199', '勇敢狐', 'image01.jpg', '1995-05-18', '2024-07-01 00:00:00', NULL, 'qr_code81.jpg', '0910045737', 'line_laura2', 10038, '澎湖縣', '錢睿韻', '0910045737', '711', '90100456', NULL, 'Note here'),
(20240674, '謝喧熹', 'michael2@example.com', '5f9f87b7b71165d17ca2991739ab0be08769674f2f67b562ddc85472f004235d', '迅捷狗', 'image01.jpg', '1986-12-23', '2024-07-01 00:00:00', NULL, 'qr_code82.jpg', '0910045738', 'line_michael2', 10039, '金門縣', '謝喧熹', '0910045738', '萊爾富', '01004567', NULL, 'Note here'),
(20240675, '鄒利艾', 'nancy2@example.com', '2d44326ea46d18cf834f4db43c3a39e5e6f70494ffbbccf33349d8e07e2549dc', '溫暖鷹', 'image01.jpg', '1991-09-14', '2024-07-01 00:00:00', NULL, 'qr_code83.jpg', '0910045739', 'line_nancy2', 10040, '連江縣', '鄒利艾', '0910045739', 'OK', '10045678', NULL, 'Note here'),
(20240676, '傅以研', 'oscar2@example.com', '5e6f328a05a3a59b1650f02debbd1e00d3fdd2bd32b5fae2e9b39eaff13bb7c6', '靈活豹', 'image01.jpg', '1998-03-27', '2024-07-01 00:00:00', NULL, 'qr_code84.jpg', '0910045740', 'line_oscar2', 10041, '台北市', '傅以研', '0910045740', '全家', '23456789', NULL, 'Note here'),
(20240677, '戴湘美', 'paul2@example.com', '9880b747574af80a56f633b8a0e8c0d789f21928d42748abec59603d9cf53515', '優雅魚', 'image01.jpg', '1990-08-10', '2024-07-01 00:00:00', NULL, 'qr_code85.jpg', '0910045741', 'line_paul2', 10042, '新北市', '戴湘美', '0910045741', '711', '34567890', NULL, 'Note here'),
(20240678, '巫添莘', 'quincy2@example.com', 'f22f7100aa20266be42e99e316daa020bc0aae3e653500a04692258458b1b10d', '無畏鹿', 'image01.jpg', '1985-04-12', '2024-07-01 00:00:00', NULL, 'qr_code86.jpg', '0910045742', 'line_quincy2', 10043, '桃園市', '巫添莘', '0910045742', '萊爾富', '45678901', NULL, 'Note here'),
(20240679, '張彬温', 'rose2@example.com', '8fad21ced0bdcfca7c69da3267b9c452376004c44c639e803e3098317a64ea02', '智勇狗', 'image01.jpg', '1997-11-21', '2024-07-01 00:00:00', NULL, 'qr_code87.jpg', '0910045743', 'line_rose2', 10044, '台中市', '張彬温', '0910045743', 'OK', '56789012', NULL, 'Note here'),
(20240680, '翁儀昀', 'steve2@example.com', '0751cfc3d65da7f440b8f5c1df2a9c5f79e893c4b6fa8a3b79b3ed00a154f6c7', '靈巧獅', 'image01.jpg', '1984-06-04', '2024-07-01 00:00:00', NULL, 'qr_code88.jpg', '0910045744', 'line_steve2', 10045, '台南市', '翁儀昀', '0910045744', '全家', '67890100', NULL, 'Note here'),
(20240681, '邱保裕', 'tina2@example.com', '8116b0dee91cc32f544cf9cbcf5fa7625a8609d79c8ba75f6cd92dd86ace687b', '勇敢豹', 'image01.jpg', '1993-03-09', '2024-07-01 00:00:00', NULL, 'qr_code89.jpg', '0910045745', 'line_tina2', 10046, '高雄市', '邱保裕', '0910045745', '711', '78901004', NULL, 'Note here'),
(20240682, '陳寒邦', 'uma2@example.com', '3a1f3d21393be4b8e74e39955b2c2a3512e10830bd78d30f3cb1454e0df13c3f', '敏捷羊', 'image01.jpg', '1988-01-14', '2024-07-01 00:00:00', NULL, 'qr_code90.jpg', '0910045746', 'line_uma2', 10047, '基隆市', '陳寒邦', '0910045746', '萊爾富', '89010045', NULL, 'Note here'),
(20240683, '黃家琴', 'vince2@example.com', '34464be34dd678136545b97ea5833c4740a8fc7095597e60fa16c5bb0d1ef7f1', '溫暖豬', 'image01.jpg', '1994-05-19', '2024-07-01 00:00:00', NULL, 'qr_code91.jpg', '0910045747', 'line_vince2', 10048, '新竹市', '黃家琴', '0910045747', 'OK', '90100456', NULL, 'Note here'),
(20240684, '袁又珊', 'wanda2@example.com', '82bd9486604046d9b3955a6983d924bfc1ecfd6489a0e48189e3cb653a6854a2', '無畏兔', 'image01.jpg', '1998-02-27', '2024-07-01 00:00:00', NULL, 'qr_code92.jpg', '0910045748', 'line_wanda2', 10049, '嘉義市', '袁又珊', '0910045748', '全家', '01004567', NULL, 'Note here'),
(20240685, '楊暉曄', 'xander2@example.com', '1a5a5bb8fee6cc910671bf1cfb056a0b47559ef0366d2394840b67dd43e27a8c', '迅捷魚', 'image01.jpg', '1986-08-21', '2024-07-01 00:00:00', NULL, 'qr_code93.jpg', '0910045749', 'line_xander2', 10050, '苗栗縣', '楊暉曄', '0910045749', '711', '10045678', NULL, 'Note here'),
(20240686, '余威澍', 'yara2@example.com', 'fbbba24908c567a31cc9153c3f5e3cc5d58868eaeb343ee0f5587dc63eb6f300', '智勇狐', 'image01.jpg', '1983-11-05', '2024-07-01 00:00:00', NULL, 'qr_code94.jpg', '0910045750', 'line_yara2', 10051, '彰化縣', '余威澍', '0910045750', '萊爾富', '23456789', NULL, 'Note here'),
(20240687, '黃千珈', 'zack2@example.com', 'ec8ba3b5db49048febb723fc9528306a97ccd6c25d3410952837c149f14c197b', '勇敢豹', 'image01.jpg', '1991-07-14', '2024-07-01 00:00:00', NULL, 'qr_code95.jpg', '0910045751', 'line_zack2', 10052, '南投縣', '黃千珈', '0910045751', 'OK', '34567890', NULL, 'Note here'),
(20240688, '陳展暢', 'alice3@example.com', 'd37870230f856d2b8cc26f0e294eaa63c11432a756cd8b6f91efd0e0066ca62a', '迅捷狗', 'image01.jpg', '1988-12-30', '2024-07-01 00:00:00', NULL, 'qr_code96.jpg', '0910045752', 'line_alice3', 10053, '雲林縣', '陳展暢', '0910045752', '全家', '45678901', NULL, 'Note here'),
(20240689, '馬孝採', 'bob3@example.com', '7d121cdb10412bb7ab33a8a572137c1446e5254c5234b56f0d6516b5337fd470', '靈巧兔', 'image01.jpg', '1992-10-18', '2024-07-01 00:00:00', NULL, 'qr_code97.jpg', '0910045753', 'line_bob3', 10054, '台東縣', '馬孝採', '0910045753', '711', '56789012', NULL, 'Note here'),
(20240690, '梁顯均', 'charlie3@example.com', 'e2e7510aaf9edb287dc970b02edf99adb0bc4e25bd1b45826c23fa290b3dbe8b', '無畏羊', 'image01.jpg', '1987-06-20', '2024-07-01 00:00:00', NULL, 'qr_code98.jpg', '0910045754', 'line_charlie3', 10055, '花蓮縣', '梁顯均', '0910045754', '萊爾富', '67890100', NULL, 'Note here'),
(20240691, '陳勵達', 'david3@example.com', 'a91944a33b9bd73b78ff6ea6dc929b94440d9b717de11b0f9b8d224082ab7805', '智勇鹿', 'image01.jpg', '1996-01-15', '2024-07-01 00:00:00', NULL, 'qr_code99.jpg', '0910045755', 'line_david3', 10056, '宜蘭縣', '陳勵達', '0910045755', 'OK', '78901004', NULL, 'Note here'),
(20240692, '馮宣毓', 'ella3@example.com', '7eab57f8884cba251b53de7140317c0dcc77cd7e41b164cf49a1687816ce8eec', '溫暖熊', 'image01.jpg', '1990-09-26', '2024-07-01 00:00:00', NULL, 'qr_code100.jpg', '0910045756', 'line_ella3', 10057, '屏東縣', '馮宣毓', '0910045756', '全家', '89010045', NULL, 'Note here'),
(20240978, '涂慶萬', 'alice12@email.com', '7dcf407fa84a0e0519c7991154c4148de0244d7589020c0d9842db9efad82094', '快樂海豚', 'image01.jpg', '1985-05-15', '2024-07-01 00:00:00', NULL, 'qr_code144.jpg', '0914445709', 'line_aalice12', 10001, '台北市', '涂慶萬', '0914445709', '全家', '23456789', NULL, 'Note here'),
(20240979, '陳依修', 'bob12@email.com', '8bb4c01cc43f617ccfd1d4745b19b5a6030d15b12750b39d60479ae7504a7387', '神秘貓頭鷹', 'image01.jpg', '1992-03-22', '2024-07-01 00:00:00', NULL, 'qr_code145.jpg', '0977745701', 'line_abob12', 10002, '新北市', '陳依修', '0977745701', '711', '34567890', NULL, 'Note here'),
(20240980, '曾業樂', 'charlie12@email.com', 'b2220233e90770a24fbb70547bffab2bacf447aecf6551bf9e3c8a016769cd7f', '優雅孔雀', 'image01.jpg', '1987-07-13', '2024-07-01 00:00:00', NULL, 'qr_code146.jpg', '0977745702', 'line_acharlie12', 10003, '桃園市', '曾業樂', '0977745702', '萊爾富', '45678901', NULL, 'Note here'),
(20240981, '鐘淑瑤', 'david12@email.com', '61da1bf4b810347c76923eb525e4a29d410770807cbb4f560371d7509f55b78f', '靈活狐貍', 'image01.jpg', '1994-11-02', '2024-07-01 00:00:00', NULL, 'qr_code147.jpg', '0977745703', 'line_adavid12', 10004, '台中市', '鐘淑瑤', '0977745703', 'OK', '56789012', NULL, 'Note here'),
(20240982, '田尹悦', 'ella12@email.com', '2e338461aafd52d1978df6c609b25fd094e89d454e82fd87c86f8d40e743ea2f', '勇敢鯨魚', 'image01.jpg', '1990-08-19', '2024-07-01 00:00:00', NULL, 'qr_code148.jpg', '0977745704', 'line_aella12', 10005, '台南市', '田尹悦', '0977745704', '全家', '67890100', NULL, 'Note here'),
(20240983, '陳昱璐', 'frank12@email.com', 'bd83e5076d73480b48661c9220edc29f890e4113f7757b69683edee5c753a966', '溫暖熊貓', 'image01.jpg', '1997-04-10', '2024-07-01 00:00:00', NULL, 'qr_code149.jpg', '0977745705', 'line_afrank12', 10006, '高雄市', '陳昱璐', '0977745705', '711', '78901004', NULL, 'Note here'),
(20240984, '詹睿育', 'george12@email.com', '7d1164dfc3783575e47abde7fea70cdbce9f77a7d75ebbf7d34b196fe2ea8ec2', '聰明狗狗', 'image01.jpg', '1983-06-24', '2024-07-01 00:00:00', NULL, 'qr_code150.jpg', '0977745706', 'line_ageorge12', 10007, '基隆市', '詹睿育', '0977745706', '萊爾富', '89010045', NULL, 'Note here'),
(20240985, '羅峯瑞', 'hannah12@email.com', 'fd7b620c35cb32eb0336b9906b46834864413c8737f7460fc3dce560c94a1a86', '堅強獅子', 'image01.jpg', '1988-09-01', '2024-07-01 00:00:00', NULL, 'qr_code151.jpg', '0977745707', 'line_ahannah12', 10008, '新竹市', '羅峯瑞', '0977745707', 'OK', '90100456', NULL, 'Note here'),
(20240986, '吳恆雲', 'ian12@email.com', '84de69d49eca0b7f004a3fd764ab350d312f83b59d885b28c719dfd5620a8df3', '敏捷豹', 'image01.jpg', '1991-01-28', '2024-07-01 00:00:00', NULL, 'qr_code152.jpg', '0977745708', 'line_aian12', 10009, '嘉義市', '吳恆雲', '0977745708', '全家', '01004567', NULL, 'Note here'),
(20240987, '方杉樂', 'jane12@email.com', 'fc618beca8c6779999d83c2038faa2a508a3c2df7056988d732a269679d1bc53', '迅捷狼', 'image01.jpg', '1995-12-14', '2024-07-01 00:00:00', NULL, 'qr_code153.jpg', '0977745709', 'line_ajane12', 10010, '苗栗縣', '方杉樂', '0977745709', '711', '10045678', NULL, 'Note here'),
(20240988, '劉洢濤', 'kevin12@email.com', '2536c5cd548e0bc5b7a644abd2efc9f9d867593364d6831f55aa8cf89da380f1', '英勇鷹', 'image01.jpg', '1986-03-09', '2024-07-01 00:00:00', NULL, 'qr_code154.jpg', '0977745710', 'line_akevin12', 10011, '彰化縣', '劉洢濤', '0977745710', '萊爾富', '23456789', NULL, 'Note here'),
(20240989, '林君樹', 'laura12@email.com', '047bba255ef8d9752e8a4dbb8cf6bd0a88d82a581fb215341e1117d890872b12', '睿智鷹', 'image01.jpg', '1984-10-21', '2024-07-01 00:00:00', NULL, 'qr_code155.jpg', '0977745711', 'line_alaura21', 10012, '南投縣', '林君樹', '0977745711', 'OK', '34567890', NULL, 'Note here'),
(20240990, '陳禧運', 'michael12@email.com', '8275e063ba10f070282d27284b32f5db5379013757c6965e5a74c5b86ac05689', '威猛虎', 'image01.jpg', '1998-05-27', '2024-07-01 00:00:00', NULL, 'qr_code156.jpg', '0977745712', 'line_amichael12', 10013, '雲林縣', '陳禧運', '0977745712', '全家', '45678901', NULL, 'Note here'),
(20240991, '曾然玉', 'nancy12@email.com', '17e25f9af239c703f62cb286a55454019785761621ace760bbcfdedb064a1a7c', '靈巧蛇', 'image01.jpg', '1989-12-11', '2024-07-01 00:00:00', NULL, 'qr_code157.jpg', '0977745713', 'line_anancy12', 10014, '台東縣', '曾然玉', '0977745713', '711', '56789012', NULL, 'Note here'),
(20240992, '巫冉孝', 'oscar12@email.com', '34dd923cc3af58d2a5a534fbeb66a9d4f6384eaa50689930b4a51be53b8e261c', '魅力狐', 'image01.jpg', '1981-07-03', '2024-07-01 00:00:00', NULL, 'qr_code158.jpg', '0977745714', 'line_aoscar12', 10015, '花蓮縣', '巫冉孝', '0977745714', '萊爾富', '67890100', NULL, 'Note here'),
(20240993, '吳俊濤', 'paul12@email.com', '899496ec6ab74a871a8edd71f0ea3cb1e6c5aa2d76cae5331c7feaa7933a182b', '無畏豹', 'image01.jpg', '1983-08-17', '2024-07-01 00:00:00', NULL, 'qr_code159.jpg', '0977745715', 'line_apaul12', 10016, '宜蘭縣', '吳俊濤', '0977745715', 'OK', '78901004', NULL, 'Note here'),
(20240994, '王興雅', 'quincy12@email.com', 'fb038f65fb096838c1cd69b5486cce9f0e21996e02f2787dd1df6b702732df18', '迅捷魚', 'image01.jpg', '1990-11-30', '2024-07-01 00:00:00', NULL, 'qr_code160.jpg', '0977745716', 'line_aquincy12', 10017, '屏東縣', '王興雅', '0977745716', '全家', '89010045', NULL, 'Note here'),
(20240995, '童博奕', 'rose12@email.com', '21acf8aba212f3e66cd5056dd756fb76b5028ef003e9cb8ed2bd8787dfeb9670', '敏捷兔', 'image01.jpg', '1987-09-16', '2024-07-01 00:00:00', NULL, 'qr_code161.jpg', '0977745717', 'line_arose12', 10018, '澎湖縣', '童博奕', '0977745717', '711', '90100456', NULL, 'Note here'),
(20240996, '尤帆筱', 'steve12@email.com', '13b2846e97048500d71a6b72351d54edc941e42c72b43fad110244a0136e4655', '智勇鷹', 'image01.jpg', '1991-02-05', '2024-07-01 00:00:00', NULL, 'qr_code162.jpg', '0977745718', 'line_asteve12', 10019, '金門縣', '尤帆筱', '0977745718', '萊爾富', '01004567', NULL, 'Note here'),
(20240997, '蔡嚴義', 'tina12@email.com', 'df0f35a1f854581dcb7131afbb5d7094b082f4fd6192f368341294a2d41aa89b', '優雅鹿', 'image01.jpg', '1986-12-20', '2024-07-01 00:00:00', NULL, 'qr_code163.jpg', '0977745719', 'line_atina12', 10020, '連江縣', '蔡嚴義', '0977745719', 'OK', '10045678', NULL, 'Note here'),
(20240998, '葉城穎', 'uma12@email.com', '46538aba4b44e223f69213017aad5f6894dffb7a78fa1cde7ea80371d350106f', '智慧羊', 'image01.jpg', '1993-06-07', '2024-07-01 00:00:00', NULL, 'qr_code164.jpg', '0977745720', 'line_auma12', 10021, '台北市', '葉城穎', '0977745720', '全家', '23456789', NULL, 'Note here'),
(20240999, '許功銘', 'vince12@email.com', 'b40719631cc05459f82bb41788aee341f7bcda4bb58d4657d60d524fef9349d6', '靈巧鷹', 'image01.jpg', '1988-04-19', '2024-07-01 00:00:00', NULL, 'qr_code165.jpg', '0977745721', 'line_avince12', 10022, '新北市', '許功銘', '0977745721', '711', '34567890', NULL, 'Note here'),
(20241000, '吳元晨', 'wanda12@email.com', 'e9bd5c83d5f890bab491e1ddc17f9983f7ecc678de0d457f83c4ac1c19a366ce', '聰明魚', 'image01.jpg', '1990-01-14', '2024-07-01 00:00:00', NULL, 'qr_code166.jpg', '0977745722', 'line_awanda12', 10023, '桃園市', '吳元晨', '0977745722', '萊爾富', '45678901', NULL, 'Note here'),
(20241001, '詹海清', 'xander12@email.com', '26254f06ab6f2dda8c89fe5a42a6a790ddcb8582046cc3a9fc8c6633d185052c', '迅捷兔', 'image01.jpg', '1989-10-27', '2024-07-01 00:00:00', NULL, 'qr_code167.jpg', '0977745723', 'line_axander12', 10024, '台中市', '詹海清', '0977745723', 'OK', '56789012', NULL, 'Note here'),
(20241002, '蔡思辛', 'yara12@email.com', 'df60f092d27e794f107542c9fa0396cdec9d95a36e9642188fba7f607d6f5533', '靈活虎', 'image01.jpg', '1985-03-11', '2024-07-01 00:00:00', NULL, 'qr_code168.jpg', '0977745724', 'line_ayara12', 10025, '台南市', '蔡思辛', '0977745724', '全家', '67890100', NULL, 'Note here'),
(20241003, '陳慧揚', 'zack12@email.com', '45a5f5c40fcb4e2f998d446c5b9eb1295ae77fcf080d573f04a3f68c9af76137', '優雅狐', 'image01.jpg', '1997-08-03', '2024-07-01 00:00:00', NULL, 'qr_code169.jpg', '0977745725', 'line_azack12', 10026, '高雄市', '陳慧揚', '0977745725', '711', '78901004', NULL, 'Note here'),
(20241004, '張勳慈', 'alice2@email.com', '705164cf38ca5abcb84534584882b5f18719ba9d34bd07e710afa234d44e9196', '勇敢熊', 'image01.jpg', '1983-11-19', '2024-07-01 00:00:00', NULL, 'qr_code170.jpg', '0977745726', 'line_aalice2', 10027, '基隆市', '張勳慈', '0977745726', '萊爾富', '89010045', NULL, 'Note here'),
(20241005, '姜光瞻', 'bob2@email.com', '59a0772c22c1216d167e98cebc861a67eee8ed3745dd7ff8ac51688cb7630281', '敏捷狗', 'image01.jpg', '1986-07-22', '2024-07-01 00:00:00', NULL, 'qr_code171.jpg', '0977745727', 'line_abob2', 10028, '新竹市', '姜光瞻', '0977745727', 'OK', '90100456', NULL, 'Note here'),
(20241006, '王益碧', 'charlie2@email.com', '3a6a6a6d40a49598741f80ba98c238e6dd762105aac7c01c21a38611b754dae6', '堅強豹', 'image01.jpg', '1994-02-15', '2024-07-01 00:00:00', NULL, 'qr_code172.jpg', '0977745728', 'line_acharlie2', 10029, '嘉義市', '王益碧', '0977745728', '全家', '01004567', NULL, 'Note here'),
(20241007, '黃悟業', 'david2@email.com', '470651bce7e5e8be428616384b7462bf151401d26edeee65f4848ab64bab9f16', '靈活羊', 'image01.jpg', '1982-05-12', '2024-07-01 00:00:00', NULL, 'qr_code173.jpg', '0977745729', 'line_adavid2', 10030, '苗栗縣', '黃悟業', '0977745729', '711', '10045678', NULL, 'Note here'),
(20241008, '杜優榕', 'ella2@email.com', '71af46c4449e604fa3d467a731e50ff7a8cfc0c64aea95eddfdcebd999b675f0', '溫暖魚', 'image01.jpg', '1989-09-28', '2024-07-01 00:00:00', NULL, 'qr_code174.jpg', '0977745730', 'line_aella2', 10031, '彰化縣', '杜優榕', '0977745730', '萊爾富', '23456789', NULL, 'Note here'),
(20241009, '周採聰', 'frank2@email.com', 'c4fdb9df6a75a0cd791757492de99080bcde74f6150f58406f3c764c2102ce19', '威猛豹', 'image01.jpg', '1984-12-01', '2024-07-01 00:00:00', NULL, 'qr_code175.jpg', '0977745731', 'line_afrank2', 10032, '南投縣', '周採聰', '0977745731', 'OK', '34567890', NULL, 'Note here'),
(20241010, '童常晗', 'george2@email.com', '86a391786640b653431af1f9f154d433fcd59fe42b4b64f2a830737eb44f9327', '迅捷兔', 'image01.jpg', '1992-08-11', '2024-07-01 00:00:00', NULL, 'qr_code176.jpg', '0977745732', 'line_ageorge2', 10033, '雲林縣', '童常晗', '0977745732', '全家', '45678901', NULL, 'Note here'),
(20241011, '阮歆石', 'hannah2@email.com', '8e1d5a53144486defef5c8ccf8d98eade1e2ed01d2f9dbfff5cac3f1e953e2e7', '聰明豬', 'image01.jpg', '1988-04-05', '2024-07-01 00:00:00', NULL, 'qr_code177.jpg', '0977745733', 'line_ahannah2', 10034, '台東縣', '阮歆石', '0977745733', '711', '56789012', NULL, 'Note here'),
(20241012, '廖禎越', 'ian2@email.com', '4a8fd1b5f40bc39ba88b40de5bfa50fd0dca1484ef37703580cb6a4ff807eeea', '無畏獅', 'image01.jpg', '1996-06-13', '2024-07-01 00:00:00', NULL, 'qr_code178.jpg', '0977745734', 'line_aian2', 10035, '花蓮縣', '廖禎越', '0977745734', '萊爾富', '67890100', NULL, 'Note here'),
(20241013, '詹卿欣', 'jane2@email.com', '0811b4d20b26494e099e487b49bb68af39f8e0a9eb364a66e56f3c2f8ceebcdd', '智勇鹿', 'image01.jpg', '1981-01-24', '2024-07-01 00:00:00', NULL, 'qr_code179.jpg', '0977745735', 'line_ajane2', 10036, '宜蘭縣', '詹卿欣', '0977745735', 'OK', '78901004', NULL, 'Note here'),
(20241014, '楊利康', 'kevin2@email.com', '0c0da9963af3f12d216d641c0d5e7ab4edb1e82f86bf53a1d044c9b350898f0e', '靈巧熊', 'image01.jpg', '1987-10-09', '2024-07-01 00:00:00', NULL, 'qr_code180.jpg', '0977745736', 'line_akevin2', 10037, '屏東縣', '楊利康', '0977745736', '全家', '89010045', NULL, 'Note here'),
(20241015, '錢睿韻', 'laura2@email.com', '92afdf02f31024faad03b6925a529857fef62e8621c1d21389a9a7b0391b8199', '勇敢狐', 'image01.jpg', '1995-05-18', '2024-07-01 00:00:00', NULL, 'qr_code181.jpg', '0977745737', 'line_alaura2', 10038, '澎湖縣', '錢睿韻', '0977745737', '711', '90100456', NULL, 'Note here'),
(20241016, '謝喧熹', 'michael2@email.com', '5f9f87b7b71165d17ca2991739ab0be08769674f2f67b562ddc85472f004235d', '迅捷狗', 'image01.jpg', '1986-12-23', '2024-07-01 00:00:00', NULL, 'qr_code182.jpg', '0977745738', 'line_amichael2', 10039, '金門縣', '謝喧熹', '0977745738', '萊爾富', '01004567', NULL, 'Note here'),
(20241017, '鄒利艾', 'nancy2@email.com', '2d44326ea46d18cf834f4db43c3a39e5e6f70494ffbbccf33349d8e07e2549dc', '溫暖鷹', 'image01.jpg', '1991-09-14', '2024-07-01 00:00:00', NULL, 'qr_code183.jpg', '0977745739', 'line_anancy2', 10040, '連江縣', '鄒利艾', '0977745739', 'OK', '10045678', NULL, 'Note here'),
(20241018, '傅以研', 'oscar2@email.com', '5e6f328a05a3a59b1650f02debbd1e00d3fdd2bd32b5fae2e9b39eaff13bb7c6', '靈活豹', 'image01.jpg', '1998-03-27', '2024-07-01 00:00:00', NULL, 'qr_code184.jpg', '0977745740', 'line_aoscar2', 10041, '台北市', '傅以研', '0977745740', '全家', '23456789', NULL, 'Note here'),
(20241019, '戴湘美', 'paul2@email.com', '9880b747574af80a56f633b8a0e8c0d789f21928d42748abec59603d9cf53515', '優雅魚', 'image01.jpg', '1990-08-10', '2024-07-01 00:00:00', NULL, 'qr_code185.jpg', '0977745741', 'line_apaul2', 10042, '新北市', '戴湘美', '0977745741', '711', '34567890', NULL, 'Note here'),
(20241020, '巫添莘', 'quincy2@email.com', 'f22f7100aa20266be42e99e316daa020bc0aae3e653500a04692258458b1b10d', '無畏鹿', 'image01.jpg', '1985-04-12', '2024-07-01 00:00:00', NULL, 'qr_code186.jpg', '0977745742', 'line_aquincy2', 10043, '桃園市', '巫添莘', '0977745742', '萊爾富', '45678901', NULL, 'Note here'),
(20241021, '張彬温', 'rose2@email.com', '8fad21ced0bdcfca7c69da3267b9c452376004c44c639e803e3098317a64ea02', '智勇狗', 'image01.jpg', '1997-11-21', '2024-07-01 00:00:00', NULL, 'qr_code187.jpg', '0977745743', 'line_arose2', 10044, '台中市', '張彬温', '0977745743', 'OK', '56789012', NULL, 'Note here'),
(20241022, '翁儀昀', 'steve2@email.com', '0751cfc3d65da7f440b8f5c1df2a9c5f79e893c4b6fa8a3b79b3ed00a154f6c7', '靈巧獅', 'image01.jpg', '1984-06-04', '2024-07-01 00:00:00', NULL, 'qr_code188.jpg', '0977745744', 'line_asteve2', 10045, '台南市', '翁儀昀', '0977745744', '全家', '67890100', NULL, 'Note here'),
(20241023, '邱保裕', 'tina2@email.com', '8116b0dee91cc32f544cf9cbcf5fa7625a8609d79c8ba75f6cd92dd86ace687b', '勇敢豹', 'image01.jpg', '1993-03-09', '2024-07-01 00:00:00', NULL, 'qr_code189.jpg', '0977745745', 'line_atina2', 10046, '高雄市', '邱保裕', '0977745745', '711', '78901004', NULL, 'Note here'),
(20241024, '陳寒邦', 'uma2@email.com', '3a1f3d21393be4b8e74e39955b2c2a3512e10830bd78d30f3cb1454e0df13c3f', '敏捷羊', 'image01.jpg', '1988-01-14', '2024-07-01 00:00:00', NULL, 'qr_code190.jpg', '0977745746', 'line_auma2', 10047, '基隆市', '陳寒邦', '0977745746', '萊爾富', '89010045', NULL, 'Note here'),
(20241025, '黃家琴', 'vince2@email.com', '34464be34dd678136545b97ea5833c4740a8fc7095597e60fa16c5bb0d1ef7f1', '溫暖豬', 'image01.jpg', '1994-05-19', '2024-07-01 00:00:00', NULL, 'qr_code191.jpg', '0977745747', 'line_avince2', 10048, '新竹市', '黃家琴', '0977745747', 'OK', '90100456', NULL, 'Note here'),
(20241026, '袁又珊', 'wanda2@email.com', '82bd9486604046d9b3955a6983d924bfc1ecfd6489a0e48189e3cb653a6854a2', '無畏兔', 'image01.jpg', '1998-02-27', '2024-07-01 00:00:00', NULL, 'qr_code192.jpg', '0977745748', 'line_awanda2', 10049, '嘉義市', '袁又珊', '0977745748', '全家', '01004567', NULL, 'Note here'),
(20241027, '楊暉曄', 'xander2@email.com', '1a5a5bb8fee6cc910671bf1cfb056a0b47559ef0366d2394840b67dd43e27a8c', '迅捷魚', 'image01.jpg', '1986-08-21', '2024-07-01 00:00:00', NULL, 'qr_code193.jpg', '0977745749', 'line_axander2', 10050, '苗栗縣', '楊暉曄', '0977745749', '711', '10045678', NULL, 'Note here'),
(20241028, '余威澍', 'yara2@email.com', 'fbbba24908c567a31cc9153c3f5e3cc5d58868eaeb343ee0f5587dc63eb6f300', '智勇狐', 'image01.jpg', '1983-11-05', '2024-07-01 00:00:00', NULL, 'qr_code194.jpg', '0977745750', 'line_ayara2', 10051, '彰化縣', '余威澍', '0977745750', '萊爾富', '23456789', NULL, 'Note here'),
(20241029, '黃千珈', 'zack2@email.com', 'ec8ba3b5db49048febb723fc9528306a97ccd6c25d3410952837c149f14c197b', '勇敢豹', 'image01.jpg', '1991-07-14', '2024-07-01 00:00:00', NULL, 'qr_code195.jpg', '0977745751', 'line_azack2', 10052, '南投縣', '黃千珈', '0977745751', 'OK', '34567890', NULL, 'Note here'),
(20241030, '陳展暢', 'alice3@email.com', 'd37870230f856d2b8cc26f0e294eaa63c11432a756cd8b6f91efd0e0066ca62a', '迅捷狗', 'image01.jpg', '1988-12-30', '2024-07-01 00:00:00', NULL, 'qr_code196.jpg', '0977745752', 'line_aalice3', 10053, '雲林縣', '陳展暢', '0977745752', '全家', '45678901', NULL, 'Note here'),
(20241031, '馬孝採', 'bob3@email.com', '7d121cdb10412bb7ab33a8a572137c1446e5254c5234b56f0d6516b5337fd470', '靈巧兔', 'image01.jpg', '1992-10-18', '2024-07-01 00:00:00', NULL, 'qr_code197.jpg', '0977745753', 'line_abob3', 10054, '台東縣', '馬孝採', '0977745753', '711', '56789012', NULL, 'Note here'),
(20241032, '梁顯均', 'charlie3@email.com', 'e2e7510aaf9edb287dc970b02edf99adb0bc4e25bd1b45826c23fa290b3dbe8b', '無畏羊', 'image01.jpg', '1987-06-20', '2024-07-01 00:00:00', NULL, 'qr_code198.jpg', '0977745754', 'line_acharlie3', 10055, '花蓮縣', '梁顯均', '0977745754', '萊爾富', '67890100', NULL, 'Note here'),
(20241033, '陳勵達', 'david3@email.com', 'a91944a33b9bd73b78ff6ea6dc929b94440d9b717de11b0f9b8d224082ab7805', '智勇鹿', 'image01.jpg', '1996-01-15', '2024-07-01 00:00:00', NULL, 'qr_code199.jpg', '0977745755', 'line_adavid3', 10056, '宜蘭縣', '陳勵達', '0977745755', 'OK', '78901004', NULL, 'Note here'),
(20241034, '馮宣毓', 'ella3@email.com', '7eab57f8884cba251b53de7140317c0dcc77cd7e41b164cf49a1687816ce8eec', '溫暖熊', 'image010.jpg', '1990-09-26', '2024-07-01 00:00:00', NULL, 'qr_code1100.jpg', '0977745756', 'line_aella3', 10057, '屏東縣', '馮宣毓', '0977745756', '全家', '89010045', NULL, 'Note here'),
(20241058, '王一', 'alice1@email.com', '7dcf407fa84a0e0519c7991154c4148de0244d7589020c0d9842db9efad82094', '快樂海豚', 'image01.jpg', '1985-05-15', '2024-07-01 00:00:00', NULL, 'qr_code121.jpg', '0919945700', 'line_aalice1', 10021, '台北市', '王一', '0919945700', '全家', '23456789', NULL, 'Note here'),
(20241059, '李二', 'bob1@email.com', '8bb4c01cc43f617ccfd1d4745b19b5a6030d15b12750b39d60479ae7504a7387', '神秘貓頭鷹', 'image01.jpg', '1992-03-22', '2024-07-01 00:00:00', NULL, 'qr_code122.jpg', '0919945701', 'line_abob1', 20022, '新北市', '李二', '0919945701', '711', '34567890', NULL, 'Note here'),
(20241060, '陳三', 'charlie1@email.com', 'b2220233e90770a24fbb70547bffab2bacf447aecf6551bf9e3c8a016769cd7f', '優雅孔雀', 'image01.jpg', '1987-07-13', '2024-07-01 00:00:00', NULL, 'qr_code123.jpg', '0919945702', 'line_acharlie1', 30023, '桃園市', '陳三', '0919945702', '萊爾富', '45678901', NULL, 'Note here'),
(20241061, '張四', 'david1@email.com', '61da1bf4b810347c76923eb525e4a29d410770807cbb4f560371d7509f55b78f', '靈巧狐狸', 'image01.jpg', '1995-10-30', '2024-07-01 00:00:00', NULL, 'qr_code124.jpg', '0919945703', 'line_adavid1', 40024, '台中市', '張四', '0919945703', 'OK', '56789012', NULL, 'Note here'),
(20241062, '林五', 'eve1@email.com', '2e338461aafd52d1978df6c609b25fd094e89d454e82fd87c86f8d40e743ea2f', '勇敢獅子', 'image01.jpg', '2000-01-20', '2024-07-01 00:00:00', NULL, 'qr_code125.jpg', '0919945704', 'line_aeve1', 50025, '台南市', '林五', '0919945704', '全家', '67890123', NULL, 'Note here'),
(20241063, '黃六', 'frank1@email.com', 'bd83e5076d73480b48661c9220edc29f890e4113f7757b69683edee5c753a966', '魅惑豹', 'image01.jpg', '1988-04-25', '2024-07-01 00:00:00', NULL, 'qr_code126.jpg', '0919945705', 'line_afrank1', 60026, '高雄市', '黃六', '0919945705', '711', '78901234', NULL, 'Note here'),
(20241064, '周七', 'grace1@email.com', '7d1164dfc3783575e47abde7fea70cdbce9f77a7d75ebbf7d34b196fe2ea8ec2', '神聖箭', 'image01.jpg', '1991-09-09', '2024-07-01 00:00:00', NULL, 'qr_code127.jpg', '0919945706', 'line_agrace1', 70027, '基隆市', '周七', '0919945706', '萊爾富', '89012345', NULL, 'Note here'),
(20241065, '鄭八', 'hannah1@email.com', '46538aba4b44e223f69213017aad5f6894dffb7a78fa1cde7ea80371d350106f', '俏皮海獺', 'image01.jpg', '1983-11-27', '2024-07-01 00:00:00', NULL, 'qr_code128.jpg', '0919945707', 'line_ahannah1', 80028, '新竹市', '鄭八', '0919945707', 'OK', '90123456', NULL, 'Note here'),
(20241066, '趙九', 'isaac1@email.com', 'b40719631cc05459f82bb41788aee341f7bcda4bb58d4657d60d524fef9349d6', '驚艷紅鶴', 'image01.jpg', '1994-02-14', '2024-07-01 00:00:00', NULL, 'qr_code129.jpg', '0919945708', 'line_aisaac1', 90029, '台中市', '趙九', '0919945708', '全家', '01234567', NULL, 'Note here'),
(20241067, '劉十', 'jack1@email.com', 'e9bd5c83d5f890bab491e1ddc17f9983f7ecc678de0d457f83c4ac1c19a366ce', '獨立貓', 'image01.jpg', '1986-12-01', '2024-07-01 00:00:00', NULL, 'qr_code130.jpg', '0919945709', 'line_ajack1', 10030, '台南市', '劉十', '0919945709', '711', '12345678', NULL, 'Note here'),
(20241068, '汪品晉', 'kate1@email.com', '26254f06ab6f2dda8c89fe5a42a6a790ddcb8582046cc3a9fc8c6633d185052c', '強壯水牛', 'image01.jpg', '1990-06-16', '2024-07-01 00:00:00', NULL, 'qr_code131.jpg', '0919945710', 'line_akate1', 20031, '高雄市', '汪品晉', '0919945710', '萊爾富', '23456789', NULL, 'Note here'),
(20241069, '盧坤理', 'linda1@email.com', 'df60f092d27e794f107542c9fa0396cdec9d95a36e9642188fba7f607d6f5533', '靜謐天鵝', 'image01.jpg', '1989-08-08', '2024-07-01 00:00:00', NULL, 'qr_code132.jpg', '0919945711', 'line_alinda1', 30032, '台北市', '盧坤理', '0919945711', 'OK', '34567890', NULL, 'Note here'),
(20241070, '洪修琦', 'mike1@email.com', '45a5f5c40fcb4e2f998d446c5b9eb1295ae77fcf080d573f04a3f68c9af76137', '火焰劍', 'image01.jpg', '1997-04-01', '2024-07-01 00:00:00', NULL, 'qr_code133.jpg', '0919945712', 'line_amike1', 40033, '新北市', '洪修琦', '0919945712', '全家', '45678901', NULL, 'Note here'),
(20241071, '張安瑄', 'nancy1@email.com', '8fe8d13022752e11aa2fee544f3353fdc2cfda0b7130283a24c4d6699b6870cd', '雷電盾', 'image01.jpg', '1982-10-15', '2024-07-01 00:00:00', NULL, 'qr_code134.jpg', '0919945713', 'line_anancy1', 50034, '桃園市', '張安瑄', '0919945713', '711', '56789012', NULL, 'Note here');
INSERT INTO `userinfo` (`user_id`, `user_name`, `email`, `password`, `nick_name`, `user_img`, `birthday`, `create_day`, `last_date`, `qr_img`, `mobile`, `line_id`, `postal_code`, `address`, `recipient`, `contact_number`, `store_firm`, `store_id`, `history_id`, `note`) VALUES
(20241072, '林嬋美', 'oliver1@email.com', '073598265fc480bf2312373e87bdab981fde31baf7dac0fcb368e130adfabccc', '黑暗匕首', 'image01.jpg', '1993-03-18', '2024-07-01 00:00:00', NULL, 'qr_code135.jpg', '0919945714', 'line_aoliver1', 60035, '台中市', '林嬋美', '0919945714', '萊爾富', '67890123', NULL, 'Note here'),
(20241073, '劉敬景', 'peter1@email.com', '9880b747574af80a56f633b8a0e8c0d789f21928d42748abec59603d9cf53515', '魔法鎧', 'image01.jpg', '1984-07-07', '2024-07-01 00:00:00', NULL, 'qr_code136.jpg', '0919945715', 'line_apeter1', 70036, '台南市', '劉敬景', '0919945715', 'OK', '78901234', NULL, 'Note here'),
(20241074, '鄧凡瑋', 'quincy1@email.com', 'f22f7100aa20266be42e99e316daa020bc0aae3e653500a04692258458b1b10d', '冰霜矛', 'image01.jpg', '1998-12-24', '2024-07-01 00:00:00', NULL, 'qr_code137.jpg', '0919945716', 'line_aquincy1', 80037, '高雄市', '鄧凡瑋', '0919945716', '全家', '89012345', NULL, 'Note here'),
(20241075, '范任良', 'rachel1@email.com', '8fad21ced0bdcfca7c69da3267b9c452376004c44c639e803e3098317a64ea02', '狂野鎚', 'image01.jpg', '1981-05-03', '2024-07-01 00:00:00', NULL, 'qr_code138.jpg', '0919945717', 'line_arachel1', 90038, '基隆市', '范任良', '0919945717', '711', '90123456', NULL, 'Note here'),
(20241076, '廖孝安', 'sam1@email.com', '0751cfc3d65da7f440b8f5c1df2a9c5f79e893c4b6fa8a3b79b3ed00a154f6c7', '迅捷弓', 'image01.jpg', '1996-08-29', '2024-07-01 00:00:00', NULL, 'qr_code139.jpg', '0919945718', 'line_asam1', 10039, '新竹市', '廖孝安', '0919945718', '萊爾富', '01234567', NULL, 'Note here'),
(20241077, '林瑤黛', 'tina1@email.com', '8116b0dee91cc32f544cf9cbcf5fa7625a8609d79c8ba75f6cd92dd86ace687b', '閃電矛', 'image01.jpg', '1999-01-11', '2024-07-01 00:00:00', NULL, 'qr_code140.jpg', '0919945719', 'line_atina1', 20040, '台北市', '林瑤黛', '0919945719', 'OK', '12345678', NULL, 'Note here'),
(20241078, '江恆恩', 'ursula1@email.com', '3a1f3d21393be4b8e74e39955b2c2a3512e10830bd78d30f3cb1454e0df13c3f', '烈焰弓', 'image01.jpg', '1992-04-21', '2024-07-01 00:00:00', NULL, 'qr_code141.jpg', '0919945720', 'line_aursula1', 30041, '新北市', '江恆恩', '0919945720', '全家', '23456789', NULL, 'Note here'),
(20241079, '程均棟', 'victor1@email.com', '34464be34dd678136545b97ea5833c4740a8fc7095597e60fa16c5bb0d1ef7f1', '暗影盾', 'image01.jpg', '1988-12-30', '2024-07-01 00:00:00', NULL, 'qr_code142.jpg', '0919945721', 'line_avictor1', 40042, '桃園市', '程均棟', '0919945721', '711', '34567890', NULL, 'Note here'),
(20241080, '賴容文', 'wendy1@email.com', '82bd9486604046d9b3955a6983d924bfc1ecfd6489a0e48189e3cb653a6854a2', '光明劍', 'image01.jpg', '1984-09-17', '2024-07-01 00:00:00', NULL, 'qr_code143.jpg', '0919945722', 'line_awendy1', 50043, '台中市', '賴容文', '0919945722', '萊爾富', '23456789', NULL, 'Note here'),
(20241081, '噴火龍', 'test@email.com', '12341234', '噴火龍', 'image01.jpg', NULL, '2024-07-17 08:54:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20241082, '水箭龜', 'test1@email.com', '$2y$12$QjSH496pcT5CEbzjD/vtVeH03tfHKFy36d4J0Ltp3lRtee9HDxY3K', 'X進化水箭龜', 'image01.jpg', NULL, '2024-07-17 09:38:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20241083, '阿嘟嘟', '123qwertt@mail.com', '$2y$10$VdDD5gG8/YhOVyFde/gICeRQ7H870h46ELekpRE1NXRAfBvH9Huki', '阿布嘟嘟', 'image01.jpg', '2024-07-16', '2024-07-18 15:26:19', NULL, NULL, '0917878787', NULL, NULL, '13246', NULL, NULL, NULL, NULL, NULL, NULL),
(20241084, '法蘭', 'PlayUncle1925@gmail.com', '$2y$10$VdDD5gG8/YhOVyFde/gICeRQ7H870h46ELekpRE1NXRAfBvH9Huki', '夜光閃亮亮復仇鬼', 'image01.jpg', '2024-07-01', '2024-07-18 21:58:10', NULL, NULL, '0917765847', NULL, NULL, '新北市', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `favorlist`
--
ALTER TABLE `favorlist`
  ADD PRIMARY KEY (`favor_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- 資料表索引 `orderlist`
--
ALTER TABLE `orderlist`
  ADD PRIMARY KEY (`ord_id`);

--
-- 資料表索引 `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ord_id` (`ord_id`);

--
-- 資料表索引 `prodlist`
--
ALTER TABLE `prodlist`
  ADD PRIMARY KEY (`prod_id`);

--
-- 資料表索引 `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `qr_img` (`qr_img`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `line_id` (`line_id`),
  ADD KEY `userinfo_ibfk_1` (`history_id`);

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
  MODIFY `history_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20241085;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `favorlist`
--
ALTER TABLE `favorlist`
  ADD CONSTRAINT `favorlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`),
  ADD CONSTRAINT `favorlist_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `prodlist` (`prod_id`);

--
-- 資料表的限制式 `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`user_id`),
  ADD CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`ord_id`) REFERENCES `orderlist` (`ord_id`);

--
-- 資料表的限制式 `userinfo`
--
ALTER TABLE `userinfo`
  ADD CONSTRAINT `userinfo_ibfk_1` FOREIGN KEY (`history_id`) REFERENCES `order_history` (`history_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
