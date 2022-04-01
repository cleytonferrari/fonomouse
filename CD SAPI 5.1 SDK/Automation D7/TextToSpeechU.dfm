object frmTextToSpeech: TfrmTextToSpeech
  Left = 187
  Top = 105
  Width = 778
  Height = 447
  Caption = 'Text To Speech Test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    770
    420)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = '&Progress'
    FocusControl = lstProgress
  end
  object Label2: TLabel
    Left = 260
    Top = 8
    Width = 77
    Height = 13
    Anchors = [akTop, akRight]
    Caption = '&Speech engines'
    FocusControl = cbVoices
  end
  object Label6: TLabel
    Left = 260
    Top = 224
    Width = 50
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'V&oice info:'
    FocusControl = lstEngineInfo
  end
  object Label7: TLabel
    Left = 516
    Top = 8
    Width = 24
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Te&xt:'
    FocusControl = reText
  end
  object Label8: TLabel
    Left = 517
    Top = 112
    Width = 111
    Height = 13
    Anchors = [akTop, akRight]
    Caption = '&TTS engine phonemes:'
    FocusControl = memEnginePhonemes
  end
  object lstProgress: TListBox
    Left = 8
    Top = 24
    Width = 243
    Height = 384
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
  end
  object cbVoices: TComboBox
    Left = 260
    Top = 24
    Width = 249
    Height = 21
    Style = csDropDownList
    Anchors = [akTop, akRight]
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnChange = cbVoicesChange
  end
  object lstEngineInfo: TListBox
    Left = 260
    Top = 240
    Width = 497
    Height = 89
    Anchors = [akTop, akRight]
    ItemHeight = 13
    TabOrder = 2
    TabWidth = 50
  end
  object gbAttrs: TGroupBox
    Left = 260
    Top = 88
    Width = 249
    Height = 129
    Anchors = [akTop, akRight]
    Caption = ' &Attributes '
    TabOrder = 3
    object Label4: TLabel
      Left = 16
      Top = 32
      Width = 26
      Height = 13
      Caption = 'R&ate:'
      FocusControl = tbRate
    end
    object Label5: TLabel
      Left = 16
      Top = 88
      Width = 38
      Height = 13
      Alignment = taCenter
      Caption = '&Volume:'
      FocusControl = tbVolume
    end
    object lblMinSpeed: TLabel
      Left = 65
      Top = 57
      Width = 15
      Height = 13
      Alignment = taCenter
      Caption = '-10'
    end
    object lblMaxSpeed: TLabel
      Left = 206
      Top = 56
      Width = 12
      Height = 13
      Alignment = taCenter
      Caption = '10'
    end
    object lblRate: TLabel
      Left = 216
      Top = 28
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblMinVolume: TLabel
      Left = 61
      Top = 109
      Width = 6
      Height = 13
      Alignment = taCenter
      Caption = '0'
    end
    object lblMaxVolume: TLabel
      Left = 201
      Top = 109
      Width = 18
      Height = 13
      Alignment = taCenter
      Caption = '100'
    end
    object lblVolume: TLabel
      Left = 216
      Top = 84
      Width = 6
      Height = 13
      Caption = '0'
    end
    object tbRate: TTrackBar
      Left = 56
      Top = 24
      Width = 161
      Height = 33
      Min = -10
      TabOrder = 0
      OnChange = tbRateChange
    end
    object tbVolume: TTrackBar
      Left = 56
      Top = 80
      Width = 161
      Height = 30
      Max = 100
      TabOrder = 1
      TickStyle = tsNone
      OnChange = tbVolumeChange
    end
  end
  object reText: TRichEdit
    Left = 516
    Top = 22
    Width = 241
    Height = 83
    Anchors = [akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    HideSelection = False
    Lines.Strings = (
      'A quick brown fox jumps over '
      'the lazy dog.'
      'What fun for the fox.'
      'What fun for the dog.')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object ToolBar1: TToolBar
    Left = 350
    Top = 53
    Width = 69
    Height = 24
    Align = alNone
    Anchors = [akTop, akRight]
    AutoSize = True
    Caption = 'ToolBar1'
    EdgeBorders = []
    Images = ImageList1
    TabOrder = 5
    object btnPlay: TToolButton
      Left = 0
      Top = 2
      ImageIndex = 0
      OnClick = btnPlayClick
    end
    object btnPause: TToolButton
      Left = 23
      Top = 2
      ImageIndex = 1
      OnClick = btnPauseClick
    end
    object btnStop: TToolButton
      Left = 46
      Top = 2
      ImageIndex = 2
      OnClick = btnStopClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 260
    Top = 335
    Width = 495
    Height = 73
    Anchors = [akRight, akBottom]
    Caption = ' VU Meter '
    TabOrder = 6
    DesignSize = (
      495
      73)
    object lblMinVU: TLabel
      Left = 16
      Top = 50
      Width = 6
      Height = 13
      Caption = '0'
    end
    object lblMaxVU: TLabel
      Left = 462
      Top = 50
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '100'
    end
    object lblVU: TLabel
      Left = 245
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
      Width = 463
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Smooth = True
      TabOrder = 0
    end
  end
  object memEnginePhonemes: TMemo
    Left = 517
    Top = 128
    Width = 239
    Height = 89
    Anchors = [akTop, akRight]
    ReadOnly = True
    TabOrder = 7
  end
  object ImageList1: TImageList
    Left = 168
    Top = 80
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF03FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF030000FF03FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF030000FF03FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF03000000000000000000000000
      0000000000000000000000000000FF030000FF03000000000000000000000000
      0000000000000000000000000000FF030000FF03000000000000000000000000
      0000000000000000000000000000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7FEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3D0000FF030000FF030000FF7FEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3D0000FF030000FF030000FF7FEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3D0000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF030000FF030000FF7F0000000000000000
      00000000000000000000EF3D0000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000FF030000FF030000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000FF030000FF030000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF03000000000000000000000000
      0000000000000000000000000000FF030000FF03000000000000000000000000
      0000000000000000000000000000FF030000FF03000000000000000000000000
      0000000000000000000000000000FF0300000000000000000000000000000000
      000000000000000000000000000000000000FF03FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF030000FF03FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF030000FF03FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF0300000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF00000001000100010000
      000100010001000000010001000100001FF11FF11FF100001DF11FF11FF10000
      1CF11931183100001C711931183100001C311931183100001C71193118310000
      1CF11931183100001DF11FF11FF100001FF11FF11FF100000001000100010000
      0001000100010000000100010001000000000000000000000000000000000000
      000000000000}
  end
  object SpVoice: TSpVoice
    AutoConnect = True
    ConnectKind = ckRunningOrNew
    OnStartStream = SpVoiceStartStream
    OnEndStream = SpVoiceEndStream
    OnVoiceChange = SpVoiceVoiceChange
    OnBookmark = SpVoiceBookmark
    OnWord = SpVoiceWord
    OnSentence = SpVoiceSentence
    OnPhoneme = SpVoicePhoneme
    OnViseme = SpVoiceViseme
    OnAudioLevel = SpVoiceAudioLevel
    OnEnginePrivate = SpVoiceEnginePrivate
    Left = 136
    Top = 168
  end
end
