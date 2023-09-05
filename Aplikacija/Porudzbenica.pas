unit Porudzbenica;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.ListBox, FMX.Layouts,
  FMX.Edit;

type
  TfrmPorudzbenica = class(TForm)
    Back: TButton;
    Rectangle1: TRectangle;
    ListBox1: TListBox;
    label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure BackClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPorudzbenica: TfrmPorudzbenica;

implementation

{$R *.fmx}

uses Prodaja,Main,Proizvod;

procedure TfrmPorudzbenica.BackClick(Sender: TObject);
begin
frmProizvod.show;
self.hide
end;

procedure TfrmPorudzbenica.Button2Click(Sender: TObject);
begin
ListBox1.Items.Clear;
ListBox2.Items.Clear;
ListBox3.Items.Clear;
ListBox4.Items.Clear;
end;

end.
