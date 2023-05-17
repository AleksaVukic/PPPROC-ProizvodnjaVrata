BEGIN TRANSACTION;
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
COMMIT;
