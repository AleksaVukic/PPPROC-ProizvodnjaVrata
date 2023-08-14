unit Normiranje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Layouts;

type
  TfrmNormiranje = class(TForm)
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
    procedure ListBoxItem4Click(Sender: TObject);
    procedure ListBoxItem5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNormiranje: TfrmNormiranje;

implementation
{$R *.fmx}


uses SobnaVrata, DvokrilnaVrata, VrataSigurnosna, VrataKlizna, HarmonikaVrata;


procedure TfrmNormiranje.ListBoxItem1Click(Sender: TObject);
begin
frmSobnaVrata.show;
end;

procedure TfrmNormiranje.ListBoxItem2Click(Sender: TObject);
begin
frmDvokrilnaVrata.show;
end;

procedure TfrmNormiranje.ListBoxItem3Click(Sender: TObject);
begin
frmSigurnosnaVrata.show;
end;

procedure TfrmNormiranje.ListBoxItem4Click(Sender: TObject);
begin
frmKliznaVrata.show;
end;

procedure TfrmNormiranje.ListBoxItem5Click(Sender: TObject);
begin
frmHarmonikaVrata.show;
end;

end.
