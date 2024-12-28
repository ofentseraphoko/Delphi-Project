object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 213
  ClientWidth = 519
  Color = clHighlightText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object lblWelcome: TLabel
    Left = 206
    Top = 8
    Width = 121
    Height = 33
    Caption = 'Studio Hive'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -29
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lblAdmin: TLabel
    Left = 338
    Top = 185
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
    Left = 150
    Top = 185
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
  object lblForgot: TLabel
    Left = 200
    Top = 126
    Width = 76
    Height = 15
    Caption = 'Forgot Password?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lblReset: TLabel
    Left = 282
    Top = 126
    Width = 24
    Height = 15
    Caption = 'Reset'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    OnClick = lblResetClick
  end
  object edtUsername: TEdit
    Left = 150
    Top = 68
    Width = 227
    Height = 23
    TabOrder = 0
    Text = 'Username'
  end
  object edtPassword: TEdit
    Left = 150
    Top = 97
    Width = 227
    Height = 23
    TabOrder = 1
    Text = 'Password'
  end
  object btnLogin: TButton
    Left = 218
    Top = 154
    Width = 103
    Height = 25
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clOlive
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object Button1: TButton
    Left = 176
    Top = 300
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 257
    Top = 300
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 338
    Top = 300
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 5
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 32
    Top = 16
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 32
    Top = 80
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 32
    Top = 144
  end
end
