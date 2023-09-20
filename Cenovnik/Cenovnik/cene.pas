unit cene;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.ListBox, kon;

type
  TForm2 = class(TForm)
    ComboBox1: TComboBox;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    cenaEdit: TEdit;
    Button1: TButton;
    Label3: TLabel;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
   i:integer;
implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
begin
kon.dbFrom.FDQuery2.sql.Text:='SELECT * FROM proizvodi where naziv='''+combobox1.selected.Text+'''';
kon.dbFrom.FDQuery2.open;

kon.dbFrom.FDQuery3.sql.Text:='insert into cenovnik(id_proizvoda,cena) values('''+dbFrom.FDQuery2.FieldByName('id_proizvoda').AsString+''','''+cenaedit.text+''')';
kon.dbFrom.FDQuery3.ExecSQL;

kon.dbFrom.FDQuery1.sql.Text:='update proizvodi set status = 1 where id_proizvoda = '''+dbFrom.FDQuery2.FieldByName('id_proizvoda').AsString+'''';
kon.dbFrom.FDQuery1.ExecSQL;

combobox1.clear;
 kon.dbFrom.FDQuery4.sql.Text:='SELECT * FROM proizvodi where status = 0';
 kon.dbFrom.FDQuery4.open;

for I := 1 to kon.dbFrom.FDQuery4.RecordCount do
begin
combobox1.items.Add(kon.dbFrom.FDQuery4.FieldByName('naziv').AsString);
kon.dbFrom.FDQuery4.next;
end;

kon.dbFrom.FDQuery4.close;

cenaedit.text:='';
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
kon.dbFrom.FDQuery2.sql.Text:='SELECT * FROM proizvodi where naziv='''+combobox1.selected.Text+'''';
kon.dbFrom.FDQuery2.open;

kon.dbFrom.FDQuery1.sql.Text:='SELECT * FROM troskovi where id_proizvoda='''+kon.dbFrom.FDQuery2.FieldByName('id_proizvoda').AsString+'''';
kon.dbFrom.FDQuery1.open;

stringgrid1.RowCount:= 0;
for I := 1 to kon.dbFrom.FDQuery1.RecordCount do
begin

stringgrid1.RowCount := stringgrid1.RowCount + 1;
stringgrid1.cells[0,stringgrid1.RowCount-1]:= dbFrom.FDQuery1.FieldByName('id_troskova').AsString;
stringgrid1.cells[1,stringgrid1.RowCount-1]:= dbFrom.FDQuery1.FieldByName('materijal').AsString;
stringgrid1.cells[2,stringgrid1.RowCount-1]:= dbFrom.FDQuery1.FieldByName('rad').AsString;
dbFrom.FDQuery1.next;

end;
dbFrom.FDQuery2.close;
dbFrom.FDQuery1.close;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
combobox1.clear;
 kon.dbFrom.FDQuery1.sql.Text:='SELECT * FROM proizvodi where status = 0';
 kon.dbFrom.FDQuery1.open;

for I := 1 to kon.dbFrom.FDQuery1.RecordCount do
begin
combobox1.items.Add(kon.dbFrom.FDQuery1.FieldByName('naziv').AsString);
kon.dbFrom.FDQuery1.next;
end;

  kon.dbFrom.FDQuery1.close;
end;

end.
