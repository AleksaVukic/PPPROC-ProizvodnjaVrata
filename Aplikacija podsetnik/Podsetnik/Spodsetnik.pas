unit Spodsetnik;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.DateTimeCtrls, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox,db;

type
  TForm3 = class(TForm)
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
  Form3: TForm3;
  i:integer;
  poruka:string;
  klijent:string;
implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
begin
dbform.FDQuery1.SQL.Text := 'insert into poruke(poruka) values('''+porukaEdit.text+''')';
dbform.FDQuery1.ExecSQL;

dbform.FDQuery1.SQL.Text := 'select * from poruke where poruka ='''+porukaEdit.text+'''';
dbform.FDQuery1.open;
poruka:= dbform.FDQuery1.FieldByName('id_poruke').AsString;
dbform.FDQuery1.close;

dbform.FDQuery1.SQL.Text := 'select * from klijenti where ime ='''+procesiComboBox.selected.text+'''';
dbform.FDQuery1.open;
klijent:= dbform.FDQuery1.FieldByName('id_klijenta').AsString;
dbform.FDQuery1.close;

dbform.FDQuery2.SQL.Text := 'insert into spoljni_podsetnik(id_klijenta,id_poruke,datum) values('''+klijent+''','''+poruka+''','''+slanjeDate.Text+''')';
dbform.FDQuery2.ExecSQL;

porukaEdit.text:='';
end;

procedure TForm3.FormShow(Sender: TObject);
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

end.
