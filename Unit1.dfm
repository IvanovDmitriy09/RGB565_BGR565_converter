object Form1: TForm1
  Left = 942
  Top = 436
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'RGB565/BGR565 converter'
  ClientHeight = 365
  ClientWidth = 795
  Color = clGrayText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 472
    Top = 0
    Width = 321
    Height = 329
  end
  object Button1: TButton
    Left = 8
    Top = 336
    Width = 75
    Height = 25
    Caption = #1086#1090#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 473
    Height = 329
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Button2: TButton
    Left = 88
    Top = 336
    Width = 75
    Height = 25
    Caption = 'BGR565'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 168
    Top = 336
    Width = 75
    Height = 25
    Caption = 'RGB565'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 248
    Top = 336
    Width = 75
    Height = 25
    Caption = #1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 4
    OnClick = Button4Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'All (*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf)|*.jpg;*.jpeg;*.bmp;*.' +
      'ico;*.emf;*.wmf'
    Left = 16
    Top = 24
  end
  object XPManifest1: TXPManifest
    Left = 48
    Top = 24
  end
end
