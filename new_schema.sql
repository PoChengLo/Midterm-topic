-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024 年 07 月 11 日 15:05
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
-- 資料庫： `new_schema`
--

-- --------------------------------------------------------

--
-- 資料表結構 `CARTITEM`
--

CREATE TABLE `CARTITEM` (
  `cart_item_id` int NOT NULL,
  `cart_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `cart_item_qty` decimal(8,0) NOT NULL,
  `cart_item_total` decimal(8,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='購物車項目';

-- --------------------------------------------------------

--
-- 資料表結構 `CARTLIST`
--

CREATE TABLE `CARTLIST` (
  `cart_id` int NOT NULL,
  `user_id` int NOT NULL,
  `cart_total` decimal(8,0) NOT NULL,
  `cart_pay` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='購物車列表';

-- --------------------------------------------------------

--
-- 資料表結構 `ORDERITEM`
--

CREATE TABLE `ORDERITEM` (
  `ord_detail_id` int NOT NULL,
  `ord_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `item_price` decimal(8,0) NOT NULL,
  `item_qty` decimal(8,0) NOT NULL,
  `item_total` decimal(8,0) NOT NULL,
  `prod_comm` varchar(255) DEFAULT NULL,
  `prod_star` int DEFAULT NULL,
  `prod_sales` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='訂單項目';

-- --------------------------------------------------------

--
-- 資料表結構 `ORDERLIST`
--

CREATE TABLE `ORDERLIST` (
  `ord_id` int NOT NULL,
  `ord_date` datetime NOT NULL,
  `user_id` int NOT NULL,
  `ord_total` decimal(8,0) NOT NULL,
  `ord_pay` tinyint(1) NOT NULL,
  `ship_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='訂單列表';

-- --------------------------------------------------------

--
-- 資料表結構 `PRODLIST`
--

CREATE TABLE `PRODLIST` (
  `prod_id` int NOT NULL,
  `prod_name` varchar(255) NOT NULL,
  `prod_tag_id` int NOT NULL,
  `prod_price` decimal(8,0) NOT NULL,
  `prod_stock` decimal(8,0) NOT NULL,
  `prod_img` varchar(255) NOT NULL,
  `prod_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prod_disc` decimal(3,2) NOT NULL,
  `prod_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='桌遊商品列表';

-- --------------------------------------------------------

--
-- 資料表結構 `PRODTAG`
--

CREATE TABLE `PRODTAG` (
  `prod_tag_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品類別列表';

-- --------------------------------------------------------

--
-- 資料表結構 `TAGLIST`
--

CREATE TABLE `TAGLIST` (
  `tag_id` int NOT NULL,
  `tag_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='類別表';

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `CARTITEM`
--
ALTER TABLE `CARTITEM`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `card_id->CARTLIST` (`cart_id`),
  ADD KEY `prod_id->PRODLIST3` (`prod_id`);

--
-- 資料表索引 `CARTLIST`
--
ALTER TABLE `CARTLIST`
  ADD PRIMARY KEY (`cart_id`);

--
-- 資料表索引 `ORDERITEM`
--
ALTER TABLE `ORDERITEM`
  ADD PRIMARY KEY (`ord_detail_id`),
  ADD KEY `ord_id->ORDERLIST` (`ord_id`),
  ADD KEY `prod_id->PRODLIST2` (`prod_id`);

--
-- 資料表索引 `ORDERLIST`
--
ALTER TABLE `ORDERLIST`
  ADD PRIMARY KEY (`ord_id`);

--
-- 資料表索引 `PRODLIST`
--
ALTER TABLE `PRODLIST`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `prod_tag_id->PRODTAG` (`prod_tag_id`);

--
-- 資料表索引 `PRODTAG`
--
ALTER TABLE `PRODTAG`
  ADD PRIMARY KEY (`prod_tag_id`),
  ADD KEY `prod_id->PRODLIST` (`prod_id`),
  ADD KEY `tag_id->TAGLIST` (`tag_id`);

--
-- 資料表索引 `TAGLIST`
--
ALTER TABLE `TAGLIST`
  ADD PRIMARY KEY (`tag_id`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `CARTITEM`
--
ALTER TABLE `CARTITEM`
  ADD CONSTRAINT `card_id->CARTLIST` FOREIGN KEY (`cart_id`) REFERENCES `CARTLIST` (`cart_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `prod_id->PRODLIST3` FOREIGN KEY (`prod_id`) REFERENCES `PRODLIST` (`prod_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 資料表的限制式 `ORDERITEM`
--
ALTER TABLE `ORDERITEM`
  ADD CONSTRAINT `ord_id->ORDERLIST` FOREIGN KEY (`ord_id`) REFERENCES `ORDERLIST` (`ord_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `prod_id->PRODLIST2` FOREIGN KEY (`prod_id`) REFERENCES `PRODLIST` (`prod_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 資料表的限制式 `PRODLIST`
--
ALTER TABLE `PRODLIST`
  ADD CONSTRAINT `prod_tag_id->PRODTAG` FOREIGN KEY (`prod_tag_id`) REFERENCES `PRODTAG` (`prod_tag_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 資料表的限制式 `PRODTAG`
--
ALTER TABLE `PRODTAG`
  ADD CONSTRAINT `prod_id->PRODLIST` FOREIGN KEY (`prod_id`) REFERENCES `PRODLIST` (`prod_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tag_id->TAGLIST` FOREIGN KEY (`tag_id`) REFERENCES `TAGLIST` (`tag_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
