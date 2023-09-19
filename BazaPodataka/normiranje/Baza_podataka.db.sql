BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "sifarnik_boja" (
	"ID"	INTEGER,
	"sifra"	INTEGER,
	"naziv"	INTEGER,
	"utrosak"	INTEGER,
	"jedinica_mere"	INTEGER,
	"IDProizvoda"	INTEGER
);
CREATE TABLE IF NOT EXISTS "Operacije" (
	"ID operacije"	INTEGER NOT NULL UNIQUE,
	"Naziv operacije"	TEXT,
	"Vreme izvrsenja"	TEXT,
	"IDProizvoda"	INTEGER,
	PRIMARY KEY("ID operacije" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Sifarnik materijala" (
	"ID materijala"	INTEGER NOT NULL UNIQUE,
	"sifra"	INTEGER,
	"Naziv"	TEXT,
	"Raspolozive kolicine"	BLOB,
	"Jedinica mere"	TEXT,
	"IDProizvoda"	INTEGER,
	PRIMARY KEY("ID materijala" AUTOINCREMENT)
);
INSERT INTO "sifarnik_boja" VALUES (1,'sif1','bela',1000,'ml',1);
INSERT INTO "sifarnik_boja" VALUES (2,'sif2','crna',750,'ml',2);
INSERT INTO "sifarnik_boja" VALUES (3,'sif3','bez',500,'ml',3);
INSERT INTO "sifarnik_boja" VALUES (4,'sif4','siva',750,'ml',4);
INSERT INTO "sifarnik_boja" VALUES (5,'sif5','braon',750,'ml',5);
INSERT INTO "Operacije" VALUES (1,'izrezivanje','30 min',0);
INSERT INTO "Operacije" VALUES (2,'oblikovanje','30 min',0);
INSERT INTO "Operacije" VALUES (3,'sastavljanje okvira','45 min',0);
INSERT INTO "Operacije" VALUES (4,'ugradnja šarki i brave','30 min',0);
INSERT INTO "Operacije" VALUES (5,'lakiranje ','60 min',5);
INSERT INTO "Operacije" VALUES (6,'brušenje','25 min',0);
INSERT INTO "Operacije" VALUES (7,'spoj krila','30 min',2);
INSERT INTO "Operacije" VALUES (8,'dodavanje sigurnosnih slojeva','60 min',3);
INSERT INTO "Operacije" VALUES (9,'ugradnja brave sa više tačaka','20 min',3);
INSERT INTO "Operacije" VALUES (10,'dodavanje staklenih panela','30 min',4);
INSERT INTO "Operacije" VALUES (11,'izrada mehanizma za klizanje','45 min',4);
INSERT INTO "Operacije" VALUES (12,'dodavanje ručki','20 min',5);
INSERT INTO "Operacije" VALUES (13,'povezivanje panela','60 min',2);
INSERT INTO "Sifarnik materijala" VALUES (1,'sif1','prirodna bukva ','600','m2',1);
INSERT INTO "Sifarnik materijala" VALUES (2,'sif2','medijapan','300','m2',2);
INSERT INTO "Sifarnik materijala" VALUES (3,'sif3','metal oblozen medijapanom','200','m2',3);
INSERT INTO "Sifarnik materijala" VALUES (4,'sif4','Eloksirani aluminijum','100','m2',4);
INSERT INTO "Sifarnik materijala" VALUES (5,'sif5','puno drvo sa segmentima od furnirane sperploce','100','m2',5);
INSERT INTO "Sifarnik materijala" VALUES (6,'sif6','drvo jasen','400','m2',1);
INSERT INTO "Sifarnik materijala" VALUES (7,'sif7','lim','200','kg',2);
INSERT INTO "Sifarnik materijala" VALUES (8,'sif8','aluminijum','300','kg',3);
INSERT INTO "Sifarnik materijala" VALUES (9,'sif9','AL šine ','250','kg',4);
INSERT INTO "Sifarnik materijala" VALUES (10,'sif10','celik','200','kg',5);
COMMIT;
