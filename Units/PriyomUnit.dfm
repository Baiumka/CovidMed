inherited fmPriyom: TfmPriyom
  Left = 274
  Top = 220
  Caption = #1055#1088#1080#1081#1086#1084
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCommand: TPanel
    inherited sbtnRefresh: TSpeedButton
      Caption = #1054#1085#1086#1074#1080#1090#1080
    end
    inherited edtCalcDay: TDBDateTimeEditEh
      Left = 693
      Top = 5
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
    Left = 680
    Top = 72
    Width = 89
    Height = 353
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1055#1086#1087#1077#1088#1077#1076#1085#1110' '#1087#1088#1080#1081#1086#1084#1080
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    DesignSize = (
      89
      353)
    object tvPriyom: TTreeView
      Left = 8
      Top = 16
      Width = 73
      Height = 305
      Anchors = [akLeft, akTop, akRight, akBottom]
      Indent = 19
      TabOrder = 0
      OnDblClick = tvPriyomDblClick
    end
    object btnPrintHistory: TButton
      Left = 10
      Top = 324
      Width = 71
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1044#1088#1091#1082
      TabOrder = 1
      OnClick = btnPrintHistoryClick
    end
  end
  object btnSave: TBitBtn [3]
    Left = 8
    Top = 432
    Width = 761
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
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
    Width = 665
    Height = 353
    ActivePage = tsResult
    Anchors = [akLeft, akTop, akBottom]
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnChange = pgcPriyomChange
    object tsPation: TTabSheet
      Caption = #1044#1072#1085#1110' '#1093#1074#1086#1088#1086#1075#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object lbl1: TLabel
        Left = 0
        Top = 16
        Width = 107
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 208
        Top = 40
        Width = 23
        Height = 13
        Caption = #1042#1110#1082':'
      end
      object lblAge: TLabel
        Left = 240
        Top = 40
        Width = 15
        Height = 13
        Caption = '00'
        Visible = False
      end
      object lbl3: TLabel
        Left = 0
        Top = 64
        Width = 183
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1110#1076#1090#1074#1077#1088#1076#1078#1077#1085#1085#1103' COVID-19'
      end
      object lbl4: TLabel
        Left = 3
        Top = 114
        Width = 98
        Height = 13
        Caption = #1042#1080#1076' '#1076#1110#1072#1075#1085#1086#1089#1090#1080#1082#1080
      end
      object lbl5: TLabel
        Left = 1
        Top = 166
        Width = 98
        Height = 13
        Caption = #1057#1082#1072#1088#1075#1080' '#1087#1072#1094#1110#1077#1085#1090#1072
      end
      object edtBirthDate: TDBDateTimeEditEh
        Left = 0
        Top = 32
        Width = 193
        Height = 21
        DataField = 'birth_date'
        DataSource = dsPation
        Enabled = False
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 0
        Visible = True
        OnChange = edtBirthDateChange
      end
      object edtCovidDate: TDBDateTimeEditEh
        Left = 0
        Top = 80
        Width = 193
        Height = 21
        DataField = 'covid_date'
        DataSource = dsPriyom
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 1
        Visible = True
      end
      object edtDiagnostic: TDBEditEh
        Left = 0
        Top = 128
        Width = 649
        Height = 21
        DataField = 'diagnostic'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object edtTrouble: TDBEditEh
        Left = 0
        Top = 184
        Width = 649
        Height = 21
        DataField = 'trouble'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object grpRepeat: TGroupBox
        Left = 0
        Top = 216
        Width = 337
        Height = 57
        Caption = #1055#1086#1074#1090#1086#1088#1085#1080#1081' '#1087#1088#1080#1081#1086#1084'?'
        TabOrder = 4
        object rbRepeatYes: TRadioButton
          Left = 16
          Top = 24
          Width = 49
          Height = 17
          Caption = #1058#1072#1082
          TabOrder = 0
          OnClick = rbRepeatYesClick
        end
        object rbRepeatNo: TRadioButton
          Left = 80
          Top = 24
          Width = 41
          Height = 17
          Caption = #1053#1110
          TabOrder = 1
          OnClick = rbRepeatNoClick
        end
      end
      object grpBad: TGroupBox
        Left = 344
        Top = 217
        Width = 305
        Height = 56
        Caption = #1042#1110#1076#1073#1091#1083#1086#1089#1100' '#1087#1086#1075#1110#1088#1096#1077#1085#1085#1103'?'
        TabOrder = 5
        Visible = False
        object rbBadYes: TRadioButton
          Left = 8
          Top = 24
          Width = 57
          Height = 17
          Caption = #1058#1072#1082
          TabOrder = 0
        end
        object rbBadNo: TRadioButton
          Left = 72
          Top = 24
          Width = 57
          Height = 17
          Caption = #1053#1110
          TabOrder = 1
        end
      end
    end
    object tsAnames: TTabSheet
      Caption = #1040#1085#1072#1084#1079#1077#1079' '#1087#1072#1094#1110#1108#1085#1090#1072
      ImageIndex = 1
      DesignSize = (
        657
        325)
      object lbl6: TLabel
        Left = 16
        Top = 16
        Width = 26
        Height = 13
        Caption = #1063#1057#1057
      end
      object lbl7: TLabel
        Left = 148
        Top = 15
        Width = 32
        Height = 13
        Caption = 'SpO2'
      end
      object lbl8: TLabel
        Left = 339
        Top = 14
        Width = 79
        Height = 13
        Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
      end
      object lbl9: TLabel
        Left = 480
        Top = 14
        Width = 102
        Height = 13
        Caption = #1063#1072#1089#1090#1086#1090#1072' '#1076#1080#1093#1072#1085#1085#1103
      end
      object lbl10: TLabel
        Left = 8
        Top = 93
        Width = 107
        Height = 13
        Caption = #1054#1079#1085#1072#1082#1080' '#1087#1085#1077#1074#1084#1086#1085#1110#1111
      end
      object edtCSS: TDBEditEh
        Left = 48
        Top = 8
        Width = 89
        Height = 21
        DataField = 'css'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object edtSpO: TDBEditEh
        Left = 192
        Top = 8
        Width = 137
        Height = 21
        DataField = 'spo2'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object edtBreath: TDBEditEh
        Left = 586
        Top = 8
        Width = 65
        Height = 21
        DataField = 'breath'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object edtTemp: TDBEditEh
        Left = 423
        Top = 8
        Width = 53
        Height = 21
        DataField = 'temperature'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object grpArtTisk: TGroupBox
        Left = 8
        Top = 40
        Width = 641
        Height = 41
        Caption = #1040#1088#1090#1080#1088#1110#1072#1083#1100#1085#1080#1081' '#1090#1080#1089#1082
        TabOrder = 4
        object rbNormal: TRadioButton
          Left = 16
          Top = 16
          Width = 73
          Height = 17
          Caption = #1059' '#1053#1086#1088#1084#1110
          TabOrder = 0
        end
        object rbGypo: TRadioButton
          Left = 288
          Top = 16
          Width = 81
          Height = 17
          Caption = #1043#1110#1087#1086#1090#1086#1085#1110#1103
          TabOrder = 1
        end
        object rbGyper: TRadioButton
          Left = 544
          Top = 16
          Width = 81
          Height = 17
          Caption = #1043#1110#1087#1077#1088#1090#1086#1085#1110#1103
          TabOrder = 2
        end
      end
      object cbPnev: TDBComboBoxEh
        Left = 120
        Top = 88
        Width = 529
        Height = 21
        DataField = 'id_pnev'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 5
        Visible = True
      end
      object dbgOznaki: TDBGridEh
        Left = 8
        Top = 112
        Width = 609
        Height = 97
        Anchors = [akLeft, akTop, akBottom]
        DataSource = dsOznaki
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghDialogColumnEdit, dghNoColumnMove]
        ReadOnly = True
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1080#1084#1087#1090#1086#1084#1072#1090#1080#1095#1085#1110' '#1086#1079#1085#1072#1082#1080
            Width = 570
          end>
      end
      object dbgSick: TDBGridEh
        Left = 8
        Top = 216
        Width = 297
        Height = 105
        Anchors = [akLeft, akBottom]
        DataSource = dsSick
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghDialogColumnEdit, dghNoColumnMove]
        ReadOnly = True
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Caption = #1057#1091#1087#1091#1090#1085#1110' '#1079#1072#1093#1074#1086#1088#1102#1074#1072#1085#1085#1103
            Width = 250
          end>
      end
      object dbgRisk: TDBGridEh
        Left = 344
        Top = 216
        Width = 273
        Height = 105
        Anchors = [akLeft, akBottom]
        DataSource = dsRisk
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghDialogColumnEdit, dghNoColumnMove]
        ReadOnly = True
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Caption = #1060#1072#1082#1090#1086#1088#1080' '#1088#1080#1079#1080#1082#1091
            Width = 230
          end>
      end
      object btnAddOznaki: TButton
        Left = 620
        Top = 112
        Width = 27
        Height = 25
        Caption = '+'
        TabOrder = 9
        OnClick = btnAddOznakiClick
      end
      object btnDelOznaki: TButton
        Left = 620
        Top = 138
        Width = 27
        Height = 25
        Caption = '-'
        TabOrder = 10
        OnClick = btnDelOznakiClick
      end
      object btnAddSick: TButton
        Left = 308
        Top = 216
        Width = 27
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = '+'
        TabOrder = 11
        OnClick = btnAddSickClick
      end
      object btnAddRisk: TButton
        Left = 620
        Top = 216
        Width = 27
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = '+'
        TabOrder = 12
        OnClick = btnAddRiskClick
      end
      object btnSickDel: TButton
        Left = 308
        Top = 242
        Width = 27
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = '-'
        TabOrder = 13
        OnClick = btnSickDelClick
      end
      object btnRiskDel: TButton
        Left = 620
        Top = 242
        Width = 27
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = '-'
        TabOrder = 14
        OnClick = btnRiskDelClick
      end
    end
    object tsResult: TTabSheet
      Caption = #1042#1080#1089#1085#1086#1074#1086#1082
      ImageIndex = 2
      object lbl11: TLabel
        Left = 141
        Top = 8
        Width = 48
        Height = 13
        Caption = #1044#1110#1072#1075#1085#1086#1079
      end
      object lbl12: TLabel
        Left = 87
        Top = 40
        Width = 103
        Height = 13
        Caption = #1057#1091#1087#1091#1090#1085#1080#1081' '#1076#1110#1072#1075#1085#1086#1079
      end
      object lbl13: TLabel
        Left = 0
        Top = 72
        Width = 190
        Height = 13
        Caption = #1057#1090#1091#1087#1110#1085#1100' '#1090#1103#1078#1082#1086#1089#1090#1110' '#1079#1072#1093#1074#1086#1088#1102#1074#1072#1085#1085#1103
      end
      object lbl14: TLabel
        Left = 28
        Top = 104
        Width = 166
        Height = 13
        Caption = #1053#1077#1086#1073#1093#1110#1076#1085#1110#1089#1090#1100' '#1075#1086#1089#1087#1110#1090#1072#1083#1110#1079#1072#1094#1110#1111' '
      end
      object cbHardLevel: TDBComboBoxEh
        Left = 200
        Top = 72
        Width = 433
        Height = 21
        DataField = 'id_hard_level'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object cbHospital: TDBComboBoxEh
        Left = 200
        Top = 104
        Width = 433
        Height = 21
        DataField = 'id_need_hospital'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 1
        Visible = True
        OnChange = cbHospitalChange
      end
      object edtResult: TDBEditEh
        Left = 200
        Top = 8
        Width = 433
        Height = 21
        DataField = 'name'
        DataSource = dsResult
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edtResultEditButtons0Click
          end>
        ReadOnly = True
        TabOrder = 2
        Visible = True
      end
      object edtDopResult: TDBEditEh
        Left = 200
        Top = 40
        Width = 433
        Height = 21
        DataField = 'name'
        DataSource = dsDopResult
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edtDopResultEditButtons0Click
          end>
        ReadOnly = True
        TabOrder = 3
        Visible = True
      end
      object btnHospitalPrint: TButton
        Left = 200
        Top = 136
        Width = 433
        Height = 25
        Caption = #1044#1088#1091#1082' '#1053#1072#1087#1088#1072#1074#1083#1077#1085#1085#1103' '#1085#1072' '#1075#1086#1089#1087#1110#1090#1072#1083#1110#1079#1072#1094#1110#1102
        TabOrder = 4
        OnClick = btnHospitalPrintClick
      end
      object Button1: TButton
        Left = 520
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 5
      end
    end
    object tsHeal: TTabSheet
      Caption = #1051#1110#1082#1091#1074#1072#1085#1085#1103
      ImageIndex = 3
      object lbl15: TLabel
        Left = 16
        Top = 16
        Width = 79
        Height = 13
        Caption = #1055#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103
      end
      object lbl16: TLabel
        Left = 16
        Top = 160
        Width = 142
        Height = 13
        Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1110' '#1087#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103
      end
      object lbl18: TLabel
        Left = 16
        Top = 264
        Width = 38
        Height = 13
        Caption = #1051#1110#1082#1072#1088':'
      end
      object lblDoc: TLabel
        Left = 56
        Top = 264
        Width = 149
        Height = 13
        Caption = '-------- --------------------- ------'
      end
      object dbgHeal: TDBGridEh
        Left = 16
        Top = 32
        Width = 625
        Height = 120
        DataSource = dsMedical
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghDialogColumnEdit, dghNoColumnMove]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgHealDrawColumnCell
        Columns = <
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Caption = #1053#1072#1079#1074#1072' '#1083#1110#1082#1086#1088#1089#1100#1082#1086#1075#1086' '#1079#1072#1089#1086#1073#1072
            Title.TitleButton = True
            Width = 580
          end>
      end
      object edtDopHeal: TDBEditEh
        Left = 16
        Top = 176
        Width = 625
        Height = 21
        DataField = 'dop_heal'
        DataSource = dsPriyom
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object grpNext: TGroupBox
        Left = 16
        Top = 208
        Width = 625
        Height = 41
        Caption = #1053#1077#1086#1073#1093#1110#1076#1085#1110#1089#1090#1100' '#1087#1086#1074#1090#1086#1088#1085#1086#1075#1086' '#1087#1088#1080#1081#1086#1084#1091
        TabOrder = 2
        object lbl17: TLabel
          Left = 312
          Top = 16
          Width = 97
          Height = 13
          Caption = #1055#1086#1087#1077#1088#1077#1076#1085#1103' '#1076#1072#1090#1072
        end
        object rbNextYes: TRadioButton
          Left = 16
          Top = 16
          Width = 57
          Height = 17
          Caption = #1058#1072#1082
          TabOrder = 0
        end
        object rbNextNo: TRadioButton
          Left = 88
          Top = 16
          Width = 49
          Height = 17
          Caption = #1053#1110
          TabOrder = 1
        end
        object edtNextDate: TDBDateTimeEditEh
          Left = 416
          Top = 11
          Width = 185
          Height = 21
          DataField = 'next_date'
          DataSource = dsPriyom
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 2
          Visible = True
        end
      end
      object btnAddMedical: TButton
        Left = 587
        Top = 7
        Width = 25
        Height = 25
        Caption = '+'
        TabOrder = 3
        OnClick = btnAddMedicalClick
      end
      object btnMedicalDel: TButton
        Left = 614
        Top = 7
        Width = 25
        Height = 25
        Caption = '-'
        TabOrder = 4
        OnClick = btnMedicalDelClick
      end
    end
  end
  object btnStart: TButton [5]
    Left = 631
    Top = 39
    Width = 137
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1095#1072#1090#1080' '#1087#1088#1080#1081#1086#1084
    Enabled = False
    TabOrder = 5
    OnClick = btnStartClick
  end
  object edtDate: TDBDateTimeEditEh [6]
    Left = 96
    Top = 4
    Width = 145
    Height = 21
    Enabled = False
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 6
    Visible = True
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
    Left = 416
    Top = 40
  end
  object dsPriyom: TDataSource
    DataSet = zqrPriyom
    Left = 368
    Top = 40
  end
  object zqrHistory: TZQuery
    Params = <>
    Left = 712
    Top = 168
  end
  object dsHistory: TDataSource
    DataSet = zqrHistory
    Left = 712
    Top = 216
  end
  object dsOznaki: TDataSource
    DataSet = zqrOznaki
    Left = 188
    Top = 256
  end
  object zqrOznaki: TZQuery
    Params = <>
    Left = 252
    Top = 256
  end
  object zqrSick: TZQuery
    Params = <>
    Left = 156
    Top = 368
  end
  object zqrRisk: TZQuery
    Params = <>
    Left = 468
    Top = 360
  end
  object dsSick: TDataSource
    DataSet = zqrSick
    Left = 196
    Top = 368
  end
  object dsRisk: TDataSource
    DataSet = zqrRisk
    Left = 524
    Top = 360
  end
  object zqrResult: TZQuery
    Params = <>
    Left = 116
    Top = 144
  end
  object zqrDopResult: TZQuery
    Params = <>
    Left = 68
    Top = 184
  end
  object dsDopResult: TDataSource
    DataSet = zqrDopResult
    Left = 148
    Top = 192
  end
  object dsResult: TDataSource
    DataSet = zqrResult
    Left = 204
    Top = 152
  end
  object dsMedical: TDataSource
    DataSet = zqrMedical
    Left = 492
    Top = 192
  end
  object zqrMedical: TZQuery
    Params = <>
    Left = 564
    Top = 192
  end
  object zqrDoc: TZQuery
    Params = <>
    Left = 380
    Top = 272
  end
  object dsDoc: TDataSource
    DataSet = zqrDoc
    Left = 372
    Top = 328
  end
end
