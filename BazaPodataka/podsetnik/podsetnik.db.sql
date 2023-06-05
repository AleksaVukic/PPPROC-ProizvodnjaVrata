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
COMMIT;
