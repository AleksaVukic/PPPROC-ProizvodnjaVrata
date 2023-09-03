unit Prodaja;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Ani, FMX.ListBox,
  FMX.Layouts;

type
  TfrmProdaja = class(TForm)
    toolbar: TToolBar;
    logo: TImage;
    bottom_bar: TRectangle;
    div_korpa: TRoundRect;
    Korpa: TButton;
    Back: TButton;
    PROIZVODI: TLabel;
    Image1: TImage;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    procedure KorpaClick(Sender: TObject);
    procedure Vise1Click(Sender: TObject);
    procedure Vise2Click(Sender: TObject);
    procedure Vise3Click(Sender: TObject);
    procedure Vise4Click(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdaja: TfrmProdaja;



implementation

{$R *.fmx}

uses Korpa, Proizvod1,GlavnaStranaAdmin, Proizvod2, Proizvod3, Proizvod4, Nalog;

procedure TfrmProdaja.BackClick(Sender: TObject);
begin
frmGlavnaStranaAdmin.show;
self.Hide;

end;


procedure TfrmProdaja.Image1Click(Sender: TObject);
begin
frmNalog.show;
self.hide;
end;

procedure TfrmProdaja.KorpaClick(Sender: TObject);
begin

frmKorpa.show;
self.hide;

end;



procedure TfrmProdaja.Vise1Click(Sender: TObject);
begin
frmProizvod1.Show;
self.Hide;
end;

procedure TfrmProdaja.Vise2Click(Sender: TObject);
begin
frmProizvod2.Show;
self.Hide;
end;

procedure TfrmProdaja.Vise3Click(Sender: TObject);
begin
frmProizvod3.Show;
self.Hide;
end;

procedure TfrmProdaja.Vise4Click(Sender: TObject);
begin
frmProizvod4.Show;
self.Hide;
end;


end.
