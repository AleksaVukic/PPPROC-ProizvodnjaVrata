unit Prodaja;

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
  TfrmProdaja = class(TForm)
    toolbar: TToolBar;
    logo: TImage;
    bottom_bar: TRectangle;
    div_korpa: TRoundRect;
    Korpa: TButton;
    Back: TButton;
    PROIZVODI: TLabel;
    Image1: TImage;
    ListBox1: TListBox;
    GO: TButton;
    REFRESH: TButton;
    Label1: TLabel;
    procedure KorpaClick(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure REFRESHClick(Sender: TObject);
    procedure GOClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdaja: TfrmProdaja;



implementation

{$R *.fmx}

uses Korpa,GlavnaStranaAdmin,Nalog,Proizvod,Main,BackgroundThread2;

procedure TfrmProdaja.BackClick(Sender: TObject);
begin
frmGlavnaStranaAdmin.show;
self.Hide;

end;


procedure TfrmProdaja.FormCreate(Sender: TObject);
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
      MyQuery.SQL.Text := 'SELECT COUNT(*) FROM SifarnikProizvoda';
      MyQuery.Open;

      if not MyQuery.IsEmpty then
      begin
      BrRed := MyQuery.Fields[0].AsInteger;

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




procedure TfrmProdaja.GOClick(Sender: TObject);
begin
var
ListIndex: integer;
ListIndex := ListBox1.ItemIndex;
Label1.Text := ListIndex.ToString;
TMyBackgroundThread2.Create;
frmProizvod.show;
self.hide;
end;

procedure TfrmProdaja.Image1Click(Sender: TObject);
begin
frmNalog.show;
self.hide;
end;

procedure TfrmProdaja.KorpaClick(Sender: TObject);
begin

frmKorpa.show;
self.hide;

end;





procedure TfrmProdaja.REFRESHClick(Sender: TObject);
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
      MyQuery.SQL.Text := 'SELECT COUNT(*) FROM SifarnikProizvoda';
      MyQuery.Open;

      if not MyQuery.IsEmpty then
      begin
      BrRed := MyQuery.Fields[0].AsInteger;

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

end.
