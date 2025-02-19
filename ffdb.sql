-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: db:3306
-- 生成日時: 2025 年 1 月 28 日 10:49
-- サーバのバージョン： 5.7.44
-- PHP のバージョン: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `db-prizecenter`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `figure`
--

CREATE TABLE `figure` (
  `figure_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maker` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_date` date NOT NULL,
  `salling_price` int(11) DEFAULT '0',
  `buying_price` int(11) DEFAULT '0',
  `favorite` int(11) DEFAULT '0',
  `image_filepath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `up_front` int(11) NOT NULL DEFAULT '0',
  `up_back` int(11) NOT NULL DEFAULT '0',
  `center_front` int(11) NOT NULL DEFAULT '0',
  `center_back` int(11) NOT NULL DEFAULT '0',
  `down_front` int(11) NOT NULL DEFAULT '0',
  `down_back` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `figure`
--

INSERT INTO `figure` (`figure_id`, `name`, `anime`, `maker`, `sale_date`, `salling_price`, `buying_price`, `favorite`, `image_filepath`, `up_front`, `up_back`, `center_front`, `center_back`, `down_front`, `down_back`) VALUES
(1, 'test', 'test', 'test', '2024-12-11', 2222, 1111, 2, '', 1, 0, 1, 1, 1, 1),
(2, 'チェンソーマン Break time collection vol3', 'チェンソーマン', 'バンプレスト', '2024-12-04', 0, 0, 109, '/img/2024/12/2.webp', 0, 0, 20, 10, 2, 1),
(3, 'NARUTO-ナルト- 疾風伝 Grandista-UCHIHA SASUKE-', 'NARUTO', 'バンプレスト', '2024-12-04', 0, 0, 2010, '/img/2024/12/3.jpg\n', 0, 1, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `figure_request`
--

CREATE TABLE `figure_request` (
  `request_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `anime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_ok` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `figure_request`
--

INSERT INTO `figure_request` (`request_id`, `name`, `anime`, `maker`, `memo`, `is_ok`) VALUES
(1, 'サスケ', 'ナルト', '', '', 1),
(2, 'サスケ', 'ナルト', '', '', 1),
(3, 'サスケ', 'ナルト', '', '', 0),
(4, 'asdad', 'NARUTO', 'バンプレスト', 'でっかいやつ', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `operator`
--

CREATE TABLE `operator` (
  `opid` int(11) NOT NULL,
  `login_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pwd_hash` varchar(255) CHARACTER SET utf8 NOT NULL,
  `operator_ac_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `operator`
--

INSERT INTO `operator` (`opid`, `login_id`, `pwd_hash`, `operator_ac_key`) VALUES
(1, 'master', '$2y$10$Zfzs.I6ydQI67S9uW4BDtuudbq0ig.8aHt4hLgjCkN2zIpNor.vyK', 'master');

-- --------------------------------------------------------

--
-- テーブルの構造 `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `mail` varchar(200) CHARACTER SET utf8 NOT NULL,
  `register_datetime` datetime NOT NULL,
  `pwd_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_ac_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `user`
--

INSERT INTO `user` (`user_id`, `mail`, `register_datetime`, `pwd_hash`, `user_ac_key`) VALUES
(1, 'HirotaKakeru1010@gmail.com', '2024-12-03 08:10:27', '$2y$10$MtfRb2qZbVoqqUCmXx10Kuph9PwONjbUvpySEQl9iVEo8wla2xFaq', 'test'),
(2, 'test@gmail.com', '2025-01-14 10:11:50', '$2y$10$tzSV2HsQAKLdMSIy2/Ybl.mscBw/hqjm4VJ.XxzrN6IBAmBh5TRpq', 'GxiVRAUoZy');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_favorite`
--

CREATE TABLE `user_favorite` (
  `user_favorite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `figure_id` int(11) NOT NULL,
  `create_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `user_favorite`
--

INSERT INTO `user_favorite` (`user_favorite_id`, `user_id`, `figure_id`, `create_datetime`) VALUES
(32, 2, 2, '2025-01-14 16:50:00'),
(33, 2, 3, '2025-01-14 16:50:02');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `figure`
--
ALTER TABLE `figure`
  ADD PRIMARY KEY (`figure_id`);

--
-- テーブルのインデックス `figure_request`
--
ALTER TABLE `figure_request`
  ADD PRIMARY KEY (`request_id`);

--
-- テーブルのインデックス `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`opid`);

--
-- テーブルのインデックス `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- テーブルのインデックス `user_favorite`
--
ALTER TABLE `user_favorite`
  ADD PRIMARY KEY (`user_favorite_id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `figure`
--
ALTER TABLE `figure`
  MODIFY `figure_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `figure_request`
--
ALTER TABLE `figure_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルの AUTO_INCREMENT `operator`
--
ALTER TABLE `operator`
  MODIFY `opid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `user_favorite`
--
ALTER TABLE `user_favorite`
  MODIFY `user_favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
