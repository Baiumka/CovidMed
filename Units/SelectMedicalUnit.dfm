inherited fmSelectMedical: TfmSelectMedical
  Left = 461
  Top = 342
  Caption = #1055#1077#1088#1077#1083#1110#1082' '#1084#1077#1076#1080#1095#1085#1080#1093' '#1079#1072#1089#1086#1073#1110#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCommand: TPanel
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
        FieldName = 'code'
        Footers = <>
        Title.Caption = #1052#1054#1056#1030#1054#1053
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072
        Title.TitleButton = True
        Width = 300
      end>
  end
  inherited nwTable: TDBNewNav
    Hints.Strings = ()
  end
end
