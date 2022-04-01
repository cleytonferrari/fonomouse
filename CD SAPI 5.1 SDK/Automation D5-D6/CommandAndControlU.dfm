object frmCommandAndControl: TfrmCommandAndControl
  Left = 191
  Top = 105
  Width = 472
  Height = 417
  Caption = 'Command And Control Test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    464
    383)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 53
    Height = 13
    Caption = '&Engine log:'
    FocusControl = lstProgress
  end
  object Label1: TLabel
    Left = 136
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object lstProgress: TListBox
    Left = 8
    Top = 64
    Width = 446
    Height = 178
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 249
    Width = 446
    Height = 73
    Anchors = [akLeft, akRight, akBottom]
    Caption = ' VU Meter '
    TabOrder = 1
    DesignSize = (
      446
      73)
    object lblMinVU: TLabel
      Left = 16
      Top = 50
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblMaxVU: TLabel
      Left = 413
      Top = 50
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '100'
    end
    object lblVU: TLabel
      Left = 220
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
      Width = 414
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Min = 0
      Max = 100
      Smooth = True
      TabOrder = 0
    end
  end
  object btnEngineProps: TButton
    Left = 8
    Top = 329
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Engine Properties'
    TabOrder = 2
    OnClick = btnEnginePropsClick
  end
  object btnUserSettings: TButton
    Left = 126
    Top = 329
    Width = 89
    Height = 25
    Anchors = [akBottom]
    Caption = 'User Settings'
    TabOrder = 3
    OnClick = btnUserSettingsClick
  end
  object btnLexicon: TButton
    Left = 245
    Top = 329
    Width = 89
    Height = 25
    Anchors = [akBottom]
    Caption = 'Lexicon Dialog'
    TabOrder = 4
    OnClick = btnLexiconClick
  end
  object btnTrainGeneral: TButton
    Left = 364
    Top = 329
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Speaker Training'
    TabOrder = 5
    OnClick = btnTrainGeneralClick
  end
  object btnTrainMic: TButton
    Left = 8
    Top = 358
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Mic Wizard'
    TabOrder = 6
    OnClick = btnTrainMicClick
  end
  object btnAudioProps: TButton
    Left = 186
    Top = 358
    Width = 89
    Height = 25
    Anchors = [akBottom]
    Caption = 'Audio Properties'
    TabOrder = 7
    OnClick = btnAudioPropsClick
  end
  object btnAudioVol: TButton
    Left = 364
    Top = 358
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Audio Volume'
    TabOrder = 8
    OnClick = btnAudioVolClick
  end
  object SpSharedRecoContext: TSpSharedRecoContext
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnStartStream = SpSharedRecoContextStartStream
    OnEndStream = SpSharedRecoContextEndStream
    OnBookmark = SpSharedRecoContextBookmark
    OnSoundStart = SpSharedRecoContextSoundStart
    OnSoundEnd = SpSharedRecoContextSoundEnd
    OnPhraseStart = SpSharedRecoContextPhraseStart
    OnRecognition = SpSharedRecoContextRecognition
    OnHypothesis = SpSharedRecoContextHypothesis
    OnPropertyNumberChange = SpSharedRecoContextPropertyNumberChange
    OnPropertyStringChange = SpSharedRecoContextPropertyStringChange
    OnFalseRecognition = SpSharedRecoContextFalseRecognition
    OnInterference = SpSharedRecoContextInterference
    OnRequestUI = SpSharedRecoContextRequestUI
    OnRecognizerStateChange = SpSharedRecoContextRecognizerStateChange
    OnAdaptation = SpSharedRecoContextAdaptation
    OnRecognitionForOtherContext = SpSharedRecoContextRecognitionForOtherContext
    OnAudioLevel = SpSharedRecoContextAudioLevel
    OnEnginePrivate = SpSharedRecoContextEnginePrivate
    Left = 72
    Top = 96
  end
end
