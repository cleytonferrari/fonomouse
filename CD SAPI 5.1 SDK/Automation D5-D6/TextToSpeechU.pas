unit TextToSpeechU;

//Uses SAPI 5.1 early bound Automation

interface

uses
  ActiveX,
{$ifdef CONDITIONALEXPRESSIONS}
  Variants,
{$endif}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, StdCtrls, ComCtrls, ToolWin, OleServer,
  SpeechLib_TLB;

type
  TfrmTextToSpeech = class(TForm)
    lstProgress: TListBox;
    Label1: TLabel;
    cbVoices: TComboBox;
    Label2: TLabel;
    lstEngineInfo: TListBox;
    gbAttrs: TGroupBox;
    tbRate: TTrackBar;
    tbVolume: TTrackBar;
    Label4: TLabel;
    Label5: TLabel;
    lblMinSpeed: TLabel;
    lblMaxSpeed: TLabel;
    lblRate: TLabel;
    lblMaxVolume: TLabel;
    lblMinVolume: TLabel;
    ImageList1: TImageList;
    reText: TRichEdit;
    ToolBar1: TToolBar;
    btnPlay: TToolButton;
    btnPause: TToolButton;
    btnStop: TToolButton;
    Label6: TLabel;
    Label7: TLabel;
    SpVoice: TSpVoice;
    GroupBox1: TGroupBox;
    lblMinVU: TLabel;
    lblMaxVU: TLabel;
    lblVU: TLabel;
    ProgressBar: TProgressBar;
    lblVolume: TLabel;
    Label8: TLabel;
    memEnginePhonemes: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbVoicesChange(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure SpVoiceAudioLevel(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; AudioLevel: Integer);
    procedure SpVoiceBookmark(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; var Bookmark: OleVariant;
      BookmarkId: Integer);
    procedure SpVoiceEndStream(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant);
    procedure SpVoiceEnginePrivate(Sender: TObject; StreamNumber,
      StreamPosition: Integer; EngineData: OleVariant);
    procedure SpVoicePhoneme(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; Duration: Integer; NextPhoneId: Smallint;
      Feature: TOleEnum; CurrentPhoneId: Smallint);
    procedure SpVoiceSentence(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; CharacterPosition, Length: Integer);
    procedure SpVoiceStartStream(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant);
    procedure SpVoiceViseme(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; Duration: Integer; NextVisemeId, Feature,
      CurrentVisemeId: TOleEnum);
    procedure SpVoiceVoiceChange(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; var VoiceObjectToken: OleVariant);
    procedure SpVoiceWord(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; CharacterPosition, Length: Integer);
    procedure tbRateChange(Sender: TObject);
    procedure tbVolumeChange(Sender: TObject);
  private
    BeenPaused, StreamJustStarted: Boolean;
    OldSentencePos, OldSentenceLen: Integer;
    procedure SetTextHilite(FirstChar, Len: Integer);
    procedure SetTextStyle(FirstChar, Len: Integer; Styles: TFontStyles);
  public
    procedure Log(const Msg: String); overload;
    procedure Log(const Msg: String; const Args: array of const); overload;
  end;

var
  frmTextToSpeech: TfrmTextToSpeech;

implementation

{$R *.dfm}

{ TfrmTextToSpeech }

procedure TfrmTextToSpeech.Log(const Msg: String);
begin
  if not Assigned(lstProgress) then
    Exit;
  lstProgress.Items.Add(Msg);
  lstProgress.ItemIndex := lstProgress.Items.Count - 1
end;

procedure TfrmTextToSpeech.Log(const Msg: String; const Args: array of const);
begin
  Log(Format(Msg, Args))
end;

procedure TfrmTextToSpeech.FormCreate(Sender: TObject);
var
  I: Integer;
  SOToken: ISpeechObjectToken;
  SOTokens: ISpeechObjectTokens;
begin
  SendMessage(lstProgress.Handle, LB_SETHORIZONTALEXTENT, Width, 0);
  //Ensure all events fire
  SpVoice.EventInterests := SVEAllEvents;
  Log('About to enumerate voices');
  SOTokens := SpVoice.GetVoices('', '');
  for I := 0 to SOTokens.Count - 1 do
  begin
    //For each voice, store the descriptor in the TStrings list
    SOToken := SOTokens.Item(I);
    cbVoices.Items.AddObject(SOToken.GetDescription(0), TObject(SOToken));
    //Increment the descriptor reference count to ensure it doesn't get destroyed
    SOToken._AddRef;
  end;
  if cbVoices.Items.Count > 0 then
  begin
    cbVoices.ItemIndex := 0; //Select 1st voice
    cbVoices.OnChange(cbVoices); //& ensure OnChange triggers
  end;
  Log('Enumerated voices');
  Log('About to check attributes');
  tbRate.Position := SpVoice.Rate;
  lblRate.Caption := IntToStr(tbRate.Position);
  tbVolume.Position := SpVoice.Volume;
  lblVolume.Caption := IntToStr(tbVolume.Position);
  Log('Checked attributes');
end;

procedure TfrmTextToSpeech.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  //Release all the voice descriptors
  for I := 0 to cbVoices.Items.Count - 1 do
    ISpeechObjectToken(Pointer(cbVoices.Items.Objects[I]))._Release;
end;

procedure TfrmTextToSpeech.cbVoicesChange(Sender: TObject);
var
  SOToken: ISpeechObjectToken;
begin
  with lstEngineInfo.Items do
  begin
    Clear;
    SOToken := ISpeechObjectToken(Pointer(
      cbVoices.Items.Objects[cbVoices.ItemIndex]));
    SpVoice.Voice := SOToken;
    Add(Format('Name: %s', [SOToken.GetAttribute('Name')]));
    Add(Format('Vendor: %s', [SOToken.GetAttribute('Vendor')]));
    Add(Format('Age: %s', [SOToken.GetAttribute('Age')]));
    Add(Format('Gender: %s', [SOToken.GetAttribute('Gender')]));
    Add(Format('Language: %s', [SOToken.GetAttribute('Language')]));
    Add(Format('Reg key: %s', [SOToken.Id]));
  end
end;

procedure TfrmTextToSpeech.btnPlayClick(Sender: TObject);
begin
  if not BeenPaused then
    SpVoice.Speak(reText.Text, SVSFlagsAsync)
  else
  begin
    SpVoice.Resume;
    BeenPaused := False
  end
end;

procedure TfrmTextToSpeech.btnPauseClick(Sender: TObject);
begin
  if not BeenPaused then
    SpVoice.Pause;
  BeenPaused := True
end;

procedure TfrmTextToSpeech.btnStopClick(Sender: TObject);
begin
  SpVoice.Skip('Sentence', MaxInt)
end;

procedure TfrmTextToSpeech.SetTextHilite(FirstChar, Len: Integer);
begin
  reText.SelStart := FirstChar; //highlight word
  reText.SelLength := Len;
end;

procedure TfrmTextToSpeech.SetTextStyle(FirstChar, Len: Integer; Styles: TFontStyles);
begin
  with reText do
  begin
    Lines.BeginUpdate;
    try
      SelStart := FirstChar; //highlight word
      SelLength := Len;
      SelAttributes.Style := Styles; //apply requested style
      SelLength := 0; //unhighlight word
    finally
      Lines.EndUpdate
    end
  end
end;

procedure TfrmTextToSpeech.SpVoiceAudioLevel(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; AudioLevel: Integer);
begin
  ProgressBar.Position := AudioLevel;
  lblVU.Caption := IntToStr(AudioLevel)
end;

procedure TfrmTextToSpeech.SpVoiceBookmark(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant;
  var Bookmark: OleVariant; BookmarkId: Integer);
begin
  Log('OnBookmark: stream %d, position %d, bookmark id %d, bookmark: %s',
    [StreamNumber, Integer(StreamPosition), BookmarkId, WideString(Bookmark)]);
end;

procedure TfrmTextToSpeech.SpVoiceEndStream(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnEndStream: stream %d, position: %d', [StreamNumber, Integer(StreamPosition)]);
  SetTextHilite(0, 0);
  SetTextStyle(OldSentencePos, OldSentenceLen, []);
end;

procedure TfrmTextToSpeech.SpVoiceEnginePrivate(Sender: TObject;
  StreamNumber, StreamPosition: Integer; EngineData: OleVariant);
begin
  Log('OnEnginePrivate: stream %d, position: %d', [StreamNumber, Integer(StreamPosition)])
end;

const
  Phonemes: array[1..49] of String = (
    '-', '!', '&', ',', '.', '?', '_',
    '1', '2', 'aa', 'ae', 'ah', 'ao', 'aw',
    'ax', 'ay', 'b', 'ch', 'd', 'dh', 'eh',
    'er', 'ey', 'f', 'g', 'h', 'ih', 'iy',
    'jh', 'k', 'l', 'm', 'n', 'ng', 'ow',
    'oy', 'p', 'r', 's', 'sh', 't', 'th',
    'uh', 'uw', 'v', 'w', 'y', 'z', 'zh'
  );

procedure TfrmTextToSpeech.SpVoicePhoneme(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; Duration: Integer;
  NextPhoneId: Smallint; Feature: TOleEnum; CurrentPhoneId: Smallint);
begin
  if CurrentPhoneId <> 7 then //Display phonemes, except silence
    memEnginePhonemes.Text := memEnginePhonemes.Text + Phonemes[CurrentPhoneId] + #32
end;

procedure TfrmTextToSpeech.SpVoiceSentence(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; CharacterPosition,
  Length: Integer);
begin
  Log('OnSentence: stream %d, position: %d, char. pos. %d, length %d',
    [StreamNumber, Integer(StreamPosition), CharacterPosition, Length]);
  SetTextStyle(OldSentencePos, OldSentenceLen, []);
  SetTextStyle(CharacterPosition, Length, [fsItalic]);
  OldSentencePos := CharacterPosition;
  OldSentenceLen := Length;
  if not StreamJustStarted then
    memEnginePhonemes.Text := memEnginePhonemes.Text + #13#10;
  StreamJustStarted := False;
end;

procedure TfrmTextToSpeech.SpVoiceStartStream(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant);
begin
  StreamJustStarted := True;
  memEnginePhonemes.Clear;
  Log('OnStartStream: stream %d, position: %d', [StreamNumber, Integer(StreamPosition)]);
end;

procedure TfrmTextToSpeech.SpVoiceViseme(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; Duration: Integer;
  NextVisemeId, Feature, CurrentVisemeId: TOleEnum);
begin
  Log('OnViseme: stream %d, position: %d, viseme %d',
    [StreamNumber, Integer(StreamPosition), CurrentVisemeId])
end;

procedure TfrmTextToSpeech.SpVoiceVoiceChange(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant;
  var VoiceObjectToken: OleVariant);
begin
  Log('OnVoiceChange: stream %d, position: %d, voice: %s',
    [StreamNumber, Integer(StreamPosition),
     String(VoiceObjectToken.GetDescription)])
end;

procedure TfrmTextToSpeech.SpVoiceWord(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; CharacterPosition,
  Length: Integer);
begin
  Log('OnWord: stream %d, position: %d, char. pos. %d, length %d',
    [StreamNumber, Integer(StreamPosition), CharacterPosition, Length]);
  SetTextHilite(CharacterPosition, Length);
end;

procedure TfrmTextToSpeech.tbRateChange(Sender: TObject);
begin
  btnStop.Click;
  SpVoice.Rate := tbRate.Position;
  lblRate.Caption := IntToStr(tbRate.Position);
end;

procedure TfrmTextToSpeech.tbVolumeChange(Sender: TObject);
begin
  btnStop.Click;
  SpVoice.Volume := tbVolume.Position;
  lblVolume.Caption := IntToStr(tbVolume.Position);
end;

end.
