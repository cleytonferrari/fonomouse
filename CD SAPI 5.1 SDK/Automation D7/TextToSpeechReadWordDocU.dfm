object frmTextToSpeechReadWordDoc: TfrmTextToSpeechReadWordDoc
  Left = 192
  Top = 107
  Width = 347
  Height = 84
  Caption = 'Text To Speech Reading A Word Document'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnReadDoc: TButton
    Left = 48
    Top = 16
    Width = 89
    Height = 25
    Caption = 'Read Word Doc'
    TabOrder = 0
    OnClick = btnReadDocClick
  end
  object btnStop: TButton
    Left = 200
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = btnStopClick
  end
  object dlgOpenDoc: TOpenDialog
    Filter = 'Word Documents (*.doc)|*.doc'
    Title = 'Select Word document to be read'
    Left = 192
    Top = 8
  end
  object SpVoice: TSpVoice
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 120
    Top = 8
  end
end
