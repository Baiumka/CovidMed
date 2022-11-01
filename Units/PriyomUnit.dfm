inherited fmPriyom: TfmPriyom
  Left = 585
  Top = 405
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
    Left = 32
    Top = 40
    Width = 297
    Height = 21
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edtFioEditButtons0Click
      end>
    TabOrder = 1
    Text = 'edtFio'
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
end
