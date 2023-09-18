unit BackgroundThread3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,FireDAC.Stan.Param,
  FMX.Objects,FMX.Grid.Style, FMX.ScrollBox, FMX.Grid;

type
  TMyBackgroundThread3 = class(TThread)
  protected
    procedure Execute; override;
  end;

implementation

uses Main,Normiranje,NProizvod;

procedure TMyBackgroundThread3.Execute;
begin
  while not Terminated do
  begin
var
MyQuery4: TFDQuery;
var
Index:integer;
Index:=frmNormiranje.Label1.Text.ToInteger + 1;

var
  IDProizvoda: string;
var
  Sifra: string;
var
  Naziv: string;
var
  Dimenzija: string;
var
  JedinicaMere: string;
var
  BojaKrila: string;
var
  MaterijalKrila: string;
var
  StokMaterijal: string;
var
  BojaStoka: string;
var
  Okov: string;
var
  MaterijalBrave: string;


    begin
    MyQuery4 := TFDQuery.Create(nil);
    try
      MyQuery4.Connection := GlobalConnection;
      MyQuery4.SQL.Text := 'SELECT * FROM SifarnikProizvoda WHERE IDProizvoda = :ID';
      MyQuery4.Params.ParamByName('ID').AsInteger := Index;
      MyQuery4.Open;

      if not MyQuery4.IsEmpty then
       begin
      IDProizvoda := MyQuery4.FieldByName('IDproizvoda').AsString;
      Sifra := MyQuery4.FieldByName('sifra').AsString;
      Naziv := MyQuery4.FieldByName('Naziv').AsString;
      frmNProizvod.Label1.Text:= MyQuery4.FieldByName('Naziv').AsString;
      Dimenzija := MyQuery4.FieldByName('Dimenzija').AsString;
      JedinicaMere := MyQuery4.FieldByName('Jedinica mere').AsString;
      BojaKrila := MyQuery4.FieldByName('Boja krila').AsString;
      MaterijalKrila := MyQuery4.FieldByName('Materijal krila').AsString;
      StokMaterijal := MyQuery4.FieldByName('Stok_materijal').AsString;
      BojaStoka := MyQuery4.FieldByName('Boja stoka').AsString;
      Okov := MyQuery4.FieldByName('Okov').AsString;
      MaterijalBrave := MyQuery4.FieldByName('Materijal brave').AsString;

      frmNProizvod.StringGrid1.RowCount := 2; // Number of rows
      frmNProizvod.StringGrid1.Cells[0, 0] := 'ID Proizvoda';
      frmNProizvod.StringGrid1.Cells[1, 0] := 'Sifra';
      frmNProizvod.StringGrid1.Cells[2, 0] := 'Naziv';
      frmNProizvod.StringGrid1.Cells[3, 0] := 'Dimenzija';
      frmNProizvod.StringGrid1.Cells[4, 0] := 'Jedinica Mere';
      frmNProizvod.StringGrid1.Cells[5, 0] := 'Boja Krila';
      frmNProizvod.StringGrid1.Cells[6, 0] := 'Materijal Krila';
      frmNProizvod.StringGrid1.Cells[7, 0] := 'Stok Meterijal';
      frmNProizvod.StringGrid1.Cells[8, 0] := 'Boja Stoka';
      frmNProizvod.StringGrid1.Cells[9, 0] := 'Okov';
      frmNProizvod.StringGrid1.Cells[10, 0] := 'Materijal brave';

      frmNProizvod.StringGrid1.Cells[0, 1] := IDProizvoda;
      frmNProizvod.StringGrid1.Cells[1, 1] := Sifra;
      frmNProizvod.StringGrid1.Cells[2, 1] := Naziv;
      frmNProizvod.StringGrid1.Cells[3, 1] := Dimenzija;
      frmNProizvod.StringGrid1.Cells[4, 1] := JedinicaMere;
      frmNProizvod.StringGrid1.Cells[5, 1] := BojaKrila;
      frmNProizvod.StringGrid1.Cells[6, 1] := MaterijalKrila;
      frmNProizvod.StringGrid1.Cells[7, 1] := StokMaterijal;
      frmNProizvod.StringGrid1.Cells[8, 1] := BojaStoka;
      frmNProizvod.StringGrid1.Cells[9, 1] := Okov;
      frmNProizvod.StringGrid1.Cells[10, 1] := MaterijalBrave;

      end;

    finally
      MyQuery4.Free;

    end;
    end;
    Sleep(100); // Wait for a second before repeating
  end;
end;

end.
