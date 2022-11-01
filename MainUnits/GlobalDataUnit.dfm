object dmGlobalData: TdmGlobalData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 694
  Top = 302
  Height = 298
  Width = 473
  object zqrAny: TZQuery
    Params = <>
    Left = 32
    Top = 16
  end
  object zuqEmpty: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 88
    Top = 16
  end
  object zqrCashKeyItem: TZQuery
    Params = <>
    Left = 392
    Top = 16
  end
  object dsAmpuSettings: TDataSource
    DataSet = zqrAmpuSettings
    Left = 144
    Top = 120
  end
  object zqrAmpuSettings: TZQuery
    SQL.Strings = (
      'SELECT * FROM goods_k.p_get_ampu_settings(:bank_id, :dt);')
    Params = <
      item
        DataType = ftUnknown
        Name = 'bank_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt'
        ParamType = ptUnknown
      end>
    Left = 256
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'bank_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt'
        ParamType = ptUnknown
      end>
  end
end
