unit TextToSpeechReadWordDocU;

interface

uses
{$ifdef CONDITIONALEXPRESSIONS}
  Variants,
{$endif}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, OleServer, SpeechLib_TLB;

type
  TfrmTextToSpeechReadWordDoc = class(TForm)
    btnReadDoc: TButton;
    dlgOpenDoc: TOpenDialog;
    btnStop: TButton;
    SpVoice: TSpVoice;
    procedure FormCreate(Sender: TObject);
    procedure btnReadDocClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    MSWord: Variant;
    Stopped: Boolean;
  end;

var
  frmTextToSpeechReadWordDoc: TfrmTextToSpeechReadWordDoc;

implementation

{$R *.dfm}

uses
  ComObj;

procedure TfrmTextToSpeechReadWordDoc.FormCreate(Sender: TObject);
begin
  MSWord := CreateOleObject('Word.Application');
end;

procedure TfrmTextToSpeechReadWordDoc.btnReadDocClick(Sender: TObject);
const
// Constants for enum WdUnits
  wdCharacter = $00000001;
  wdParagraph = $00000004;
// Constants for enum WdMovementType
  wdExtend = $00000001;
var
  Moved: Integer;
  Txt: String;
begin
  (Sender as TButton).Enabled := False;
  Stopped := False;
  if dlgOpenDoc.Execute then
  begin
    MSWord.Documents.Open(FileName := dlgOpenDoc.FileName);
    Moved := 2;
    while (Moved > 1) and not Stopped do
    begin
      //Select next paragraph
      Moved := MSWord.Selection.EndOf(Unit := wdParagraph, Extend := wdExtend);
      if Moved > 1 then
      begin
        Txt := Trim(MSWord.Selection.Text);
        if Length(Txt) > 0 then
          SpVoice.Speak(Txt, SVSFlagsAsync);
        Application.ProcessMessages;
        //Move to start of next paragraph
        MSWord.Selection.MoveRight(Unit := wdCharacter);
      end
    end;
  end;
  MSWord.ActiveDocument.Close;
  TButton(Sender).Enabled := True;
end;

procedure TfrmTextToSpeechReadWordDoc.btnStopClick(Sender: TObject);
begin
  SpVoice.Skip('Sentence', Maxint);
  Stopped := True;
end;

procedure TfrmTextToSpeechReadWordDoc.FormDestroy(Sender: TObject);
begin
  btnStop.Click;
  MSWord.Quit;
  MSWord := Unassigned;
end;

end.
