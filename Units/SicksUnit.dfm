inherited fmSicks: TfmSicks
  Left = 578
  Top = 423
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1093#1074#1086#1088#1102#1074#1072#1085#1100
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblTableTitle: TLabel
    Visible = False
  end
  inherited pnlCommand: TPanel
    inherited sbtnRefresh: TSpeedButton
      Caption = #1054#1085#1086#1074#1080#1090#1080
    end
    inherited edtCalcDay: TDBDateTimeEditEh
      EditFormat = 'MM/YYYY'
    end
  end
  inherited dbgTable: TDBGridEh
    Left = 0
    Top = 32
    Width = 784
    Height = 429
    Align = alClient
    Columns = <
      item
        Color = clInfoBk
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
        ReadOnly = True
        Title.Caption = #8470
        Title.TitleButton = True
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'code'
        Footers = <>
        Title.Caption = #1050#1086#1076' '#1052#1050#1061'-10 '
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072' '#1079#1072#1093#1074#1086#1088#1102#1074#1072#1085#1085#1103
        Title.TitleButton = True
        Width = 400
      end>
  end
  inherited nwTable: TDBNewNav
    Left = 95
    Top = 4
    Hints.Strings = ()
  end
  inherited alBase: TActionList
    Left = 552
    Top = 0
  end
  inherited ilBase: TImageList
    Left = 584
    Top = 0
  end
  inherited zqrTable: TZQuery
    Left = 416
    Top = 0
  end
  inherited dsTable: TDataSource
    Left = 456
    Top = 0
  end
end
