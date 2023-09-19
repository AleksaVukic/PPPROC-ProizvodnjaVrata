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
MyQuery5: TFDQuery;
var
MyQuery6: TFDQuery;
var
MyQuery7: TFDQuery;
var
MyQuery8: TFDQuery;
var
MyQuery9: TFDQuery;
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
  sifr:string;
var
  BrRed:integer;
var
  I:integer;
var
  IDP:integer;
var
  MaterijalBrave: string;


    begin
    MyQuery4 := TFDQuery.Create(nil);
    MyQuery5 := TFDQuery.Create(nil);
    MyQuery6 := TFDQuery.Create(nil);
    MyQuery7 := TFDQuery.Create(nil);
    MyQuery8 := TFDQuery.Create(nil);
    MyQuery9 := TFDQuery.Create(nil);
    try
      MyQuery4.Connection := GlobalConnection;
      MyQuery4.SQL.Text := 'SELECT * FROM SifarnikProizvoda WHERE IDProizvoda = :ID';
      MyQuery4.Params.ParamByName('ID').AsInteger := Index;
      MyQuery4.Open;

      MyQuery5.Connection := GlobalConnection;
      MyQuery5.SQL.Text := 'SELECT * FROM sifarnik_boja WHERE IDProizvoda = :ID';
      MyQuery5.Params.ParamByName('ID').AsInteger := Index;
      MyQuery5.Open;

      MyQuery6.Connection := GlobalConnection;
      MyQuery6.SQL.Text := 'SELECT * FROM Sifarnik_materijala WHERE IDProizvoda = :ID AND sifra = ''krilo''';
      MyQuery6.Params.ParamByName('ID').AsInteger := Index;
      MyQuery6.Open;

      MyQuery7.Connection := GlobalConnection;
      MyQuery7.SQL.Text := 'SELECT * FROM Sifarnik_materijala WHERE IDProizvoda = :ID AND sifra = ''stok''';
      MyQuery7.Params.ParamByName('ID').AsInteger := Index;
      MyQuery7.Open;



      MyQuery9.Connection := GlobalConnection;
      MyQuery9.SQL.Text := 'SELECT COUNT(*) FROM Operacije';
      MyQuery9.Open;

      if not MyQuery4.IsEmpty then
       begin
      IDProizvoda := MyQuery4.FieldByName('IDproizvoda').AsString;
      Sifra := MyQuery4.FieldByName('sifra').AsString;
      Naziv := MyQuery4.FieldByName('Naziv').AsString;
      frmNProizvod.Label1.Text:= MyQuery4.FieldByName('Naziv').AsString;
      Dimenzija := MyQuery4.FieldByName('Dimenzija').AsString;
      JedinicaMere := MyQuery4.FieldByName('Jedinica mere').AsString;
      Okov := MyQuery4.FieldByName('Okov').AsString;

      frmNProizvod.StringGrid1.RowCount := 2; // Number of rows
      frmNProizvod.StringGrid1.Cells[0, 0] := 'ID Proizvoda';
      frmNProizvod.StringGrid1.Cells[1, 0] := 'Sifra';
      frmNProizvod.StringGrid1.Cells[2, 0] := 'Naziv';
      frmNProizvod.StringGrid1.Cells[3, 0] := 'Dimenzija';
      frmNProizvod.StringGrid1.Cells[4, 0] := 'Jedinica Mere';

      frmNProizvod.StringGrid1.Cells[0, 1] := IDProizvoda;
      frmNProizvod.StringGrid1.Cells[1, 1] := Sifra;
      frmNProizvod.StringGrid1.Cells[2, 1] := Naziv;
      frmNProizvod.StringGrid1.Cells[3, 1] := Dimenzija;
      frmNProizvod.StringGrid1.Cells[4, 1] := JedinicaMere;

      end;
      if not MyQuery5.IsEmpty then
      begin
      frmNProizvod.Label4.Text := MyQuery5.FieldByName('naziv').AsString;
      frmNProizvod.Label9.Text := MyQuery4.FieldByName('Boja Stoka').AsString
      end;

      if not MyQuery6.IsEmpty then
      begin
      frmNProizvod.Label10.Text := MyQuery6.FieldByName('Naziv').AsString;
      end;

      if not MyQuery7.IsEmpty then
      begin
      frmNProizvod.Label12.Text := MyQuery7.FieldByName('Naziv').AsString;
      end;

      if frmNProizvod.RoundRect1.Fill.Color = $FF80A19E then
      begin
      if not MyQuery9.IsEmpty then
      begin
        frmNProizvod.ListBox1.Clear;
        BrRed := MyQuery9.Fields[0].AsInteger;
        for I := 1 to BrRed do
        begin
          MyQuery8.Connection := GlobalConnection;
          MyQuery8.SQL.Text := 'SELECT * FROM Operacije WHERE IDOperacije = :I';
          MyQuery8.Params.ParamByName('I').AsInteger := I;
          MyQuery8.Open;
          IDP := MyQuery8.FieldByName('IDProizvoda').AsInteger;
          if not MyQuery8.IsEmpty then
          begin
          if (IDP=0) or (IDP=Index) then
          begin
            frmNProizvod.ListBox1.Items.Add(MyQuery8.FieldByName('Naziv operacije').AsString);
          end;
          end;

      end;
      end;
      end;

    finally
      MyQuery4.Free;
      MyQuery5.Free;
      MyQuery6.Free;
      MyQuery7.Free;
      MyQuery8.Free;
      MyQuery9.Free;

    end;
    end;
    Sleep(2000); // Wait for a second before repeating
  end;
end;

end.
