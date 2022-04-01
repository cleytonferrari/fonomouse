unit TextToSpeechSimpleU;

//Uses SAPI 5.1 early bound Automation

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ComCtrls, Buttons, ImgList, ToolWin,
  OleServer, SpeechLib_TLB;

type
  TfrmTextToSpeech = class(TForm)
    memText: TMemo;
    Label7: TLabel;
    Button1: TButton;
    SpVoice1: TSpVoice;
    procedure Button1Click(Sender: TObject);
  end;

var
  frmTextToSpeech: TfrmTextToSpeech;

implementation

{$R *.dfm}

{ TfrmTextToSpeech }

procedure TfrmTextToSpeech.Button1Click(Sender: TObject);
begin
  SpVoice1.Speak(memText.Text, SVSFDefault)
end;

end.
