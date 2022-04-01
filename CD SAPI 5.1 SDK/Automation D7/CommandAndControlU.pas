unit CommandAndControlU;

//Uses SAPI 5.1 early bound Automation

interface

uses
  ActiveX,
{$ifdef CONDITIONALEXPRESSIONS}
  Variants,
{$endif}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, OleServer, SpeechLib_TLB;

type
  TfrmCommandAndControl = class(TForm)
    lstProgress: TListBox;
    GroupBox1: TGroupBox;
    ProgressBar: TProgressBar;
    lblMinVU: TLabel;
    lblMaxVU: TLabel;
    lblVU: TLabel;
    Label3: TLabel;
    SpSharedRecoContext: TSpSharedRecoContext;
    btnEngineProps: TButton;
    btnUserSettings: TButton;
    btnLexicon: TButton;
    btnTrainGeneral: TButton;
    btnTrainMic: TButton;
    btnAudioProps: TButton;
    btnAudioVol: TButton;
    procedure FormCreate(Sender: TObject);
    procedure SpSharedRecoContextAudioLevel(Sender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      AudioLevel: Integer);
    procedure SpSharedRecoContextFalseRecognition(ASender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      const Result: ISpeechRecoResult);
    procedure SpSharedRecoContextHypothesis(ASender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      const Result: ISpeechRecoResult);
    procedure SpSharedRecoContextInterference(Sender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      Interference: TOleEnum);
    procedure SpSharedRecoContextPhraseStart(Sender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant);
    procedure SpSharedRecoContextRecognition(ASender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      RecognitionType: TOleEnum; const Result: ISpeechRecoResult);
    procedure SpSharedRecoContextRecognitionForOtherContext(
      Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
    procedure SpSharedRecoContextRequestUI(ASender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      const UIType: WideString);
    procedure SpSharedRecoContextSoundStart(Sender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant);
    procedure SpSharedRecoContextSoundEnd(Sender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant);
    procedure SpSharedRecoContextStartStream(Sender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant);
    procedure SpSharedRecoContextEndStream(Sender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      StreamReleased: WordBool);
    procedure btnEnginePropsClick(Sender: TObject);
    procedure btnUserSettingsClick(Sender: TObject);
    procedure btnLexiconClick(Sender: TObject);
    procedure btnTrainGeneralClick(Sender: TObject);
    procedure btnTrainMicClick(Sender: TObject);
    procedure btnAudioPropsClick(Sender: TObject);
    procedure btnAudioVolClick(Sender: TObject);
    procedure SpSharedRecoContextAdaptation(Sender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant);
    procedure SpSharedRecoContextBookmark(Sender: TObject;
      StreamNumber: Integer; StreamPosition, BookmarkId: OleVariant;
      Options: TOleEnum);
    procedure SpSharedRecoContextEnginePrivate(Sender: TObject;
      StreamNumber: Integer; StreamPosition, EngineData: OleVariant);
    procedure SpSharedRecoContextPropertyNumberChange(ASender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      const PropertyName: WideString; NewNumberValue: Integer);
    procedure SpSharedRecoContextPropertyStringChange(ASender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      const PropertyName: WideString; const NewStringValue: WideString);
    procedure SpSharedRecoContextRecognizerStateChange(Sender: TObject;
      StreamNumber: Integer; StreamPosition: OleVariant;
      NewState: TOleEnum);
  private
    SRGrammar: ISpeechRecoGrammar;
    procedure InvokeUI(const TypeOfUI, Caption: WideString);
  public
    procedure Log(const Msg: String); overload;
    procedure Log(const Msg: String; const Args: array of const); overload;
  end;

var
  frmCommandAndControl: TfrmCommandAndControl;

implementation

{$R *.dfm}

uses
  SAPI, ComObj;

{ TfrmVoiceDictationAPI }

procedure TfrmCommandAndControl.Log(const Msg: String);
begin
  if not Assigned(lstProgress) then
    Exit;
  lstProgress.Items.Add(Msg);
  lstProgress.ItemIndex := lstProgress.Items.Count - 1
end;

procedure TfrmCommandAndControl.Log(const Msg: String; const Args: array of const);
begin
  Log(Format(Msg, Args))
end;

procedure TfrmCommandAndControl.FormCreate(Sender: TObject);
begin
  //OnAudioLevel event is not fired by default - this changes that
  SpSharedRecoContext.EventInterests := SREAllEvents;
  SRGrammar := SpSharedRecoContext.CreateGrammar(0);
  SRGrammar.CmdLoadFromFile('C and C Grammar.xml', SLODynamic);
  SRGrammar.CmdSetRuleIdState(0, SGDSActive)
end;

procedure TfrmCommandAndControl.SpSharedRecoContextAudioLevel(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  AudioLevel: Integer);
begin
  ProgressBar.Position := AudioLevel;
  lblVU.Caption := IntToStr(AudioLevel)
end;

procedure TfrmCommandAndControl.SpSharedRecoContextFalseRecognition(
  ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  const Result: ISpeechRecoResult);
begin
  Log('OnFalseRecognition: %s, SAPI confidence: %s, engine confidence: %s',
    [Result.PhraseInfo.GetText(0, -1, True),
     Result.PhraseInfo.Rule.Confidence,
     Result.PhraseInfo.Rule.EngineConfidence])
end;

procedure TfrmCommandAndControl.SpSharedRecoContextHypothesis(
  ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  const Result: ISpeechRecoResult);
begin
  Log('OnHypothesis: %s', [Result.PhraseInfo.GetText(0, -1, True)]);
end;

procedure TfrmCommandAndControl.SpSharedRecoContextInterference(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  Interference: TOleEnum);
var
  S: String;
begin
  case Interference of
    SINone:     S := 'none';
    SINoise:    S := 'noise';
    SINoSignal: S := 'no signal';
    SITooLoud:  S := 'too loud for discrete recognition';
    SITooQuiet: S := 'too quiet for discrete recognition';
    SITooFast:  S := 'too fast for discrete recognition';
    SITooSlow:  S := 'too slow';
  end;
  Log('OnInterference: %s', [S])
end;

procedure TfrmCommandAndControl.SpSharedRecoContextPhraseStart(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnPhraseStart');
end;

function GetProp(Props: ISpeechPhraseProperties;
  const Name: String): ISpeechPhraseProperty; overload;
var
  I: Integer;
  Prop: ISpeechPhraseProperty;
begin
  Result := nil;
  for I := 0 to Props.Count - 1 do
  begin
    Prop := Props.Item(I);
    if CompareText(Prop.Name, Name) = 0 then
    begin
      Result := Prop;
      Break
    end
  end
end;

function GetPropValue(SRResult: ISpeechRecoResult;
  const Path: array of String): OleVariant;
var
  Prop: ISpeechPhraseProperty;
  PathLoop: Integer;
begin
  for PathLoop := Low(Path) to High(Path) do
  begin
    if PathLoop = Low(Path) then //top level property
      Prop := GetProp(SRResult.PhraseInfo.Properties, Path[PathLoop])
    else //nested property
      Prop := GetProp(Prop.Children, Path[PathLoop]);
    if not Assigned(Prop) then
    begin
      Result := Unassigned;
      Exit;
    end
  end;
  Result := Prop.Value
end;

procedure TfrmCommandAndControl.SpSharedRecoContextRecognition(
  ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  RecognitionType: TOleEnum; const Result: ISpeechRecoResult);
begin
  with Result.PhraseInfo do
  begin
    Log('OnRecognition: %s', [GetText(0, -1, True)]);
    case GetPropValue(Result, ['chosencolour', 'colourvalue']) of
      1: Color := clRed;
      2: Color := clBlue;
      3: Color := clGreen;
    end
  end
end;

procedure TfrmCommandAndControl.SpSharedRecoContextRecognitionForOtherContext(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnRecognitionForOtherContext')
end;

procedure TfrmCommandAndControl.SpSharedRecoContextRequestUI(
  ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  const UIType: WideString);
begin
  Log('OnRequestUI: %s', [UIType])
end;

procedure TfrmCommandAndControl.SpSharedRecoContextSoundStart(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnSoundStart')
end;

procedure TfrmCommandAndControl.SpSharedRecoContextSoundEnd(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnSoundEnd')
end;

procedure TfrmCommandAndControl.SpSharedRecoContextStartStream(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnStartStream: stream %d', [StreamNumber])
end;

procedure TfrmCommandAndControl.SpSharedRecoContextEndStream(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  StreamReleased: WordBool);
begin
  Log('OnEndStream: stream %d', [StreamNumber])
end;

procedure TfrmCommandAndControl.btnEnginePropsClick(Sender: TObject);
begin
  //Only available in SAPI 5.0; not in SAPI 5.1 or later
  InvokeUI(SPDUI_EngineProperties, 'Engine Properties')
end;

procedure TfrmCommandAndControl.btnUserSettingsClick(Sender: TObject);
begin
  InvokeUI(SPDUI_RecoProfileProperties, 'User Settings')
end;

procedure TfrmCommandAndControl.btnLexiconClick(Sender: TObject);
begin
  InvokeUI(SPDUI_AddRemoveWord, 'Add/Remove Word')
end;

procedure TfrmCommandAndControl.btnTrainGeneralClick(Sender: TObject);
begin
  InvokeUI(SPDUI_UserTraining, 'Speaker Training')
end;

procedure TfrmCommandAndControl.btnTrainMicClick(Sender: TObject);
begin
  InvokeUI(SPDUI_MicTraining, 'Microphone Setup')
end;

procedure TfrmCommandAndControl.btnAudioPropsClick(Sender: TObject);
begin
  InvokeUI(SPDUI_AudioProperties, 'Audio Properties')
end;

procedure TfrmCommandAndControl.btnAudioVolClick(Sender: TObject);
begin
  InvokeUI(SPDUI_AudioVolume, 'Audio Volume')
end;

procedure TfrmCommandAndControl.InvokeUI(const TypeOfUI, Caption: WideString);
var
  U: OleVariant;
begin
  U := Unassigned;
  if SpSharedRecoContext.Recognizer.IsUISupported(TypeOfUI, U) then
    SpSharedRecoContext.Recognizer.DisplayUI(Handle, Caption, TypeOfUI, U)
end;

procedure TfrmCommandAndControl.SpSharedRecoContextAdaptation(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnAdaptation')
end;

procedure TfrmCommandAndControl.SpSharedRecoContextBookmark(
  Sender: TObject; StreamNumber: Integer; StreamPosition,
  BookmarkId: OleVariant; Options: TOleEnum);
begin
  Log('OnBookmark: %d', [Integer(BookmarkId)])
end;

procedure TfrmCommandAndControl.SpSharedRecoContextEnginePrivate(
  Sender: TObject; StreamNumber: Integer; StreamPosition,
  EngineData: OleVariant);
begin
  Log('OnEnginePrivate')
end;

procedure TfrmCommandAndControl.SpSharedRecoContextPropertyNumberChange(
  ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  const PropertyName: WideString; NewNumberValue: Integer);
begin
  Log('OnPropertyNumberChange: %s=%d', [PropertyName, NewNumberValue])
end;

procedure TfrmCommandAndControl.SpSharedRecoContextPropertyStringChange(
  ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  const PropertyName: WideString; const NewStringValue: WideString);
begin
  Log('OnPropertyStringChange: %s=%s', [PropertyName, NewStringValue])
end;

procedure TfrmCommandAndControl.SpSharedRecoContextRecognizerStateChange(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  NewState: TOleEnum);
var
  S: String;
begin
  case NewState of
    SRSInactive:          S := 'inactive';
    SRSActive:            S := 'active';
    SRSActiveAlways:      S := 'active always';
    SRSInactiveWithPurge: S := 'inactive with purge';
  end;
  Log('OnRecognizerStateChange')
end;

end.
