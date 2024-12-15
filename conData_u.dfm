object dbmData: TdbmData
  Height = 280
  Width = 923
  object conData: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Ofentse\On' +
      'eDrive - Curro Holdings\2024 Grade 12\I.T\PAT documents 2024\Ofe' +
      'ntse Raphoko PAT 2024\Phase 2(for reals)\StudioHiveDB.mdb;Persis' +
      't Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 424
    Top = 8
  end
  object tblTenants: TADOTable
    Active = True
    Connection = conData
    CursorType = ctStatic
    TableName = 'tblTenants'
    Left = 56
    Top = 80
  end
  object tblPasswords: TADOTable
    Active = True
    Connection = conData
    CursorType = ctStatic
    TableName = 'tblPasswords'
    Left = 656
    Top = 72
  end
  object dscTransactions: TDataSource
    DataSet = qryTransactions
    Left = 320
    Top = 144
  end
  object tblTransactions: TADOTable
    Active = True
    Connection = conData
    CursorType = ctStatic
    TableName = 'tblTransactions'
    Left = 256
    Top = 72
  end
  object dscTenants: TDataSource
    DataSet = qryTenants
    Left = 88
    Top = 144
  end
  object tblStudios: TADOTable
    Active = True
    Connection = conData
    CursorType = ctStatic
    TableName = 'tblStudios'
    Left = 464
    Top = 80
  end
  object dscStudios: TDataSource
    DataSet = qryStudios
    Left = 496
    Top = 144
  end
  object tblLease: TADOTable
    Active = True
    Connection = conData
    CursorType = ctStatic
    TableName = 'tblLease'
    Left = 744
    Top = 152
  end
  object qryTransactions: TADOQuery
    Connection = conData
    Parameters = <>
    Left = 232
    Top = 152
  end
  object qryTenants: TADOQuery
    Connection = conData
    Parameters = <>
    Left = 32
    Top = 144
  end
  object qryStudios: TADOQuery
    Connection = conData
    Parameters = <>
    Left = 440
    Top = 168
  end
end
