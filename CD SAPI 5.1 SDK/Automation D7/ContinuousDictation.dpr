program ContinuousDictation;

uses
  Forms,
  ContinuousDictationU in 'ContinuousDictationU.pas' {frmContinuousDictation};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmContinuousDictation, frmContinuousDictation);
  Application.Run;
end.
