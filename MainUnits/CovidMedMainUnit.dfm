inherited fmCovidMedMain: TfmCovidMedMain
  Left = 368
  Top = 145
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Covid Med v 1.0'
  ClientHeight = 596
  ClientWidth = 1118
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  PixelsPerInch = 96
  TextHeight = 13
  inherited splConcole: TSplitter
    Top = 535
    Width = 1118
  end
  inherited sbMain: TStatusBar
    Top = 570
    Width = 1118
  end
  inherited dbgConsole: TDBGridEh
    Top = 540
    Width = 1118
  end
  inherited tcChild: TTabControl
    Width = 1118
  end
  inherited edtCalcDate: TDBDateTimeEditEh
    EditFormat = 'DD/MM/YYYY'
  end
  inherited mmMenu: TMainMenu
    Left = 592
    Top = 0
  end
  inherited alMain: TActionList
    Left = 536
    Top = 0
    object actUsers: TAction
      Category = '1_'#1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
      OnExecute = actUsersExecute
    end
    object actPations: TAction
      Category = '1_'#1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1055#1072#1094#1110#1077#1085#1090#1080
      OnExecute = actPationsExecute
    end
    object actPriyom: TAction
      Category = '2_'#1055#1088#1080#1081#1086#1084
      Caption = #1055#1086#1095#1072#1090#1080' '#1085#1086#1074#1080#1081' '#1087#1088#1080#1081#1086#1084
      OnExecute = actPriyomExecute
    end
    object actArchive: TAction
      Category = '2_'#1055#1088#1080#1081#1086#1084
      Caption = #1040#1088#1093#1110#1074' '#1055#1088#1080#1081#1086#1084#1110#1074
      OnExecute = actArchiveExecute
    end
    object actMedical: TAction
      Category = '1_'#1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1051#1110#1082#1072#1088#1089#1100#1082#1110' '#1079#1072#1089#1086#1073#1080
      OnExecute = actMedicalExecute
    end
    object actSicks: TAction
      Category = '1_'#1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1047#1072#1093#1074#1086#1088#1102#1074#1072#1085#1085#1103
      OnExecute = actSicksExecute
    end
    object actRisk: TAction
      Category = '1_'#1044#1086#1074#1110#1076#1085#1080#1082#1080
      Caption = #1060#1072#1082#1090#1086#1088#1080' '#1088#1080#1079#1080#1082#1091
      OnExecute = actRiskExecute
    end
  end
  inherited ilChildIcon: TImageList
    Left = 480
    Top = 0
  end
end
