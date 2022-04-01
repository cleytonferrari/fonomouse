unit ContinuousDictationU;

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
  TfrmContinuousDictation = class(TForm)
    lstProgress: TListBox;
    GroupBox1: TGroupBox;
    ProgressBar: TProgressBar;
    lblMinVU: TLabel;
    lblMaxVU: TLabel;
    lblVU: TLabel;
    memText: TMemo;
    lstHypotheses: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnEngineProps: TButton;
    btnUserSettings: TButton;
    btnLexicon: TButton;
    btnTrainGeneral: TButton;
    btnTrainMic: TButton;
    btnAudioProps: TButton;
    btnAudioVol: TButton;
    SpSharedRecoContext: TSpSharedRecoContext;
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
  private
    SRGrammar: ISpeechRecoGrammar;
    procedure InvokeUI(const TypeOfUI, Caption: WideString);
  public
    procedure Log(const Msg: String); overload;
    procedure Log(const Msg: String; const Args: array of const); overload;
  end;

var
  frmContinuousDictation: TfrmContinuousDictation;

implementation

{$R *.dfm}

uses
  SAPI, ComObj;

{ TfrmVoiceDictationAPI }

procedure TfrmContinuousDictation.Log(const Msg: String);
begin
  if not Assigned(lstProgress) then
    Exit;
  lstProgress.Items.Add(Msg);
  lstProgress.ItemIndex := lstProgress.Items.Count - 1
end;

procedure TfrmContinuousDictation.Log(const Msg: String; const Args: array of const);
begin
  Log(Format(Msg, Args))
end;

procedure TfrmContinuousDictation.FormCreate(Sender: TObject);
begin
  //OnAudioLevel event is not fired by default - this changes that
  SpSharedRecoContext.EventInterests := SREAllEvents;
  SRGrammar := SpSharedRecoContext.CreateGrammar(0);
  SRGrammar.DictationSetState(SGDSActive)
end;

procedure TfrmContinuousDictation.SpSharedRecoContextAudioLevel(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  AudioLevel: Integer);
begin
  ProgressBar.Position := AudioLevel;
  lblVU.Caption := IntToStr(AudioLevel)
end;

procedure TfrmContinuousDictation.SpSharedRecoContextFalseRecognition(
  ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  const Result: ISpeechRecoResult);
begin
  Log('OnFalseRecognition: %s, SAPI confidence: %s, engine confidence: %s',
    [Result.PhraseInfo.GetText(0, -1, True),
     Result.PhraseInfo.Rule.Confidence,
     Result.PhraseInfo.Rule.EngineConfidence])
end;

procedure TfrmContinuousDictation.SpSharedRecoContextHypothesis(
  ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  const Result: ISpeechRecoResult);
begin
  lstHypotheses.Items.Add(Result.PhraseInfo.GetText(0, -1, True));
  lstHypotheses.ItemIndex := lstHypotheses.Items.Count - 1
end;

procedure TfrmContinuousDictation.SpSharedRecoContextInterference(
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

procedure TfrmContinuousDictation.SpSharedRecoContextPhraseStart(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnPhraseStart');
  lstHypotheses.Items.Clear
end;

procedure TfrmContinuousDictation.SpSharedRecoContextRecognition(
  ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  RecognitionType: TOleEnum; const Result: ISpeechRecoResult);
begin
  memText.SelText := Result.PhraseInfo.GetText(0, -1, True) + #32
end;

procedure TfrmContinuousDictation.SpSharedRecoContextRecognitionForOtherContext(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnRecognitionForOtherContext')
end;

procedure TfrmContinuousDictation.SpSharedRecoContextRequestUI(
  ASender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  const UIType: WideString);
begin
  Log('OnRequestUI: %s', [UIType])
end;

procedure TfrmContinuousDictation.SpSharedRecoContextSoundStart(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnSoundStart')
end;

procedure TfrmContinuousDictation.SpSharedRecoContextSoundEnd(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnSoundEnd')
end;

procedure TfrmContinuousDictation.SpSharedRecoContextStartStream(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant);
begin
  Log('OnStartStream: stream %d', [StreamNumber])
end;

procedure TfrmContinuousDictation.SpSharedRecoContextEndStream(
  Sender: TObject; StreamNumber: Integer; StreamPosition: OleVariant;
  StreamReleased: WordBool);
begin
  Log('OnEndStream: stream %d', [StreamNumber])
end;

procedure TfrmContinuousDictation.btnEnginePropsClick(Sender: TObject);
begin
  InvokeUI(SPDUI_EngineProperties, 'Engine Properties')
end;

procedure TfrmContinuousDictation.btnUserSettingsClick(Sender: TObject);
begin
  InvokeUI(SPDUI_RecoProfileProperties, 'User Settings')
end;

procedure TfrmContinuousDictation.btnLexiconClick(Sender: TObject);
begin
  InvokeUI(SPDUI_AddRemoveWord, 'Add/Remove Word')
end;

procedure TfrmContinuousDictation.btnTrainGeneralClick(Sender: TObject);
begin
  InvokeUI(SPDUI_UserTraining, 'Speaker Training')
end;

procedure TfrmContinuousDictation.btnTrainMicClick(Sender: TObject);
begin
  InvokeUI(SPDUI_MicTraining, 'Microphone Setup')
end;

procedure TfrmContinuousDictation.btnAudioPropsClick(Sender: TObject);
begin
  InvokeUI(SPDUI_AudioProperties, 'Audio Properties')
end;

procedure TfrmContinuousDictation.btnAudioVolClick(Sender: TObject);
begin
  InvokeUI(SPDUI_AudioVolume, 'Audio Volume')
end;

procedure TfrmContinuousDictation.InvokeUI(const TypeOfUI, Caption: WideString);
var
  U: OleVariant;
begin
  U := Unassigned;
  if SpSharedRecoContext.Recognizer.IsUISupported(TypeOfUI, U) then
    SpSharedRecoContext.Recognizer.DisplayUI(Handle, Caption, TypeOfUI, U)
end;

end.
