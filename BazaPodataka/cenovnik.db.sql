BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Cenovnik" (
	"ID Cenovnik"	INTEGER NOT NULL UNIQUE,
	"Proizvod"	TEXT,
	"Cena"	INTEGER,
	"TipPopusta"	INTEGER,
	"VrednostPopusta"	INTEGER,
	PRIMARY KEY("ID Cenovnik" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Tip_Popusta" (
	"IDPopusta"	INTEGER NOT NULL UNIQUE,
	"TipPopusta"	INTEGER UNIQUE,
	"VrednostPopusta"	INTEGER,
	PRIMARY KEY("IDPopusta" AUTOINCREMENT)
);
INSERT INTO "Cenovnik" VALUES (1,'','','Godisnjica',10);
INSERT INTO "Cenovnik" VALUES (2,NULL,NULL,'Registracija',15);
INSERT INTO "Cenovnik" VALUES (3,NULL,NULL,'Promo kod "20"',20);
INSERT INTO "Cenovnik" VALUES (4,NULL,NULL,'Promo kod "30"',30);
INSERT INTO "Cenovnik" VALUES (5,NULL,NULL,'Promo kod "50"',50);
INSERT INTO "Cenovnik" VALUES (6,NULL,NULL,'Crni petak',35);
INSERT INTO "Cenovnik" VALUES (7,NULL,NULL,'Kvantitet',5);
INSERT INTO "Cenovnik" VALUES (8,NULL,NULL,'Godisnjica',10);
INSERT INTO "Cenovnik" VALUES (9,NULL,NULL,'Registracija',15);
INSERT INTO "Cenovnik" VALUES (10,NULL,NULL,'Promo kod "20"',20);
INSERT INTO "Cenovnik" VALUES (11,NULL,NULL,'Promo kod "30"',30);
INSERT INTO "Cenovnik" VALUES (12,NULL,NULL,'Promo kod "50"',50);
INSERT INTO "Cenovnik" VALUES (13,NULL,NULL,'Crni petak',35);
INSERT INTO "Cenovnik" VALUES (14,NULL,NULL,'Kvantitet',5);
INSERT INTO "Cenovnik" VALUES (15,NULL,NULL,NULL,NULL);
INSERT INTO "Cenovnik" VALUES (16,NULL,NULL,NULL,NULL);
INSERT INTO "Cenovnik" VALUES (17,NULL,NULL,NULL,NULL);
INSERT INTO "Cenovnik" VALUES (18,NULL,NULL,NULL,NULL);
INSERT INTO "Cenovnik" VALUES (19,NULL,NULL,NULL,NULL);
INSERT INTO "Cenovnik" VALUES (20,NULL,NULL,NULL,NULL);
INSERT INTO "Tip_Popusta" VALUES (1,'Godisnjica',10);
INSERT INTO "Tip_Popusta" VALUES (2,'Registracija',15);
INSERT INTO "Tip_Popusta" VALUES (3,' Promo kod 20',20);
INSERT INTO "Tip_Popusta" VALUES (4,'Promo kod "30"',30);
INSERT INTO "Tip_Popusta" VALUES (5,'Promo kod "50"',50);
INSERT INTO "Tip_Popusta" VALUES (6,'Crni petak',35);
INSERT INTO "Tip_Popusta" VALUES (7,'Kvantitet',5);
COMMIT;
