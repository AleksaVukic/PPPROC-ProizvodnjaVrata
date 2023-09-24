unit OperacijeDB;

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
  TfrmOperacijeDB = class(TForm)
    RoundRect3: TRoundRect;
    RoundRect4: TRoundRect;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ListBox1: TListBox;
    Button1: TButton;
    Label7: TLabel;
    Button2: TButton;
    procedure RoundRect3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RoundRect4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOperacijeDB: TfrmOperacijeDB;

implementation

{$R *.fmx}

uses Main,NewProizvod;

procedure TfrmOperacijeDB.Button2Click(Sender: TObject);
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
      MyQuery.SQL.Text := 'SELECT MAX(IDOperacije) AS MaxID FROM Operacije';
      MyQuery.Open;

      if not MyQuery.IsEmpty then
      begin
      BrRed1 := MyQuery.FieldByName('MaxID').AsInteger;
      for I := 1 to BrRed1 do
        begin
        MyQuery2.Connection := GlobalConnection;
        MyQuery2.SQL.Text := 'SELECT * FROM Operacije WHERE IDOperacije = :I';
        MyQuery2.Params.ParamByName('I').AsInteger := I;
        MyQuery2.Open;

        if not MyQuery2.IsEmpty then
        begin
         ListBox1.Items.Add(MyQuery2.FieldByName('Naziv operacije').AsString);
        end;
        end;
      end;

  finally
     MyQuery.Free;
  end;


end;

procedure TfrmOperacijeDB.RoundRect3Click(Sender: TObject);
begin
var
Naziv:String;
var
VI:String;
var
JM:String;
var
MyQuery3: TFDQuery;
var
MyQuery4: TFDQuery;
begin

MyQuery3 := TFDQuery.Create(nil);
MyQuery4 := TFDQuery.Create(nil);

Naziv := Edit1.Text;
VI := Edit2.Text;
JM := Edit5.Text;





  try
      MyQuery3.Connection := GlobalConnection;
      MyQuery3.SQL.Text := 'INSERT INTO Operacije ("Naziv operacije","Vreme izvrsenja") VALUES (:Naziv,:VI)';
      MyQuery3.Params.ParamByName('Naziv').AsString := Naziv;
      MyQuery3.Params.ParamByName('VI').AsString := VI + ' ' + JM;
      MyQuery3.ExecSQL;

    finally
    MyQuery3.Free;
    MyQuery4.Free;
  end;

ShowMessage('Operacija Dodata');
end;
end;

procedure TfrmOperacijeDB.RoundRect4Click(Sender: TObject);
begin
var
MyQuery4: TFDQuery;
begin

MyQuery4 := TFDQuery.Create(nil);


  try
    MyQuery4.Connection := GlobalConnection;
    MyQuery4.SQL.Text := 'DELETE FROM Operacije WHERE "Naziv operacije" = :Naziv';
    MyQuery4.Params.ParamByName('Naziv').AsString := ListBox1.Items[ListBox1.ItemIndex];
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
