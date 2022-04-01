object frmTextToSpeech: TfrmTextToSpeech
  Left = 192
  Top = 107
  Width = 367
  Height = 190
  Caption = 'Simple Text To Speech Test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 16
    Top = 8
    Width = 24
    Height = 13
    Caption = 'Te&xt:'
    FocusControl = memText
  end
  object memText: TMemo
    Left = 15
    Top = 24
    Width = 329
    Height = 91
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    Lines.Strings = (
      'A quick brown fox jumps over the lazy dog')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Button1: TButton
    Left = 143
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Speak'
    TabOrder = 1
    OnClick = Button1Click
  end
  object SpVoice1: TSpVoice
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 80
    Top = 56
  end
end
