BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Knjigovodjstvo" (
	"KnjigovodjstvoID"	INTEGER NOT NULL,
	"Faktura"	INTEGER,
	PRIMARY KEY("KnjigovodjstvoID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Zaposleni" (
	"ZaposleniID"	INTEGER NOT NULL,
	"Ime"	TEXT,
	"Prezime"	TEXT,
	"BrTelefona"	TEXT,
	PRIMARY KEY("ZaposleniID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Ponuda" (
	"PonudaID"	INTEGER NOT NULL,
	"Proizvodi"	TEXT,
	"Cenovnik"	INTEGER,
	"Kolicina"	NUMERIC,
	"Klijent"	INTEGER,
	"Poruceno"	INTEGER,
	PRIMARY KEY("PonudaID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Nalog" (
	"NalogID"	INTEGER NOT NULL,
	"KorisnickoIme"	TEXT UNIQUE,
	"Lozinka"	TEXT UNIQUE,
	"ImeFirme"	TEXT UNIQUE,
	PRIMARY KEY("NalogID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ListaProizvoda" (
	"ListaID"	INTEGER NOT NULL,
	"Proizvod1"	INTEGER,
	"Proizvod2"	INTEGER,
	"Proizvod3"	INTEGER,
	"Proizvod4"	INTEGER,
	"Proizvod5"	INTEGER,
	PRIMARY KEY("ListaID" AUTOINCREMENT),
	FOREIGN KEY("Proizvod4") REFERENCES "Proizvod"("ProizvodID"),
	FOREIGN KEY("Proizvod2") REFERENCES "Proizvod"("ProizvodID"),
	FOREIGN KEY("Proizvod3") REFERENCES "Proizvod"("ProizvodID"),
	FOREIGN KEY("Proizvod5") REFERENCES "Proizvod"("ProizvodID"),
	FOREIGN KEY("Proizvod1") REFERENCES "Proizvod"("ProizvodID")
);
CREATE TABLE IF NOT EXISTS "Isporuka" (
	"IsporukaID"	INTEGER NOT NULL,
	"Proizvod"	INTEGER,
	"Faktura"	TEXT,
	"Adresa"	TEXT,
	"Kontakt"	TEXT,
	PRIMARY KEY("IsporukaID" AUTOINCREMENT),
	FOREIGN KEY("Proizvod") REFERENCES "ListaProizvoda"("ListaID")
);
CREATE TABLE IF NOT EXISTS "IstorijaPorudzbini" (
	"IstorijaID"	INTEGER NOT NULL,
	"KlijentID"	INTEGER UNIQUE,
	"Proizvodi"	TEXT,
	PRIMARY KEY("IstorijaID" AUTOINCREMENT),
	FOREIGN KEY("Proizvodi") REFERENCES "ListaProizvoda"("ListaID"),
	FOREIGN KEY("KlijentID") REFERENCES "Klijent"("KlijentID")
);
CREATE TABLE IF NOT EXISTS "Masina" (
	"MasinaID"	INTEGER NOT NULL,
	"ZaposleniID"	INTEGER UNIQUE,
	"Naziv"	TEXT,
	"Opis"	TEXT,
	PRIMARY KEY("MasinaID" AUTOINCREMENT),
	FOREIGN KEY("ZaposleniID") REFERENCES "Zaposleni"("ZaposleniID")
);
CREATE TABLE IF NOT EXISTS "Klijent" (
	"KlijentID"	INTEGER NOT NULL,
	"KorisnickoIme"	TEXT UNIQUE,
	"Lozinka"	TEXT UNIQUE,
	"ImeFirme"	TEXT UNIQUE,
	"SvePorudzbine"	TEXT,
	"Broj"	TEXT UNIQUE,
	"Email"	TEXT UNIQUE,
	"Adresa"	TEXT,
	"Kontakt"	TEXT UNIQUE,
	PRIMARY KEY("KlijentID" AUTOINCREMENT),
	FOREIGN KEY("KorisnickoIme") REFERENCES "Nalog"("KorisnickoIme"),
	FOREIGN KEY("Kontakt") REFERENCES "PorukeKlijentu"("KontaktID"),
	FOREIGN KEY("Lozinka") REFERENCES "Nalog"("Lozinka"),
	FOREIGN KEY("SvePorudzbine") REFERENCES "IstorijaPorudzbini"("IstorijaID"),
	FOREIGN KEY("ImeFirme") REFERENCES "Nalog"("ImeFirme")
);
CREATE TABLE IF NOT EXISTS "PorukeKlijentu" (
	"KontaktID"	INTEGER NOT NULL,
	"Broj"	TEXT UNIQUE,
	"Email"	TEXT UNIQUE,
	"Odgovor"	TEXT,
	PRIMARY KEY("KontaktID" AUTOINCREMENT),
	FOREIGN KEY("Broj") REFERENCES "Klijent"("Broj"),
	FOREIGN KEY("Email") REFERENCES "Klijent"("Email")
);
CREATE TABLE IF NOT EXISTS "Cenovnik" (
	"CenovnikID"	INTEGER NOT NULL,
	"Cena"	NUMERIC,
	"Proizvod"	INTEGER UNIQUE,
	"ImeProizvoda"	INTEGER UNIQUE,
	PRIMARY KEY("CenovnikID" AUTOINCREMENT),
	FOREIGN KEY("ImeProizvoda") REFERENCES "Proizvod"("ImeProizvoda"),
	FOREIGN KEY("Proizvod") REFERENCES "Proizvod"("ProizvodID")
);
CREATE TABLE IF NOT EXISTS "Proizvod" (
	"ProizvodID"	INTEGER NOT NULL,
	"ImeProizvoda"	TEXT UNIQUE,
	PRIMARY KEY("ProizvodID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Magacin" (
	"MagacinID"	INTEGER NOT NULL,
	"Proizvod"	INTEGER UNIQUE,
	"Faktura"	TEXT,
	"Kolicina"	NUMERIC,
	PRIMARY KEY("MagacinID" AUTOINCREMENT),
	FOREIGN KEY("Proizvod") REFERENCES "Proizvod"("ProizvodID")
);
INSERT INTO "Knjigovodjstvo" VALUES (1,'Faktura1');
INSERT INTO "Knjigovodjstvo" VALUES (2,'Faktura2');
INSERT INTO "Zaposleni" VALUES (1,'Zaposleni1','Prezime1','135141531');
INSERT INTO "Zaposleni" VALUES (2,'Zaposleni2','Prezime2','1515612515');
INSERT INTO "Nalog" VALUES (1,'Username1','pass123','Firm1');
INSERT INTO "Nalog" VALUES (2,'Username2','pass132','Firm2');
INSERT INTO "Nalog" VALUES (3,'Username3','pass125',NULL);
INSERT INTO "ListaProizvoda" VALUES (1,1,7,7,NULL,NULL);
INSERT INTO "ListaProizvoda" VALUES (2,16,5,NULL,NULL,NULL);
INSERT INTO "ListaProizvoda" VALUES (3,5,9,17,19,NULL);
INSERT INTO "Isporuka" VALUES (1,NULL,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (2,NULL,NULL,NULL,NULL);
INSERT INTO "IstorijaPorudzbini" VALUES (1,1,'1');
INSERT INTO "IstorijaPorudzbini" VALUES (2,2,'3');
INSERT INTO "Masina" VALUES (1,1,'Testera',NULL);
INSERT INTO "Masina" VALUES (2,2,'Masina za lepjenje','na popravci');
INSERT INTO "Klijent" VALUES (1,'Username1','pass123','Firm1','1','036 2818 1958','test@test.com','Kosovska 8',NULL);
INSERT INTO "Klijent" VALUES (2,'Username2','pass132','Firm2','2','036 2818 1954','test@test1.com',NULL,NULL);
INSERT INTO "PorukeKlijentu" VALUES (1,'036 2818 1954','test@test.com','Драги/а корисниче/ица,

Хвала вам на поруци. Да бисмо вам помогли, молимо вас да нам детаљније објасните своје питање или проблем. Такође, молимо вас да нам кажете шта би желели да постигнете, како би наш одговор могао бити што бољи и кориснији за вас.');
INSERT INTO "PorukeKlijentu" VALUES (2,'036 2818 1958','test@test1.com','Драги/а корисниче/ица,

Хвала вам на поруци. Да бисмо вам помогли, молимо вас да нам детаљније објасните своје питање или проблем. Такође, молимо вас да нам кажете шта би желели да постигнете, како би наш одговор могао бити што бољи и кориснији за вас.');
INSERT INTO "Cenovnik" VALUES (1,'150€',1,'TipDvostruka_MAl');
INSERT INTO "Cenovnik" VALUES (2,'170€',2,'TipDvostruka_MDrvo');
INSERT INTO "Cenovnik" VALUES (3,'135€',3,'TipDvostruka_MMet');
INSERT INTO "Cenovnik" VALUES (4,'135€',4,'TipDvostruka_MStaklo');
INSERT INTO "Cenovnik" VALUES (5,'135€',5,'TipDzep_MAl');
INSERT INTO "Cenovnik" VALUES (6,'150€',6,'TipDzep_MDrvo');
INSERT INTO "Cenovnik" VALUES (7,'135€',7,'TipDzep_MStaklo');
INSERT INTO "Cenovnik" VALUES (8,'170€',8,'TipDzep_MMet');
INSERT INTO "Cenovnik" VALUES (9,'135€',9,'TipHoland_MAl');
INSERT INTO "Cenovnik" VALUES (10,'150€',10,'TipHoland_MDrvo');
INSERT INTO "Cenovnik" VALUES (11,'170€',11,'TipHoland_MMet');
INSERT INTO "Cenovnik" VALUES (12,'135€',12,'TipHoland_MStaklo');
INSERT INTO "Cenovnik" VALUES (13,'150€',13,'TipKliza_MAl');
INSERT INTO "Cenovnik" VALUES (14,'150€',14,'TipKliza_MMet');
INSERT INTO "Cenovnik" VALUES (15,'135€',15,'TipKliza_MDrvo');
INSERT INTO "Cenovnik" VALUES (16,'135€',16,'TipKliza_MStaklo');
INSERT INTO "Cenovnik" VALUES (17,'170€',17,'TipSarka_MAl');
INSERT INTO "Cenovnik" VALUES (18,'150€',18,'TipSarka_MDrvo');
INSERT INTO "Cenovnik" VALUES (19,'135€',19,'TipSarka_MMet');
INSERT INTO "Cenovnik" VALUES (20,'170€',20,'TipSarka_MStaklo');
INSERT INTO "Proizvod" VALUES (1,'TipSarka_MDrvo');
INSERT INTO "Proizvod" VALUES (2,'TipSarka_MStaklo');
INSERT INTO "Proizvod" VALUES (3,'TipSarka_MAl');
INSERT INTO "Proizvod" VALUES (4,'TipSarka_MMet');
INSERT INTO "Proizvod" VALUES (5,'TipDvostruka_MDrvo');
INSERT INTO "Proizvod" VALUES (6,'TipDvostruka_MStaklo');
INSERT INTO "Proizvod" VALUES (7,'TipDvostruka_MAl');
INSERT INTO "Proizvod" VALUES (8,'TipDvostruka_MMet');
INSERT INTO "Proizvod" VALUES (9,'TipKliza_MDrvo');
INSERT INTO "Proizvod" VALUES (10,'TipKliza_MStaklo');
INSERT INTO "Proizvod" VALUES (11,'TipKliza_MAl');
INSERT INTO "Proizvod" VALUES (12,'TipKliza_MMet');
INSERT INTO "Proizvod" VALUES (13,'TipHoland_MDrvo');
INSERT INTO "Proizvod" VALUES (14,'TipHoland_MStaklo');
INSERT INTO "Proizvod" VALUES (15,'TipHoland_MAl');
INSERT INTO "Proizvod" VALUES (16,'TipHoland_MMet');
INSERT INTO "Proizvod" VALUES (17,'TipDzep_MDrvo');
INSERT INTO "Proizvod" VALUES (18,'TipDzep_MStaklo');
INSERT INTO "Proizvod" VALUES (19,'TipDzep_MAl');
INSERT INTO "Proizvod" VALUES (20,'TipDzep_MMet');
INSERT INTO "Magacin" VALUES (1,1,NULL,20);
INSERT INTO "Magacin" VALUES (2,2,NULL,13);
INSERT INTO "Magacin" VALUES (3,3,NULL,15);
INSERT INTO "Magacin" VALUES (4,4,NULL,17);
INSERT INTO "Magacin" VALUES (5,5,NULL,8);
INSERT INTO "Magacin" VALUES (6,6,NULL,3);
INSERT INTO "Magacin" VALUES (7,7,NULL,1);
INSERT INTO "Magacin" VALUES (8,8,NULL,64);
INSERT INTO "Magacin" VALUES (9,9,NULL,20);
INSERT INTO "Magacin" VALUES (10,10,NULL,23);
INSERT INTO "Magacin" VALUES (11,11,NULL,51);
INSERT INTO "Magacin" VALUES (12,12,NULL,7);
INSERT INTO "Magacin" VALUES (13,13,NULL,3);
INSERT INTO "Magacin" VALUES (14,14,NULL,12);
INSERT INTO "Magacin" VALUES (15,15,NULL,61);
INSERT INTO "Magacin" VALUES (16,16,NULL,12);
INSERT INTO "Magacin" VALUES (17,17,NULL,15);
INSERT INTO "Magacin" VALUES (18,18,NULL,12);
INSERT INTO "Magacin" VALUES (19,19,NULL,1);
INSERT INTO "Magacin" VALUES (20,20,NULL,2);
COMMIT;
