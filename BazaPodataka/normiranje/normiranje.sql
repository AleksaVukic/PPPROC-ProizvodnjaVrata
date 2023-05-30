BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "SifarnikMaterijala" (
	"ID materijala"	INTEGER,
	"Naziv"	TEXT,
	"Jedinica mere"	TEXT,
	"Raspolozive kolicine"	TEXT,
	"Cena"	TEXT,
	"Minimalna kolicina"	REAL,
	"Maksimalna kolicina"	TEXT,
	"Rok isporuke"	TEXT,
	"Dostupnost"	TEXT,
	"Dobavljac"	TEXT
);
CREATE TABLE IF NOT EXISTS "Operacije" (
	"ID operacije"	INTEGER,
	"Naziv"	TEXT,
	"Vreme izvrsenja"	TEXT,
	"Materijali"	TEXT,
	"Redosled operacija"	TEXT,
	"Masine i alati"	TEXT,
	"Kvalitet kontrole"	TEXT,
	"Radnici"	TEXT
);
CREATE TABLE IF NOT EXISTS "SifarnikProizvoda" (
	"ID proizvoda"	INTEGER,
	"Opis"	TEXT,
	"Kategorija"	TEXT,
	"Dimenzija"	TEXT,
	"Materijal"	TEXT,
	"Naziv"	TEXT,
	"Radnici"	TEXT
);
CREATE TABLE IF NOT EXISTS "NormativProizvoda" (
	"ID norme"	INTEGER,
	"Vreme izvrsenja"	TEXT,
	"Potrebni resursi"	TEXT,
	"Instrukcije"	TEXT,
	"Kvalitet i standardi"	TEXT,
	"Tehnicka dokumentacija"	TEXT
);
COMMIT;
