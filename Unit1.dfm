object Form1: TForm1
  Left = 304
  Top = 323
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'RGB565/BGR565 converter'
  ClientHeight = 351
  ClientWidth = 561
  Color = clGrayText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 560
    Top = 0
    Width = 321
    Height = 321
    Proportional = True
  end
  object Label1: TLabel
    Left = 0
    Top = 328
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 561
    Height = 321
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1058#1077#1082#1089#1090
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 553
        Height = 293
        Align = alClient
        Color = 16776176
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'HEX'
      ImageIndex = 1
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 553
        Height = 293
        Align = alClient
        Color = 16776176
        ColCount = 17
        FixedColor = clMoneyGreen
        RowCount = 2
        ScrollBars = ssVertical
        TabOrder = 0
        ColWidths = (
          64
          34
          31
          30
          29
          26
          27
          26
          27
          26
          27
          27
          30
          26
          26
          26
          26)
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 48
    Top = 24
  end
  object ColorDialog1: TColorDialog
    Left = 80
    Top = 24
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 16
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 112
    Top = 24
  end
  object MainMenu1: TMainMenu
    Left = 144
    Top = 24
    object Afqk1: TMenuItem
      Caption = #1060#1072#1081#1083
      OnClick = Afqk1Click
      object N1: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        ShortCut = 16463
        OnClick = N1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N3: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        Enabled = False
        ShortCut = 16467
        object bin1: TMenuItem
          Caption = '.bin'
          OnClick = bin1Click
        end
        object txt1: TMenuItem
          Caption = '-'
        end
        object txt2: TMenuItem
          Caption = '.txt'
          OnClick = txt2Click
        end
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object N10: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N10Click
      end
    end
    object N4: TMenuItem
      Caption = #1055#1088#1072#1074#1082#1072
      object N6: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
        ShortCut = 16451
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        ShortCut = 16430
        OnClick = N7Click
      end
    end
    object N5: TMenuItem
      Caption = #1050#1086#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = N5Click
      object BGR5651: TMenuItem
        Caption = 'BGR565'
        Enabled = False
        ShortCut = 16450
        OnClick = BGR5651Click
      end
      object RGB5651: TMenuItem
        Caption = '-'
      end
      object RGB5652: TMenuItem
        Caption = 'RGB565'
        Enabled = False
        ShortCut = 16466
        OnClick = RGB5652Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Caption = #1062#1074#1077#1090
        OnClick = N12Click
      end
    end
    object N8: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      ShortCut = 112
      OnClick = N8Click
    end
  end
end
