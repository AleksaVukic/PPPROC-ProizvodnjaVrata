unit NewProizvod;

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
  TfrmNewProizvod = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Edit5: TEdit;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    ListBox5: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Back: TButton;
    GO: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button5: TButton;
    Button6: TButton;
    Label9: TLabel;
    ListBox6: TListBox;
    Label10: TLabel;
    procedure BackClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure GOClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewProizvod: TfrmNewProizvod;

implementation

{$R *.fmx}

uses Main, Normiranje,BojaDB,MaterijalDB,OperacijeDB;

procedure TfrmNewProizvod.BackClick(Sender: TObject);
begin
frmNormiranje.show;
self.hide;
end;

procedure TfrmNewProizvod.Button1Click(Sender: TObject);
begin

ListBox1.Clear;
ListBox2.Clear;
ListBox3.Clear;
ListBox4.Clear;
ListBox5.Clear;
ListBox6.Clear;

var
MyQuery: TFDQuery;
var
MyQuery2: TFDQuery;
var
MyQuery3: TFDQuery;
var
MyQuery4: TFDQuery;
var
MyQuery5: TFDQuery;
var
MyQuery6: TFDQuery;
var
MyQuery7: TFDQuery;
var
I:integer;
var
BrRed1:integer;
var
I2:integer;
var
BrRed2:integer;
var
I3:integer;
var
BrRed3:integer;
var
BrID:integer;


MyQuery := TFDQuery.Create(nil);
MyQuery2 := TFDQuery.Create(nil);
MyQuery3 := TFDQuery.Create(nil);
MyQuery4 := TFDQuery.Create(nil);
MyQuery5 := TFDQuery.Create(nil);
MyQuery6 := TFDQuery.Create(nil);
MyQuery7 := TFDQuery.Create(nil);
    try
      MyQuery.Connection := GlobalConnection;
      MyQuery.SQL.Text := 'SELECT MAX(ID) AS MaxID FROM sifarnik_boja';
      MyQuery.Open;

      MyQuery3.Connection := GlobalConnection;
      MyQuery3.SQL.Text := 'SELECT MAX(IDmaterijala) AS MaxID FROM Sifarnik_materijala';
      MyQuery3.Open;

      MyQuery5.Connection := GlobalConnection;
      MyQuery5.SQL.Text := 'SELECT MAX(IDOperacije) AS MaxID FROM Operacije';
      MyQuery5.Open;

      MyQuery7.Connection := GlobalConnection;
      MyQuery7.SQL.Text := 'SELECT MAX(IDproizvoda) AS MaxID FROM SifarnikProizvoda';
      MyQuery7.Open;


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
          if (MyQuery2.FieldByName('sifra').AsString = 'krila') then
          begin
          ListBox1.Items.Add(MyQuery2.FieldByName('naziv').AsString);
          end;
          if (MyQuery2.FieldByName('sifra').AsString = 'stok') then
          begin
          ListBox2.Items.Add(MyQuery2.FieldByName('naziv').AsString);
          end;


        end;

        end;
      end;

      if not MyQuery3.IsEmpty then
      begin
      BrRed2 := MyQuery3.FieldByName('MaxID').AsInteger;
      for I2 := 1 to BrRed2 do
      begin
      MyQuery4.Connection := GlobalConnection;
        MyQuery4.SQL.Text := 'SELECT * FROM Sifarnik_materijala WHERE IDmaterijala = :I';
        MyQuery4.Params.ParamByName('I').AsInteger := I2;
        MyQuery4.Open;

        if not MyQuery4.IsEmpty then
        begin
          if (MyQuery4.FieldByName('sifra').AsString = 'krilo') then
          begin
          ListBox3.Items.Add(MyQuery4.FieldByName('naziv').AsString);
          end;
          if (MyQuery4.FieldByName('sifra').AsString = 'stok') then
          begin
          ListBox4.Items.Add(MyQuery4.FieldByName('naziv').AsString);
          end;


        end;

      end;
      end;

      if not MyQuery5.IsEmpty then
      begin
      BrRed3 := MyQuery5.FieldByName('MaxID').AsInteger;
      for I3 := 1 to BrRed3 do
      begin
      MyQuery6.Connection := GlobalConnection;
        MyQuery6.SQL.Text := 'SELECT * FROM Operacije WHERE IDOperacije = :I';
        MyQuery6.Params.ParamByName('I').AsInteger := I3;
        MyQuery6.Open;

        if not MyQuery6.IsEmpty then
        begin
          ListBox5.Items.Add(MyQuery6.FieldByName('Naziv operacije').AsString);
        end;

      end;
      end;

      if not MyQuery7.IsEmpty then
      begin
      var
      NewID:integer;

      BrID := MyQuery7.FieldByName('MaxID').AsInteger;
      NewID:=BrID+1;
      Label9.Text:='ID proizvoda: ' + NewID.ToString;
      Label10.Text:=NewID.ToString;
      end;



    finally
      MyQuery.Free;
      MyQuery2.Free;
      MyQuery3.Free;
      MyQuery4.Free;
      MyQuery5.Free;
      MyQuery6.Free;
      MyQuery7.Free;
    end;
end;


procedure TfrmNewProizvod.Button2Click(Sender: TObject);
begin
frmBojaDB.show;
end;

procedure TfrmNewProizvod.Button3Click(Sender: TObject);
begin
frmMaterijalDB.show;
end;

procedure TfrmNewProizvod.Button4Click(Sender: TObject);
begin
frmOperacijeDB.show;
end;

procedure TfrmNewProizvod.Button5Click(Sender: TObject);
var
  i: Integer;
var
  pom:string;
begin
  try
  begin
   i:=ListBox5.ItemIndex;
  pom := ListBox5.Items[i];
  ListBox6.Items.Add(pom);
  ListBox5.Items.Delete(i);
  end;
except
on E: Exception do
   begin
   ShowMessage('Molimo vas prvo izaberite item iz liste');
   end;
  end;
end;
procedure TfrmNewProizvod.Button6Click(Sender: TObject);
var
  i: Integer;
var
  pom:string;
begin
try
  begin
  i:=ListBox6.ItemIndex;
  pom := ListBox6.Items[i];
  ListBox5.Items.Add(pom);
  ListBox6.Items.Delete(i);
  end;
except
on E: Exception do
   begin
   ShowMessage('Molimo vas prvo izaberite item iz liste');
   end;
end;
end;


procedure TfrmNewProizvod.GOClick(Sender: TObject);
var
MyQueryA: TFDQuery;
var
MyQueryB: TFDQuery;
var
MyQueryC: TFDQuery;
var
MyQueryD: TFDQuery;
var
MyQueryE: TFDQuery;
var
MyQueryF: TFDQuery;
var
MyQueryG: TFDQuery;
var
LB6:integer;
var
I:integer;
var
IDNewProizvod:integer;
var
Naziv:String;
var
Dimenzije:String;
var
JM:String;



begin

MyQueryA := TFDQuery.Create(nil);
MyQueryB := TFDQuery.Create(nil);
MyQueryC := TFDQuery.Create(nil);
MyQueryD := TFDQuery.Create(nil);
MyQueryE := TFDQuery.Create(nil);
MyQueryF := TFDQuery.Create(nil);
MyQueryG := TFDQuery.Create(nil);

//IDNewProizvod:=Label10.Text.ToInteger;
LB6:=ListBox6.Count;
Naziv := Edit1.Text;
Dimenzije := Edit2.Text;
JM := Edit5.Text;

try

   if (ListBox1.ItemIndex <> -1) and (ListBox2.ItemIndex <> -1) and (ListBox3.ItemIndex <> -1) and (ListBox4.ItemIndex <> -1) and (ListBox6.Items.Count <> 0) then
   begin

   MyQueryF.Connection := GlobalConnection;
   MyQueryF.SQL.Text := 'INSERT INTO SifarnikProizvoda (Naziv, Dimenzija, "Jedinica mere","Boja krila","Materijal krila",Stok_materijal,"Boja stoka") VALUES (:Naziv,:Dimenzija,:JM,:BK,:MK,:MS,:BS)';
   MyQueryF.Params.ParamByName('Naziv').AsString := Naziv;
   MyQueryF.Params.ParamByName('Dimenzija').AsString := Dimenzije;
   MyQueryF.Params.ParamByName('JM').AsString := JM;
   MyQueryF.Params.ParamByName('BK').AsString := ListBox1.Items[ListBox1.ItemIndex];
   MyQueryF.Params.ParamByName('MK').AsString := ListBox3.Items[ListBox3.ItemIndex];
   MyQueryF.Params.ParamByName('MS').AsString := ListBox4.Items[ListBox4.ItemIndex];
   MyQueryF.Params.ParamByName('BS').AsString := ListBox2.Items[ListBox2.ItemIndex];
   MyQueryF.ExecSQL;

   MyQueryG.Connection := GlobalConnection;
   MyQueryG.SQL.Text := 'SELECT MAX(IDproizvoda) AS MaxID FROM SifarnikProizvoda';
   MyQueryG.Open;
   IDNewProizvod:= MyQueryG.FieldByName('MaxID').AsInteger;

   MyQueryA.Connection := GlobalConnection;
   MyQueryA.SQL.Text := 'UPDATE sifarnik_boja SET Pripada = Pripada || :AppendValue WHERE naziv = :Naziv AND sifra = ''krila''';
   MyQueryA.Params.ParamByName('AppendValue').AsString := '(' + IDNewProizvod.ToString + ')';
   MyQueryA.Params.ParamByName('Naziv').AsString := ListBox1.Items[ListBox1.ItemIndex];
   MyQueryA.ExecSQL;

   MyQueryB.Connection := GlobalConnection;
   MyQueryB.SQL.Text := 'UPDATE sifarnik_boja SET Pripada = Pripada || :AppendValue WHERE naziv = :Naziv AND sifra = ''stok''';
   MyQueryB.Params.ParamByName('AppendValue').AsString := '(' + IDNewProizvod.ToString + ')';
   MyQueryB.Params.ParamByName('Naziv').AsString := ListBox2.Items[ListBox2.ItemIndex];
   MyQueryB.ExecSQL;

   MyQueryC.Connection := GlobalConnection;
   MyQueryC.SQL.Text := 'UPDATE Sifarnik_materijala SET IDProizvoda = IDProizvoda || :AppendValue WHERE Naziv = :Naziv AND sifra = ''krilo''';
   MyQueryC.Params.ParamByName('AppendValue').AsString := '(' + IDNewProizvod.ToString + ')';
   MyQueryC.Params.ParamByName('Naziv').AsString := ListBox3.Items[ListBox3.ItemIndex];
   MyQueryC.ExecSQL;

   MyQueryD.Connection := GlobalConnection;
   MyQueryD.SQL.Text := 'UPDATE Sifarnik_materijala SET IDProizvoda = IDProizvoda || :AppendValue WHERE Naziv = :Naziv AND sifra = ''stok''';
   MyQueryD.Params.ParamByName('AppendValue').AsString := '(' + IDNewProizvod.ToString + ')';
   MyQueryD.Params.ParamByName('Naziv').AsString := ListBox4.Items[ListBox4.ItemIndex];
   MyQueryD.ExecSQL;

   for I := 1 to LB6 do
   begin
   MyQueryE.Connection := GlobalConnection;
   MyQueryE.SQL.Text := 'UPDATE Operacije SET Pripada = Pripada || :AppendValue WHERE "Naziv operacije" = :Naziv';
   MyQueryE.Params.ParamByName('AppendValue').AsString := '(' + IDNewProizvod.ToString + ')';
   MyQueryE.Params.ParamByName('Naziv').AsString := ListBox6.Items[I-1];
   MyQueryE.ExecSQL;
   end;

   ShowMessage('Proizvod dodat');

   end else
   begin
   ShowMessage('Molimo vas odaberite sve atribute');
   end;
finally
      MyQueryA.Free;
      MyQueryB.Free;
      MyQueryC.Free;
      MyQueryD.Free;
      MyQueryE.Free;
end;


end;

end.