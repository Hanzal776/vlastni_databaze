IT3 PVY – Vlastní relační databáze: Autobazar

Tento projekt obsahuje návrh relační databáze pro správu autobazaru. Databáze zaznamenává informace o autech, jejich dostupnosti, zákaznících, zaměstnancích, prodejích a servisních úkonech.
Cílem je vytvořit přehledný a normalizovaný systém, který pokrývá běžné procesy autobazaru — od vystavení aut k prodeji, přes evidenci zákazníků až po servisní historii každého vozu.

Popis databázového modelu

Databáze modeluje reálné prostředí autosalonu/autobazaru, kde:

zákazníci nakupují jednotlivé vozy,

zaměstnanci zajišťují prodej i servis,

každé auto má své vlastnosti — značka, model, cena, barva, typ paliva, převodovka,

systém sleduje prodejní transakce i servisní zásahy,

databáze uchovává informace o dostupnosti vozu.

Každá tabulka reprezentuje jednu část reálného prostředí.

Tabulky databáze
Tabulka auto – Evidence vozidel

Reprezentuje všechna auta, která jsou v systému — dostupná k prodeji i již prodaná.

Co tabulka dělá?

ukládá detailní popis každého vozu (značka, model, rok výroby, stav tachometru),

obsahuje cenu, typ paliva, převodovku, barvu a dostupnost,

umožňuje připojit fotografii vozu (BLOB),

slouží jako centrální objekt, ke kterému se vztahuje servis i prodej.

Tabulka zakaznik – Zákazníci

Eviduje osoby, které mohou kupovat vozy.

Co tabulka dělá?

uchovává jméno, příjmení, kontakt a datum registrace,

obsahuje informaci o každém zákazníkovi, který provedl nákup,

používá se v tabulce prodej (1 zákazník může mít více nákupů).

Tabulka zamestnanec – Zaměstnanci autobazaru

Reprezentuje pracovníky, kteří auto prodávají nebo servisují.

Co tabulka dělá?

uchovává jméno, příjmení, pozici a plat,

slouží jako vazba v tabulkách prodej (prodejce) a servis (mechanik),

umožňuje sledovat aktivitu jednotlivých zaměstnanců.

Tabulka prodej – Záznamy o prodejích

Reprezentuje každou dokončenou transakci.

Co tabulka dělá?

spojuje auto, zákazníka a zaměstnance,

uchovává cenu, čas a průběh prodeje,

umožňuje sestavovat prodejní statistiky a historii prodeje auta,

každé auto zde může být pouze jednou (1:1 vztah s auto).

Tabulka servis – Servisní historie vozidel

Zaznamenává všechny servisní úkony provedené na vozidlech.

Co tabulka dělá?

eviduje popis úkonu, cenu, datum a typ servisního zásahu,

spojuje auto a mechanika (zaměstnance),

umožňuje zobrazit kompletní servisní historii konkrétního auta.

Jak spolu tabulky spolupracují


<img width="366" height="87" alt="image" src="https://github.com/user-attachments/assets/f3861695-1623-433c-98f6-78864b44d328" />


Hlavní vztahy:

auto → prodej
Každé auto může být prodáno pouze jednou.

zakaznik → prodej
Zákazník může realizovat více nákupů.

zamestnanec → prodej / servis
Zaměstnanec může prodávat auta i provádět servis.

auto → servis
Každé auto může mít libovolný počet servisních záznamů.

Díky těmto vztahům vzniká realistický a funkční model prostředí autobazaru.

Výhody návrhu

databáze je normalizovaná (3NF),

je možné sledovat celý životní cyklus auta — od vložení do systému, přes servis až po prodej,

jednoduché rozšíření o další funkce (testovací jízdy, náhradní díly, reklamace),

podporuje přehledné generování statistik.

Odkaz na DBDiagram
https://dbdiagram.io/
