unit pocetna;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation,ipodsetnik,iprikaz,spodsetnik,sprikaz;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button4: TButton;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
spodsetnik.Form3.show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
iprikaz.Form4.show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
sprikaz.Form5.show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
ipodsetnik.Form2.show;
end;

end.
