BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Operacije" (
	"ID operacije"	INTEGER NOT NULL UNIQUE,
	"Naziv"	TEXT,
	"Vreme izvrsenja"	TEXT,
	"Resursi"	TEXT,
	"Redosled operacija"	TEXT,
	"Masine i alati"	TEXT,
	"Kvalitet kontrole"	TEXT,
	"Radnici"	TEXT,
	PRIMARY KEY("ID operacije" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Sifarnik materijala" (
	"ID materijala"	INTEGER NOT NULL UNIQUE,
	"sifra"	INTEGER,
	"Naziv"	TEXT,
	"Raspolozive kolicine"	TEXT,
	"Jedinica mere"	NUMERIC,
	"Cena"	TEXT,
	PRIMARY KEY("ID materijala" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Proizvod_operacije" (
	"ID proizvoda"	INTEGER NOT NULL UNIQUE,
	"ID operacije"	INTEGER,
	"Vreme izvrsenja"	INTEGER,
	"RB"	INTEGER,
	"Field5"	INTEGER,
	PRIMARY KEY("ID proizvoda" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Normativ proizvoda" (
	"ID materijala"	INTEGER NOT NULL UNIQUE,
	"Vreme izvrsenja"	INTEGER,
	"Potrebni resursi"	TEXT,
	"Radna snaga"	TEXT,
	"Instrukcije"	TEXT,
	"Kvalitet i standardi"	TEXT,
	"Tehnicka dokumentacija"	TEXT,
	"ID proizvoda"	INTEGER,
	FOREIGN KEY("ID proizvoda") REFERENCES "Sifarnik proizvoda",
	FOREIGN KEY("ID materijala") REFERENCES "Sifarnik materijala"("ID materijala"),
	PRIMARY KEY("ID materijala","ID proizvoda")
);
CREATE TABLE IF NOT EXISTS "Sifarnik proizvoda" (
	"ID proizvoda"	INTEGER NOT NULL UNIQUE,
	"sifra"	TEXT,
	"Naziv"	TEXT,
	"Dimenzija"	TEXT,
	"Jedinica mere"	TEXT,
	"Boja krila"	TEXT,
	"Materijal krila"	TEXT,
	"Stok_materijal"	TEXT,
	"Boja štoka"	TEXT,
	"Okov"	TEXT,
	"Materijal brave"	TEXT,
	PRIMARY KEY("ID proizvoda" AUTOINCREMENT)
);
INSERT INTO "Operacije" VALUES (1,'','',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (4,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (5,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (6,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (7,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (8,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (9,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (10,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (11,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (12,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Operacije" VALUES (13,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Sifarnik materijala" VALUES (1,'sif1','Medijapan','600','m2',NULL);
INSERT INTO "Sifarnik materijala" VALUES (2,'sif2','Lak','20','l',NULL);
INSERT INTO "Sifarnik materijala" VALUES (3,'sif3','Boja','30','l',NULL);
INSERT INTO "Sifarnik materijala" VALUES (4,'sif4','Lim','100','m2',NULL);
INSERT INTO "Sifarnik materijala" VALUES (5,'sif5','Zn','2','kg',NULL);
INSERT INTO "Sifarnik materijala" VALUES (6,'sif6','Celik','400','kg',NULL);
INSERT INTO "Sifarnik materijala" VALUES (7,'sif7','Al','200','kg',NULL);
INSERT INTO "Sifarnik materijala" VALUES (8,'sif8','Staklo','300','kg',NULL);
INSERT INTO "Sifarnik materijala" VALUES (9,'sif9','sperploca','250','kg',NULL);
INSERT INTO "Sifarnik materijala" VALUES (10,'sif10','pvc keder','800','m',NULL);
INSERT INTO "Sifarnik materijala" VALUES (11,'sif11',NULL,NULL,NULL,NULL);
INSERT INTO "Proizvod_operacije" VALUES (0,0,NULL,NULL,NULL);
INSERT INTO "Proizvod_operacije" VALUES (1,NULL,NULL,NULL,NULL);
INSERT INTO "Proizvod_operacije" VALUES (2,NULL,NULL,NULL,NULL);
INSERT INTO "Proizvod_operacije" VALUES (3,NULL,NULL,NULL,NULL);
INSERT INTO "Proizvod_operacije" VALUES (4,NULL,NULL,NULL,NULL);
INSERT INTO "Proizvod_operacije" VALUES (5,NULL,NULL,NULL,NULL);
INSERT INTO "Proizvod_operacije" VALUES (6,NULL,NULL,NULL,NULL);
INSERT INTO "Proizvod_operacije" VALUES (7,NULL,NULL,NULL,NULL);
INSERT INTO "Proizvod_operacije" VALUES (8,NULL,NULL,NULL,NULL);
INSERT INTO "Proizvod_operacije" VALUES (9,NULL,NULL,NULL,NULL);
INSERT INTO "Normativ proizvoda" VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Normativ proizvoda" VALUES (2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Normativ proizvoda" VALUES (3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Normativ proizvoda" VALUES (4,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Normativ proizvoda" VALUES (5,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Normativ proizvoda" VALUES (6,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Normativ proizvoda" VALUES (7,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Normativ proizvoda" VALUES (8,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Normativ proizvoda" VALUES (9,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Normativ proizvoda" VALUES (10,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Normativ proizvoda" VALUES (11,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "Sifarnik proizvoda" VALUES (1,'sif1','Sobna vrata','200x75','cm',' braon','prirodna bukva','drvo jasen','bež','Hafele šarke i AGB brava','čelik');
INSERT INTO "Sifarnik proizvoda" VALUES (5,'sif5','Dvokrilna vrata','220x140','cm','bela','medijapan','medijapan','bela','Hafele šarke i AGB brava','čelik');
INSERT INTO "Sifarnik proizvoda" VALUES (7,'sif7','Sigurnosna vrata','200x75','cm','crna','metal obložen medijapanom','medijapan i lim','bela','Podesive AGB šarke i brava','Aluminijum');
INSERT INTO "Sifarnik proizvoda" VALUES (8,'sif8','Klizna vrata','190x100','cm','siva','Eloksirani aluminijum','aluminijum','bela','2 lajne 2m širine','/');
INSERT INTO "Sifarnik proizvoda" VALUES (9,'sif9','Harmonika vrata','203x88','cm','braon','puno drvo sa segmentima od furnirane šperploče','2 AL šine po kojima klize','crna lakirana','metalna ručka i braon segmenti','čelik');
COMMIT;
