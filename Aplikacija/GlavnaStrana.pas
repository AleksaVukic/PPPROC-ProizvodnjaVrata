unit GlavnaStrana;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  TfrmGlavnaStrana = class(TForm)
    Panel1: TPanel;
    korpa: TButton;
    Panel2: TPanel;
    LabelGatekeeper: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    KONTAKT: TLabel;
    Label4: TLabel;
    Image1: TImage;
    nalog: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGlavnaStrana: TfrmGlavnaStrana;

implementation

{$R *.fmx}




end.
