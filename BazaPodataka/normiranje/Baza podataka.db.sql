BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Sifarnik materijala" (
	"ID materijala"	INTEGER,
	"Naziv"	TEXT,
	"Jedinica mere"	TEXT,
	"Raspolozive kolicine"	TEXT,
	"Cena"	TEXT,
	"MInimalna kolicina"	REAL,
	"Maksimalna kolicina"	TEXT,
	"Rok isporuke"	TEXT,
	"Dostupnost"	TEXT,
	"Dobavljac"	TEXT
);
CREATE TABLE IF NOT EXISTS "Operacije" (
	"ID operacije"	INTEGER,
	"Naziv"	TEXT,
	"Vreme izvrsenja"	TEXT,
	"Resursi"	TEXT,
	"Redosled operacija"	TEXT,
	"Masine i alati"	TEXT,
	"Kvalitet kontrole"	TEXT,
	"Radnici"	TEXT
);
CREATE TABLE IF NOT EXISTS "Normativ proizvoda" (
	"ID norme"	INTEGER,
	"ID operacije"	INTEGER,
	"Vreme izvrsenja"	TEXT,
	"Potrebni resursi"	TEXT,
	"Radna snaga"	TEXT,
	"Instrukcije"	TEXT,
	"Kvalitet i standardi"	TEXT,
	"Tehnicka dokumentacija"	TEXT
);
CREATE TABLE IF NOT EXISTS "Resursi" (
	"ID resursa"	INTEGER,
	"Naziv resursa"	TEXT,
	"Kolicina"	TEXT,
	"Dostupnost"	TEXT,
	"Lokacija"	TEXT,
	"Vreme dostupnosti"	TEXT,
	"Opis "	TEXT
);
CREATE TABLE IF NOT EXISTS "Sifarnik proizvoda" (
	"ID proizvoda"	INTEGER,
	"Opis"	TEXT,
	"Kategorija"	TEXT,
	"Dimenzija"	TEXT,
	"Materijal"	TEXT,
	"Naziv"	TEXT,
	"Radnici"	TEXT
);
COMMIT;
