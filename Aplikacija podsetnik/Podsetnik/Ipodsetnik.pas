unit Ipodsetnik;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, FMX.Edit,
  FMX.DateTimeCtrls,db;

type
  TForm2 = class(TForm)
    ProcesiComboBox: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    slanjeDate: TDateEdit;
    Label4: TLabel;
    porukaEdit: TEdit;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  i:integer;
  poruka:string;
  proces:string;
implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
begin
dbform.FDQuery1.SQL.Text := 'insert into poruke(poruka) values('''+porukaEdit.text+''')';
dbform.FDQuery1.ExecSQL;

dbform.FDQuery1.SQL.Text := 'select * from poruke where poruka ='''+porukaEdit.text+'''';
dbform.FDQuery1.open;
poruka:= dbform.FDQuery1.FieldByName('id_poruke').AsString;
dbform.FDQuery1.close;

dbform.FDQuery1.SQL.Text := 'select * from procesi where proces ='''+procesiComboBox.selected.text+'''';
dbform.FDQuery1.open;
proces:= dbform.FDQuery1.FieldByName('id_procesa').AsString;
dbform.FDQuery1.close;

dbform.FDQuery2.SQL.Text := 'insert into interni_podsetnik(id_procesa,id_poruke,datum) values('''+proces+''','''+poruka+''','''+slanjeDate.Text+''')';
dbform.FDQuery2.ExecSQL;

porukaEdit.text:='';
end;

procedure TForm2.FormShow(Sender: TObject);
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

end.
