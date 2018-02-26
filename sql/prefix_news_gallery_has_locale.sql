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
-- Struktura tabulky `prefix_news_gallery_has_locale`
--

CREATE TABLE `prefix_news_gallery_has_locale` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_locale` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'vazba na jazyk',
  `id_news_gallery` bigint(20) UNSIGNED NOT NULL COMMENT 'vazba na polozku galerie',
  `title` varchar(255) DEFAULT NULL COMMENT 'titulek'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='novinky - galerie maji preklady';

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `prefix_news_gallery_has_locale`
--
ALTER TABLE `prefix_news_gallery_has_locale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_news_gallery_has_locale_locale_idx` (`id_locale`),
  ADD KEY `fk_news_gallery_has_locale_news_gallery_idx` (`id_news_gallery`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `prefix_news_gallery_has_locale`
--
ALTER TABLE `prefix_news_gallery_has_locale`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `prefix_news_gallery_has_locale`
--
ALTER TABLE `prefix_news_gallery_has_locale`
  ADD CONSTRAINT `fk_news_gallery_has_locale_locale` FOREIGN KEY (`id_locale`) REFERENCES `prefix_locale` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_news_gallery_has_locale_news_gallery` FOREIGN KEY (`id_news_gallery`) REFERENCES `prefix_news_gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
