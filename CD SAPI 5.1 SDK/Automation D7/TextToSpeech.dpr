program TextToSpeech;

uses
  Forms,
  TextToSpeechU in 'TextToSpeechU.pas' {frmTextToSpeech};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTextToSpeech, frmTextToSpeech);
  Application.Run;
end.
