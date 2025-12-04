-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 04. pro 2025, 20:35
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
-- Databáze: `autoservis`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `auto`
--

CREATE TABLE `auto` (
  `auto_id` int(11) NOT NULL,
  `znacka` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `rok_vyroby` int(11) DEFAULT NULL,
  `obrazek` longblob DEFAULT NULL,
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
(1, 'Škoda', 'Octavia', 2018, NULL, 145000, 350000.00, 'Benzin', 'Bílá', 'Manual', 1),
(2, 'Volkswagen', 'Golf', 2020, NULL, 41000, 420000.00, 'Nafta', 'Modrá', 'Automat', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `osoba`
--

CREATE TABLE `osoba` (
  `osoba_id` int(11) NOT NULL,
  `jmeno` varchar(30) NOT NULL,
  `prijmeni` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `osoba`
--

INSERT INTO `osoba` (`osoba_id`, `jmeno`, `prijmeni`, `email`, `telefon`) VALUES
(1, 'Jan', 'Novák', 'novak.jan@example.com', '+420722111222 '),
(2, 'Petr', 'Svoboda', 'petr.svoboda@example.com', '+420777333444'),
(3, 'Lucie', 'Kralova', 'lucie.kralova@example.com', '+420605111222'),
(4, 'Martin', 'Dvořák', 'martin.dvorak@example.com', '+420603999111');

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
(1, 1, 1, 3, '2023-06-12 14:35:00', 340000.00),
(2, 2, 2, 3, '2024-02-22 15:10:00', 410000.00);

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
(1, 1, 4, 'Výměna oleje a filtrů', 1500.00, '2023-07-11 10:10:00', 'Garanční'),
(2, 2, 4, 'Diagnostika motoru a oprava EGR', 6200.00, '2024-03-10 13:20:00', 'Oprava');

-- --------------------------------------------------------

--
-- Struktura tabulky `zakaznik`
--

CREATE TABLE `zakaznik` (
  `zakaznik_id` int(11) NOT NULL,
  `datum_registrace` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `zakaznik`
--

INSERT INTO `zakaznik` (`zakaznik_id`, `datum_registrace`) VALUES
(1, '2023-01-15'),
(2, '2023-03-10');

-- --------------------------------------------------------

--
-- Struktura tabulky `zamestnanec`
--

CREATE TABLE `zamestnanec` (
  `zamestnanec_id` int(11) NOT NULL,
  `pozice` enum('Prodejce','Mechanik','Vedouci','Administrativa') DEFAULT NULL,
  `mzda` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `zamestnanec`
--

INSERT INTO `zamestnanec` (`zamestnanec_id`, `pozice`, `mzda`) VALUES
(3, 'Prodejce', 32000.00),
(4, 'Mechanik', 28000.00);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`auto_id`);

--
-- Indexy pro tabulku `osoba`
--
ALTER TABLE `osoba`
  ADD PRIMARY KEY (`osoba_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefon` (`telefon`);

--
-- Indexy pro tabulku `prodej`
--
ALTER TABLE `prodej`
  ADD PRIMARY KEY (`prodej_id`),
  ADD KEY `fk_prodej_zakaznik` (`zakaznik_id`),
  ADD KEY `fk_prodej_auto` (`auto_id`),
  ADD KEY `fk_prodej_zamestnanec` (`zamestnanec_id`);

--
-- Indexy pro tabulku `servis`
--
ALTER TABLE `servis`
  ADD PRIMARY KEY (`servis_id`),
  ADD KEY `fk_servis_auto` (`auto_id`),
  ADD KEY `fk_servis_zamestnanec` (`zamestnanec_id`);

--
-- Indexy pro tabulku `zakaznik`
--
ALTER TABLE `zakaznik`
  ADD PRIMARY KEY (`zakaznik_id`);

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
-- AUTO_INCREMENT pro tabulku `osoba`
--
ALTER TABLE `osoba`
  MODIFY `osoba_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `prodej`
--
ALTER TABLE `prodej`
  ADD CONSTRAINT `fk_prodej_auto` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`),
  ADD CONSTRAINT `fk_prodej_zakaznik` FOREIGN KEY (`zakaznik_id`) REFERENCES `zakaznik` (`zakaznik_id`),
  ADD CONSTRAINT `fk_prodej_zamestnanec` FOREIGN KEY (`zamestnanec_id`) REFERENCES `zamestnanec` (`zamestnanec_id`);

--
-- Omezení pro tabulku `servis`
--
ALTER TABLE `servis`
  ADD CONSTRAINT `fk_servis_auto` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`),
  ADD CONSTRAINT `fk_servis_zamestnanec` FOREIGN KEY (`zamestnanec_id`) REFERENCES `zamestnanec` (`zamestnanec_id`);

--
-- Omezení pro tabulku `zakaznik`
--
ALTER TABLE `zakaznik`
  ADD CONSTRAINT `fk_zakaznik_osoba` FOREIGN KEY (`zakaznik_id`) REFERENCES `osoba` (`osoba_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `zamestnanec`
--
ALTER TABLE `zamestnanec`
  ADD CONSTRAINT `fk_zamestnanec_osoba` FOREIGN KEY (`zamestnanec_id`) REFERENCES `osoba` (`osoba_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
