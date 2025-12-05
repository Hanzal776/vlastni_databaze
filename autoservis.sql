Table osoba {
  osoba_id int [pk, not null]
  jmeno varchar(30) [not null]
  prijmeni varchar(30) [not null]
  telefon varchar(20) [unique, not null]
  email varchar(50) [unique, null]
}

Table zakaznik {
  zakaznik_id int [pk, ref: > osoba.osoba_id, not null]
  datum_registrace date [not null]
}

Table zamestnanec {
  zamestnanec_id int [pk, ref: > osoba.osoba_id, not null]
  pozice enum('Prodejce', 'Mechanik', 'Vedouci', 'Administrativa') [not null]
  mzda decimal(8,2) [not null]
}

Table auto {
  auto_id int [pk, not null]
  znacka varchar(50) [not null]
  model varchar(50) [not null]
  rok_vyroby int [not null]
  obrazek blob [null]
  najeto_km int [not null]
  cena decimal(10,2) [not null]
  palivo enum('Benzin', 'Nafta', 'Elektro', 'Hybrid') [not null]
  barva varchar(30) [null]
  prevodovka enum('Manual', 'Automat') [not null]
  dostupne boolean [not null]
}

Table prodej {
  prodej_id int [pk, not null]
  zakaznik_id int [not null]
  auto_id int [not null]
  zamestnanec_id int [not null]
  datum_prodeje datetime [not null]
  cena_prodeje decimal(10,2) [not null]
}

Table servis {
  servis_id int [pk, not null]
  auto_id int [not null]
  zamestnanec_id int [not null]
  popis text [not null]
  cena decimal(8,2) [not null]
  datum_servisu datetime [not null]
  typ_ukonu enum('Garanční', 'Oprava', 'Kontrola', 'Příprava na prodej') [not null]
}

Ref: prodej.zakaznik_id > zakaznik.zakaznik_id
Ref: prodej.auto_id > auto.auto_id
Ref: prodej.zamestnanec_id > zamestnanec.zamestnanec_id

Ref: servis.auto_id > auto.auto_id
Ref: servis.zamestnanec_id > zamestnanec.zamestnanec_id
