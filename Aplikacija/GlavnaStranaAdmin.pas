unit GlavnaStranaAdmin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Menus;

type
  TForm2 = class(TForm)
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
    AdminMenu: TPopupMenu;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

end.
