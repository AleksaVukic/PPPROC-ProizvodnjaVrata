unit Prodaja;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Ani;

type
  TfrmProdaja = class(TForm)
    profslika: TCircle;
    toolbar: TToolBar;
    logo: TImage;
    bottom_bar: TRectangle;
    div_korpa: TRoundRect;
    Korpa: TButton;
    Back: TButton;
    PROIZVODI: TLabel;
    Proizvod1: TRoundRect;
    RoundRect1: TRoundRect;
    p1: TLabel;
    vrsta: TLabel;
    pan_vrata: TImage;
    Proizvod2: TRoundRect;
    stakl_vrata: TImage;
    RoundRect3: TRoundRect;
    Label1: TLabel;
    Label2: TLabel;
    Proizvod3: TRoundRect;
    stkl_delovi_vrata: TImage;
    RoundRect4: TRoundRect;
    Label3: TLabel;
    Label4: TLabel;
    Proizvod4: TRoundRect;
    klizna_vrata: TImage;
    RoundRect6: TRoundRect;
    Label5: TLabel;
    Label6: TLabel;
    RoundRect2: TRoundRect;
    Label7: TLabel;
    Image1: TImage;
    RoundRect5: TRoundRect;
    Label8: TLabel;
    procedure KorpaClick(Sender: TObject);
    procedure RoundRect5Click(Sender: TObject);
    procedure BackClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdaja: TfrmProdaja;



implementation

{$R *.fmx}

uses Korpa, Proizvod1,GlavnaStranaAdmin;

procedure TfrmProdaja.BackClick(Sender: TObject);
begin
frmGlavnaStranaAdmin.show;
self.Hide;

end;


procedure TfrmProdaja.KorpaClick(Sender: TObject);
begin

frmKorpa.show;
self.hide;

end;



procedure TfrmProdaja.RoundRect5Click(Sender: TObject);
begin
frmProizvod1.Show;
self.Hide;
end;

end.
