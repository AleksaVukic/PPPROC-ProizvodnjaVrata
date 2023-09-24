program GatekeeperWeb;

uses
  System.StartUpCopy,
  FMX.Forms,
  LogIn in 'LogIn.pas' {frmLogIn},
  Registracija in 'Registracija.pas' {frmRegister},
  Main in 'Main.pas' {frmMain},
  GlavnaStrana in 'GlavnaStrana.pas' {frmGlavnaStrana},
  Nalog in 'Nalog.pas' {frmNalog},
  GlavnaStranaAdmin in 'GlavnaStranaAdmin.pas' {frmGlavnaStranaAdmin},
  Prodaja in 'Prodaja.pas' {frmProdaja},
  Nabavka in 'Nabavka.pas' {frmNabavka},
  Podsetnik in 'Podsetnik.pas' {frmPodsetnik},
  Cenovnik in 'Cenovnik.pas' {frmCenovnik},
  Knjigovodjstvo in 'Knjigovodjstvo.pas' {frmKnjigovodjstvo},
  Normiranje in 'Normiranje.pas' {frmNormiranje},
  Korpa in 'Korpa.pas' {frmKorpa},
  Magacin in 'Magacin.pas' {frmMagacin},
  Pravna in 'Pravna.pas' {frmPravna},
  SobnaVrata in 'SobnaVrata.pas' {frmSobnaVrata},
  DvokrilnaVrata in 'DvokrilnaVrata.pas' {frmDvokrilnaVrata},
  VrataSigurnosna in 'VrataSigurnosna.pas' {frmSigurnosnaVrata},
  VrataKlizna in 'VrataKlizna.pas' {frmKliznaVrata},
  HarmonikaVrata in 'HarmonikaVrata.pas' {frmHarmonikaVrata},
  BackgroundThread in 'BackgroundThread.pas',
  Proizvod in 'Proizvod.pas' {frmProizvod},
  Porudzbenica in 'Porudzbenica.pas' {frmPorudzbenica},
  BackgroundThread2 in 'BackgroundThread2.pas',
  Racun in 'Racun.pas' {frmRacun},
  BackgroundThread3 in 'BackgroundThread3.pas',
  NProizvod in 'NProizvod.pas' {frmNProizvod},
  NewProizvod in 'NewProizvod.pas' {frmNewProizvod},
  BojaDB in 'BojaDB.pas' {frmBojaDB},
  MaterijalDB in 'MaterijalDB.pas' {frmMaterijalDB},
  OperacijeDB in 'OperacijeDB.pas' {frmOperacijeDB};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogIn, frmLogIn);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGlavnaStrana, frmGlavnaStrana);
  Application.CreateForm(TfrmNalog, frmNalog);
  Application.CreateForm(TfrmGlavnaStranaAdmin, frmGlavnaStranaAdmin);
  Application.CreateForm(TfrmProdaja, frmProdaja);
  Application.CreateForm(TfrmNabavka, frmNabavka);
  Application.CreateForm(TfrmPodsetnik, frmPodsetnik);
  Application.CreateForm(TfrmCenovnik, frmCenovnik);
  Application.CreateForm(TfrmKnjigovodjstvo, frmKnjigovodjstvo);
  Application.CreateForm(TfrmNormiranje, frmNormiranje);
  Application.CreateForm(TfrmKorpa, frmKorpa);
  Application.CreateForm(TfrmMagacin, frmMagacin);
  Application.CreateForm(TfrmPravna, frmPravna);
  Application.CreateForm(TfrmSobnaVrata, frmSobnaVrata);
  Application.CreateForm(TfrmDvokrilnaVrata, frmDvokrilnaVrata);
  Application.CreateForm(TfrmSigurnosnaVrata, frmSigurnosnaVrata);
  Application.CreateForm(TfrmKliznaVrata, frmKliznaVrata);
  Application.CreateForm(TfrmHarmonikaVrata, frmHarmonikaVrata);
  Application.CreateForm(TfrmProizvod, frmProizvod);
  Application.CreateForm(TfrmPorudzbenica, frmPorudzbenica);
  Application.CreateForm(TfrmRacun, frmRacun);
  Application.CreateForm(TfrmNProizvod, frmNProizvod);
  Application.CreateForm(TfrmNewProizvod, frmNewProizvod);
  Application.CreateForm(TfrmBojaDB, frmBojaDB);
  Application.CreateForm(TfrmMaterijalDB, frmMaterijalDB);
  Application.CreateForm(TfrmOperacijeDB, frmOperacijeDB);
  Application.Run;
end.
