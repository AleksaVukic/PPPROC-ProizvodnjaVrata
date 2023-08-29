unit DvokrilnaVrata;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TfrmDvokrilnaVrata = class(TForm)
    bottom_bar: TRectangle;
    Back: TButton;
    toolbar: TToolBar;
    logo: TImage;
    DvokrilnaVrata: TLabel;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDvokrilnaVrata: TfrmDvokrilnaVrata;

implementation

{$R *.fmx}

end.
