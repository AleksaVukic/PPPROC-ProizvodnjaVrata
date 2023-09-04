unit Proizvod;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,FireDAC.Stan.Param,
  FMX.Objects;

type
  TfrmProizvod = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BACK: TButton;
    Label8: TLabel;
    RoundRect1: TRoundRect;
    RoundRect2: TRoundRect;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    procedure BACKClick(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProizvod: TfrmProizvod;

implementation

{$R *.fmx}

uses Prodaja,Main;

procedure TfrmProizvod.BACKClick(Sender: TObject);
begin
frmProdaja.show;
self.hide;
end;



procedure TfrmProizvod.RoundRect1Click(Sender: TObject);
begin
if RoundRect1.Fill.Color = $FFE0E0E0 then
begin
RoundRect1.Fill.Color := $FF538681;
RoundRect2.Fill.Color := $FFE0E0E0;
end else
begin
RoundRect2.Fill.Color := $FFE0E0E0;
RoundRect1.Fill.Color := $FF538681;
end;
end;

procedure TfrmProizvod.RoundRect2Click(Sender: TObject);
begin
if RoundRect2.Fill.Color = $FFE0E0E0 then
begin
RoundRect2.Fill.Color := $FF538681;
RoundRect1.Fill.Color := $FFE0E0E0;
end else
begin
RoundRect2.Fill.Color := $FFE0E0E0;
RoundRect1.Fill.Color := $FF538681;
end;
end;

end.
