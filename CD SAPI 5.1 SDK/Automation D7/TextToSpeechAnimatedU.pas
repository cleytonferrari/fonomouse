unit TextToSpeechAnimatedU;

//Uses SAPI 5.1 early bound Automation

interface

uses
  ActiveX,
{$ifdef CONDITIONALEXPRESSIONS}
  Variants,
{$endif}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, StdCtrls, ComCtrls, ToolWin, OleServer,
  SpeechLib_TLB, ExtCtrls;

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
    imgsMic: TImageList;
    pbMic: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbVoicesChange(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure SpVoiceAudioLevel(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; AudioLevel: Integer);
    procedure SpVoiceBookmark(ASender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; const Bookmark: WideString;
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
    procedure SpVoiceVoiceChange(ASender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant;
      const VoiceObjectToken: ISpeechObjectToken);
    procedure SpVoiceWord(Sender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; CharacterPosition, Length: Integer);
    procedure tbRateChange(Sender: TObject);
    procedure tbVolumeChange(Sender: TObject);
    procedure pbMicPaint(Sender: TObject);
  private
    BeenPaused, StreamJustStarted: Boolean;
    OldSentencePos, OldSentenceLen: Integer;
    procedure SetTextHilite(FirstChar, Len: Integer);
    procedure SetTextStyle(FirstChar, Len: Integer; Styles: TFontStyles);
    procedure SetupMicImages;
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

procedure TfrmTextToSpeech.SetupMicImages;
var
  Bmp: TBitmap;

  procedure LoadBitmap(const FileName: String);
  begin
    Bmp.LoadFromFile(FileName);
    imgsMic.AddMasked(Bmp, Bmp.TransparentColor);
  end;

begin
  Bmp := TBitmap.Create;
  try
    ChDir('C:\Arquivos de programas\Microsoft Speech SDK 5.1\Samples\CPP\TTSApp\Res');
    LoadBitmap('mic.bmp');
    LoadBitmap('mic_mouth_2.bmp');
    LoadBitmap('mic_mouth_3.bmp');
    LoadBitmap('mic_mouth_4.bmp');
    LoadBitmap('mic_mouth_5.bmp');
    LoadBitmap('mic_mouth_6.bmp');
    LoadBitmap('mic_mouth_7.bmp');
    LoadBitmap('mic_mouth_8.bmp');
    LoadBitmap('mic_mouth_9.bmp');
    LoadBitmap('mic_mouth_10.bmp');
    LoadBitmap('mic_mouth_11.bmp');
    LoadBitmap('mic_mouth_12.bmp');
    LoadBitmap('mic_mouth_13.bmp');
    LoadBitmap('mic_eyes_narrow.bmp');
    LoadBitmap('mic eyes closed.bmp');
  finally
    Bmp.Free;
  end
end;

procedure TfrmTextToSpeech.FormCreate(Sender: TObject);
var
  I: Integer;
  SOToken: ISpeechObjectToken;
  SOTokens: ISpeechObjectTokens;
begin
  SendMessage(lstProgress.Handle, LB_SETHORIZONTALEXTENT, Width, 0);
  //Set up image list
  SetupMicImages;
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

procedure TfrmTextToSpeech.SpVoiceBookmark(ASender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant;
  const Bookmark: WideString; BookmarkId: Integer);
begin
  Log('OnBookmark: stream %d, position %d, bookmark id %d, bookmark: %s',
    [StreamNumber, Integer(StreamPosition), BookmarkId, Bookmark]);
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
    memEnginePhonemes.Text := memEnginePhonemes.Text + Phonemes[CurrentPhoneId] +'-'
end;

procedure TfrmTextToSpeech.SpVoiceSentence(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; CharacterPosition,
  Length: Integer);
begin
  Log('OnSentence: stream %d, position: %d, char. pos. %d, length %d',
    [StreamNumber, Integer(StreamPosition), CharacterPosition, Length]);
  SetTextStyle(OldSentencePos, OldSentenceLen, []);
  if Length > 0 then
  begin
    SetTextStyle(CharacterPosition, Length, [fsItalic]);
    OldSentencePos := CharacterPosition;
    OldSentenceLen := Length;
  end;
  if not StreamJustStarted then
    memEnginePhonemes.Text := memEnginePhonemes.Text + #13#10;
  StreamJustStarted := False;
end;

procedure TfrmTextToSpeech.SpVoiceStartStream(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant);
begin
  StreamJustStarted := True;
  Log('OnStartStream: stream %d, position: %d', [StreamNumber, Integer(StreamPosition)]);
  memEnginePhonemes.Clear;
end;

const
  Visemes: array[0..21] of Byte = (
   	0,  // SP_VISEME_0 = 0,    // Silence
    11, // SP_VISEME_1,        // AE, AX, AH
    11, // SP_VISEME_2,        // AA
    11, // SP_VISEME_3,        // AO
    10, // SP_VISEME_4,        // EY, EH, UH
    11, // SP_VISEME_5,        // ER
    9,  // SP_VISEME_6,        // y, IY, IH, IX
    2,  // SP_VISEME_7,        // w, UW
    13, // SP_VISEME_8,        // OW
    9,  // SP_VISEME_9,        // AW
    12, // SP_VISEME_10,       // OY
    11, // SP_VISEME_11,       // AY
    9,  // SP_VISEME_12,       // h
    3,  // SP_VISEME_13,       // r
    6,  // SP_VISEME_14,       // l
    7,  // SP_VISEME_15,       // s, z
    8,  // SP_VISEME_16,       // SH, CH, JH, ZH
    5,  // SP_VISEME_17,       // TH, DH
    4,  // SP_VISEME_18,       // f, v
    7,  // SP_VISEME_19,       // d, t, n
    9,  // SP_VISEME_20,       // k, g, NG
    1   // SP_VISEME_21,       // p, b, m
  );

procedure TfrmTextToSpeech.SpVoiceViseme(Sender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant; Duration: Integer;
  NextVisemeId, Feature, CurrentVisemeId: TOleEnum);
const
  EyesNarrow = 14;
  EyesClosed = 15;
begin
  imgsMic.Draw(pbMic.Canvas, 0, 0, Visemes[CurrentVisemeId]);
  if Visemes[CurrentVisemeId] mod 6 = 2 then
    imgsMic.Draw(pbMic.Canvas, 0, 0, EyesNarrow)
  else
    if Visemes[CurrentVisemeId] mod 6 = 5 then
      imgsMic.Draw(pbMic.Canvas, 0, 0, EyesClosed);
end;

procedure TfrmTextToSpeech.SpVoiceVoiceChange(ASender: TObject;
  StreamNumber: Integer; StreamPosition: OleVariant;
  const VoiceObjectToken: ISpeechObjectToken);
begin
  Log('OnVoiceChange: stream %d, position: %d, voice: %s',
    [StreamNumber, Integer(StreamPosition),
     VoiceObjectToken.GetDescription(0)])
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

procedure TfrmTextToSpeech.pbMicPaint(Sender: TObject);
begin
  imgsMic.Draw(pbMic.Canvas, 0, 0, 0);
end;

end.
