inherited fmAdmin: TfmAdmin
  Left = 301
  Top = 240
  Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1085#1103' '#1079#1072#1082#1083#1072#1076#1086#1084
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel [0]
    Left = 8
    Top = 46
    Width = 79
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1079#1072#1082#1083#1072#1076#1091':'
  end
  inherited pnlCommand: TPanel
    Width = 785
    inherited lblCalcDate: TLabel
      Left = 671
    end
    inherited edtCalcDay: TDBDateTimeEditEh
      Left = 686
      EditFormat = 'MM/YYYY'
    end
  end
  object edtZaklad: TDBEditEh [2]
    Left = 96
    Top = 40
    Width = 665
    Height = 21
    DataField = 'name'
    DataSource = dsAdmin
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object btnSave: TButton [3]
    Left = 0
    Top = 80
    Width = 785
    Height = 25
    Anchors = [akLeft, akRight]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnSaveClick
  end
  inherited alBase: TActionList
    Left = 536
    Top = 0
  end
  inherited ilBase: TImageList
    Left = 568
    Top = 0
  end
  object zqrAdmin: TZQuery
    Params = <>
    Left = 440
    Top = 344
  end
  object dsAdmin: TDataSource
    DataSet = zqrAdmin
    Left = 512
    Top = 344
  end
end
