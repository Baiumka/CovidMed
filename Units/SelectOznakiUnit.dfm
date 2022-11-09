inherited fmSelectOznaki: TfmSelectOznaki
  Left = 584
  Top = 379
  Caption = #1054#1079#1085#1072#1082#1080' '#1079#1072#1093#1074#1086#1088#1102#1074#1072#1085#1085#1103
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
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1054#1079#1085#1072#1082#1080' '#1079#1072#1093#1074#1086#1088#1102#1074#1072#1085#1085#1103
        Title.TitleButton = True
        Width = 300
      end>
  end
  inherited nwTable: TDBNewNav
    Hints.Strings = ()
  end
end
