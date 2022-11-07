inherited fmRisk: TfmRisk
  Left = 429
  Top = 394
  Caption = #1060#1072#1082#1090#1086#1088#1080' '#1088#1080#1079#1080#1082#1091
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
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072' '#1092#1072#1082#1090#1086#1088#1091' '#1088#1080#1079#1080#1082#1091
        Title.TitleButton = True
        Width = 300
      end>
  end
  inherited nwTable: TDBNewNav
    Left = 95
    Top = 4
    Hints.Strings = ()
  end
  inherited alBase: TActionList
    Left = 400
    Top = 0
  end
  inherited ilBase: TImageList
    Left = 432
    Top = 0
  end
  inherited zqrTable: TZQuery
    Left = 488
    Top = 0
  end
  inherited dsTable: TDataSource
    Left = 520
    Top = 0
  end
end
