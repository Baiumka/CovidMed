inherited fmPriyom: TfmPriyom
  Left = 721
  Top = 352
  Caption = #1055#1088#1080#1081#1086#1084
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
  object edtFio: TDBEditEh [1]
    Left = 8
    Top = 40
    Width = 609
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    DataField = 'fio'
    DataSource = dsPation
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edtFioEditButtons0Click
      end>
    ReadOnly = True
    TabOrder = 1
    Visible = True
  end
  object grpPationInfo: TGroupBox [2]
    Left = 472
    Top = 72
    Width = 297
    Height = 353
    Anchors = [akLeft, akTop, akRight]
    Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1087#1072#1094#1110#1077#1085#1090#1072
    Enabled = False
    TabOrder = 2
    Visible = False
    DesignSize = (
      297
      353)
    object tvPriyom: TTreeView
      Left = 144
      Top = 16
      Width = 145
      Height = 329
      Anchors = [akLeft, akTop, akRight]
      Indent = 19
      TabOrder = 0
    end
  end
  object btnSave: TBitBtn [3]
    Left = 8
    Top = 432
    Width = 761
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1080' '#1087#1088#1080#1081#1086#1084
    Enabled = False
    TabOrder = 3
    Visible = False
    OnClick = btnSaveClick
    Kind = bkOK
  end
  object pgcPriyom: TPageControl [4]
    Left = 8
    Top = 72
    Width = 457
    Height = 353
    ActivePage = tsMain
    Enabled = False
    TabOrder = 4
    Visible = False
    object tsMain: TTabSheet
      Caption = #1055#1088#1080#1081#1086#1084
      object lbl1: TLabel
        Left = 0
        Top = 7
        Width = 39
        Height = 13
        Caption = #1057#1082#1072#1088#1075#1080':'
      end
      object lbl3: TLabel
        Left = 0
        Top = 38
        Width = 54
        Height = 13
        Caption = #1051#1110#1082#1091#1074#1072#1085#1085#1103':'
      end
      object lbl2: TLabel
        Left = 0
        Top = 247
        Width = 55
        Height = 13
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090':'
      end
      object edtTrouble: TDBEditEh
        Left = 64
        Top = 8
        Width = 377
        Height = 21
        DataField = 'trouble'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object edtResult: TDBEditEh
        Left = 64
        Top = 248
        Width = 377
        Height = 21
        DataField = 'result'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object chkHealth: TCheckBox
        Left = 8
        Top = 304
        Width = 185
        Height = 17
        Caption = #1055#1072#1094#1110#1077#1085#1090' '#1074#1080#1083#1110#1082#1091#1074#1072#1085#1080#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object edtHeal: TDBEditEh
        Left = 64
        Top = 38
        Width = 377
        Height = 91
        AutoSize = False
        DataField = 'heal'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
    end
  end
  object btnStart: TButton [5]
    Left = 632
    Top = 40
    Width = 137
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1095#1072#1090#1080' '#1087#1088#1080#1081#1086#1084
    Enabled = False
    TabOrder = 5
    OnClick = btnStartClick
  end
  inherited alBase: TActionList
    Left = 568
    Top = 0
  end
  inherited ilBase: TImageList
    Left = 608
    Top = 0
  end
  object zqrPation: TZQuery
    Params = <>
    Left = 488
    Top = 32
  end
  object dsPation: TDataSource
    DataSet = zqrPation
    Left = 520
    Top = 32
  end
  object zqrPriyom: TZQuery
    Params = <>
    Left = 312
    Top = 64
  end
  object dsPriyom: TDataSource
    DataSet = zqrPriyom
    Left = 368
    Top = 64
  end
  object zqrHistory: TZQuery
    Params = <>
    Left = 656
    Top = 216
  end
  object dsHistory: TDataSource
    DataSet = zqrHistory
    Left = 712
    Top = 216
  end
end
