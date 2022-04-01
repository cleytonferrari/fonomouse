object frmContinuousDictation: TfrmContinuousDictation
  Left = 192
  Top = 105
  Width = 443
  Height = 559
  Caption = 'Continuous Dictation Test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    435
    532)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 344
    Width = 60
    Height = 13
    Caption = '&Spoken text:'
    FocusControl = memText
  end
  object Label2: TLabel
    Left = 240
    Top = 344
    Width = 59
    Height = 13
    Caption = '&Hypotheses:'
    FocusControl = lstHypotheses
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 53
    Height = 13
    Caption = '&Engine log:'
    FocusControl = lstProgress
  end
  object lstProgress: TListBox
    Left = 8
    Top = 32
    Width = 417
    Height = 225
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 264
    Width = 417
    Height = 73
    Anchors = [akLeft, akTop, akRight]
    Caption = ' VU Meter '
    TabOrder = 1
    DesignSize = (
      417
      73)
    object lblMinVU: TLabel
      Left = 16
      Top = 50
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblMaxVU: TLabel
      Left = 384
      Top = 50
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '100'
    end
    object lblVU: TLabel
      Left = 206
      Top = 50
      Width = 6
      Height = 13
      Alignment = taCenter
      Anchors = [akTop]
      Caption = '0'
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 24
      Width = 385
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Smooth = True
      TabOrder = 0
    end
  end
  object memText: TMemo
    Left = 8
    Top = 360
    Width = 225
    Height = 100
    Anchors = [akLeft, akTop, akBottom]
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object lstHypotheses: TListBox
    Left = 240
    Top = 360
    Width = 184
    Height = 100
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
  object btnEngineProps: TButton
    Left = 8
    Top = 467
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Engine Properties'
    TabOrder = 4
    OnClick = btnEnginePropsClick
  end
  object btnUserSettings: TButton
    Left = 116
    Top = 467
    Width = 89
    Height = 25
    Anchors = [akBottom]
    Caption = 'User Settings'
    TabOrder = 5
    OnClick = btnUserSettingsClick
  end
  object btnLexicon: TButton
    Left = 228
    Top = 467
    Width = 89
    Height = 25
    Anchors = [akBottom]
    Caption = 'Lexicon Dialog'
    TabOrder = 6
    OnClick = btnLexiconClick
  end
  object btnTrainGeneral: TButton
    Left = 336
    Top = 467
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Speaker Training'
    TabOrder = 7
    OnClick = btnTrainGeneralClick
  end
  object btnTrainMic: TButton
    Left = 8
    Top = 499
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Mic Wizard'
    TabOrder = 8
    OnClick = btnTrainMicClick
  end
  object btnAudioProps: TButton
    Left = 172
    Top = 499
    Width = 89
    Height = 25
    Anchors = [akBottom]
    Caption = 'Audio Properties'
    TabOrder = 9
    OnClick = btnAudioPropsClick
  end
  object btnAudioVol: TButton
    Left = 336
    Top = 499
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Audio Volume'
    TabOrder = 10
    OnClick = btnAudioVolClick
  end
  object SpSharedRecoContext: TSpSharedRecoContext
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnStartStream = SpSharedRecoContextStartStream
    OnEndStream = SpSharedRecoContextEndStream
    OnSoundStart = SpSharedRecoContextSoundStart
    OnSoundEnd = SpSharedRecoContextSoundEnd
    OnPhraseStart = SpSharedRecoContextPhraseStart
    OnRecognition = SpSharedRecoContextRecognition
    OnHypothesis = SpSharedRecoContextHypothesis
    OnFalseRecognition = SpSharedRecoContextFalseRecognition
    OnInterference = SpSharedRecoContextInterference
    OnRequestUI = SpSharedRecoContextRequestUI
    OnRecognitionForOtherContext = SpSharedRecoContextRecognitionForOtherContext
    OnAudioLevel = SpSharedRecoContextAudioLevel
    Left = 72
    Top = 96
  end
end
