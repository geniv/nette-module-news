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
-- Struktura tabulky `prefix_news_gallery`
--

CREATE TABLE `prefix_news_gallery` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_news` bigint(20) UNSIGNED NOT NULL COMMENT 'vazba na novinku',
  `image` varchar(400) DEFAULT NULL COMMENT 'obrazek',
  `added` datetime DEFAULT NULL COMMENT 'pridano',
  `visible` tinyint(1) DEFAULT '0' COMMENT 'viditelnost',
  `visible_on_homepage` tinyint(1) DEFAULT '0' COMMENT 'viditelnost na homepage',
  `position` bigint(20) UNSIGNED DEFAULT '0' COMMENT 'poradi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='novinky - galerie';

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `prefix_news_gallery`
--
ALTER TABLE `prefix_news_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_news_gallery_news_idx` (`id_news`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `prefix_news_gallery`
--
ALTER TABLE `prefix_news_gallery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `prefix_news_gallery`
--
ALTER TABLE `prefix_news_gallery`
  ADD CONSTRAINT `fk_news_gallery_news` FOREIGN KEY (`id_news`) REFERENCES `prefix_news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
