BEGIN TRANSACTION;
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
INSERT INTO "Sifarnik proizvoda" VALUES (1,'sif1','Sobna vrata','200x75','cm',' braon','prirodna bukva','drvo jasen','bež','Hafele šarke i AGB brava','čelik');
INSERT INTO "Sifarnik proizvoda" VALUES (5,'sif5','Dvokrilna vrata','220x140','cm','bela','medijapan','medijapan','bela','Hafele šarke i AGB brava','čelik');
INSERT INTO "Sifarnik proizvoda" VALUES (7,'sif7','Sigurnosna vrata','200x75','cm','crna','metal obložen medijapanom','medijapan i lim','bela','Podesive AGB šarke i brava','Aluminijum');
INSERT INTO "Sifarnik proizvoda" VALUES (8,'sif8','Klizna vrata','190x100','cm','siva','Eloksirani aluminijum','aluminijum','bela','2 lajne 2m širine','/');
INSERT INTO "Sifarnik proizvoda" VALUES (9,'sif9','Harmonika vrata','203x88','cm','braon','puno drvo sa segmentima od furnirane šperploče','2 AL šine po kojima klize','crna lakirana','metalna ručka i braon segmenti','čelik');
COMMIT;
