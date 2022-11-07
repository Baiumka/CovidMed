inherited fmPationEdit: TfmPationEdit
  Left = 396
  Top = 169
  Width = 1138
  Height = 701
  Caption = #1050#1072#1088#1090#1082#1072' '#1087#1072#1094#1110#1108#1085#1090#1072
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel [0]
    Left = 704
    Top = 128
    Width = 18
    Height = 13
    Caption = #1042#1110#1082':'
  end
  object lblAge: TLabel [1]
    Left = 736
    Top = 128
    Width = 12
    Height = 13
    Caption = '00'
    Visible = False
  end
  object lbl7: TLabel [2]
    Left = 80
    Top = 32
    Width = 27
    Height = 13
    Caption = #1055'.'#1030'.'#1041'.'
  end
  object lbl8: TLabel [3]
    Left = 16
    Top = 120
    Width = 91
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
  end
  object lbl9: TLabel [4]
    Left = 64
    Top = 160
    Width = 45
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object lbl10: TLabel [5]
    Left = 456
    Top = 160
    Width = 85
    Height = 13
    Caption = #1045#1083#1077#1082#1090#1088#1086#1085#1072' '#1087#1086#1095#1090#1072
  end
  object lbl11: TLabel [6]
    Left = 8
    Top = 320
    Width = 100
    Height = 13
    Caption = #1052#1110#1089#1094#1077' '#1087#1088#1072#1094#1110', '#1087#1086#1089#1072#1076#1072
  end
  object lbl12: TLabel [7]
    Left = 120
    Top = 352
    Width = 297
    Height = 13
    AutoSize = False
    Caption = #1057#1091#1087#1091#1090#1085#1110' '#1079#1072#1093#1074#1086#1088#1102#1074#1072#1085#1085#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl13: TLabel [8]
    Left = 448
    Top = 352
    Width = 305
    Height = 13
    AutoSize = False
    Caption = #1060#1072#1082#1090#1086#1088#1080' '#1088#1080#1079#1080#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl14: TLabel [9]
    Left = 120
    Top = 472
    Width = 297
    Height = 13
    AutoSize = False
    Caption = #1040#1083#1077#1088#1075#1086#1083#1086#1075#1110#1095#1085#1080#1081' '#1072#1085#1072#1084#1085#1077#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl15: TLabel [10]
    Left = 448
    Top = 472
    Width = 265
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1053#1077#1087#1077#1088#1077#1085#1086#1089#1080#1084#1110#1089#1090#1100' '#1083#1110#1082#1072#1088#1089#1100#1082#1080#1093' '#1087#1088#1077#1087#1072#1088#1072#1090#1110#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl16: TLabel [11]
    Left = 776
    Top = 40
    Width = 173
    Height = 13
    Caption = #1055#1077#1088#1077#1083#1110#1082' '#1087#1086#1087#1077#1088#1077#1076#1085#1110#1111' '#1087#1088#1080#1081#1086#1084#1110#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlCommand: TPanel
    Width = 1122
    inherited sbtnRefresh: TSpeedButton
      Caption = #1054#1085#1086#1074#1080#1090#1080
    end
    inherited lblCalcDate: TLabel
      Left = 1008
    end
    inherited edtCalcDay: TDBDateTimeEditEh
      Left = 1023
      EditFormat = 'MM/YYYY'
    end
  end
  object edtFio: TDBEditEh [13]
    Left = 120
    Top = 32
    Width = 641
    Height = 21
    DataField = 'fio'
    DataSource = dsPation
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object btnSave: TBitBtn [14]
    Left = 120
    Top = 616
    Width = 641
    Height = 25
    Caption = #1047#1073#1077#1088#1077#1075#1090#1080
    TabOrder = 7
    Kind = bkOK
  end
  object edtBirthday: TDBDateTimeEditEh [15]
    Left = 120
    Top = 120
    Width = 553
    Height = 25
    DataField = 'birth_date'
    DataSource = dsPation
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
    OnChange = edtBirthdayChange
  end
  object grpSex: TGroupBox [16]
    Left = 120
    Top = 64
    Width = 641
    Height = 41
    Caption = #1057#1090#1072#1090#1100
    TabOrder = 2
    object rbMale: TRadioButton
      Left = 48
      Top = 16
      Width = 81
      Height = 17
      Caption = #1063#1086#1083#1086#1074#1110#1095#1072
      TabOrder = 0
    end
    object rbFemale: TRadioButton
      Left = 464
      Top = 16
      Width = 65
      Height = 17
      Caption = #1046#1110#1085#1086#1095#1072
      TabOrder = 1
    end
  end
  object edtPhone: TDBEditEh [17]
    Left = 120
    Top = 160
    Width = 305
    Height = 21
    DataField = 'phone'
    DataSource = dsPation
    EditButtons = <>
    TabOrder = 4
    Visible = True
  end
  object edtMail: TDBEditEh [18]
    Left = 552
    Top = 160
    Width = 209
    Height = 21
    DataField = 'mail'
    DataSource = dsPation
    EditButtons = <>
    TabOrder = 5
    Visible = True
  end
  object grpAdress: TGroupBox [19]
    Left = 120
    Top = 200
    Width = 641
    Height = 105
    Caption = #1052#1110#1089#1094#1077' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103' '#1087#1072#1094#1110#1077#1085#1090#1072
    TabOrder = 6
    object lbl2: TLabel
      Left = 8
      Top = 24
      Width = 43
      Height = 17
      Caption = #1054#1073#1083#1072#1089#1090#1100
    end
    object lbl3: TLabel
      Left = 231
      Top = 27
      Width = 28
      Height = 13
      Caption = #1052#1110#1089#1090#1086
    end
    object lbl4: TLabel
      Left = 424
      Top = 29
      Width = 36
      Height = 13
      Caption = #1042#1091#1083#1080#1094#1103
    end
    object lbl5: TLabel
      Left = 8
      Top = 64
      Width = 42
      Height = 13
      Caption = #1041#1091#1076#1080#1085#1086#1082
    end
    object lbl6: TLabel
      Left = 216
      Top = 64
      Width = 48
      Height = 13
      Caption = #1050#1074#1072#1088#1090#1080#1088#1072
    end
    object edtStreet: TDBEditEh
      Left = 464
      Top = 26
      Width = 121
      Height = 21
      DataField = 'street'
      DataSource = dsPation
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object edtCity: TDBEditEh
      Left = 269
      Top = 26
      Width = 121
      Height = 21
      DataField = 'city'
      DataSource = dsPation
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object edtHouse: TDBEditEh
      Left = 56
      Top = 60
      Width = 145
      Height = 21
      DataField = 'house'
      DataSource = dsPation
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object edtKv: TDBEditEh
      Left = 270
      Top = 60
      Width = 121
      Height = 21
      DataField = 'kv'
      DataSource = dsPation
      EditButtons = <>
      TabOrder = 3
      Visible = True
    end
    object cbOblast: TDBComboBoxEh
      Left = 57
      Top = 26
      Width = 145
      Height = 21
      DataField = 'id_oblast'
      DataSource = dsPation
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
  end
  object chkWork: TCheckBox [20]
    Left = 656
    Top = 320
    Width = 97
    Height = 17
    Caption = #1053#1045' '#1055#1088#1072#1094#1102#1101
    TabOrder = 8
  end
  object edtWork: TDBEditEh [21]
    Left = 120
    Top = 320
    Width = 521
    Height = 21
    DataField = 'work'
    DataSource = dsPation
    EditButtons = <>
    TabOrder = 9
    Visible = True
  end
  object dbgSick: TDBGridEh [22]
    Left = 119
    Top = 368
    Width = 308
    Height = 89
    DataSource = dsSick
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghDialogColumnEdit, dghNoColumnMove]
    ReadOnly = True
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'code'
        Footers = <>
        Title.Caption = #1052#1061#1058'-10'
        Title.TitleButton = True
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072' '#1079#1072#1093#1074#1086#1088#1102#1074#1072#1085#1085#1103
        Title.TitleButton = True
        Width = 210
      end>
  end
  object dbgRisk: TDBGridEh [23]
    Left = 448
    Top = 368
    Width = 313
    Height = 89
    DataSource = dsRisk
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghDialogColumnEdit, dghNoColumnMove]
    ReadOnly = True
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1060#1072#1082#1090#1086#1088' '#1088#1080#1079#1080#1082#1091
        Title.TitleButton = True
        Width = 270
      end>
  end
  object dbgAllergy: TDBGridEh [24]
    Left = 120
    Top = 488
    Width = 305
    Height = 120
    DataSource = dsAllergy
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghDialogColumnEdit, dghNoColumnMove]
    ReadOnly = True
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'code'
        Footers = <>
        Title.Caption = #1052#1054#1056#1030#1054#1053
        Title.TitleButton = True
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072
        Title.TitleButton = True
        Width = 210
      end>
  end
  object dbgTablets: TDBGridEh [25]
    Left = 448
    Top = 488
    Width = 313
    Height = 120
    DataSource = dsTablets
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghDialogColumnEdit, dghNoColumnMove]
    ReadOnly = True
    TabOrder = 13
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'code'
        Footers = <>
        Title.Caption = #1052#1054#1056#1030#1054#1053
        Title.TitleButton = True
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072
        Title.TitleButton = True
        Width = 220
      end>
  end
  object nvTablets: TDBNavigator [26]
    Left = 720
    Top = 464
    Width = 40
    Height = 25
    DataSource = dsTablets
    VisibleButtons = [nbInsert, nbDelete]
    TabOrder = 14
  end
  object nvSick: TDBNavigator [27]
    Left = 384
    Top = 344
    Width = 40
    Height = 25
    DataSource = dsSick
    VisibleButtons = [nbInsert, nbDelete]
    TabOrder = 15
  end
  object nvRisk: TDBNavigator [28]
    Left = 720
    Top = 344
    Width = 40
    Height = 25
    DataSource = dsRisk
    VisibleButtons = [nbInsert, nbDelete]
    TabOrder = 16
  end
  object nvAllergy: TDBNavigator [29]
    Left = 384
    Top = 464
    Width = 40
    Height = 25
    DataSource = dsAllergy
    VisibleButtons = [nbInsert, nbDelete]
    TabOrder = 17
  end
  object tvPriyom: TTreeView [30]
    Left = 776
    Top = 72
    Width = 329
    Height = 569
    Indent = 19
    TabOrder = 18
  end
  inherited alBase: TActionList
    Left = 528
    Top = 0
  end
  inherited ilBase: TImageList
    Left = 568
    Top = 0
  end
  object dsPation: TDataSource
    DataSet = zqrPation
    Left = 336
    Top = 72
  end
  object zqrPation: TZQuery
    Params = <>
    Left = 384
    Top = 72
  end
  object dsSick: TDataSource
    DataSet = zqrSick
    Left = 232
    Top = 400
  end
  object dsRisk: TDataSource
    DataSet = zqrRisk
    Left = 568
    Top = 408
  end
  object dsAllergy: TDataSource
    DataSet = zqrAllergy
    Left = 248
    Top = 544
  end
  object dsTablets: TDataSource
    DataSet = zqrTablets
    Left = 552
    Top = 544
  end
  object zqrSick: TZQuery
    Params = <>
    Left = 320
    Top = 400
  end
  object zqrRisk: TZQuery
    Params = <>
    Left = 640
    Top = 408
  end
  object zqrAllergy: TZQuery
    Params = <>
    Left = 320
    Top = 552
  end
  object zqrTablets: TZQuery
    Params = <>
    Left = 616
    Top = 544
  end
  object zqrHistory: TZQuery
    Params = <>
    Left = 848
    Top = 168
  end
  object dsHistory: TDataSource
    DataSet = zqrHistory
    Left = 912
    Top = 168
  end
end
