-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost:3306
-- Vytvořeno: Úte 06. úno 2018, 12:38
-- Verze serveru: 10.1.26-MariaDB-0+deb9u1
-- Verze PHP: 7.0.27-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `netteweb`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `prefix_news`
--

CREATE TABLE `prefix_news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ident` varchar(100) DEFAULT NULL COMMENT 'identifikator',
  `image` varchar(400) DEFAULT NULL COMMENT 'obrazek',
  `added` datetime DEFAULT NULL COMMENT 'pridano',
  `visible` tinyint(1) DEFAULT '0' COMMENT 'viditelnost',
  `visible_on_homepage` tinyint(1) DEFAULT '0' COMMENT 'viditelnost na homepage'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='novinky';

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `prefix_news`
--
ALTER TABLE `prefix_news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `prefix_news`
--
ALTER TABLE `prefix_news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
