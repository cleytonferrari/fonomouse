program TextToSpeechAnimated;

uses
  Forms,
  TextToSpeechAnimatedU in 'TextToSpeechAnimatedU.pas' {frmTextToSpeech};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTextToSpeech, frmTextToSpeech);
  Application.Run;
end.
