inherited fmSelectPation: TfmSelectPation
  Left = 593
  Top = 321
  Caption = #1042#1080#1073#1110#1088' '#1087#1072#1094#1110#1077#1085#1090#1072
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
        FieldName = 'fio'
        Footers = <>
        Title.Caption = #1055'.'#1030'.'#1041'.'
        Title.TitleButton = True
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'birth_date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
        Title.TitleButton = True
        Width = 100
      end>
  end
  inherited nwTable: TDBNewNav
    Hints.Strings = ()
  end
end
