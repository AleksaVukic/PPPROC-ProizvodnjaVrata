unit NProizvod;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,FireDAC.Stan.Param,
  System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.Objects,
  FMX.Layouts, FMX.ListBox;

type
  TfrmNProizvod = class(TForm)
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    toolbar: TToolBar;
    logo: TImage;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ListBox1: TListBox;
    RoundRect1: TRoundRect;
    Label7: TLabel;
    Back: TButton;
    procedure RoundRect1Click(Sender: TObject);
    procedure BackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNProizvod: TfrmNProizvod;

implementation

{$R *.fmx}

uses Main,Normiranje;





procedure TfrmNProizvod.BackClick(Sender: TObject);
begin
frmNormiranje.show;
self.hide;
end;

procedure TfrmNProizvod.RoundRect1Click(Sender: TObject);
begin
if RoundRect1.Fill.Color = $FFE0E0E0 then
begin
  RoundRect1.Fill.Color := $FF80A19E;
end else
begin
  RoundRect1.Fill.Color := $FFE0E0E0;
end;

end;

end.