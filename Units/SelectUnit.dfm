inherited fmSelect: TfmSelect
  Left = 941
  Top = 384
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  FormStyle = fsNormal
  Visible = False
  DesignSize = (
    784
    461)
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
    Height = 409
    Align = alTop
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
    ReadOnly = True
    OnDblClick = dbgTableDblClick
  end
  inherited nwTable: TDBNewNav
    Left = 95
    Top = 4
    Hints.Strings = ()
    Visible = False
  end
  object btnOk: TBitBtn [4]
    Left = 0
    Top = 440
    Width = 785
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 3
    OnClick = btnOkClick
    Kind = bkOK
  end
  inherited alBase: TActionList
    Left = 536
    Top = 0
  end
  inherited ilBase: TImageList
    Left = 568
    Top = 0
  end
  inherited zqrTable: TZQuery
    Left = 432
    Top = 0
  end
  inherited dsTable: TDataSource
    Left = 464
    Top = 0
  end
end
