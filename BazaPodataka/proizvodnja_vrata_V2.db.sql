BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "TipPodsetnika" (
	"IDTipa"	INTEGER NOT NULL UNIQUE,
	"TipPodsetnika"	TEXT,
	PRIMARY KEY("IDTipa" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Podsetnik" (
	"IDPodsetnik"	INTEGER NOT NULL UNIQUE,
	"SMS"	TEXT,
	"Email"	TEXT,
	"Sadrzaj"	TEXT,
	"TipPodsetnika"	TEXT,
	PRIMARY KEY("IDPodsetnik" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "NarucenProizvod" (
	"IDNarudzbine"	INTEGER NOT NULL UNIQUE,
	"ImeKlijenta"	TEXT,
	"Adresa"	TEXT,
	"Proizvod"	TEXT,
	"Faktura"	INTEGER,
	PRIMARY KEY("IDNarudzbine" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "IstorijaPorudzbina" (
	"IDIstorijaPorudzbina"	INTEGER NOT NULL UNIQUE,
	"ListaProizvoda"	TEXT,
	PRIMARY KEY("IDIstorijaPorudzbina" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Klijent" (
	"IDKlijent"	INTEGER NOT NULL UNIQUE,
	"KoriscnikoIme"	TEXT,
	"Lozinka"	TEXT,
	"ImeFirme"	TEXT,
	"Istorija"	TEXT,
	"Broj"	TEXT,
	"Email"	TEXT,
	"Adresa"	TEXT,
	PRIMARY KEY("IDKlijent" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Isporuka" (
	"IDIsporuka"	INTEGER NOT NULL UNIQUE,
	"Proizvod"	TEXT,
	"Faktura"	INTEGER,
	"Adresa"	TEXT,
	PRIMARY KEY("IDIsporuka" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "UlaznaTransakcija" (
	"IDUlazneTransakcije"	INTEGER,
	"DatumPrijema"	NUMERIC UNIQUE,
	"OpisFakture"	TEXT UNIQUE,
	"Faktura"	INTEGER UNIQUE,
	PRIMARY KEY("IDUlazneTransakcije" AUTOINCREMENT),
	FOREIGN KEY("OpisFakture") REFERENCES "UlaznaTransakcija"("OpisFakture"),
	FOREIGN KEY("Faktura") REFERENCES "UlaznaTransakcija"("OpisFakture"),
	FOREIGN KEY("DatumPrijema") REFERENCES "UlaznaTransakcija"("DatumPrijema")
);
CREATE TABLE IF NOT EXISTS "SkladistenjeFaktura" (
	"IDSkladistenjeFaktura"	INTEGER,
	"DatumPrijema"	INTEGER UNIQUE,
	"Opis"	INTEGER UNIQUE,
	"Faktura"	INTEGER UNIQUE,
	PRIMARY KEY("IDSkladistenjeFaktura" AUTOINCREMENT),
	FOREIGN KEY("Opis") REFERENCES "SkladistenjeFaktura"("Opis"),
	FOREIGN KEY("DatumPrijema") REFERENCES "SkladistenjeFaktura"("DatumPrijema")
);
CREATE TABLE IF NOT EXISTS "Inventar" (
	"IDInventar"	INTEGER,
	"Opis"	TEXT UNIQUE,
	"Datum"	NUMERIC UNIQUE,
	PRIMARY KEY("IDInventar" AUTOINCREMENT),
	FOREIGN KEY("Datum") REFERENCES "Inventar"("Datum"),
	FOREIGN KEY("Opis") REFERENCES "Inventar"("Opis")
);
CREATE TABLE IF NOT EXISTS "Prodaja" (
	"IDProdaja"	INTEGER,
	"BrojFaktura"	INTEGER UNIQUE,
	"DatumProdaje"	NUMERIC UNIQUE,
	"Artikal"	INTEGER UNIQUE,
	PRIMARY KEY("IDProdaja" AUTOINCREMENT),
	FOREIGN KEY("DatumProdaje") REFERENCES "Prodaja"("DatumProdaje"),
	FOREIGN KEY("BrojFaktura") REFERENCES "Prodaja"("BrojFaktura")
);
CREATE TABLE IF NOT EXISTS "Izvestavanje" (
	"IDIzvestavanje"	INTEGER,
	"BrojFaktura"	INTEGER UNIQUE,
	"ObracunTroskova"	NUMERIC UNIQUE,
	PRIMARY KEY("IDIzvestavanje" AUTOINCREMENT),
	FOREIGN KEY("BrojFaktura") REFERENCES "Izvestavanje"("BrojFaktura")
);
CREATE TABLE IF NOT EXISTS "ObracunTroskova" (
	"IDObracunTroskova"	INTEGER,
	"IDRadnika"	INTEGER UNIQUE,
	"BrojFaktura"	INTEGER UNIQUE,
	PRIMARY KEY("IDObracunTroskova" AUTOINCREMENT),
	FOREIGN KEY("IDRadnika") REFERENCES "ObracunTroskova"("IDRadnika")
);
CREATE TABLE IF NOT EXISTS "Dobavljac" (
	"IDDobavljaca"	INTEGER,
	"Iime"	TEXT,
	"Adresa"	TEXT,
	"e-mail"	TEXT,
	"Ugovor"	REAL,
	PRIMARY KEY("IDDobavljaca")
);
CREATE TABLE IF NOT EXISTS "Jemstvo" (
	"ID"	INTEGER,
	"Ugovor"	REAL,
	"PravnoLice"	TEXT,
	"Uslovi"	TEXT,
	PRIMARY KEY("ID")
);
CREATE TABLE IF NOT EXISTS "Kupci" (
	"IDKupca"	INTEGER,
	"ImeKupca"	TEXT,
	"Ugovor"	REAL,
	"Adresa"	TEXT,
	PRIMARY KEY("IDKupca")
);
CREATE TABLE IF NOT EXISTS "PravnoLice" (
	"IDPravnogLica"	INTEGER,
	"Ime"	TEXT,
	"Kontakt"	TEXT,
	"e-mail"	TEXT,
	PRIMARY KEY("IDPravnogLica")
);
CREATE TABLE IF NOT EXISTS "Ugovor" (
	"IDUgovora"	INTEGER,
	"DatumFormiranjaUgovora"	TEXT,
	"PravnoLice"	TEXT,
	PRIMARY KEY("IDUgovora")
);
CREATE TABLE IF NOT EXISTS "Zaposleni" (
	"IDZaposenih"	INTEGER,
	"ImeZaposlenog"	TEXT,
	"Ugovor"	REAL,
	"Adresa"	TEXT,
	PRIMARY KEY("IDZaposenih")
);
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
CREATE TABLE IF NOT EXISTS "Magacin" (
	"IDStovarista"	INTEGER,
	"Materijal"	TEXT,
	"Kolicina"	NUMERIC,
	"Ime"	TEXT,
	"Datum"	TEXT,
	PRIMARY KEY("IDStovarista" AUTOINCREMENT)
);
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
INSERT INTO "TipPodsetnika" VALUES (1,'Novi model');
INSERT INTO "TipPodsetnika" VALUES (2,'Praznik-Neradni dani');
INSERT INTO "TipPodsetnika" VALUES (3,'Stanje isporuke');
INSERT INTO "TipPodsetnika" VALUES (4,'Potvrda narudzbine');
INSERT INTO "TipPodsetnika" VALUES (5,'Registracija');
INSERT INTO "Podsetnik" VALUES (1,NULL,NULL,'Dragi korisnice,izasli su novi modeli','Novi model');
INSERT INTO "Podsetnik" VALUES (2,NULL,NULL,'Dragi korisnice,vas paket je poslat','Stanje isporuke');
INSERT INTO "Podsetnik" VALUES (3,NULL,NULL,'Dragi korisnice,vasa narudzbina je uspesno poslata','Potvrda narudzbine');
INSERT INTO "Podsetnik" VALUES (4,NULL,NULL,'Dragi korisnice,vasa narudzbina je uspesno poslata','Potvrda narudzbine');
INSERT INTO "Podsetnik" VALUES (5,NULL,NULL,'Dragi korisnice,izasli su novi modeli','Novi model');
INSERT INTO "Podsetnik" VALUES (6,NULL,NULL,'Dragi korisnice,vas paket je poslat','Stanje isporuke');
INSERT INTO "Podsetnik" VALUES (7,NULL,NULL,'Dragi korisnice,danas necemo raditi zbog praznika','Praznik-neradni dani');
INSERT INTO "Podsetnik" VALUES (8,NULL,NULL,'Dragi korisnice,uspesno ste se registrovali','Registracija');
INSERT INTO "Podsetnik" VALUES (9,NULL,NULL,'Dragi korisnice,danas necemo raditi zbog praznika','Praznik-neradni dani');
INSERT INTO "Podsetnik" VALUES (10,NULL,NULL,'Dragi korisnice,uspesno ste se registrovali','Registracija');
INSERT INTO "Podsetnik" VALUES (11,NULL,NULL,'Dragi korisnice,vas paket je stigao','Stanje isporuke');
INSERT INTO "Podsetnik" VALUES (12,NULL,NULL,'Dragi korisnice,registracija nije uspela,pokusajte ponovo','Registracija');
INSERT INTO "Podsetnik" VALUES (13,NULL,NULL,'Dragi korisnice,trenutno nema novih modela','Novi model');
INSERT INTO "Podsetnik" VALUES (14,NULL,NULL,'Dragi korisnice,vas paket je na putu','Stanje isporuke');
INSERT INTO "Podsetnik" VALUES (15,NULL,NULL,'Izasli su najnoviji modeli,pogledajte ih ovde','Novi model');
INSERT INTO "Podsetnik" VALUES (16,NULL,NULL,'Dragi korisnici,narednih dana radimo skraceno zbog praznika','Praznik-neradni dani');
INSERT INTO "Podsetnik" VALUES (17,NULL,NULL,'Dragi korisnice,vas paket je u pripremi','Stanje isporuke');
INSERT INTO "Podsetnik" VALUES (18,NULL,NULL,'Dragi korisnice,niste uspeli da izvrsite narudzbinu','Potvrda narudzbine');
INSERT INTO "Podsetnik" VALUES (19,NULL,NULL,'Dragi korisnice,niste uspeli da izvrsite narudzbinu,pokusajte ponovo','Potvrda narudzbine');
INSERT INTO "Podsetnik" VALUES (20,NULL,NULL,'Dragi korisnici,vikendom necemo raditi','Praznik-neradni dani');
INSERT INTO "NarucenProizvod" VALUES (1,NULL,'10, Мокринска',NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (2,NULL,'59, Marsala Tita',NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (3,NULL,'57, Браће Витомировић',NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (4,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (5,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (6,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (7,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (8,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (9,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (10,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (11,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (12,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (13,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (14,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (15,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (16,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (17,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (18,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (19,NULL,NULL,NULL,NULL);
INSERT INTO "NarucenProizvod" VALUES (20,NULL,NULL,NULL,NULL);
INSERT INTO "IstorijaPorudzbina" VALUES (1,'<"proizvod1";"proizvod2";"proizvod3">');
INSERT INTO "IstorijaPorudzbina" VALUES (2,'<"proizvod1";"proizvod2";"proizvod3">');
INSERT INTO "IstorijaPorudzbina" VALUES (3,'<"proizvod1";"proizvod2";"proizvod3">');
INSERT INTO "IstorijaPorudzbina" VALUES (4,'<"proizvod1";"proizvod2";"proizvod3">');
INSERT INTO "IstorijaPorudzbina" VALUES (5,'<"proizvod1";"proizvod2";"proizvod3">');
INSERT INTO "IstorijaPorudzbina" VALUES (6,'<"proizvod1";"proizvod2";"proizvod3">');
INSERT INTO "IstorijaPorudzbina" VALUES (7,'<"proizvod1";"proizvod2";"proizvod3">');
INSERT INTO "IstorijaPorudzbina" VALUES (8,'<"proizvod1";"proizvod2";"proizvod3">');
INSERT INTO "Klijent" VALUES (1,NULL,NULL,'EDOPS',NULL,'7072721134',NULL,'3, Bozidara Stanojevica');
INSERT INTO "Klijent" VALUES (2,NULL,NULL,'Forma Ideale',NULL,'3852934582',NULL,'24, Zorza Klemansoa');
INSERT INTO "Klijent" VALUES (3,NULL,NULL,'Bloom Marketing	
',NULL,'5448532670',NULL,'20, Ђока Павићевића');
INSERT INTO "Klijent" VALUES (4,NULL,NULL,'The Interactive College	
',NULL,'3758107459',NULL,'52r, Miriјevsko brdo');
INSERT INTO "Klijent" VALUES (5,NULL,NULL,'Hearty Pancake	
',NULL,'2383668115',NULL,'56, Хиландарска');
INSERT INTO "Klijent" VALUES (6,NULL,NULL,'The Auto DNA	
',NULL,'0601399361',NULL,'2, Вукасовићева');
INSERT INTO "Klijent" VALUES (7,NULL,NULL,'Urban Philosophy	
',NULL,'0252580803',NULL,'146, Бранка Момирова');
INSERT INTO "Klijent" VALUES (8,NULL,NULL,'Raven',NULL,'2197691283',NULL,'3, Виноградска');
INSERT INTO "Klijent" VALUES (9,NULL,NULL,'Gourmet Sandwich	
',NULL,'1390776015',NULL,'4, Кристе Ђорђевић');
INSERT INTO "Klijent" VALUES (10,NULL,NULL,'Office Tile	
',NULL,'2789660317',NULL,'37, Војводе Влаховића');
INSERT INTO "Klijent" VALUES (11,NULL,NULL,'Smart Phone Repair	
',NULL,'9995949295',NULL,'17, Ослобођења

');
INSERT INTO "Klijent" VALUES (12,NULL,NULL,'House Brush	
',NULL,'4926203756',NULL,'8, Karamatina');
INSERT INTO "Klijent" VALUES (13,NULL,NULL,'Bean Morning	
',NULL,'8092100539',NULL,'20, Капетана Дерока');
INSERT INTO "Klijent" VALUES (14,NULL,NULL,'Evergrow',NULL,'4603603582',NULL,'8, Житничка');
INSERT INTO "Klijent" VALUES (15,NULL,NULL,'The Loop	
',NULL,'7615072090',NULL,'51, Ђевђелијска');
INSERT INTO "Klijent" VALUES (16,NULL,NULL,'Gawk Beauty	
',NULL,'1317762732',NULL,'30, Жарка Самарџића');
INSERT INTO "Klijent" VALUES (17,NULL,NULL,'My Plumber	
',NULL,'9815506091',NULL,'1, Мате Милошевића');
INSERT INTO "Klijent" VALUES (18,NULL,NULL,'Coal Kings	
',NULL,'5878000013',NULL,'59, Златиборска');
INSERT INTO "Klijent" VALUES (19,NULL,NULL,'The Zone	
',NULL,'9613339136',NULL,'9, Посавска');
INSERT INTO "Klijent" VALUES (20,NULL,NULL,'Panic Room	
',NULL,'6201388777',NULL,'13, Читачка');
INSERT INTO "Isporuka" VALUES (1,NULL,NULL,'30, Жарка Самарџића');
INSERT INTO "Isporuka" VALUES (2,NULL,NULL,'8, Karamatina');
INSERT INTO "Isporuka" VALUES (3,NULL,NULL,'37, Војводе Влаховића');
INSERT INTO "Isporuka" VALUES (4,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (5,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (6,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (7,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (8,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (9,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (10,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (11,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (12,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (13,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (14,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (15,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (16,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (17,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (18,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (19,NULL,NULL,NULL);
INSERT INTO "Isporuka" VALUES (20,NULL,NULL,NULL);
INSERT INTO "Dobavljac" VALUES (2,'Mika','Beogradska 123','mika@gmail.com','DA');
INSERT INTO "Dobavljac" VALUES (3,'Pera','Celjska 2','pera@gmail.com','DA');
INSERT INTO "Dobavljac" VALUES (4,'Laza','Beogradska 44','laza@gmail.com','NE');
INSERT INTO "Dobavljac" VALUES (5,'Paja','Aleksandra I 21','paja@gmail.com','DA');
INSERT INTO "Dobavljac" VALUES (6,'Mare','Pavla Vujisica 12','mare@gmail.com','NE');
INSERT INTO "Dobavljac" VALUES (7,'Kole','Beogradska 45','kole@gmail.com','NE');
INSERT INTO "Dobavljac" VALUES (8,'Ogi','Beogradska 55','ogi@gmail.com','NE');
INSERT INTO "Dobavljac" VALUES (9,'Laki','Aleksandra I 67','laki@gmail.com','DA');
INSERT INTO "Dobavljac" VALUES (10,'Mina','Celjska 22','mina@gmail.com','DA');
INSERT INTO "Dobavljac" VALUES (11,'Jana','Aleksandra I 111','jana@gmail.com','DA');
INSERT INTO "Dobavljac" VALUES (12,'Tina','Celjska 122','tina@gmail.com','DA');
INSERT INTO "Dobavljac" VALUES (13,'Mica','Pavla Vujisica 6','mica@gmail.com','DA');
INSERT INTO "Dobavljac" VALUES (14,'Joca','Aleksandra I 201','joca@gmail.com','NE');
INSERT INTO "Dobavljac" VALUES (15,'Nemanja','Beogradska 76','nemanja@gmail.com','NE');
INSERT INTO "Dobavljac" VALUES (16,'Neca','Pavla Vujisica 122','neca@gmail.com','NE');
INSERT INTO "Dobavljac" VALUES (17,'Jovan','Celjska 89','jovan@gmail.com','DA');
INSERT INTO "Dobavljac" VALUES (18,'Goran','Aleksandra I 40','goran@gmail.com','DA');
INSERT INTO "Dobavljac" VALUES (19,'Zoran','Beogradska 321','zoran@gmail.com','DA');
INSERT INTO "Dobavljac" VALUES (20,'Mateja','Pavla Vujisica 87','mateja@gmail.com','NE');
INSERT INTO "Dobavljac" VALUES (21,'Miki','Celjska 90','miki@gmail.com','DA');
INSERT INTO "Jemstvo" VALUES (1,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (2,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (3,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (4,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (5,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (6,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (7,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (8,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (9,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (10,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (11,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (12,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (13,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (14,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (15,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (16,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (17,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (18,'',NULL,NULL);
INSERT INTO "Jemstvo" VALUES (19,NULL,NULL,NULL);
INSERT INTO "Jemstvo" VALUES (20,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (1,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (2,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (3,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (4,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (5,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (6,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (7,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (8,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (9,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (10,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (11,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (12,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (13,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (14,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (15,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (16,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (17,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (18,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (19,NULL,NULL,NULL);
INSERT INTO "Kupci" VALUES (20,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (1,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (2,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (3,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (4,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (5,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (6,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (7,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (8,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (9,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (10,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (11,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (12,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (13,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (14,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (15,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (16,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (17,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (18,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (19,NULL,NULL,NULL);
INSERT INTO "PravnoLice" VALUES (20,NULL,NULL,NULL);
INSERT INTO "Ugovor" VALUES (1,NULL,NULL);
INSERT INTO "Ugovor" VALUES (2,NULL,NULL);
INSERT INTO "Ugovor" VALUES (3,NULL,NULL);
INSERT INTO "Ugovor" VALUES (4,NULL,NULL);
INSERT INTO "Ugovor" VALUES (5,NULL,NULL);
INSERT INTO "Ugovor" VALUES (6,NULL,NULL);
INSERT INTO "Ugovor" VALUES (7,NULL,NULL);
INSERT INTO "Ugovor" VALUES (8,NULL,NULL);
INSERT INTO "Ugovor" VALUES (9,NULL,NULL);
INSERT INTO "Ugovor" VALUES (10,NULL,NULL);
INSERT INTO "Ugovor" VALUES (11,NULL,NULL);
INSERT INTO "Ugovor" VALUES (12,NULL,NULL);
INSERT INTO "Ugovor" VALUES (13,NULL,NULL);
INSERT INTO "Ugovor" VALUES (14,NULL,NULL);
INSERT INTO "Ugovor" VALUES (15,NULL,NULL);
INSERT INTO "Ugovor" VALUES (16,NULL,NULL);
INSERT INTO "Ugovor" VALUES (17,NULL,NULL);
INSERT INTO "Ugovor" VALUES (18,NULL,NULL);
INSERT INTO "Ugovor" VALUES (19,NULL,NULL);
INSERT INTO "Ugovor" VALUES (20,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (1,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (2,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (3,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (4,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (5,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (6,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (7,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (8,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (9,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (10,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (11,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (12,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (13,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (14,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (15,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (16,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (17,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (18,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (19,NULL,NULL,NULL);
INSERT INTO "Zaposleni" VALUES (20,NULL,NULL,NULL);
COMMIT;
