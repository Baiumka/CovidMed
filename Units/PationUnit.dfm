inherited fmPationUnit: TfmPationUnit
  Left = 531
  Top = 457
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1072#1094#1110#1077#1085#1090#1110#1074
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
    ReadOnly = True
    OnDblClick = dbgTableDblClick
    Columns = <
      item
        Color = clInfoBk
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
        Title.Caption = #8470
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'fio'
        Footers = <>
        Title.Caption = #1055'. '#1030'. '#1041'.'
        Title.TitleButton = True
        Width = 300
      end
      item
        EditButtons = <>
        FieldName = 'birth_date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'phone'
        Footers = <>
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Title.TitleButton = True
        Width = 100
      end>
  end
  inherited nwTable: TDBNewNav
    Left = 103
    Top = 4
    Hints.Strings = ()
    BeforeAction = nwTableBeforeAction
  end
  inherited alBase: TActionList
    Left = 448
    Top = 0
  end
  inherited ilBase: TImageList
    Left = 488
    Top = 0
  end
  inherited zqrTable: TZQuery
    Left = 648
    Top = 392
  end
  inherited dsTable: TDataSource
    Left = 592
    Top = 392
  end
end
