object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 299
  ClientWidth = 567
  Color = clHighlightText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblWelcome: TLabel
    Left = 206
    Top = 24
    Width = 146
    Height = 23
    Caption = 'Welcome Back!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAdmin: TLabel
    Left = 260
    Top = 173
    Width = 39
    Height = 15
    Caption = 'Admin '
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -12
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = lblAdminClick
  end
  object lblNew: TLabel
    Left = 252
    Top = 194
    Width = 62
    Height = 15
    Caption = 'New Tenant'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblNewClick
  end
  object edtUsername: TEdit
    Left = 206
    Top = 84
    Width = 146
    Height = 23
    TabOrder = 0
    Text = 'Username'
  end
  object edtPassword: TEdit
    Left = 206
    Top = 113
    Width = 146
    Height = 23
    TabOrder = 1
    Text = 'Password'
  end
  object btnLogin: TButton
    Left = 240
    Top = 142
    Width = 83
    Height = 25
    Caption = 'Login'
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object Button1: TButton
    Left = 232
    Top = 260
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 313
    Top = 260
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 417
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 5
  end
end
