program Cenovnik;

uses
  System.StartUpCopy,
  FMX.Forms,
  pocetna in 'pocetna.pas' {Form1},
  cene in 'cene.pas' {Form2},
  prikaz in 'prikaz.pas' {Form3},
  kon in 'kon.pas' {dbFrom};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TdbFrom, dbFrom);
  Application.Run;
end.
