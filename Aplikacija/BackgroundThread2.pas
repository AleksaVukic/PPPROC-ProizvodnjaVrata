unit BackgroundThread2;

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
  TMyBackgroundThread2 = class(TThread)
  protected
    procedure Execute; override;
  end;

implementation

uses Main,Prodaja,Proizvod;

procedure TMyBackgroundThread2.Execute;
begin
  while not Terminated do
  begin
var
MyQuery: TFDQuery;
var
Index:integer;
Index:=frmProdaja.Label1.Text.ToInteger + 1;
var
Kolicina:string;
var
Cena:string;
var
UCena:integer;
var
BCena:integer;

    begin
    MyQuery := TFDQuery.Create(nil);
    try
      MyQuery.Connection := GlobalConnection;
      MyQuery.SQL.Text := 'SELECT * FROM SifarnikProizvoda WHERE IDProizvoda = :ID';
      MyQuery.Params.ParamByName('ID').AsInteger := Index;
      MyQuery.Open;

      if not MyQuery.IsEmpty then
      begin
        frmProizvod.Label1.Text := MyQuery.FieldByName('Naziv').AsString;
        frmProizvod.Label8.Text := MyQuery.FieldByName('Dimenzija').AsString;
        frmProizvod.Label11.Text := MyQuery.FieldByName('Boja krila').AsString;
        Bcena := MyQuery.FieldByName('Cena brave').AsInteger;
        frmProizvod.Label12.Text := '(' + Bcena.ToString + ')';
        Cena := MyQuery.FieldByName('Cena').AsString;
        Kolicina := frmProizvod.Edit1.Text;
        if frmProizvod.RoundRect1.Fill.Color = $FF538681 then
        begin
          Ucena := Cena.ToInteger * Kolicina.ToInteger + BCena;
        end else
        begin
          Ucena := Cena.ToInteger * Kolicina.ToInteger;
        end;
        frmProizvod.Label7.Text := Ucena.ToString;
      end;

    finally
      MyQuery.Free;

    end;
    end;
    Sleep(500); // Wait for a second before repeating
  end;
end;

end.
