unit Iprikaz;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.ScrollBox,db;

type
  TForm4 = class(TForm)
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
  Form4: TForm4;
  i:integer;
  proces:string;
implementation

{$R *.fmx}

procedure TForm4.FormShow(Sender: TObject);
begin
dbform.FDQuery2.SQL.Text := 'SELECT * FROM procesi ';
dbform.FDQuery2.Open;

for I := 1 to dbform.FDQuery2.RecordCount do
begin
procesiComboBox.items.Add(dbform.FDQuery2.FieldByName('proces').AsString);
dbform.FDQuery2.next;
end;
dbform.FDQuery2.close;
end;

procedure TForm4.ProcesiComboBoxChange(Sender: TObject);
begin
dbform.FDQuery1.SQL.Text := 'select * from procesi where proces ='''+procesiComboBox.selected.text+'''';
dbform.FDQuery1.open;
proces:= dbform.FDQuery1.FieldByName('id_procesa').AsString;
dbform.FDQuery1.close;

dbform.FDQuery2.SQL.Text := 'SELECT * FROM interni_podsetnik where id_procesa = '''+proces+'''';
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
