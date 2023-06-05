program GatekeeperWeb;

uses
  System.StartUpCopy,
  FMX.Forms,
  LogIn in 'LogIn.pas' {frmLogIn},
  Registracija in 'Registracija.pas' {frmRegister},
  Main in 'Main.pas' {frmMain},
  GlavnaStrana in 'GlavnaStrana.pas' {frmGlavnaStrana};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogIn, frmLogIn);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGlavnaStrana, frmGlavnaStrana);
  Application.Run;
end.
