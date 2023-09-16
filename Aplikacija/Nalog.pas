unit Nalog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,FireDAC.Stan.Param,
  FMX.Objects;

type
  TfrmNalog = class(TForm)
    bottom_bar: TRectangle;
    Back: TButton;
    toolbar: TToolBar;
    logo: TImage;
    NALOG: TLabel;
    Circle1: TCircle;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Odjava: TButton;
    Label3: TLabel;
    email: TLabel;
    Label4: TLabel;
    brtelefona: TLabel;
    ADMIN: TLabel;
    adresa: TLabel;
    procedure BackClick(Sender: TObject);
    procedure OdjavaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNalog: TfrmNalog;

  var
  UlogovanID : integer;

implementation

{$R *.fmx}

uses LogIn,Registracija,Main,GlavnaStrana,GlavnaStranaAdmin,BackgroundThread;



procedure TfrmNalog.BackClick(Sender: TObject);
begin
  if frmNalog.ADMIN.Opacity = 1 then
  begin
  frmGlavnaStranaAdmin.show;
  self.hide;
  end else
  begin
  frmGlavnaStrana.show;
  self.hide;
  end;


end;

procedure TfrmNalog.OdjavaClick(Sender: TObject);
begin
frmLogIn.show;
self.hide;
end;

end.
