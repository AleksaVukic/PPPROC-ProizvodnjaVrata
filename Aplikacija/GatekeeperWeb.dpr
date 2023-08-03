program GatekeeperWeb;

uses
  System.StartUpCopy,
  FMX.Forms,
  LogIn in 'LogIn.pas' {frmLogIn},
  Registracija in 'Registracija.pas' {frmRegister},
  Main in 'Main.pas' {frmMain},
  GlavnaStrana in 'GlavnaStrana.pas' {frmGlavnaStrana},
  Nalog in 'Nalog.pas' {Form1},
  GlavnaStranaAdmin in 'GlavnaStranaAdmin.pas' {frmGlavnaStranaAdmin},
  Prodaja in 'Prodaja.pas' {frmProdaja},
  Nabavka in 'Nabavka.pas' {frmNabavka},
  Podsetnik in 'Podsetnik.pas' {frmPodsetnik},
  Cenovnik in 'Cenovnik.pas' {frmCenovnik},
  Knjigovodjstvo in 'Knjigovodjstvo.pas' {frmKnjigovodjstvo},
  Normiranje in 'Normiranje.pas' {frmNormiranje},
  Korpa in 'Korpa.pas' {frmKorpa},
  Magacin in 'Magacin.pas' {frmMagacin},
  Pravna in 'Pravna.pas' {frmPravna};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogIn, frmLogIn);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGlavnaStrana, frmGlavnaStrana);
  Application.CreateForm(TForm1, Form1);
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
  Application.Run;
end.
