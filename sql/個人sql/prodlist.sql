-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024 年 07 月 18 日 22:43
-- 伺服器版本： 8.3.0
-- PHP 版本： 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `new_db_0718`
--

-- --------------------------------------------------------

--
-- 資料表結構 `prodlist`
--

CREATE TABLE `prodlist` (
  `prod_id` int NOT NULL,
  `prod_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_tag_id` int DEFAULT NULL,
  `prod_stock` decimal(8,0) DEFAULT NULL,
  `prod_desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_price` decimal(8,0) DEFAULT NULL,
  `prod_disc` decimal(3,2) DEFAULT NULL,
  `prod_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='桌遊商品列表';

--
-- 傾印資料表的資料 `prodlist`
--

INSERT INTO `prodlist` (`prod_id`, `prod_name`, `prod_img`, `prod_tag_id`, `prod_stock`, `prod_desc`, `prod_price`, `prod_disc`, `prod_update`) VALUES
(1, '龍之遺跡 (Dragon’s Legacy)', '001.jpg', 6, 20, '背景故事：在遙遠的大陸上，有一座神秘的城堡，據說裡面藏著龍的寶藏。這座城堡被稱為「龍之遺跡」。傳說中，這位巨龍曾是一位強大的魔法師，他的寶藏包含了無數的寶石、魔法物品和知識。冒險者們聞風而至，希望能夠一探究竟，但城堡充滿了陷阱、謎題和神秘的魔法，只有最勇敢的人才能夠成功。', 1200, 1.00, '2024-06-01 09:00:00'),
(2, '幽靈船 (Ghost Ship))', '002.jpg', 2, 20, '背景故事：在一個風暴肆虐的夜晚，一艘幽靈船漂浮在海上。這艘船曾經是可怕的海盜船，現在卻成了鬼魂的家。船上的幽靈船員試圖找到失散的寶藏，但他們必須面對詛咒和鬼魂的威脅。每個角落都隱藏著危險，但寶藏就在眼前。', 900, 0.90, '2024-02-11 12:00:00'),
(3, '奇幻競技場 (Fantasy Arena)', '003.jpg', 3, 10, '背景故事：在一個神秘的競技場中，不同種族的戰士、法師和怪物聚集在一起，為了榮譽和寶物而戰。這個競技場由神秘的魔法師創造，中央有一個傳送門，通向其他世界。每個角色都有獨特的技能，每場比賽都是一場驚心動魄的戰鬥。', 1500, 0.85, '2023-11-11 11:11:11'),
(4, '時光迷宮 (Chrono Labyrinth)', '004.jpg', 4, 13, '背景故事：在一個神秘的森林深處，有一座古老的迷宮，被稱為「時光迷宮」。這個迷宮不僅是空間的迷宮，還是時間的迷宮。每個房間都通往不同的時代，從史前時代到遙遠的未來，甚至是平行宇宙。傳說中，時光迷宮的中心藏著一個能夠改變歷史的神秘寶物。', 2500, 1.00, '2023-05-02 09:15:00'),
(5, '魔法糖果工廠 (Enchanted Candy Factory)', '005.jpg', 5, 20, '背景故事：在一個彩色繽紛的世界中，有一座神奇的糖果工廠，名為「魔法糖果工廠」。這個工廠由一位古老的糖果師傅創立，他擁有神秘的魔法技能，能夠製作出令人驚艷的糖果。這些糖果不僅美味，還具有奇幻的效果，例如讓人飛行、變小或甚至穿越時空。', 2100, 0.75, '2023-05-05 15:10:00'),
(6, '魔法餐廳 (Enchanted Bistro)', '006.jpg', 6, 13, '故事背景：在一個隱藏於森林深處的神秘餐廳，糖果、藥草和魔法交織成美味佳餚。這裡的廚師是糖果精靈和烹飪巫師，他們的料理能夠賦予食客不同的魔法效果。每道菜都是一場奇幻的冒險，每個客人都是一位冒險者。', 1300, 0.95, '2024-09-09 09:00:00'),
(7, '詭異時光錶 (Eerie Hourglass)', '007.jpg', 7, 19, '背景故事： 一個神秘的沙漏能夠穿越時空，將人們帶到不同的年代。但每次使用都會引發詭異事件，需要解開謎題才能回到現實。這款神秘的時光錶是一位古老的時間守護者所創造。它看似一個普通的沙漏，但卻擁有非凡的力量。每當你翻轉它，你就能夠穿越到不同的年代，體驗過去和未來的奇幻世界。然而，使用時光錶總是伴隨著詭異事件，需要解開謎題才能回到現實。', 1950, 1.00, '2024-03-22 15:00:00'),
(8, '笑話大亂鬥 (Joke Brawl)', '008.jpg', 8, 14, '背景故事：在一個詼諧的競技場上，各種笑話角色爭奪笑聲之冠。這裡有說冷笑話的小丑、搞笑的外星人、諷刺的詩人，甚至是一位神秘的笑聲使者。每個人都想成為最有趣的人，贏得觀眾的掌聲。你是一位年輕的笑話師，渴望在「笑話大亂鬥」中嶄露頭角。你的目標是成為最搞笑的人，贏得笑聲之冠。在競技場上，你遇到了其他笑話角色，例如「謎語大師」和「語言戰士」。每個人都有自己獨特的笑話技能，例如「語言戰士」可以用文字創造出最詼諧的場景。', 1440, 0.70, '2023-06-15 08:00:00'),
(9, '怪獸養成所 (Monster Nursery)', '009.jpg', 9, 15, '背景故事： 在一個神秘的怪獸養成所，你是怪獸訓練師。這個養成所位於一座隱藏在樹林中的古老城堡，被魔法結界保護著。你的目標是培養出最可愛、最詭異、最厲害的怪獸，並讓它們成為世界上最受歡迎的寵物。在養成所裡，你遇到了各種奇特的怪獸，例如「毛絨龍」和「幻影貓」。你必須學會如何餵食、訓練和照顧它們，並與其他訓練師交流經驗。', 1600, 1.00, '2024-02-22 14:00:00'),
(10, '魔法鬥拳 (Mystic Fisticuffs)', '010.jpg', 10, 5, '背景故事： 在一個魔法世界中，各種奇特的生物參加鬥拳比賽，使用魔法技能和特殊招式。這個競技場由神秘的魔法使者創造，中央有一個神奇的鬥拳之石，據說能夠賦予戰士無限的力量。你是一位年輕的戰士，渴望在「魔法鬥拳」中證明自己的實力。你的目標是成為最強的鬥拳戰士，贏得鬥拳之石。', 2400, 0.95, '2024-01-01 13:00:00'),
(11, '死亡遊戲 (Game of Mortality)', '011.jpg', 11, 8, '背景故事： 艾莉絲·哈珀（Alice Harper）是一位突然得到大量遺產的寡婦。她的丈夫，一位富有的收藏家，意外身亡，留下了一個神秘的遺囑。遺囑中提到了「死亡遊戲」，一場超越生死的詭異競賽。這場遊戲的規則是：參賽者必須在一個古老的莊園中生存下去，找出遊戲的創造者，並打破詛咒。每個參與者都有自己的動機和秘密，而莊園充滿了危險、謎團和不可思議的力量。艾莉絲決定參加這場遊戲，不僅為了解開丈夫的死亡之謎，也是為了尋找自己的目的和意義。她必須在莊園中探索，與其他參與者競爭，並解開遊戲的謎團。但是，每個人都是潛在的兇手，每個線索都是關鍵。在這場生死之間的遊戲中，艾莉絲將面臨極限挑戰，揭示遊戲的真正目的，並找到自己的答案。她的命運與莊園的詭譎之間交織，而她的選擇將決定她的生死。', 3000, 1.00, '2024-02-01 13:00:00'),
(12, '推理之夜 (Night of Deduction)', '012.jpg', 12, 11, '背景故事： 1841年的倫敦，陰霾籠罩著街頭巷尾。即將退休的老警探亨利·福斯特（Henry Foster）在一生中解決了無數謎團，但他的最後一個案件卻是他職業生涯中最棘手的。這次，他被召集到一座古老的莊園，參加了一場名為「推理之夜」的神秘晚宴。莊園主人是一位神秘的富商，名叫阿爾伯特·蒙哥馬利（Albert Montgomery）。蒙哥馬利先生是一位熱愛謎題和謀殺案的收藏家，他邀請了一群天才推理者、神秘學家和犯罪心理學家參加這場晚宴。每個參與者都有自己的動機和秘密，而蒙哥馬利先生的目的只有一個：解開一個看似不可能的謀殺之謎。在這個古老的莊園中，福斯特老警探必須收集線索、訪問其他參與者，並在晚宴上揭示兇手的身份。但是，每個人都是潛在的兇手，每個線索都是關鍵。而時間在不斷流逝，福斯特老警探必須在退休前解開這個謎團，否則這將成為他職業生涯中的一個遺憾。', 2800, 1.00, '2024-03-01 12:00:00'),
(13, '驚悚列車 (Thriller Express)', '013.jpg', 13, 22, '背景故事： 剛成年的孤兒，艾娃（Eva），正要前往匈牙利尋找她失散多年的父親。她的唯一線索是一封古老的信，其中提到父親曾在一趟名為「驚悚列車」的火車上工作。這列車並非普通的交通工具，而是一個神秘的移動世界。它穿越歷史、文化和超自然的境界，載著各式各樣的乘客：從神秘的旅行者到危險的犯罪份子，每個人都有自己的目的和秘密。艾娃登上了「驚悚列車」，她的心跳加速，因為她知道這是她與父親重逢的唯一機會。但是，這列車並非只是一趟普通的旅程。在其中，她將面對超自然現象、謎團和危險，而每個車廂都是一個新的挑戰。艾娃必須解開列車上的謎團，找到父親，並揭示驚悚列車背後的真相。她的命運與這趟列車緊密相連，而她的選擇將決定她的未來。', 1700, 1.00, '2024-04-01 12:00:00'),
(14, '克蘇魯的遺產 (Cthulhu’s Legacy)', '014.jpg', 14, 12, '背景故事： 艾莉森·格雷（Allison Gray）是一位年輕的小說家，她的作品以神秘和超自然元素為主題。某天，她在一個寒冷的冬夜中，做了一個奇怪的夢。在這個夢中，她置身於一個古老的神廟，四周是腐朽的雕像和神秘的符號。在夢中，艾莉森遇見了一位神秘的長者，他名為克蘇魯。克蘇魯是一個失落的神祇，被囚禁在地球上的沉沒城市拉萊耶之下。他的存在超越了人類的理解，他的眼睛閃爍著宇宙的秘密。艾莉森醒來時，她感到自己被這個夢境深深吸引。她開始研究克蘇魯神話，追尋這個失落的神秘世界。她的小說開始受到克蘇魯的影響，她的文字中充滿了古老的符號、禁忌的知識和不可名狀的恐怖。艾莉森的小說逐漸引起了讀者的注意，但同時也引來了危險。她的作品似乎喚醒了克蘇魯，而他的遺產開始影響現實世界。艾莉森必須解開克蘇魯的謎團，找到真相，並保護自己和她所愛的人。', 1900, 1.00, '2024-05-01 14:00:00'),
(15, '靈異審判 (Spectral Tribunal)', '015.jpg', 15, 15, '背景故事： 在一個被詛咒的小鎮上，靈異現象層出不窮。你是一位靈媒，被召集到一座古老的法庭，解決靈魂的紛爭。每個案件都涉及詭異的事件和不可思議的證據。這座法庭位於一座荒廢的教堂，其木質長椅上仍殘留著靈魂的氣息，而法官則是一位神秘的長者，他的眼睛能洞察靈魂的真相。', 2200, 1.00, '2024-04-10 09:00:00'),
(16, '魔法王國：貓頭鷹與矮人的傳說 (Magic Kingdom: The Legend of Owls and Dwarves)', '016.jpg', 8, 20, '背景故事：在遙遠的魔法王國中，矮人們擁有豐富的礦藏，而貓頭鷹則是智慧的象徵，守護著古老的魔法知識。王國中的魔法師們致力於保持世界的平衡，但最近，神秘的黑暗勢力開始蠢蠢欲動，試圖奪取魔法的力量。為了保護王國，貓頭鷹、矮人和魔法師們必須攜手合作，通過一系列挑戰來阻止黑暗勢力的侵襲。', 2200, 1.00, '2024-07-18 15:54:00'),
(17, '奔馳大草原 (Savanna Sprint)', '017.jpg', 4, 20, '在非洲大草原上，動物們每年都會舉辦一場盛大的賽跑比賽，以決定誰是最快的動物。這次的比賽吸引了來自四面八方的參賽者，包括獅子、羚羊、斑馬、大象等。每位選手都有自己的特長和策略，目標是利用智慧和速度在充滿挑戰的賽道上脫穎而出，成為年度冠軍。', 1450, 1.00, '2024-07-18 20:50:00'),
(18, '黑暗陰謀(Dark Conspiracy)', '018.jpg', 20, 20, '背景故事：在工業革命時代的倫敦，黑暗的街道和煙霧瀰漫的天空下，殺手們正在策劃一連串駭人的事件。每一個謀殺案背後都有複雜的陰謀與計劃，而目擊者們則在恐懼中掙扎，警察在迷霧中艱難追捕。玩家需要在這個危險的城市中，扮演不同的角色，解開謎團或實施完美的犯罪，利用智慧和策略來達成各自的目標。', 2450, 1.00, '2024-07-18 22:22:00'),
(19, '海嘯求生(Tsunami Survival)', '019.jpg', 7, 20, '背景故事：在菲律賓的美麗沙灘上，遊客們正享受著陽光和海浪，突然間，一場巨大海嘯即將來襲。玩家們需要在這個驚心動魄的危機中，快速反應並協同合作，利用有限的資源和智慧來逃離險境，保護自己和他人。每個決策都關係到生死存亡，只有最機智和團結的團隊才能存活下來。', 1700, 1.00, '2024-07-18 22:29:00'),
(20, '冰封絕境 (Frozen Peril)', '020.jpg', 7, 20, '背景故事：在俄國的偏遠內陸，一群旅人被困在大雪紛飛的冬夜裡。他們找到了一間破舊的小木屋，躲避寒冷。然而，他們很快發現，這裡不僅是嚴寒的避難所，還有一個神秘的兇手潛伏其中。玩家們必須在這個嚴苛的環境中，克服恐懼，彼此合作，尋找資源，揭開兇手的真面目，並設法生存下去。', 2000, 1.00, '2024-07-18 22:42:00');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `prodlist`
--
ALTER TABLE `prodlist`
  ADD PRIMARY KEY (`prod_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
