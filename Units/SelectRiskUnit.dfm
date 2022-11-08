inherited fmSelectRisk: TfmSelectRisk
  Left = 527
  Top = 394
  Caption = #1055#1077#1088#1077#1083#1110#1082' '#1092#1072#1082#1090#1086#1088#1110#1074' '#1088#1080#1079#1080#1082#1091
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCommand: TPanel
    inherited sbtnRefresh: TSpeedButton
      Caption = #1054#1085#1086#1074#1080#1090#1080
    end
    inherited edtCalcDay: TDBDateTimeEditEh
      EditFormat = 'MM/YYYY'
    end
  end
  inherited dbgTable: TDBGridEh
    Columns = <
      item
        EditButtons = <>
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1060#1072#1082#1090#1086#1088' '#1056#1080#1079#1080#1082#1091
        Title.TitleButton = True
        Width = 300
      end>
  end
  inherited nwTable: TDBNewNav
    Hints.Strings = ()
  end
  inherited btnOk: TBitBtn
    Caption = #1054#1073#1088#1072#1090#1080
  end
end
