unit GlavnaStranaAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Menus, FMX.ExtCtrls;

type
  TfrmGlavnaStranaAdmin = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    korpa: TButton;
    Image1: TImage;
    nalog: TButton;
    LabelGatekeeper: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    KONTAKT: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Button1: TButton;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure nalogClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGlavnaStranaAdmin: TfrmGlavnaStranaAdmin;


implementation

{$R *.fmx}

uses Nalog,Prodaja,Nabavka,Podsetnik,Magacin,Cenovnik,Knjigovodjstvo,Pravna,Normiranje,Proizvodnja;



procedure TfrmGlavnaStranaAdmin.Button1Click(Sender: TObject);
begin
frmProdaja.show;
self.hide;
end;

procedure TfrmGlavnaStranaAdmin.MenuItem1Click(Sender: TObject);
begin
frmNabavka.show;
end;

procedure TfrmGlavnaStranaAdmin.MenuItem2Click(Sender: TObject);
begin
frmPodsetnik.show;
end;

procedure TfrmGlavnaStranaAdmin.MenuItem3Click(Sender: TObject);
begin
frmMagacin.show;
end;

procedure TfrmGlavnaStranaAdmin.MenuItem4Click(Sender: TObject);
begin
frmNormiranje.show;
end;

procedure TfrmGlavnaStranaAdmin.MenuItem5Click(Sender: TObject);
begin
frmPravna.show;
end;

procedure TfrmGlavnaStranaAdmin.MenuItem6Click(Sender: TObject);
begin
frmCenovnik.show;
end;

procedure TfrmGlavnaStranaAdmin.MenuItem7Click(Sender: TObject);
begin
frmKnjigovodjstvo.show;
end;

procedure TfrmGlavnaStranaAdmin.MenuItem8Click(Sender: TObject);
begin
frmProizvodnja.show;
end;

procedure TfrmGlavnaStranaAdmin.nalogClick(Sender: TObject);
begin
frmNalog.show;
self.hide;
end;

end.
