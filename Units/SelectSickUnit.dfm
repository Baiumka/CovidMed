inherited fmSelectSick: TfmSelectSick
  Left = 610
  Top = 405
  Caption = #1055#1077#1088#1077#1083#1110#1082' '#1079#1072#1093#1074#1086#1088#1102#1074#1072#1085#1100
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
        Title.Caption = #1052#1061#1058'-10'
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
