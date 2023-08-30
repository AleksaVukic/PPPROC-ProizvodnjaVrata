unit Proizvod3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TfrmProizvod3 = class(TForm)
    Boja: TRoundRect;
    Label6: TLabel;
    Cena: TRoundRect;
    RoundRect3: TRoundRect;
    Label5: TLabel;
    Circle1: TCircle;
    Circle2: TCircle;
    Circle3: TCircle;
    Circle4: TCircle;
    Kolicina: TRoundRect;
    Label13: TLabel;
    Korpa: TRoundRect;
    Label2: TLabel;
    Image1: TImage;
    Label9: TLabel;
    Naziv: TRoundRect;
    Label3: TLabel;
    Label4: TLabel;
    RoundRect10: TRoundRect;
    RoundRect12: TRoundRect;
    Label11: TLabel;
    RoundRect13: TRoundRect;
    Label12: TLabel;
    RoundRect6: TRoundRect;
    RoundRect8: TRoundRect;
    Sirina: TRoundRect;
    Label7: TLabel;
    Stok: TRoundRect;
    Label10: TLabel;
    ToolBar1: TToolBar;
    Label1: TLabel;
    logo1: TImage;
    Visina: TRoundRect;
    Label8: TLabel;
    RoundRect1: TRoundRect;
    BACK: TLabel;
    procedure RoundRect13Click(Sender: TObject);
    procedure RoundRect12Click(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProizvod3: TfrmProizvod3;

implementation

{$R *.fmx}

uses Prodaja;


procedure TfrmProizvod3.RoundRect12Click(Sender: TObject);
var
RGBColor1: TAlphaColor;
var
RGBColor2: TAlphaColor;

begin
RGBColor1 := $FF709B8C;
RGBColor2 := $FFE0E0E0;

if RoundRect12.Fill.Color <> RGBColor1 then
begin
RoundRect12.Fill.Color := RGBColor1;
end else
begin
RoundRect12.Fill.Color := RGBColor2;
end;
if RoundRect13.Fill.Color = RGBColor1 then
begin
  RoundRect13.Fill.Color:= RGBColor2;
end;
end;


procedure TfrmProizvod3.RoundRect13Click(Sender: TObject);
var
RGBColor1: TAlphaColor;
var
RGBColor2: TAlphaColor;

begin
RGBColor1 := $FF709B8C;
RGBColor2 := $FFE0E0E0;

if RoundRect13.Fill.Color <> RGBColor1 then
begin
RoundRect13.Fill.Color := RGBColor1;
end else
begin
RoundRect13.Fill.Color := RGBColor2;
end;
if RoundRect12.Fill.Color = RGBColor1 then
begin
  RoundRect12.Fill.Color:= RGBColor2;
end;
end;

procedure TfrmProizvod3.RoundRect1Click(Sender: TObject);
begin
frmProdaja.show;
self.hide;
end;

end.
