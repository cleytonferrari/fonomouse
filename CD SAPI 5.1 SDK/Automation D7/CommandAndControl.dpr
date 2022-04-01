program CommandAndControl;

uses
  Forms,
  CommandAndControlU in 'CommandAndControlU.pas' {frmCommandAndControl};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCommandAndControl, frmCommandAndControl);
  Application.Run;
end.
