BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "UlaznaTransakcija" (
	"IDUlazneTransakcije"	INTEGER,
	"DatumPrijema"	NUMERIC UNIQUE,
	"OpisFakture"	TEXT UNIQUE,
	"Faktura"	INTEGER UNIQUE,
	FOREIGN KEY("OpisFakture") REFERENCES "UlaznaTransakcija"("OpisFakture"),
	FOREIGN KEY("Faktura") REFERENCES "UlaznaTransakcija"("OpisFakture"),
	FOREIGN KEY("DatumPrijema") REFERENCES "UlaznaTransakcija"("DatumPrijema"),
	PRIMARY KEY("IDUlazneTransakcije" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "SkladistenjeFaktura" (
	"IDSkladistenjeFaktura"	INTEGER,
	"DatumPrijema"	INTEGER UNIQUE,
	"Opis"	INTEGER UNIQUE,
	"Faktura"	INTEGER UNIQUE,
	FOREIGN KEY("DatumPrijema") REFERENCES "SkladistenjeFaktura"("DatumPrijema"),
	FOREIGN KEY("Opis") REFERENCES "SkladistenjeFaktura"("Opis"),
	PRIMARY KEY("IDSkladistenjeFaktura" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Inventar" (
	"IDInventar"	INTEGER,
	"Opis"	TEXT UNIQUE,
	"Datum"	NUMERIC UNIQUE,
	FOREIGN KEY("Datum") REFERENCES "Inventar"("Datum"),
	FOREIGN KEY("Opis") REFERENCES "Inventar"("Opis"),
	PRIMARY KEY("IDInventar" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Prodaja" (
	"IDProdaja"	INTEGER,
	"BrojFaktura"	INTEGER UNIQUE,
	"DatumProdaje"	NUMERIC UNIQUE,
	"Artikal"	INTEGER UNIQUE,
	FOREIGN KEY("DatumProdaje") REFERENCES "Prodaja"("DatumProdaje"),
	FOREIGN KEY("BrojFaktura") REFERENCES "Prodaja"("BrojFaktura"),
	PRIMARY KEY("IDProdaja" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Izvestavanje" (
	"IDIzvestavanje"	INTEGER,
	"BrojFaktura"	INTEGER UNIQUE,
	"ObracunTroskova"	NUMERIC UNIQUE,
	FOREIGN KEY("BrojFaktura") REFERENCES "Izvestavanje"("BrojFaktura"),
	PRIMARY KEY("IDIzvestavanje" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ObracunTroskova" (
	"IDObracunTroskova"	INTEGER,
	"IDRadnika"	INTEGER UNIQUE,
	"BrojFaktura"	INTEGER UNIQUE,
	FOREIGN KEY("IDRadnika") REFERENCES "ObracunTroskova"("IDRadnika"),
	PRIMARY KEY("IDObracunTroskova" AUTOINCREMENT)
);
COMMIT;
