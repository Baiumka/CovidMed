inherited fmArchive: TfmArchive
  Left = 342
  Top = 423
  Caption = #1040#1088#1093#1110#1074' '#1055#1088#1080#1081#1086#1084#1110#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblTableTitle: TLabel
    Visible = False
  end
  inherited pnlCommand: TPanel
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
    ReadOnly = True
    OnDblClick = dbgTableDblClick
    OnDrawColumnCell = dbgTableDrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
        Title.Caption = #8470
        Title.TitleButton = True
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'pation'
        Footers = <>
        Title.Caption = #1055#1072#1094#1110#1077#1085#1090
        Title.TitleButton = True
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'trouble'
        Footers = <>
        Title.Caption = #1057#1082#1072#1088#1075#1080
        Title.TitleButton = True
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'result'
        Footers = <>
        Title.Caption = #1044#1110#1072#1075#1085#1086#1079
        Title.TitleButton = True
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'reg_date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1080#1081#1086#1084#1091
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'doctor'
        Footers = <>
        Title.Caption = #1051#1110#1082#1072#1088
        Title.TitleButton = True
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'status'
        Footers = <>
        Title.Caption = #1057#1090#1072#1090#1091#1089' '#1087#1088#1080#1081#1086#1084#1091
        Width = 100
      end>
  end
  inherited nwTable: TDBNewNav
    Left = 103
    Top = 4
    Hints.Strings = ()
  end
  inherited alBase: TActionList
    Left = 456
    Top = 0
  end
  inherited ilBase: TImageList
    Left = 496
    Top = 0
  end
  inherited zqrTable: TZQuery
    Left = 712
    Top = 168
  end
  inherited dsTable: TDataSource
    Left = 712
    Top = 224
  end
end
