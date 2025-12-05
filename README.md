# Databáze pro autobazar

Tento projekt obsahuje jednoduchý návrh databáze, která se dá použít pro evidenci vozidel, zákazníků, zaměstnanců, prodejů a servisních záznamů. Je to základní model vhodný pro menší autobazar nebo jako studijní materiál.

## Co je v repozitáři
- **autoservis.sql** – vytvoření všech tabulek  
- **autoservis_vyplneny.sql** – ukázková data  
- **snimek_diagramu.png** – databázový diagram

## Přehled tabulek
- **auto** – základní údaje o vozech  
- **zakaznik** – zákazníci a jejich kontakty  
- **zamestnanec** – zaměstnanci autobazaru  
- **prodej** – kdo komu co prodal a za kolik  
- **servis** – servisní zásahy na jednotlivých autech  

### Vztahy (stručně)
- Auto může mít více servisních záznamů, ale jen jeden prodej  
- Zákazník může nakoupit více aut  
- Zaměstnanec může provádět servis i prodeje  

## Jak databázi použít
1. Naimportuj `autoservis.sql` do své databáze.  
2. Pokud chceš rovnou pracovat s daty, přidej i `autoservis_vyplneny.sql`.  
3. Diagram v PNG ti pomůže pochopit vazby mezi tabulkami.

## Pár ukázkových dotazů

```sql
-- Seznam aut, která jsou aktuálně k dispozici:
SELECT * FROM auto WHERE dostupnost = 1;

-- Servisní historie konkrétního auta:
SELECT * FROM servis WHERE id_auto = 1 ORDER BY datum DESC;
