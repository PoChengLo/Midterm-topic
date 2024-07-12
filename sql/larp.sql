-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-07-12 09:49:32
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
-- 資料庫： `larp`
--

-- --------------------------------------------------------

--
-- 資料表結構 `larplist`
--

CREATE TABLE `larplist` (
  `larp_id` int NOT NULL,
  `larp_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `larp_price` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `larp_people` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `larp_date` datetime DEFAULT NULL,
  `larp_info` varchar(255) DEFAULT NULL,
  `larp_tag_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `larp_desc` varchar(68) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `larp_loc` varchar(255) DEFAULT NULL,
  `larp_star` int DEFAULT NULL,
  `larp_comm` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `larplist`
--

INSERT INTO `larplist` (`larp_id`, `larp_name`, `larp_price`, `larp_people`, `larp_date`, `larp_info`, `larp_tag_id`, `larp_desc`, `larp_loc`, `larp_star`, `larp_comm`) VALUES
(1, '卡坦島 (Settlers of Catan)', '約30美元', '3-4人（有擴展包可增加玩家人數）', NULL, NULL, NULL, '建築與資源管理遊戲，玩家在未開拓的島嶼上建設道路、定居點及城市，並交易資源以達成目標。', NULL, NULL, NULL),
(2, '票房大亨 (Ticket to Ride)', '約50美元', '2-5人', NULL, NULL, NULL, '鐵路建設主題遊戲，玩家透過收集火車卡連接城市以完成路線並獲得分數。', NULL, NULL, NULL),
(3, '巴哈馬毒氣事件 (Pandemic)', '約40美元', '2-4人（有擴展包可增加玩家人數）', NULL, NULL, NULL, '合作式遊戲，玩家合作對抗全球擴散的疾病，共同策略避免全球大流行。', NULL, NULL, NULL),
(4, '傳奇 (The Resistance)', '約20美元', '5-10人', NULL, NULL, NULL, '心理戰遊戲，玩家分為抵抗組織成員和政府特務，特務需偽裝成抵抗組織以推翻抵抗組織。', NULL, NULL, NULL),
(5, '世紀: 高盧戰記 (Small World)', '約50美元', '2-5人（有擴展包可增加玩家人數）', NULL, NULL, NULL, '區域佔領遊戲，玩家扮演奇幻種族，在地圖上擴展領土並獲得分數。', NULL, NULL, NULL),
(6, '殖民地 (Colonists)', '約70美元', '1-4人', NULL, NULL, NULL, '資源管理和城市建設遊戲，玩家透過建造和管理來滿足殖民地居民的需求，以達成目標。', NULL, NULL, NULL),
(7, '王朝 (Dominion)', '約35美元', '2-4人（有擴展包可增加玩家人數）', NULL, NULL, NULL, '牌組構築遊戲，玩家透過購買卡片來建立自己的牌組，並利用卡片效果獲得點數。', NULL, NULL, NULL),
(8, '七大奇蹟 (7 Wonders)', '約40美元', '2-7人', NULL, NULL, NULL, '文明建設遊戲，玩家在不同時期建設奇蹟並發展文明，以獲得最高分數。', NULL, NULL, NULL),
(9, '王牌大地主 (The Great Dalmuti)', '約15美元', '4-8人', NULL, NULL, NULL, '改編自古老的卡牌遊戲，玩家透過出牌和角色換位來爭奪地位，遊戲結束時頭領為王牌大地主。', NULL, NULL, NULL),
(10, '亞特蘭提斯傳奇 (Atlantis Rising)', '約60美元', '1-7人', NULL, NULL, NULL, '合作式遊戲，玩家合作阻止亞特蘭提斯沉沒，透過資源管理和協作來建造防禦系統。', NULL, NULL, NULL),
(11, '電力公司 (Power Grid)', '約45美元', '2-6人', NULL, NULL, NULL, '經濟策略遊戲，玩家建立發電廠和供電網絡，管理資源並滿足城市需求以獲得最高營收。', NULL, NULL, NULL),
(12, '穿越歷史 (Through the Ages: A New Story of Civilization)', '約65美元', '2-4人', NULL, NULL, NULL, '文明建設遊戲，玩家透過科技發展和領土擴展，建立強大的文明並獲得文明分數。', NULL, NULL, NULL),
(13, '極地大冒險 (Arctic Scavengers)', '約25美元', '2-5人', NULL, NULL, NULL, '生存和策略遊戲，玩家在極地搜尋資源和建立部落，並與其他玩家爭奪資源和生存。', NULL, NULL, NULL),
(14, '瘟疫公司 (Plague Inc.)', '約35美元', '1-4人', NULL, NULL, NULL, '模擬和策略遊戲，玩家以病毒形式侵入世界各地，擴散疾病並進行進化以達到最大影響。', NULL, NULL, NULL),
(15, '時空穿梭 (Time Stories)', '約50美元', '2-4人', NULL, NULL, NULL, '冒險和謎題解決遊戲，玩家穿越不同時空並解開隱藏的謎團，透過時間迴圈來達成任務。', NULL, NULL, NULL),
(16, '王國重建 (Kingdom Builder)', '約40美元', '2-4人', NULL, NULL, NULL, '區域佔領和策略遊戲，玩家透過地形板塊佔領建築點來擴展王國並獲得分數。', NULL, NULL, NULL),
(17, '維京養成記 (A Feast for Odin)', '約75美元', '1-4人', NULL, NULL, NULL, '資源管理和策略遊戲，玩家以維京人身份探索和擴展領土，並完成各種任務以獲得維京生活的最高榮耀。', NULL, NULL, NULL),
(18, '狼人 (Ultimate Werewolf)', '約20美元', '8-18人', NULL, NULL, NULL, '社交推理遊戲，玩家分為狼人和村民兩隊，村民透過推理找出狼人並消滅他們。', NULL, NULL, NULL),
(19, '垂死的星球 (Twilight Imperium)', '約150美元', '3-6人', NULL, NULL, NULL, '太空政治和策略遊戲，玩家代表不同的太空文明進行外交、戰爭和資源管理，以控制宇宙中的星系。', NULL, NULL, NULL),
(20, '殘酷王室 (Intrigue)', '約25美元', '3-6人', NULL, NULL, NULL, '策略和心理遊戲，玩家扮演君主和貴族，在宮廷中進行交易和密謀以維持權力和影響力。', NULL, NULL, NULL),
(21, '星際大戰: 皇家 (Star Wars: Imperial Assault)', '約80美元', '2-5人', NULL, NULL, NULL, '戰略和冒險遊戲，玩家分為帝國和反抗軍，進行地面戰和特工任務以影響星際戰爭的結果。', NULL, NULL, NULL),
(22, '王國藝術 (Kingdomino)', '約20美元', '2-4人', NULL, NULL, NULL, '輕鬆的區域佔領遊戲，玩家透過拼湊地塊來建立個人王國並獲得最高分數。', NULL, NULL, NULL),
(23, '災難之都 (Doomtown: Reloaded)', '約30美元', '2-4人', NULL, NULL, NULL, '西部世界和卡牌遊戲混合，玩家在荒涼的災難之都中建立勢力並進行決鬥和控制。', NULL, NULL, NULL),
(24, '大絕殺 (Battlestar Galactica)', '約60美元', '3-6人', NULL, NULL, NULL, '合作與背叛遊戲，玩家分為人類和叛徒，人類需保護星際船艦和抵抗叛徒的入侵。', NULL, NULL, NULL),
(25, '上流社會 (Splendor)', '約35美元', '2-4人', NULL, NULL, NULL, '資源收集和發展遊戲，玩家透過購買寶石和發展商業來達成貴族身份。', NULL, NULL, NULL),
(26, '戰爭之光 (War of the Ring)', '約90美元', '2-4人', NULL, NULL, NULL, '指揮和戰略遊戲，玩家分為自由人和黑暗勢力，以指揮軍隊和影響中土世界的戰爭結果。', NULL, NULL, NULL),
(27, '地底探險 (Sub Terra)', '約30美元', '1-6人', NULL, NULL, NULL, '生存和冒險遊戲，玩家在地底迷宮中尋找出路並避免各種危險，以逃出地下世界。', NULL, NULL, NULL),
(28, '阿卡諾 (Arcadia Quest)', '約70美元', '2-4人', NULL, NULL, NULL, '冒險和戰鬥遊戲，玩家控制英雄隊伍在城市中冒險並對抗怪物以獲得榮譽和寶藏。', NULL, NULL, NULL),
(29, '機器人危機 (RoboRally)', '約40美元', '2-6人', NULL, NULL, NULL, '機器人和策略遊戲，玩家透過編程指令來控制機器人在工廠中完成競賽和任務。', NULL, NULL, NULL),
(30, '銀河征服 (Twilight Struggle)', '約50美元', '2人', NULL, NULL, NULL, '冷戰主題的策略遊戲，玩家代表美國或蘇聯，在全球進行政治、軍事和外交競爭以獲得最高影響力。', NULL, NULL, NULL),
(31, '菁英遊戲 (Codenames)', '約20美元', '2-8人', NULL, NULL, NULL, '情報解密遊戲，玩家扮演間諜和情報官員，透過暗示來找出自己隊伍的代號並完成任務。', NULL, NULL, NULL),
(32, '君主 (Monarch)', '約25美元', '2-4人', NULL, NULL, NULL, '王室和卡牌遊戲，玩家透過收集貴族、建設建築和管理資源來建立最強的王國。', NULL, NULL, NULL),
(33, '命運: 虛構 (Dead of Winter)', '約60美元', '2-5人', NULL, NULL, NULL, '生存和合作遊戲，玩家在冰封的世界中合作以對抗寒冷和食人者，並保護殖民地的生存。', NULL, NULL, NULL),
(34, '據點防禦 (The Manhattan Project: Energy Empire)', '約55美元', '1-5人', NULL, NULL, NULL, '資源管理和工業化遊戲，玩家在世界舞台上建立能源帝國並進行環保和科技發展。', NULL, NULL, NULL),
(35, '邊境 (Borderlands)', '約30美元', '2-4人', NULL, NULL, NULL, '合作和冒險遊戲，玩家探索邊境地區並對抗怪物和外星生物，以保護殖民地和資源。', NULL, NULL, NULL),
(36, '摩登藝術 (Modern Art)', '約30美元', '3-5人', NULL, NULL, NULL, '藝術品市場和投資遊戲，玩家透過購買和拍賣藝術品來獲得最高的投資報酬。', NULL, NULL, NULL),
(37, '尖峰時刻 (High Society)', '約15美元', '3-5人', NULL, NULL, NULL, '貴族和拍賣遊戲，玩家透過出價和購買來獲得最高的貴族地位和社會地位。', NULL, NULL, NULL),
(38, '赫拉克勒斯傳奇 (Heraclio Legend)', '約25美元', '4-6人', NULL, NULL, NULL, '神話和角色扮演遊戲，玩家扮演古代英雄並完成神話中的任務和挑戰以贏得榮譽和獎勵。', NULL, NULL, NULL),
(39, '寶石礦工 (Quartz)', '約20美元', '3-5人', NULL, NULL, NULL, '礦業和交易遊戲，玩家扮演寶石礦工在礦山中挖掘寶石並交易以獲得最高的利潤。', NULL, NULL, NULL),
(40, '天空工廠 (Sky Factory)', '約30美元', '2-4人', NULL, NULL, NULL, '科技和生產遊戲，玩家在天空城市中建立工廠和生產線以提升資源和技術水平。', NULL, NULL, NULL),
(41, '終極迷宮 (Ultimate Dungeon)', '約40美元', '1-4人', NULL, NULL, NULL, '地牢探險和冒險遊戲，玩家在隨機生成的地牢中探索和戰鬥以獲得寶藏和經驗。', NULL, NULL, NULL),
(42, '戰爭之矛 (Spearpoint 1943)', '約30美元', '2-4人', NULL, NULL, NULL, '二戰和戰略遊戲，玩家在戰場上指揮部隊並使用策略和戰術來取得勝利和控制。', NULL, NULL, NULL),
(43, '魔法傳奇 (Legends of Magic)', '約25美元', '3-6人', NULL, NULL, NULL, '魔法和冒險遊戲，玩家扮演魔法使和冒險者在魔法世界中尋找寶藏和解開魔法秘密。', NULL, NULL, NULL),
(44, '大亨 (Tycoon)', '約30美元', '3-5人', NULL, NULL, NULL, '企業和資源管理遊戲，玩家建立和管理企業以擴展資源和利潤，並達成企業的最高地位。', NULL, NULL, NULL),
(45, '火星殖民 (Terraforming Mars)', '約60美元', '1-5人', NULL, NULL, NULL, '科技和殖民地遊戲，玩家在火星上進行氣候調節和資源開發以建立永久性殖民地。', NULL, NULL, NULL),
(46, '星際公民 (Star Citizen)', '約150美元', '1-4人', NULL, NULL, NULL, '太空探險和資源管理遊戲，玩家透過飛行船和資源開發來探索宇宙並達成個人和團隊的目標。', NULL, NULL, NULL),
(47, '冒險島 (Isle of Adventure)', '約25美元', '2-5人', NULL, NULL, NULL, '冒險和探索遊戲，玩家在神秘島嶼上探索和尋找寶藏以獲得豐富的獎勵和經驗。', NULL, NULL, NULL),
(48, '英雄雲集 (Gloomhaven)', '約140美元', '1-4人', NULL, NULL, NULL, '角色扮演和探險遊戲，玩家扮演冒險者和英雄在奇幻世界中進行冒險和戰鬥以達成目標和任務。', NULL, NULL, NULL),
(49, '瘋狂實驗 (Epic Lab Time)', '約30美元', '2-6人', NULL, NULL, NULL, '科學實驗和策略遊戲，玩家透過收集資源和進行實驗來創造最瘋狂和有趣的發明和創新。', NULL, NULL, NULL),
(50, '地底之王 (King of Underground)', '約25美元', '3-5人', NULL, NULL, NULL, '地底城市和策略遊戲，玩家建立和管理地下城市以控制資源和防禦敵人的入侵。', NULL, NULL, NULL),
(51, '恐怖入侵 (Mansions of Madness)', '約90美元', '2-5人', NULL, NULL, NULL, '驚悚和冒險遊戲，玩家探索和解開驚悚大宅中的隱藏秘密和怪異現象。', NULL, NULL, NULL),
(52, '戰鬥輪 (Battlecon)', '約35美元', '2-5人', NULL, NULL, NULL, '格鬥和戰術遊戲，玩家透過選擇和操作戰鬥技巧來進行一對一的戰鬥和對抗。', NULL, NULL, NULL),
(53, '巴哈馬帝國 (Empire of the Bahamas)', '約45美元', '2-4人', NULL, NULL, NULL, '海盜和帝國建設遊戲，玩家扮演海盜和帝國領袖進行掠奪和建立帝國以達成統治和霸業。', NULL, NULL, NULL),
(54, '古代悲劇 (Ancient Tragedy)', '約30美元', '3-6人', NULL, NULL, NULL, '神話和悲劇遊戲，玩家扮演古代英雄和神話人物在神秘的世界中進行冒險和挑戰。', NULL, NULL, NULL),
(55, '神奇城市 (Mage Knight)', '約80美元', '1-4人', NULL, NULL, NULL, '奇幻和策略遊戲，玩家扮演魔法騎士和英雄在神秘城市中探索和戰鬥以達成目標和任務。', NULL, NULL, NULL),
(56, '巨獸大亨 (Monster Tycoon)', '約35美元', '2-5人', NULL, NULL, NULL, '怪獸和企業管理遊戲，玩家建立和管理怪獸園區以吸引遊客和維護怪獸的健康和安全。', NULL, NULL, NULL),
(57, '星際探險 (Star Expedition)', '約40美元', '2-4人', NULL, NULL, NULL, '太空探險和資源開發遊戲，玩家在星際中建立殖民地和資源基地以達成個人和團隊的目標。', NULL, NULL, NULL),
(58, '石器時代 (Stone Age)', '約50美元', '2-4人', NULL, NULL, NULL, '文明和資源管理遊戲，玩家扮演史前部落並進行狩獵、採集和建設以達成發展和進步。', NULL, NULL, NULL),
(59, '太陽神傳奇 (Legends of the Sun God)', '約65美元', '3-6人', NULL, NULL, NULL, '神話和冒險遊戲，玩家扮演古代文明的神話英雄和神明進行冒險和尋找失落的寶藏和神器。', NULL, NULL, NULL),
(60, '秘境 (Mysterium)', '約40美元', '2-7人', NULL, NULL, NULL, '驚悚和解謎遊戲，玩家扮演靈媒和靈異探險家在靈異的宅邸中解開隱藏的秘密和事件。', NULL, NULL, NULL),
(61, '末世之暮 (The Fall of the Apocalypse)', '約55美元', '2-5人', NULL, NULL, NULL, '末世和生存遊戲，玩家在末日和毀滅的世界中生存和對抗來自外部的威脅和敵人。', NULL, NULL, NULL),
(62, '絕地重生 (Rebirth)', '約30美元', '3-5人', NULL, NULL, NULL, '生存和冒險遊戲，玩家在死亡世界中重生和對抗來自外部的危險和敵人。', NULL, NULL, NULL),
(63, '巫師之夜 (Night of the Wizard)', '約25美元', '2-4人', NULL, NULL, NULL, '魔法和冒險遊戲，玩家扮演巫師和魔法使在黑暗的夜晚中進行冒險和解謎。', NULL, NULL, NULL),
(64, '古代夜晚 (Ancient Nights)', '約30美元', '3-6人', NULL, NULL, NULL, '古代文明和神秘遊戲，玩家在夜晚和神秘的世界中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(65, '龍之地下城 (Dragon Dungeon)', '約45美元', '2-5人', NULL, NULL, NULL, '龍和地下城遊戲，玩家探索和解鎖地下城並對抗龍和怪物以獲得寶藏和經驗。', NULL, NULL, NULL),
(66, '命運之塔 (Tower of Destiny)', '約35美元', '2-4人', NULL, NULL, NULL, '冒險和迷宮遊戲，玩家在命運之塔中探索和解鎖迷宮並對抗怪物和隱藏的秘密。', NULL, NULL, NULL),
(67, '復仇 (Revenge)', '約20美元', '3-6人', NULL, NULL, NULL, '角色扮演和冒險遊戲，玩家在復仇之路上進行對抗和戰鬥以達成榮譽和獎勵。', NULL, NULL, NULL),
(68, '黑暗法則 (Dark Rules)', '約25美元', '2-5人', NULL, NULL, NULL, '驚悚和懸疑遊戲，玩家扮演偵探和靈異學家在黑暗的世界中解開罪案和怪異的事件。', NULL, NULL, NULL),
(69, '暴君 (Tyrant)', '約30美元', '3-5人', NULL, NULL, NULL, '古代和帝國建設遊戲，玩家扮演暴君和皇帝在古代帝國中建設和擴展以達成統治和霸業。', NULL, NULL, NULL),
(70, '帝國的光榮 (Glory of the Empire)', '約35美元', '2-4人', NULL, NULL, NULL, '帝國和資源管理遊戲，玩家扮演帝國建設者和統治者在帝國中建立和管理資源以達成最高地位和權力。', NULL, NULL, NULL),
(71, '世界末日 (World of the End)', '約40美元', '2-5人', NULL, NULL, NULL, '末世和生存遊戲，玩家在末日世界中生存和對抗來自外部的威脅和敵人。', NULL, NULL, NULL),
(72, '尋寶歷險 (Treasure Adventure)', '約30美元', '3-6人', NULL, NULL, NULL, '探險和尋寶遊戲，玩家在神秘和危險的世界中探索和尋找隱藏的寶藏和寶物。', NULL, NULL, NULL),
(73, '死亡遺產 (Legacy of Death)', '約25美元', '2-4人', NULL, NULL, NULL, '驚悚和生存遊戲，玩家在死亡和毀滅的世界中生存和對抗來自外部的威脅和敵人。', NULL, NULL, NULL),
(74, '未來大亨 (Future Tycoon)', '約30美元', '2-5人', NULL, NULL, NULL, '未來和科技管理遊戲，玩家建立和管理未來城市和資源以達成最高的科技和創新。', NULL, NULL, NULL),
(75, '毀滅 (Destruction)', '約20美元', '2-4人', NULL, NULL, NULL, '戰略和戰爭遊戲，玩家在戰場上指揮和控制部隊並使用策略和戰術來取得勝利和控制。', NULL, NULL, NULL),
(76, '古埃及 (Ancient Egypt)', '約30美元', '3-5人', NULL, NULL, NULL, '文明和資源管理遊戲，玩家建立和管理古代埃及文明以達成最高的發展和進步。', NULL, NULL, NULL),
(77, '世界末日: 黑暗之冠 (World of the End: The Dark Crown)', '約45美元', '2-5人', NULL, NULL, NULL, '末世和生存遊戲，玩家在末日和毀滅的世界中生存和對抗來自外部的威脅和敵人。', NULL, NULL, NULL),
(78, '掠奪之王 (King of Plunder)', '約25美元', '3-5人', NULL, NULL, NULL, '海盜和掠奪遊戲，玩家扮演海盜和掠奪者在荒涼的島嶼中掠奪和搶劫以達成最高的控制和財富。', NULL, NULL, NULL),
(79, '亞特蘭蒂斯 (Atlantis)', '約35美元', '2-4人', NULL, NULL, NULL, '神秘和冒險遊戲，玩家在失落的亞特蘭蒂斯中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(80, '金字塔之塔 (Tower of the Pyramid)', '約30美元', '3-6人', NULL, NULL, NULL, '古代和冒險遊戲，玩家在金字塔的塔中探索和解鎖隱藏的秘密和事件。', NULL, NULL, NULL),
(81, '謎宮秘境 (Mystery Labyrinth)', '約25美元', '2-4人', NULL, NULL, NULL, '驚悚和解謎遊戲，玩家在靈異的迷宮中解開隱藏的秘密和事件。', NULL, NULL, NULL),
(82, '龍之域 (Dragon Domain)', '約35美元', '2-5人', NULL, NULL, NULL, '龍和奇幻遊戲，玩家建立和管理龍的領域以達成最高的控制和權力。', NULL, NULL, NULL),
(83, '黑暗世界 (Dark World)', '約20美元', '3-6人', NULL, NULL, NULL, '驚悚和懸疑遊戲，玩家扮演偵探和靈異學家在黑暗的世界中解開罪案和怪異的事件。', NULL, NULL, NULL),
(84, '獵魔 (Witch Hunt)', '約30美元', '2-5人', NULL, NULL, NULL, '魔法和狩獵遊戲，玩家扮演獵魔人和巫師在黑暗的夜晚中進行狩獵和對抗以達成榮譽和獎勵。', NULL, NULL, NULL),
(85, '命運之戰 (Battle of Destiny)', '約35美元', '2-4人', NULL, NULL, NULL, '冒險和戰鬥遊戲，玩家在命運之戰中尋找失落的寶藏和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(86, '龍王傳奇 (Dragon King)', '約45美元', '2-5人', NULL, NULL, NULL, '龍和奇幻遊戲，玩家扮演龍王和龍騎士在神秘的世界中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(87, '黑暗傳奇 (Dark Legend)', '約30美元', '3-6人', NULL, NULL, NULL, '驚悚和懸疑遊戲，玩家扮演偵探和靈異學家在黑暗的世界中解開罪案和怪異的事件。', NULL, NULL, NULL),
(88, '地獄之門 (Gate of Hell)', '約25美元', '2-4人', NULL, NULL, NULL, '恐怖和冒險遊戲，玩家在地獄之門中探索和解鎖隱藏的秘密和事件。', NULL, NULL, NULL),
(89, '傳奇戰爭 (Legendary War)', '約35美元', '2-5人', NULL, NULL, NULL, '戰爭和策略遊戲，玩家在傳奇戰爭中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(90, '破滅之路 (Road to Destruction)', '約30美元', '3-6人', NULL, NULL, NULL, '生存和冒險遊戲，玩家在破滅之路中生存和對抗來自外部的威脅和敵人。', NULL, NULL, NULL),
(91, '悲劇之夜 (Night of Tragedy)', '約25美元', '2-4人', NULL, NULL, NULL, '悲劇和驚悚遊戲，玩家在悲劇之夜中解開隱藏的秘密和事件。', NULL, NULL, NULL),
(92, '遺忘之境 (Land of Forgotten)', '約35美元', '2-5人', NULL, NULL, NULL, '冒險和探索遊戲，玩家在遺忘之境中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(93, '魔法之夜 (Night of Magic)', '約30美元', '3-6人', NULL, NULL, NULL, '魔法和冒險遊戲，玩家在魔法之夜中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(94, '龍騎士 (Dragon Knight)', '約45美元', '2-5人', NULL, NULL, NULL, '龍和奇幻遊戲，玩家扮演龍騎士和龍王在神秘的世界中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(95, '太陽神戰爭 (War of the Sun God)', '約35美元', '2-4人', NULL, NULL, NULL, '神話和戰爭遊戲，玩家在太陽神戰爭中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(96, '龍之神秘 (Dragon Mystery)', '約30美元', '3-6人', NULL, NULL, NULL, '龍和神秘遊戲，玩家在龍之神秘中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(97, '失落之境 (Land of Lost)', '約35美元', '2-5人', NULL, NULL, NULL, '冒險和探索遊戲，玩家在失落之境中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(98, '巨龍殿堂 (Dragon Palace)', '約45美元', '2-5人', NULL, NULL, NULL, '龍和奇幻遊戲，玩家在巨龍殿堂中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(99, '魔法之境 (Land of Magic)', '約30美元', '3-6人', NULL, NULL, NULL, '魔法和冒險遊戲，玩家在魔法之境中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL),
(100, '太陽神秘境 (Mystery of the Sun God)', '約35美元', '2-4人', NULL, NULL, NULL, '神話和冒險遊戲，玩家在太陽神秘境中探索和解開隱藏的秘密和事件。', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `larptag`
--

CREATE TABLE `larptag` (
  `larp_tag_id` int NOT NULL,
  `larp_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `taglist`
--

CREATE TABLE `taglist` (
  `tag_id` int NOT NULL,
  `tag_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 傾印資料表的資料 `taglist`
--

INSERT INTO `taglist` (`tag_id`, `tag_name`) VALUES
(1, '益智'),
(2, '親子'),
(3, '策略'),
(4, '派對'),
(5, '卡牌'),
(6, '桌上角色扮演'),
(7, '合作'),
(8, '競速'),
(9, '冒險'),
(10, '推理'),
(11, '戰爭'),
(12, '建設'),
(13, '經營'),
(14, '歷史'),
(15, '科幻'),
(16, '奇幻'),
(17, '運動'),
(18, '音樂'),
(19, '教育'),
(20, '恐怖'),
(21, '經典'),
(22, '動物'),
(23, '自然'),
(24, '歷險'),
(25, '拼圖'),
(26, '旅行'),
(27, '社交'),
(28, '競技'),
(29, '創意'),
(30, '傳統');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `larplist`
--
ALTER TABLE `larplist`
  ADD PRIMARY KEY (`larp_id`);

--
-- 資料表索引 `larptag`
--
ALTER TABLE `larptag`
  ADD KEY `larp_id` (`larp_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- 資料表索引 `taglist`
--
ALTER TABLE `taglist`
  ADD PRIMARY KEY (`tag_id`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `larptag`
--
ALTER TABLE `larptag`
  ADD CONSTRAINT `larptag_ibfk_1` FOREIGN KEY (`larp_id`) REFERENCES `larplist` (`larp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `larptag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `taglist` (`tag_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
