object frmCommandAndControl: TfrmCommandAndControl
  Left = 191
  Top = 105
  Width = 452
  Height = 391
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
    444
    357)
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
  object lstProgress: TListBox
    Left = 8
    Top = 32
    Width = 426
    Height = 184
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 223
    Width = 426
    Height = 73
    Anchors = [akLeft, akRight, akBottom]
    Caption = ' VU Meter '
    TabOrder = 1
    DesignSize = (
      426
      73)
    object lblMinVU: TLabel
      Left = 16
      Top = 50
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblMaxVU: TLabel
      Left = 393
      Top = 50
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '100'
    end
    object lblVU: TLabel
      Left = 210
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
      Width = 394
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Smooth = True
      TabOrder = 0
    end
  end
  object btnEngineProps: TButton
    Left = 8
    Top = 303
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Engine Properties'
    TabOrder = 2
    OnClick = btnEnginePropsClick
  end
  object btnUserSettings: TButton
    Left = 119
    Top = 303
    Width = 89
    Height = 25
    Anchors = [akBottom]
    Caption = 'User Settings'
    TabOrder = 3
    OnClick = btnUserSettingsClick
  end
  object btnLexicon: TButton
    Left = 233
    Top = 303
    Width = 89
    Height = 25
    Anchors = [akBottom]
    Caption = 'Lexicon Dialog'
    TabOrder = 4
    OnClick = btnLexiconClick
  end
  object btnTrainGeneral: TButton
    Left = 344
    Top = 303
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Speaker Training'
    TabOrder = 5
    OnClick = btnTrainGeneralClick
  end
  object btnTrainMic: TButton
    Left = 8
    Top = 332
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Mic Wizard'
    TabOrder = 6
    OnClick = btnTrainMicClick
  end
  object btnAudioProps: TButton
    Left = 176
    Top = 332
    Width = 89
    Height = 25
    Anchors = [akBottom]
    Caption = 'Audio Properties'
    TabOrder = 7
    OnClick = btnAudioPropsClick
  end
  object btnAudioVol: TButton
    Left = 344
    Top = 332
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
