object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Calcolo - Quantili'
  ClientHeight = 237
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelTipoCalcolo: TLabel
    Left = 18
    Top = 13
    Width = 57
    Height = 13
    Caption = 'Tipo Calcolo'
  end
  object Label1: TLabel
    Left = 18
    Top = 89
    Width = 24
    Height = 13
    Caption = 'Serie'
  end
  object LabelValoreQ: TLabel
    Left = 198
    Top = 13
    Width = 41
    Height = 13
    Caption = 'Valore Q'
  end
  object LabelRisultato: TLabel
    Left = 291
    Top = 13
    Width = 42
    Height = 13
    Caption = 'Risultato'
  end
  object Labelconteggio: TLabel
    Left = 291
    Top = 58
    Width = 49
    Height = 13
    Caption = 'Conteggio'
  end
  object ButtonExit: TButton
    Left = 473
    Top = 8
    Width = 75
    Height = 25
    Action = ActionExit
    TabOrder = 0
  end
  object ButtonCalculate: TButton
    Left = 473
    Top = 39
    Width = 75
    Height = 25
    Action = ActionCalculate
    TabOrder = 1
  end
  object ComboBoxTipoCalcolo: TComboBox
    Left = 18
    Top = 32
    Width = 145
    Height = 21
    TabOrder = 2
    Items.Strings = (
      'Quartile'
      'Percentile')
  end
  object Memo: TMemo
    Left = 18
    Top = 108
    Width = 448
    Height = 106
    Lines.Strings = (
      
        '1, 3, 5, 6, 9, 11, 12, 13, 19, 21, 22, 32, 35, 36, 45, 44, 55, 6' +
        '8, 79, 80, 81, 88, 90, 91, '
      
        '92, 100, 112, 113, 114, 120, 121, 132, 145, 146, 149, 150, 155, ' +
        '180, 189, 190')
    TabOrder = 3
  end
  object NumberBoxValoreQ: TNumberBox
    Left = 198
    Top = 32
    Width = 64
    Height = 21
    Alignment = taRightJustify
    Decimal = 4
    Mode = nbmFloat
    TabOrder = 4
  end
  object NumberBoxRisultato: TNumberBox
    Left = 291
    Top = 32
    Width = 121
    Height = 21
    Alignment = taRightJustify
    Decimal = 4
    Mode = nbmFloat
    TabOrder = 5
  end
  object NumberBoxConteggio: TNumberBox
    Left = 291
    Top = 77
    Width = 121
    Height = 21
    Alignment = taRightJustify
    Decimal = 4
    TabOrder = 6
  end
  object ActionList1: TActionList
    Left = 357
    Top = 15
    object ActionExit: TAction
      Caption = 'Exit'
      OnExecute = ActionExitExecute
    end
    object ActionCalculate: TAction
      Caption = 'Calculate'
      OnExecute = ActionCalculateExecute
    end
  end
end
