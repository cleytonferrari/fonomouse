program TextToSpeechSimple;

uses
  Forms,
  TextToSpeechSimpleU in 'TextToSpeechSimpleU.pas' {frmTextToSpeech};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTextToSpeech, frmTextToSpeech);
  Application.Run;
end.
