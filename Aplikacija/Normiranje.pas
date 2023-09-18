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
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GOClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNormiranje: TfrmNormiranje;

implementation
{$R *.fmx}


uses SobnaVrata, DvokrilnaVrata, VrataSigurnosna, VrataKlizna, HarmonikaVrata,Main,BackgroundThread3,NProizvod;




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

procedure TfrmNormiranje.GOClick(Sender: TObject);
begin
var
ListIndex: integer;
ListIndex := ListBox1.ItemIndex;
Label1.Text := ListIndex.ToString;
TMyBackgroundThread3.Create;
frmNProizvod.show;
self.hide;
end;

end.
