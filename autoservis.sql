CREATE TABLE `osoba` (
  `osoba_id` int PRIMARY KEY NOT NULL,
  `jmeno` varchar(30) NOT NULL,
  `prijmeni` varchar(30) NOT NULL,
  `telefon` varchar(20) UNIQUE NOT NULL,
  `email` varchar(50) UNIQUE
);

CREATE TABLE `zakaznik` (
  `zakaznik_id` int PRIMARY KEY NOT NULL,
  `datum_registrace` date NOT NULL
);

CREATE TABLE `zamestnanec` (
  `zamestnanec_id` int PRIMARY KEY NOT NULL,
  `pozice` enum(Prodejce,Mechanik,Vedouci,Administrativa) NOT NULL,
  `mzda` decimal(8,2) NOT NULL
);

CREATE TABLE `auto` (
  `auto_id` int PRIMARY KEY NOT NULL,
  `znacka` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `rok_vyroby` int NOT NULL,
  `obrazek` blob,
  `najeto_km` int NOT NULL,
  `cena` decimal(10,2) NOT NULL,
  `palivo` enum(Benzin,Nafta,Elektro,Hybrid) NOT NULL,
  `barva` varchar(30),
  `prevodovka` enum(Manual,Automat) NOT NULL,
  `dostupne` boolean NOT NULL
);

CREATE TABLE `prodej` (
  `prodej_id` int PRIMARY KEY NOT NULL,
  `zakaznik_id` int NOT NULL,
  `auto_id` int NOT NULL,
  `zamestnanec_id` int NOT NULL,
  `datum_prodeje` datetime NOT NULL,
  `cena_prodeje` decimal(10,2) NOT NULL
);

CREATE TABLE `servis` (
  `servis_id` int PRIMARY KEY NOT NULL,
  `auto_id` int NOT NULL,
  `zamestnanec_id` int NOT NULL,
  `popis` text NOT NULL,
  `cena` decimal(8,2) NOT NULL,
  `datum_servisu` datetime NOT NULL,
  `typ_ukonu` enum(Garanční,Oprava,Kontrola,Příprava na prodej) NOT NULL
);

ALTER TABLE `zakaznik` ADD FOREIGN KEY (`zakaznik_id`) REFERENCES `osoba` (`osoba_id`);

ALTER TABLE `zamestnanec` ADD FOREIGN KEY (`zamestnanec_id`) REFERENCES `osoba` (`osoba_id`);

ALTER TABLE `prodej` ADD FOREIGN KEY (`zakaznik_id`) REFERENCES `zakaznik` (`zakaznik_id`);

ALTER TABLE `prodej` ADD FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`);

ALTER TABLE `prodej` ADD FOREIGN KEY (`zamestnanec_id`) REFERENCES `zamestnanec` (`zamestnanec_id`);

ALTER TABLE `servis` ADD FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`);

ALTER TABLE `servis` ADD FOREIGN KEY (`zamestnanec_id`) REFERENCES `zamestnanec` (`zamestnanec_id`);
