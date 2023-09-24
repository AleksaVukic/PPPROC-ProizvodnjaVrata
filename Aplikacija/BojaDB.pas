unit BojaDB;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,FireDAC.Stan.Param,
  FMX.Objects, FMX.Ani, FMX.ListBox,FMX.Layouts;

type
  TfrmBojaDB = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Edit5: TEdit;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    RoundRect2: TRoundRect;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ListBox1: TListBox;
    Button1: TButton;
    Label7: TLabel;
    Button2: TButton;
    RoundRect3: TRoundRect;
    RoundRect4: TRoundRect;
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RoundRect3Click(Sender: TObject);
    procedure RoundRect4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBojaDB: TfrmBojaDB;

implementation

{$R *.fmx}

uses Main,NewProizvod;

procedure TfrmBojaDB.Button2Click(Sender: TObject);
begin
ListBox1.Clear;

var
MyQuery: TFDQuery;
var
MyQuery2: TFDQuery;
var
I:integer;
var
BrRed1:integer;

MyQuery := TFDQuery.Create(nil);
MyQuery2 := TFDQuery.Create(nil);

  try
      MyQuery.Connection := GlobalConnection;
      MyQuery.SQL.Text := 'SELECT MAX(ID) AS MaxID FROM sifarnik_boja';
      MyQuery.Open;

      if not MyQuery.IsEmpty then
      begin
      BrRed1 := MyQuery.FieldByName('MaxID').AsInteger;
      for I := 1 to BrRed1 do
        begin
        MyQuery2.Connection := GlobalConnection;
        MyQuery2.SQL.Text := 'SELECT * FROM sifarnik_boja WHERE ID = :I';
        MyQuery2.Params.ParamByName('I').AsInteger := I;
        MyQuery2.Open;

        if not MyQuery2.IsEmpty then
        begin
         ListBox1.Items.Add(MyQuery2.FieldByName('naziv').AsString + '(' + MyQuery2.FieldByName('sifra').AsString + ')');
        end;
        end;
      end;

  finally
     MyQuery.Free;
  end;


end;

procedure TfrmBojaDB.RoundRect1Click(Sender: TObject);
begin
if RoundRect1.Fill.Color = $FFE0E0E0 then
begin
  RoundRect1.Fill.Color := $FF80A19E;
  RoundRect2.Fill.Color := $FFE0E0E0;
end;
end;

procedure TfrmBojaDB.RoundRect2Click(Sender: TObject);
begin
if RoundRect2.Fill.Color = $FFE0E0E0 then
begin
  RoundRect2.Fill.Color := $FF80A19E;
  RoundRect1.Fill.Color := $FFE0E0E0;
end;
end;

procedure TfrmBojaDB.RoundRect3Click(Sender: TObject);
var
Naziv:String;
var
Utrosak:String;
var
JM:String;
var
Sifra:String;
var
MyQuery3: TFDQuery;
var
MyQuery4: TFDQuery;
begin

MyQuery3 := TFDQuery.Create(nil);
MyQuery4 := TFDQuery.Create(nil);

Naziv := Edit1.Text;
Utrosak := Edit2.Text;
JM := Edit5.Text;

if RoundRect1.Fill.Color = $FF80A19E then
begin
  Sifra := 'krila';
end else
begin
  Sifra := 'stok';
end;



  try
      MyQuery3.Connection := GlobalConnection;
      MyQuery3.SQL.Text := 'INSERT INTO sifarnik_boja (sifra,naziv,utrosak,jedinica_mere) VALUES (:Sifra,:Naziv,:Utrosak,:JM)';
      MyQuery3.Params.ParamByName('Sifra').AsString := Sifra;
      MyQuery3.Params.ParamByName('Naziv').AsString := Naziv;
      MyQuery3.Params.ParamByName('Utrosak').AsString := Utrosak;
      MyQuery3.Params.ParamByName('JM').AsString := JM;
      MyQuery3.ExecSQL;

    finally
    MyQuery3.Free;
    MyQuery4.Free;
  end;

 ShowMessage('Boja Dodata');
end;

procedure TfrmBojaDB.RoundRect4Click(Sender: TObject);
begin
var
MyQuery4: TFDQuery;
var
pom:string;
var
sifra:string;
begin

MyQuery4 := TFDQuery.Create(nil);


  try
    pom := Copy(ListBox1.Items[ListBox1.ItemIndex], 1, Pos('(', ListBox1.Items[ListBox1.ItemIndex]) - 1);
    sifra := Copy(ListBox1.Items[ListBox1.ItemIndex], Pos('(', ListBox1.Items[ListBox1.ItemIndex]) + 1, Length(ListBox1.Items[ListBox1.ItemIndex]) - Pos('(', ListBox1.Items[ListBox1.ItemIndex]) - 1);

    MyQuery4.Connection := GlobalConnection;
    MyQuery4.SQL.Text := 'DELETE FROM sifarnik_boja WHERE naziv = :Naziv AND sifra = :Sifra';
    MyQuery4.Params.ParamByName('Naziv').AsString := pom;
    MyQuery4.Params.ParamByName('Sifra').AsString := sifra;
    MyQuery4.ExecSQL;

    ListBox1.Items.Delete(ListBox1.ItemIndex);
    MyQuery4.Free;
   except
   on E: Exception do
   begin
   ShowMessage('Molimo vas prvo izaberite item iz liste');
   end;

  end;


end;
end;

end.
