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
    Button1: TButton;
    procedure nalogClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGlavnaStrana: TfrmGlavnaStrana;

implementation

{$R *.fmx}

uses Nalog,Prodaja;



procedure TfrmGlavnaStrana.Button1Click(Sender: TObject);
begin
frmProdaja.show;
self.hide;
end;

procedure TfrmGlavnaStrana.nalogClick(Sender: TObject);
begin
frmNalog.show;
self.hide;
end;

end.
