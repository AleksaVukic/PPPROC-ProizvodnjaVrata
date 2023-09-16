program Project2;

uses
  System.StartUpCopy,
  FMX.Forms,
  pocetna in 'pocetna.pas' {Form1},
  Ipodsetnik in 'Ipodsetnik.pas' {Form2},
  Spodsetnik in 'Spodsetnik.pas' {Form3},
  Iprikaz in 'Iprikaz.pas' {Form4},
  Sprikaz in 'Sprikaz.pas' {Form5},
  db in 'db.pas' {dbform};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(Tdbform, dbform);
  Application.Run;
end.
