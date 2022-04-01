program TextToSpeechReadWordDoc;

uses
  Forms,
  TextToSpeechReadWordDocU in 'TextToSpeechReadWordDocU.pas' {frmTextToSpeechReadWordDoc};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmTextToSpeechReadWordDoc, frmTextToSpeechReadWordDoc);
  Application.Run;
end.
