object frmTenants: TfrmTenants
  Left = 0
  Top = 0
  Caption = 'Tenant Dashboard'
  ClientHeight = 506
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object pgcTenants: TPageControl
    Left = -8
    Top = 0
    Width = 801
    Height = 505
    ActivePage = tbsSettings
    TabOrder = 0
    object tbsHome: TTabSheet
      Caption = 'Home'
    end
    object tbsTransactions: TTabSheet
      Caption = 'Transactions'
      ImageIndex = 1
      object Label1: TLabel
        Left = 320
        Top = 215
        Width = 34
        Height = 15
        Caption = 'Label1'
      end
      object pgcTransactions: TPageControl
        Left = 0
        Top = 0
        Width = 521
        Height = 472
        ActivePage = tbsHistory
        TabOrder = 0
        object tbsPayments: TTabSheet
          Caption = 'Payments'
          OnShow = tbsPaymentsShow
          object lblPayments: TLabel
            Left = 189
            Top = 0
            Width = 105
            Height = 32
            Caption = 'Payments'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblAmount: TLabel
            Left = 139
            Top = 189
            Width = 47
            Height = 15
            Caption = 'Amount:'
          end
          object btnPay: TButton
            Left = 219
            Top = 231
            Width = 75
            Height = 25
            Caption = 'Pay'
            TabOrder = 0
            OnClick = btnPayClick
          end
          object edtAmount: TEdit
            Left = 201
            Top = 186
            Width = 121
            Height = 23
            TabOrder = 1
          end
          object rgpType: TRadioGroup
            Left = 189
            Top = 53
            Width = 116
            Height = 105
            Caption = 'Transaction Type'
            Items.Strings = (
              'Rent Payment'
              'Fine Payment')
            TabOrder = 2
          end
        end
        object tbsHistory: TTabSheet
          Caption = 'Payment History'
          ImageIndex = 1
          object lblPaymentHistory: TLabel
            Left = 3
            Top = 3
            Width = 180
            Height = 35
            Caption = 'Payment History'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Sitka Heading'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object lblSearch: TLabel
            Left = 3
            Top = 44
            Width = 104
            Height = 15
            Caption = 'Search specific date'
          end
          object lblShow: TLabel
            Left = 3
            Top = 88
            Width = 29
            Height = 15
            Caption = 'Show'
          end
          object lblFrom: TLabel
            Left = 246
            Top = 88
            Width = 28
            Height = 15
            Caption = 'From'
          end
          object lblTo: TLabel
            Left = 384
            Top = 88
            Width = 12
            Height = 15
            Caption = 'To'
          end
          object lblOr: TLabel
            Left = 208
            Top = 88
            Width = 13
            Height = 15
            Caption = 'Or'
          end
          object lblPrev: TLabel
            Left = 418
            Top = 262
            Width = 26
            Height = 15
            Caption = 'Prev.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object lblNext: TLabel
            Left = 472
            Top = 262
            Width = 25
            Height = 15
            Caption = 'Next'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object dbgTransactions: TDBGrid
            Left = 3
            Top = 121
            Width = 505
            Height = 135
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
          end
          object redReceipt: TRichEdit
            Left = 0
            Top = 272
            Width = 362
            Height = 136
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Lines.Strings = (
              'redReceipt')
            ParentFont = False
            TabOrder = 1
          end
          object dtpSearch: TDateTimePicker
            Left = 113
            Top = 44
            Width = 248
            Height = 23
            Date = 45559.000000000000000000
            Time = 0.565035081017413200
            TabOrder = 2
          end
          object cbxType: TComboBox
            Left = 38
            Top = 85
            Width = 145
            Height = 23
            TabOrder = 3
            Text = 'Transaction Type'
          end
          object DateTimePicker2: TDateTimePicker
            Left = 280
            Top = 85
            Width = 82
            Height = 23
            Date = 45559.000000000000000000
            Time = 0.568636134259577400
            TabOrder = 4
          end
          object DateTimePicker3: TDateTimePicker
            Left = 402
            Top = 85
            Width = 82
            Height = 23
            Date = 45559.000000000000000000
            Time = 0.568857372687489300
            TabOrder = 5
          end
          object btnExport: TButton
            Left = 76
            Top = 414
            Width = 75
            Height = 25
            Caption = 'Export to .txt'
            TabOrder = 6
            OnClick = btnExportClick
          end
        end
      end
    end
    object tbsLease: TTabSheet
      Caption = 'Lease Information'
      ImageIndex = 2
      object RichEdit1: TRichEdit
        Left = 195
        Top = 83
        Width = 302
        Height = 230
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Lines.Strings = (
          'RichEdit1')
        ParentFont = False
        TabOrder = 0
      end
    end
    object tbsSettings: TTabSheet
      Caption = 'Settings and Personal Information'
      ImageIndex = 3
      OnShow = tbsSettingsShow
      object lblPersonal: TLabel
        Left = 120
        Top = 11
        Width = 236
        Height = 28
        Caption = 'Personal Information'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblName: TLabel
        Left = 24
        Top = 72
        Width = 60
        Height = 15
        Caption = 'First Name:'
      end
      object lblSurname: TLabel
        Left = 24
        Top = 120
        Width = 50
        Height = 15
        Caption = 'Surname:'
      end
      object lblEmail: TLabel
        Left = 264
        Top = 72
        Width = 77
        Height = 15
        Caption = 'Email Address:'
      end
      object lblPhone: TLabel
        Left = 264
        Top = 120
        Width = 84
        Height = 15
        Caption = 'Phone Number:'
      end
      object lblSettings: TLabel
        Left = 201
        Top = 216
        Width = 88
        Height = 28
        Caption = 'Settings'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Cambria'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object lblUsername: TLabel
        Left = 18
        Top = 267
        Width = 56
        Height = 15
        Caption = 'Username:'
      end
      object lblPassword: TLabel
        Left = 21
        Top = 298
        Width = 53
        Height = 15
        Caption = 'Password:'
      end
      object edtName: TEdit
        Left = 90
        Top = 69
        Width = 121
        Height = 23
        TabOrder = 0
        Text = 'John'
      end
      object btnSave: TButton
        Left = 201
        Top = 159
        Width = 91
        Height = 25
        Caption = 'Save Changes'
        TabOrder = 1
        OnClick = btnSaveClick
      end
      object edtSurname: TEdit
        Left = 90
        Top = 117
        Width = 121
        Height = 23
        TabOrder = 2
        Text = 'Smith'
      end
      object edtPhone: TEdit
        Left = 360
        Top = 117
        Width = 121
        Height = 23
        TabOrder = 3
      end
      object edtEmail: TEdit
        Left = 360
        Top = 69
        Width = 121
        Height = 23
        TabOrder = 4
      end
      object edtPassword: TEdit
        Left = 90
        Top = 295
        Width = 121
        Height = 23
        TabOrder = 5
      end
      object btnDone: TButton
        Left = 201
        Top = 344
        Width = 83
        Height = 25
        Caption = 'Save Changes'
        TabOrder = 6
        Visible = False
      end
      object edtUsername: TEdit
        Left = 90
        Top = 266
        Width = 121
        Height = 23
        TabOrder = 7
      end
    end
  end
  object SaveTextFileDialog: TSaveTextFileDialog
    Left = 916
    Top = 26
  end
end
