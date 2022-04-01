object Form1: TForm1
  Left = 747
  Top = 170
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Prototipo 01'
  ClientHeight = 530
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel4: TBevel
    Left = 8
    Top = 288
    Width = 249
    Height = 161
  end
  object Bevel3: TBevel
    Left = 8
    Top = 456
    Width = 249
    Height = 65
  end
  object Bevel1: TBevel
    Left = 8
    Top = 32
    Width = 249
    Height = 249
  end
  object Label1: TLabel
    Left = 56
    Top = 11
    Width = 131
    Height = 13
    Caption = 'LISTA DE COMANDOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 60
    Height = 13
    Caption = '1 - Esquerda'
  end
  object Label3: TLabel
    Left = 16
    Top = 56
    Width = 45
    Height = 13
    Caption = '2 - Direita'
  end
  object Label4: TLabel
    Left = 16
    Top = 72
    Width = 41
    Height = 13
    Caption = '3 - Baixo'
  end
  object Label5: TLabel
    Left = 16
    Top = 88
    Width = 38
    Height = 13
    Caption = '4 - Cima'
  end
  object Label6: TLabel
    Left = 16
    Top = 104
    Width = 108
    Height = 13
    Caption = '5 - Clique Bot'#227'o Direito'
  end
  object Label7: TLabel
    Left = 16
    Top = 120
    Width = 123
    Height = 13
    Caption = '6 - Clique Bot'#227'o Esquerdo'
  end
  object Label8: TLabel
    Left = 16
    Top = 136
    Width = 128
    Height = 13
    Caption = '7 - Pressionar Bot'#227'o Direito'
  end
  object Label9: TLabel
    Left = 16
    Top = 152
    Width = 143
    Height = 13
    Caption = '8 - Pressionar Bot'#227'o Esquerdo'
  end
  object Label10: TLabel
    Left = 16
    Top = 168
    Width = 111
    Height = 13
    Caption = '9 - Liberar Bot'#227'o Direito'
  end
  object Label11: TLabel
    Left = 10
    Top = 184
    Width = 132
    Height = 13
    Caption = '10 - Liberar Bot'#227'o Esquerdo'
  end
  object Label12: TLabel
    Left = 10
    Top = 200
    Width = 145
    Height = 13
    Caption = '11 - Duplo Clique Bot'#227'o Direito'
  end
  object Label13: TLabel
    Left = 10
    Top = 216
    Width = 160
    Height = 13
    Caption = '12 - Duplo Clique Bot'#227'o Esquerdo'
  end
  object Label14: TLabel
    Left = 11
    Top = 232
    Width = 35
    Height = 13
    Caption = '13 - Ok'
  end
  object Label15: TLabel
    Left = 16
    Top = 336
    Width = 123
    Height = 13
    Caption = 'Velocidade do Mouse'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 40
    Top = 296
    Width = 174
    Height = 13
    Caption = 'Estilo do Movimento do Mouse'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label17: TLabel
    Left = 16
    Top = 352
    Width = 150
    Height = 13
    Caption = 'Modo Deslizando Milessegundo'
  end
  object Label18: TLabel
    Left = 16
    Top = 400
    Width = 82
    Height = 13
    Caption = 'Modo Saldo Pixel'
  end
  object Label19: TLabel
    Left = 12
    Top = 248
    Width = 163
    Height = 13
    Caption = '14 - Modo R'#225'pido   [Configura'#231#227'o]'
  end
  object Label20: TLabel
    Left = 12
    Top = 264
    Width = 162
    Height = 13
    Caption = '15 - Modo Salto      [Configura'#231#227'o]'
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 496
    Width = 233
    Height = 20
    Smooth = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 464
    Width = 233
    Height = 25
    Caption = 'ADD Palavra'
    TabOrder = 1
    OnClick = Button1Click
  end
  object EditMs: TEdit
    Left = 16
    Top = 368
    Width = 65
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = '30'
  end
  object btnMenosMS: TButton
    Left = 96
    Top = 368
    Width = 75
    Height = 25
    Caption = '<<<<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnMenosMSClick
  end
  object btnMaisMS: TButton
    Left = 176
    Top = 368
    Width = 75
    Height = 25
    Caption = '>>>>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnMaisMSClick
  end
  object RBrapido: TRadioButton
    Left = 24
    Top = 312
    Width = 105
    Height = 17
    Caption = 'Modo R'#225'pido'
    Checked = True
    TabOrder = 5
    TabStop = True
    OnClick = RBrapidoClick
  end
  object RBSalto: TRadioButton
    Left = 160
    Top = 312
    Width = 81
    Height = 17
    Caption = 'Modo Salto'
    TabOrder = 6
    OnClick = RBSaltoClick
  end
  object btnMenosPixel: TButton
    Left = 96
    Top = 416
    Width = 75
    Height = 25
    Caption = '<<<<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnMenosPixelClick
  end
  object btnMaisPixel: TButton
    Left = 176
    Top = 416
    Width = 75
    Height = 25
    Caption = '>>>>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnMaisPixelClick
  end
  object EditPixel: TEdit
    Left = 16
    Top = 416
    Width = 65
    Height = 21
    ReadOnly = True
    TabOrder = 9
    Text = '10'
  end
  object SpSharedRecoContext2: TSpSharedRecoContext
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnRecognition = SpSharedRecoContext2Recognition
    OnAudioLevel = SpSharedRecoContext2AudioLevel
    Left = 8
    Top = 464
  end
  object TMovimentos: TTimer
    Interval = 0
    OnTimer = TMovimentosTimer
    Left = 208
    Top = 8
  end
end
