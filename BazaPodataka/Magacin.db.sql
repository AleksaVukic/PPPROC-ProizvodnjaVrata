BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Prijem" (
	"IDPrijema"	INTEGER,
	"Ime"	TEXT,
	"Faktura"	TEXT,
	"Kolicina"	NUMERIC,
	"Datum"	TEXT,
	PRIMARY KEY("IDPrijema" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Materijal" (
	"IDMaterijala"	INTEGER,
	"Vrsta"	TEXT,
	"Cena"	NUMERIC,
	"Tip"	TEXT,
	PRIMARY KEY("IDMaterijala" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Stovariste" (
	"IDStovarista"	INTEGER,
	"Materijal"	TEXT,
	"Kolicina"	NUMERIC,
	"Ime"	TEXT,
	"Datum"	TEXT,
	PRIMARY KEY("IDStovarista" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Lista Stovarista" (
	"IDListe"	INTEGER,
	"Tip"	TEXT,
	"Kolicina"	NUMERIC,
	PRIMARY KEY("IDListe" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Slanje" (
	"IDSlanja"	INTEGER,
	"Kolicina"	NUMERIC,
	"Materijal"	TEXT,
	"Vrsta"	TEXT,
	"Datum"	TEXT
);
COMMIT;
