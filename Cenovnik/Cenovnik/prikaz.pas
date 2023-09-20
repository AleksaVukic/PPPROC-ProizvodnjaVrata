unit prikaz;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.ListBox, FMX.StdCtrls,kon;

type
  TForm3 = class(TForm)
    ComboBox1: TComboBox;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  i:integer;
  proizvod:string;
implementation

{$R *.fmx}

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
kon.dbFrom.FDQuery1.sql.Text:='SELECT * FROM proizvodi where naziv='''+combobox1.selected.Text+'''';
kon.dbFrom.FDQuery1.open;
proizvod:=kon.dbFrom.FDQuery1.FieldByName('id_proizvoda').AsString;

kon.dbFrom.FDQuery2.sql.Text:='SELECT * FROM troskovi where id_proizvoda='''+proizvod+'''';
kon.dbFrom.FDQuery2.open;

kon.dbFrom.FDQuery3.sql.Text:='SELECT * FROM cenovnik where id_proizvoda='''+proizvod+'''';
kon.dbFrom.FDQuery3.open;

stringgrid1.RowCount:= 0;
for I := 1 to kon.dbFrom.FDQuery1.RecordCount do
begin

stringgrid1.RowCount := stringgrid1.RowCount + 1;
stringgrid1.cells[0,stringgrid1.RowCount-1]:= dbFrom.FDQuery3.FieldByName('cena').AsString;
stringgrid1.cells[1,stringgrid1.RowCount-1]:= dbFrom.FDQuery2.FieldByName('materijal').AsString;
stringgrid1.cells[2,stringgrid1.RowCount-1]:= dbFrom.FDQuery2.FieldByName('rad').AsString;
dbFrom.FDQuery1.next;

end;
dbFrom.FDQuery1.next;
dbFrom.FDQuery2.next;
dbFrom.FDQuery3.next;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
combobox1.clear;
 kon.dbFrom.FDQuery1.sql.Text:='SELECT * FROM proizvodi where status = 1';
 kon.dbFrom.FDQuery1.open;

for I := 1 to kon.dbFrom.FDQuery1.RecordCount do
begin
combobox1.items.Add(kon.dbFrom.FDQuery1.FieldByName('naziv').AsString);
kon.dbFrom.FDQuery1.next;
end;

  kon.dbFrom.FDQuery1.close;
end;

end.
