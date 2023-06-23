program GatekeeperWeb;

uses
  System.StartUpCopy,
  FMX.Forms,
  LogIn in 'LogIn.pas' {frmLogIn},
  Registracija in 'Registracija.pas' {frmRegister},
  Main in 'Main.pas' {frmMain},
  GlavnaStrana in 'GlavnaStrana.pas' {frmGlavnaStrana},
  Nalog in 'Nalog.pas' {Form1},
  GlavnaStranaAdmin in 'GlavnaStranaAdmin.pas' {frmGlavnaStranaAdmin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogIn, frmLogIn);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGlavnaStrana, frmGlavnaStrana);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmGlavnaStranaAdmin, frmGlavnaStranaAdmin);
  Application.Run;
end.
