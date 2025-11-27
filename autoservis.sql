CREATE TABLE `zakaznik` (
  `zakaznik_id` integer PRIMARY KEY,
  `prijmeni` varchar(30),
  `jmeno` varchar(30),
  `email` varchar(50) UNIQUE,
  `telefon` varchar(20) UNIQUE,
  `datum_registrace` date
);

CREATE TABLE `auto` (
  `auto_id` integer PRIMARY KEY,
  `znacka` varchar(50),
  `model` varchar(50),
  `rok_vyroby` year,
  `obrazek` mediumblob,
  `najeto_km` integer,
  `cena` decimal(10,2),
  `palivo` enum(Benzin,Nafta,Elektro,Hybrid),
  `barva` varchar(30),
  `prevodovka` enum(Manual,Automat),
  `dostupne` boolean
);

CREATE TABLE `zamestnanec` (
  `zamestnanec_id` integer PRIMARY KEY,
  `jmeno` varchar(30),
  `prijmeni` varchar(30),
  `pozice` enum(Prodejce,Mechanik,Vedouci,Administrativa),
  `mzda` decimal(8,2),
  `telefon` varchar(20)
);

CREATE TABLE `prodej` (
  `prodej_id` integer PRIMARY KEY,
  `zakaznik_id` integer,
  `auto_id` integer,
  `zamestnanec_id` integer,
  `datum_prodeje` datetime,
  `cena_prodeje` decimal(10,2)
);

CREATE TABLE `servis` (
  `servis_id` integer PRIMARY KEY,
  `auto_id` integer,
  `zamestnanec_id` integer,
  `popis` text,
  `cena` decimal(8,2),
  `datum_servisu` datetime,
  `typ_ukonu` enum(Garanční,Oprava,Kontrola,Příprava na prodej)
);

ALTER TABLE `prodej` ADD FOREIGN KEY (`zakaznik_id`) REFERENCES `zakaznik` (`zakaznik_id`);

ALTER TABLE `prodej` ADD FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`);

ALTER TABLE `prodej` ADD FOREIGN KEY (`zamestnanec_id`) REFERENCES `zamestnanec` (`zamestnanec_id`);

ALTER TABLE `servis` ADD FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`);

ALTER TABLE `servis` ADD FOREIGN KEY (`zamestnanec_id`) REFERENCES `zamestnanec` (`zamestnanec_id`);
