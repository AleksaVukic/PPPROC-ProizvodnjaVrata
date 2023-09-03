unit BackgroundThread;

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
  TMyBackgroundThread = class(TThread)
  protected
    procedure Execute; override;
  end;

implementation

uses Main,Nalog,LogIn,GlavnaStranaAdmin;

procedure TMyBackgroundThread.Execute;
begin
  while not Terminated do
  begin
UlogovanID := frmLogIn.UlogovanID.Text.ToInteger;
var
MyQuery2: TFDQuery;

    begin
    MyQuery2 := TFDQuery.Create(nil);
    try
      MyQuery2.Connection := GlobalConnection;
      MyQuery2.SQL.Text := 'SELECT * FROM Nalog WHERE NalogID = :UlogovanID';
      MyQuery2.ParamByName('UlogovanID').AsInteger := UlogovanID;

      MyQuery2.Open;
      if not MyQuery2.IsEmpty then
      begin
      frmNalog.Label1.Text := MyQuery2.FieldByName('Ime').AsString;
      frmNalog.Label2.Text := MyQuery2.FieldByName('Prezime').AsString;
      frmNalog.email.Text := MyQuery2.FieldByName('Email').AsString;
      frmNalog.brtelefona.Text := MyQuery2.FieldByName('BrTelefona').AsString;
        if  MyQuery2.FieldByName('ROLE').AsString = 'ADMIN' then
        begin
          frmNalog.ADMIN.Opacity := 1;
        end else
        begin
          frmNalog.ADMIN.Opacity := 0;
        end;

      end;
    finally
      MyQuery2.Free;

    end;
    end;
    Sleep(1000); // Wait for a second before repeating
  end;
end;

end.