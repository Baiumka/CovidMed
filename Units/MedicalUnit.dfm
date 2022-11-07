inherited fmMedical: TfmMedical
  Left = 985
  Top = 349
  Caption = #1057#1087#1080#1089#1086#1082' '#1083#1110#1082#1072#1088#1089#1082#1110#1093' '#1079#1072#1089#1086#1073#1110#1074
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
        Title.Caption = #1053#1072#1079#1074#1072
        Title.TitleButton = True
        Width = 300
      end
      item
        EditButtons = <>
        FieldName = 'code'
        Footers = <>
        Title.Caption = #1050#1086#1076' '#1084#1086#1088#1080#1086#1085#1072
        Title.TitleButton = True
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'farm_group'
        Footers = <>
        Title.Caption = #1060#1072#1088#1084' '#1075#1088#1091#1087#1072
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'act_mat'
        Footers = <>
        Title.Caption = #1044#1110#1102#1095#1072' '#1056#1077#1095#1086#1074#1080#1085#1072
        Title.TitleButton = True
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'mtype'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'end_date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1079#1072#1074#1077#1088#1096#1077#1085#1085#1103' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111
        Title.TitleButton = True
        Width = 100
      end>
  end
  inherited nwTable: TDBNewNav
    Left = 95
    Top = 4
    Hints.Strings = ()
    BeforeAction = nwTableBeforeAction
  end
  inherited alBase: TActionList
    Left = 568
    Top = 65528
  end
  inherited ilBase: TImageList
    Left = 608
    Top = 65528
  end
  inherited zqrTable: TZQuery
    Left = 656
    Top = 144
  end
  inherited dsTable: TDataSource
    Left = 704
    Top = 144
  end
end
