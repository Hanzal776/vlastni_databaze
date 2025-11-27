-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 27. lis 2025, 20:14
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `autosalon`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `auto`
--

CREATE TABLE `auto` (
  `auto_id` int(11) NOT NULL,
  `znacka` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `rok_vyroby` year(4) DEFAULT NULL,
  `obrazek` mediumblob DEFAULT NULL,
  `najeto_km` int(11) DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `palivo` enum('Benzin','Nafta','Elektro','Hybrid') DEFAULT NULL,
  `barva` varchar(30) DEFAULT NULL,
  `prevodovka` enum('Manual','Automat') DEFAULT NULL,
  `dostupne` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `auto`
--

INSERT INTO `auto` (`auto_id`, `znacka`, `model`, `rok_vyroby`, `obrazek`, `najeto_km`, `cena`, `palivo`, `barva`, `prevodovka`, `dostupne`) VALUES
(1, 'Škoda', 'Octavia', '2018', NULL, 145000, 299000.00, 'Benzin', 'Bílá', 'Manual', 1),
(2, 'Hyundai', 'Ioniq', '2021', NULL, 15000, 620000.00, 'Elektro', 'Černá', 'Automat', 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `prodej`
--

CREATE TABLE `prodej` (
  `prodej_id` int(11) NOT NULL,
  `zakaznik_id` int(11) DEFAULT NULL,
  `auto_id` int(11) DEFAULT NULL,
  `zamestnanec_id` int(11) DEFAULT NULL,
  `datum_prodeje` datetime DEFAULT NULL,
  `cena_prodeje` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `prodej`
--

INSERT INTO `prodej` (`prodej_id`, `zakaznik_id`, `auto_id`, `zamestnanec_id`, `datum_prodeje`, `cena_prodeje`) VALUES
(1, 1, 2, 3, '2023-06-12 14:35:00', 610000.00),
(2, 2, 1, 3, '2023-03-02 11:20:00', 285000.00);

-- --------------------------------------------------------

--
-- Struktura tabulky `servis`
--

CREATE TABLE `servis` (
  `servis_id` int(11) NOT NULL,
  `auto_id` int(11) DEFAULT NULL,
  `zamestnanec_id` int(11) DEFAULT NULL,
  `popis` text DEFAULT NULL,
  `cena` decimal(8,2) DEFAULT NULL,
  `datum_servisu` datetime DEFAULT NULL,
  `typ_ukonu` enum('Garanční','Oprava','Kontrola','Příprava na prodej') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `servis`
--

INSERT INTO `servis` (`servis_id`, `auto_id`, `zamestnanec_id`, `popis`, `cena`, `datum_servisu`, `typ_ukonu`) VALUES
(1, 2, 2, 'Výměna brzdových destiček', 4200.00, '2023-07-11 10:10:00', 'Oprava'),
(2, 1, 2, 'Diagnostika motoru', 900.00, '2023-09-17 12:00:00', 'Kontrola');

-- --------------------------------------------------------

--
-- Struktura tabulky `zakaznik`
--

CREATE TABLE `zakaznik` (
  `zakaznik_id` int(11) NOT NULL,
  `prijmeni` varchar(30) DEFAULT NULL,
  `jmeno` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `datum_registrace` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `zakaznik`
--

INSERT INTO `zakaznik` (`zakaznik_id`, `prijmeni`, `jmeno`, `email`, `telefon`, `datum_registrace`) VALUES
(1, 'Novak', 'Jan', 'novak.jan@example.com', '+420722111222 ', '2023-01-15'),
(2, 'Malá', 'Petra', 'petra.mala@example.com', '+420733444555', '2023-03-10');

-- --------------------------------------------------------

--
-- Struktura tabulky `zamestnanec`
--

CREATE TABLE `zamestnanec` (
  `zamestnanec_id` int(11) NOT NULL,
  `jmeno` varchar(30) DEFAULT NULL,
  `prijmeni` varchar(30) DEFAULT NULL,
  `pozice` enum('Prodejce','Mechanik','Vedouci','Administrativa') DEFAULT NULL,
  `mzda` decimal(8,2) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `zamestnanec`
--

INSERT INTO `zamestnanec` (`zamestnanec_id`, `jmeno`, `prijmeni`, `pozice`, `mzda`, `telefon`) VALUES
(1, 'Lucie', 'Krátká', 'Administrativa', 30000.00, '+420602111333'),
(2, 'Pavel', 'Beneš', 'Mechanik', 38000.00, '+420734555666'),
(3, 'Karel', 'Dvořák', 'Prodejce', 35000.00, '+420721888777');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`auto_id`);

--
-- Indexy pro tabulku `prodej`
--
ALTER TABLE `prodej`
  ADD PRIMARY KEY (`prodej_id`),
  ADD KEY `zakaznik_id` (`zakaznik_id`),
  ADD KEY `auto_id` (`auto_id`),
  ADD KEY `zamestnanec_id` (`zamestnanec_id`);

--
-- Indexy pro tabulku `servis`
--
ALTER TABLE `servis`
  ADD PRIMARY KEY (`servis_id`),
  ADD KEY `auto_id` (`auto_id`),
  ADD KEY `zamestnanec_id` (`zamestnanec_id`);

--
-- Indexy pro tabulku `zakaznik`
--
ALTER TABLE `zakaznik`
  ADD PRIMARY KEY (`zakaznik_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefon` (`telefon`);

--
-- Indexy pro tabulku `zamestnanec`
--
ALTER TABLE `zamestnanec`
  ADD PRIMARY KEY (`zamestnanec_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `auto`
--
ALTER TABLE `auto`
  MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `prodej`
--
ALTER TABLE `prodej`
  MODIFY `prodej_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `servis`
--
ALTER TABLE `servis`
  MODIFY `servis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `zakaznik`
--
ALTER TABLE `zakaznik`
  MODIFY `zakaznik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `zamestnanec`
--
ALTER TABLE `zamestnanec`
  MODIFY `zamestnanec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `prodej`
--
ALTER TABLE `prodej`
  ADD CONSTRAINT `prodej_ibfk_1` FOREIGN KEY (`zakaznik_id`) REFERENCES `zakaznik` (`zakaznik_id`),
  ADD CONSTRAINT `prodej_ibfk_2` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`),
  ADD CONSTRAINT `prodej_ibfk_3` FOREIGN KEY (`zamestnanec_id`) REFERENCES `zamestnanec` (`zamestnanec_id`);

--
-- Omezení pro tabulku `servis`
--
ALTER TABLE `servis`
  ADD CONSTRAINT `servis_ibfk_1` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`),
  ADD CONSTRAINT `servis_ibfk_2` FOREIGN KEY (`zamestnanec_id`) REFERENCES `zamestnanec` (`zamestnanec_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
