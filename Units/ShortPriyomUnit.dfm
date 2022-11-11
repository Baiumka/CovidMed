inherited fmShortPriyom: TfmShortPriyom
  Left = 577
  Top = 353
  Caption = #1050#1088#1072#1090#1082#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1080#1081#1086#1084#1091
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel [0]
    Left = 16
    Top = 32
    Width = 42
    Height = 13
    Caption = #1055#1072#1094#1110#1077#1085#1090':'
  end
  object lbl2: TLabel [1]
    Left = 16
    Top = 64
    Width = 75
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1080#1081#1086#1084#1091':'
  end
  object lbl3: TLabel [2]
    Left = 464
    Top = 64
    Width = 155
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1110#1076#1090#1074#1077#1088#1076#1078#1077#1085#1085#1103' COVID-19'
  end
  object lbl4: TLabel [3]
    Left = 16
    Top = 96
    Width = 85
    Height = 13
    Caption = #1057#1082#1072#1088#1075#1080' '#1087#1072#1094#1110#1077#1085#1090#1072':'
  end
  object lbl5: TLabel [4]
    Left = 624
    Top = 32
    Width = 18
    Height = 13
    Caption = #1042#1110#1082':'
  end
  object lbl6: TLabel [5]
    Left = 16
    Top = 128
    Width = 115
    Height = 13
    Caption = #1057#1080#1084#1087#1090#1086#1084#1072#1090#1080#1095#1085#1110' '#1086#1079#1085#1072#1082#1080
  end
  object lbl7: TLabel [6]
    Left = 16
    Top = 192
    Width = 67
    Height = 13
    Caption = #1055#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103
  end
  object lbl8: TLabel [7]
    Left = 16
    Top = 320
    Width = 28
    Height = 13
    Caption = #1051#1110#1082#1072#1088
  end
  object lbl: TLabel [8]
    Left = 16
    Top = 160
    Width = 43
    Height = 13
    Caption = #1044#1110#1072#1075#1085#1086#1079':'
  end
  inherited pnlCommand: TPanel
    inherited sbtnRefresh: TSpeedButton
      Caption = #1054#1085#1086#1074#1080#1090#1080
    end
    inherited edtCalcDay: TDBDateTimeEditEh
      EditFormat = 'MM/YYYY'
    end
  end
  object edtPation: TDBEditEh [10]
    Left = 136
    Top = 32
    Width = 465
    Height = 21
    DataField = 'pation'
    DataSource = dsPriyom
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 1
    Visible = True
  end
  object edtDoc: TDBEditEh [11]
    Left = 136
    Top = 320
    Width = 625
    Height = 21
    DataField = 'doc'
    DataSource = dsPriyom
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 2
    Visible = True
  end
  object edtDate: TDBDateTimeEditEh [12]
    Left = 136
    Top = 64
    Width = 161
    Height = 21
    DataField = 'p_date'
    DataSource = dsPriyom
    Enabled = False
    EditButtons = <>
    Kind = dtkDateEh
    ReadOnly = True
    TabOrder = 3
    Visible = True
  end
  object edtAge: TDBNumberEditEh [13]
    Left = 664
    Top = 32
    Width = 97
    Height = 21
    DataField = 'age'
    DataSource = dsPriyom
    DecimalPlaces = 0
    Enabled = False
    EditButtons = <>
    ReadOnly = True
    TabOrder = 4
    Visible = True
  end
  object edtCovidDate: TDBDateTimeEditEh [14]
    Left = 632
    Top = 64
    Width = 129
    Height = 21
    DataField = 'covid_date'
    DataSource = dsPriyom
    Enabled = False
    EditButtons = <>
    Kind = dtkDateEh
    ReadOnly = True
    TabOrder = 5
    Visible = True
  end
  object edtTrouble: TDBEditEh [15]
    Left = 136
    Top = 96
    Width = 625
    Height = 21
    DataField = 'trouble'
    DataSource = dsPriyom
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 6
    Visible = True
  end
  object edtOznaki: TDBEditEh [16]
    Left = 136
    Top = 128
    Width = 625
    Height = 21
    DataField = 'oznaki'
    DataSource = dsPriyom
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 7
    Visible = True
  end
  object edtResult: TDBEditEh [17]
    Left = 136
    Top = 160
    Width = 625
    Height = 21
    DataField = 'result'
    DataSource = dsPriyom
    EditButtons = <>
    Enabled = False
    ReadOnly = True
    TabOrder = 8
    Visible = True
  end
  object dbgMedical: TDBGridEh [18]
    Left = 136
    Top = 192
    Width = 625
    Height = 120
    DataSource = dsMedical
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghDialogColumnEdit, dghNoColumnMove]
    ReadOnly = True
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgMedicalDrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072
        Title.TitleButton = True
        Width = 580
      end>
  end
  object btnClose: TBitBtn [19]
    Left = 16
    Top = 416
    Width = 745
    Height = 25
    Caption = #1047#1072#1095#1080#1085#1080#1090#1080
    TabOrder = 10
    Kind = bkCancel
  end
  inherited alBase: TActionList
    Images = nil
    Left = 544
    Top = 65528
  end
  inherited ilBase: TImageList
    Left = 600
    Top = 65528
  end
  object dsPriyom: TDataSource
    DataSet = zqrPriyom
    Left = 432
  end
  object zqrPriyom: TZQuery
    ReadOnly = True
    Params = <>
    Left = 352
    Top = 65528
  end
  object dsMedical: TDataSource
    DataSet = zqrMedical
    Left = 344
    Top = 360
  end
  object zqrMedical: TZQuery
    Params = <>
    Left = 416
    Top = 360
  end
end
