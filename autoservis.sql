Table zakaznik {
  zakaznik_id int [pk]
  prijmeni varchar(30)
  jmeno varchar(30)
  email varchar(50) [unique]
  telefon varchar(20) [unique]
  datum_registrace date
}

Table auto {
  auto_id int [pk]
  znacka varchar(50)
  model varchar(50)
  rok_vyroby int
  obrazek blob
  najeto_km int
  cena decimal(10,2)
  palivo enum('Benzin', 'Nafta', 'Elektro', 'Hybrid')
  barva varchar(30)
  prevodovka enum('Manual', 'Automat')
  dostupne boolean
}

Table zamestnanec {
  zamestnanec_id int [pk]
  jmeno varchar(30)
  prijmeni varchar(30)
  pozice enum('Prodejce', 'Mechanik', 'Vedouci', 'Administrativa')
  mzda decimal(8,2)
  telefon varchar(20)
}

Table prodej {
  prodej_id int [pk]
  zakaznik_id int
  auto_id int
  zamestnanec_id int
  datum_prodeje datetime
  cena_prodeje decimal(10,2)
}

Table servis {
  servis_id int [pk]
  auto_id int
  zamestnanec_id int
  popis text
  cena decimal(8,2)
  datum_servisu datetime
  typ_ukonu enum('Garanční', 'Oprava', 'Kontrola', 'Příprava na prodej')
}

Ref: prodej.zakaznik_id > zakaznik.zakaznik_id
Ref: prodej.auto_id > auto.auto_id
Ref: prodej.zamestnanec_id > zamestnanec.zamestnanec_id

Ref: servis.auto_id > auto.auto_id
Ref: servis.zamestnanec_id > zamestnanec.zamestnanec_id
