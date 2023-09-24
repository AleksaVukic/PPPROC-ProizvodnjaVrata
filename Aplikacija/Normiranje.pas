unit Normiranje;

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
  TfrmNormiranje = class(TForm)
    ListBox1: TListBox;
    bottom_bar: TRectangle;
    Back: TButton;
    toolbar: TToolBar;
    logo: TImage;
    PROIZVODI: TLabel;
    Image1: TImage;
    Button1: TButton;
    GO: TButton;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GOClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BackClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNormiranje: TfrmNormiranje;

implementation
{$R *.fmx}


uses GlavnaStranaAdmin,SobnaVrata, DvokrilnaVrata, VrataSigurnosna, VrataKlizna, HarmonikaVrata,Main,BackgroundThread3,NProizvod,NewProizvod;




procedure TfrmNormiranje.BackClick(Sender: TObject);
begin
frmGlavnaStranaAdmin.show;
self.hide;
end;

procedure TfrmNormiranje.Button1Click(Sender: TObject);
begin
ListBox1.Clear;
var
MyQuery: TFDQuery;
var
MyQuery2: TFDQuery;
var
BrRed: integer;
var
I:integer;
  begin
    MyQuery := TFDQuery.Create(nil);
    try
      MyQuery.Connection := GlobalConnection;
      MyQuery.SQL.Text := 'SELECT MAX(IDProizvoda) AS MaxID FROM SifarnikProizvoda';
      MyQuery.Open;

      if not MyQuery.IsEmpty then
      begin
      BrRed := MyQuery.FieldByName('MaxID').AsInteger;

      for I := 1 to BrRed do
      begin
       MyQuery2 := TFDQuery.Create(nil);
       MyQuery2.Connection := GlobalConnection;
        MyQuery2.SQL.Text := 'SELECT * FROM SifarnikProizvoda WHERE IDproizvoda = :I';
        MyQuery2.ParamByName('I').AsInteger := I;
        MyQuery2.Open;
        if not MyQuery2.IsEmpty then
        begin
        ListBox1.Items.Add(MyQuery2.FieldByName('Naziv').AsString);
        end;
        MyQuery2.Free;
      end;

      end;

    finally
      MyQuery.Free;

    end;
  end;
end;

procedure TfrmNormiranje.Button2Click(Sender: TObject);
begin
frmNewProizvod.show;
self.hide;
end;

procedure TfrmNormiranje.Button3Click(Sender: TObject);
begin
var
MyQuery4: TFDQuery;
var
MyQueryA: TFDQuery;
var
MyQueryB: TFDQuery;
var
MyQueryB1: TFDQuery;
var
MyQueryB2: TFDQuery;
var
MyQueryC: TFDQuery;
var
MyQueryC1: TFDQuery;
var
MyQueryC2: TFDQuery;
var
MyQueryD: TFDQuery;
var
MyQueryD1: TFDQuery;
var
MyQueryD2: TFDQuery;
var
ListID: integer;
var
I:integer;
var
BrRedB,BrRedC,BrRedD:integer;
var
pomB,pomC,pomD:String;
var
orStringB,orStringC,orStringD:String;
var
subStringB,subStringC,subStringD:String;
var
PositionB,PositionC,PositionD:integer;
var
modStringB,modStringC,modStringD:String;


begin

MyQuery4 := TFDQuery.Create(nil);
MyQueryA := TFDQuery.Create(nil);
MyQueryB := TFDQuery.Create(nil);
MyQueryC := TFDQuery.Create(nil);
MyQueryD := TFDQuery.Create(nil);
MyQueryB1 := TFDQuery.Create(nil);
MyQueryC1 := TFDQuery.Create(nil);
MyQueryD1 := TFDQuery.Create(nil);
MyQueryB2 := TFDQuery.Create(nil);
MyQueryC2 := TFDQuery.Create(nil);
MyQueryD2 := TFDQuery.Create(nil);


  try




    MyQueryA.Connection := GlobalConnection;
    MyQueryA.SQL.Text := 'SELECT * FROM SifarnikProizvoda WHERE Naziv = :Naziv';
    MyQueryA.ParamByName('Naziv').AsString := ListBox1.Items[ListBox1.ItemIndex];
    MyQueryA.Open;

    ListID:= MyQueryA.FieldByName('IDproizvoda').AsInteger;

      MyQueryB1.Connection := GlobalConnection;
      MyQueryB1.SQL.Text := 'SELECT MAX(ID) AS MaxID FROM sifarnik_boja';
      MyQueryB1.Open;

      if not MyQueryB1.IsEmpty then
      begin
      BrRedB := MyQueryB1.FieldByName('MaxID').AsInteger;

      for I := 1 to BrRedB do
        begin
        MyQueryB.Connection := GlobalConnection;
        MyQueryB.SQL.Text := 'SELECT * FROM sifarnik_boja WHERE ID = :ID';
        MyQueryB.Params.ParamByName('ID').AsInteger := I;
        MyQueryB.Open;

        orStringB:= MyQueryB.FieldByName('Pripada').AsString;
        subStringB:='('+ListID.ToString +')';
        PositionB:= Pos(subStringB,orStringB);


        if PositionB > 0 then
        begin
        modStringB := Copy(orStringB, 1, PositionB - 1) + Copy(orStringB, PositionB + Length(subStringB));

          MyQueryB2.Connection := GlobalConnection;
          MyQueryB2.SQL.Text := 'UPDATE sifarnik_boja SET Pripada =:pom WHERE ID = :ID';
          MyQueryB2.Params.ParamByName('pom').AsString := modStringB;
          MyQueryB2.Params.ParamByName('ID').AsInteger := I;
          MyQueryB2.ExecSQL;
        end else
        begin
        modStringB := orStringB;

          MyQueryB2.Connection := GlobalConnection;
          MyQueryB2.SQL.Text := 'UPDATE sifarnik_boja SET Pripada =:pom WHERE ID = :ID';
          MyQueryB2.Params.ParamByName('pom').AsString := modStringB;
          MyQueryB2.Params.ParamByName('ID').AsInteger := I;
          MyQueryB2.ExecSQL;
        end;
        end;


       end;
      MyQueryC1.Connection := GlobalConnection;
      MyQueryC1.SQL.Text := 'SELECT MAX(IDmaterijala) AS MaxID FROM Sifarnik_materijala';
      MyQueryC1.Open;

      if not MyQueryC1.IsEmpty then
      begin
      BrRedC := MyQueryC1.FieldByName('MaxID').AsInteger;

      for I := 1 to BrRedC do
        begin
        MyQueryC.Connection := GlobalConnection;
        MyQueryC.SQL.Text := 'SELECT * FROM Sifarnik_materijala WHERE IDmaterijala = :ID';
        MyQueryC.Params.ParamByName('ID').AsInteger := I;
        MyQueryC.Open;

        orStringC:= MyQueryC.FieldByName('IDProizvoda').AsString;
        subStringC:='('+ListID.ToString +')';
        PositionC:= Pos(subStringC,orStringC);


        if PositionC > 0 then
        begin
        modStringC := Copy(orStringC, 1, PositionC - 1) + Copy(orStringC, PositionC + Length(subStringC));

          MyQueryC2.Connection := GlobalConnection;
          MyQueryC2.SQL.Text := 'UPDATE Sifarnik_materijala SET IDProizvoda =:pom WHERE IDmaterijala = :ID';
          MyQueryC2.Params.ParamByName('pom').AsString := modStringC;
          MyQueryC2.Params.ParamByName('ID').AsInteger := I;
          MyQueryC2.ExecSQL;
        end else
        begin
        modStringC := orStringC;

          MyQueryC2.Connection := GlobalConnection;
          MyQueryC2.SQL.Text := 'UPDATE Sifarnik_materijala SET IDProizvoda =:pom WHERE IDmaterijala = :ID';
          MyQueryC2.Params.ParamByName('pom').AsString := modStringC;
          MyQueryC2.Params.ParamByName('ID').AsInteger := I;
          MyQueryC2.ExecSQL;
        end;
        end;


       end;

      MyQueryD1.Connection := GlobalConnection;
      MyQueryD1.SQL.Text := 'SELECT MAX(IDOperacije) AS MaxID FROM Operacije';
      MyQueryD1.Open;

      if not MyQueryD1.IsEmpty then
      begin
      BrRedD := MyQueryD1.FieldByName('MaxID').AsInteger;

      for I := 1 to BrRedD do
        begin
        MyQueryD.Connection := GlobalConnection;
        MyQueryD.SQL.Text := 'SELECT * FROM Operacije WHERE IDOperacije = :ID';
        MyQueryD.Params.ParamByName('ID').AsInteger := I;
        MyQueryD.Open;

        orStringD:= MyQueryD.FieldByName('Pripada').AsString;
        subStringD:='('+ListID.ToString +')';
        PositionD:= Pos(subStringD,orStringD);


        if PositionD > 0 then
        begin
        modStringD := Copy(orStringD, 1, PositionD - 1) + Copy(orStringD, PositionD + Length(subStringD));
          MyQueryD2.Connection := GlobalConnection;
          MyQueryD2.SQL.Text := 'UPDATE Operacije SET Pripada =:pom WHERE IDOperacije = :ID';
          MyQueryD2.Params.ParamByName('pom').AsString := modStringD;
          MyQueryD2.Params.ParamByName('ID').AsInteger := I;
          MyQueryD2.ExecSQL;
        end else
        begin
        modStringD := orStringD;
          MyQueryD2.Connection := GlobalConnection;
          MyQueryD2.SQL.Text := 'UPDATE Operacije SET Pripada =:pom WHERE IDOperacije = :ID';
          MyQueryD2.Params.ParamByName('pom').AsString := modStringD;
          MyQueryD2.Params.ParamByName('ID').AsInteger := I;
          MyQueryD2.ExecSQL;
        end;
        end;


       end;



        MyQuery4.Connection := GlobalConnection;
        MyQuery4.SQL.Text := 'DELETE FROM SifarnikProizvoda WHERE Naziv = :Naziv';
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

procedure TfrmNormiranje.FormCreate(Sender: TObject);
begin
var
MyQuery: TFDQuery;
var
MyQuery2: TFDQuery;
var
BrRed: integer;
var
I:integer;
  begin
    MyQuery := TFDQuery.Create(nil);
    try
      MyQuery.Connection := GlobalConnection;
      MyQuery.SQL.Text := 'SELECT MAX(IDProizvoda) AS MaxID FROM SifarnikProizvoda';
      MyQuery.Open;

      if not MyQuery.IsEmpty then
      begin
      BrRed := MyQuery.FieldByName('MaxID').AsInteger;

      for I := 1 to BrRed do
      begin
       MyQuery2 := TFDQuery.Create(nil);
       MyQuery2.Connection := GlobalConnection;
        MyQuery2.SQL.Text := 'SELECT * FROM SifarnikProizvoda WHERE IDproizvoda = :I';
        MyQuery2.ParamByName('I').AsInteger := I;
        MyQuery2.Open;
        if not MyQuery2.IsEmpty then
        begin
        ListBox1.Items.Add(MyQuery2.FieldByName('Naziv').AsString);
        end;
        MyQuery2.Free;
      end;

      end;

    finally
      MyQuery.Free;

    end;
  end;
end;

procedure TfrmNormiranje.GOClick(Sender: TObject);
begin
var
ListIndex: integer;
ListIndex := ListBox1.ItemIndex;
Label1.Text := ListIndex.ToString;
Label2.Text := ListBox1.Items[ListBox1.ItemIndex];
TMyBackgroundThread3.Create;
frmNProizvod.show;
self.hide;
end;

end.
