unit Sprikaz;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.ScrollBox,db;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    ProcesiComboBox: TComboBox;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    procedure FormShow(Sender: TObject);
    procedure ProcesiComboBoxChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  i: integer;
  klijent:string;
implementation

{$R *.fmx}

procedure TForm5.FormShow(Sender: TObject);
begin
dbform.FDQuery2.SQL.Text := 'SELECT * FROM klijenti ';
dbform.FDQuery2.Open;

for I := 1 to dbform.FDQuery2.RecordCount do
begin
procesiComboBox.items.Add(dbform.FDQuery2.FieldByName('ime').AsString);
dbform.FDQuery2.next;
end;
dbform.FDQuery2.close;
end;

procedure TForm5.ProcesiComboBoxChange(Sender: TObject);
begin
dbform.FDQuery1.SQL.Text := 'select * from klijenti where ime ='''+procesiComboBox.selected.text+'''';
dbform.FDQuery1.open;
klijent:= dbform.FDQuery1.FieldByName('id_klijenta').AsString;
dbform.FDQuery1.close;

dbform.FDQuery2.SQL.Text := 'SELECT * FROM spoljni_podsetnik where id_klijenta = '''+klijent+'''';
dbform.FDQuery2.Open;

stringgrid1.RowCount:= 0;
for I := 1 to dbform.FDQuery2.RecordCount do
begin

dbform.FDQuery3.SQL.Text := 'SELECT * FROM poruke where id_poruke = '''+dbform.FDQuery2.FieldByName('id_poruke').AsString+'''';
dbform.FDQuery3.Open;

stringgrid1.RowCount := stringgrid1.RowCount + 1;
stringgrid1.cells[0,stringgrid1.RowCount-1]:= dbform.FDQuery3.FieldByName('poruka').AsString;
stringgrid1.cells[1,stringgrid1.RowCount-1]:= dbform.FDQuery2.FieldByName('datum').AsString;
dbform.FDQuery2.next;
end;
dbform.FDQuery2.close;
end;

end.
