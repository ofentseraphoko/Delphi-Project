object frmAdmin: TfrmAdmin
  Left = 0
  Top = 0
  Caption = 'Admin Dashboard'
  ClientHeight = 525
  ClientWidth = 1010
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 13
  object pgcAdmin: TPageControl
    Left = 0
    Top = -3
    Width = 673
    Height = 520
    ActivePage = tbsTransactions
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tbsHome: TTabSheet
      Caption = 'Home'
    end
    object tbsTransactions: TTabSheet
      Caption = 'Transactions'
      ImageIndex = 1
      object lblPrev: TLabel
        Left = 578
        Top = 320
        Width = 21
        Height = 13
        Caption = 'Prev'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lblPrevClick
      end
      object lblNext: TLabel
        Left = 616
        Top = 320
        Width = 23
        Height = 13
        Caption = 'Next'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lblNextClick
      end
      object lblAmount: TLabel
        Left = 3
        Top = 259
        Width = 47
        Height = 15
        Caption = 'Amount:'
      end
      object lblTo: TLabel
        Left = 430
        Top = 104
        Width = 12
        Height = 15
        Caption = 'To'
      end
      object lblOr: TLabel
        Left = 213
        Top = 104
        Width = 13
        Height = 15
        Caption = 'Or'
      end
      object llFrom: TLabel
        Left = 273
        Top = 104
        Width = 28
        Height = 15
        Caption = 'From'
      end
      object lblShow: TLabel
        Left = 3
        Top = 101
        Width = 29
        Height = 15
        Caption = 'Show'
      end
      object lblTransactions: TLabel
        Left = 3
        Top = 3
        Width = 143
        Height = 28
        Caption = 'Transactions'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -24
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMin: TLabel
        Left = 329
        Top = 355
        Width = 53
        Height = 15
        Caption = 'Minimum'
      end
      object lblMax: TLabel
        Left = 464
        Top = 355
        Width = 55
        Height = 15
        Caption = 'Maximum'
      end
      object lblDate: TLabel
        Left = 3
        Top = 53
        Width = 107
        Height = 15
        Caption = 'Search specific date:'
      end
      object dbgTransactions: TDBGrid
        Left = 3
        Top = 125
        Width = 646
        Height = 189
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object redReceipt: TRichEdit
        Left = 3
        Top = 326
        Width = 320
        Height = 129
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Lines.Strings = (
          'redReceipt')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object spnMin: TSpinEdit
        Left = 329
        Top = 327
        Width = 97
        Height = 24
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
      object spnMax: TSpinEdit
        Left = 464
        Top = 327
        Width = 97
        Height = 24
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
      end
      object cbxType: TComboBox
        Left = 38
        Top = 98
        Width = 145
        Height = 23
        TabOrder = 4
        Text = 'Transaction Type'
        OnChange = cbxTypeChange
        Items.Strings = (
          'Rent'
          'Fine')
      end
      object btnAmount: TButton
        Left = 385
        Top = 382
        Width = 105
        Height = 25
        Caption = 'Filter by amount'
        TabOrder = 5
        OnClick = btnAmountClick
      end
      object dtpSearch: TDateTimePicker
        Left = 110
        Top = 52
        Width = 186
        Height = 23
        Date = 45557.000000000000000000
        Time = 0.898755347225233000
        TabOrder = 6
        OnChange = dtpSearchChange
      end
      object dtpFrom: TDateTimePicker
        Left = 321
        Top = 98
        Width = 88
        Height = 23
        Date = 45560.000000000000000000
        Time = 0.650616782404540600
        TabOrder = 7
        OnChange = dtpFromChange
      end
      object dtpTo: TDateTimePicker
        Left = 448
        Top = 98
        Width = 105
        Height = 23
        Date = 45560.000000000000000000
        Time = 0.651735254628874800
        TabOrder = 8
        OnChange = dtpToChange
      end
      object btnExport: TButton
        Left = 128
        Top = 461
        Width = 75
        Height = 25
        Caption = 'Export to .txt'
        TabOrder = 9
        OnClick = btnExportClick
      end
    end
    object tbsStudio: TTabSheet
      Caption = 'Studio'
      ImageIndex = 2
      object lblStudios: TLabel
        Left = 3
        Top = 3
        Width = 82
        Height = 28
        Caption = 'Studios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -24
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPrevStudio: TLabel
        Left = 592
        Top = 49
        Width = 23
        Height = 15
        Caption = 'Prev'
        OnClick = lblPrevStudioClick
      end
      object lblNextStudio: TLabel
        Left = 629
        Top = 49
        Width = 25
        Height = 15
        Caption = 'Next'
        OnClick = lblNextStudioClick
      end
      object dbgStudios: TDBGrid
        Left = 3
        Top = 68
        Width = 659
        Height = 169
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object btnAddStudio: TButton
        Left = 560
        Top = 243
        Width = 102
        Height = 25
        Caption = 'Add New Studio'
        TabOrder = 1
        OnClick = btnAddStudioClick
      end
      object btnRemoveStudio: TButton
        Left = 560
        Top = 305
        Width = 102
        Height = 25
        Caption = 'RemoveStudio'
        TabOrder = 2
        OnClick = btnRemoveStudioClick
      end
      object cmbStatus: TComboBox
        Left = 3
        Top = 41
        Width = 145
        Height = 23
        TabOrder = 3
        Text = 'Status'
        OnChange = cmbStatusChange
        Items.Strings = (
          'Available'
          'Occupied'
          'Renovation')
      end
      object gpbAddStudio: TGroupBox
        Left = 3
        Top = 243
        Width = 273
        Height = 230
        TabOrder = 4
        object Label1: TLabel
          Left = 96
          Top = 12
          Width = 90
          Height = 22
          Caption = 'Add Studio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Cambria'
          Font.Style = []
          ParentFont = False
        end
        object lblWindow: TLabel
          Left = 3
          Top = 77
          Width = 80
          Height = 15
          Caption = 'Window Count'
        end
        object lblFloor: TLabel
          Left = 3
          Top = 96
          Width = 50
          Height = 15
          Caption = 'Floor Size'
        end
        object lblRent1: TLabel
          Left = 3
          Top = 152
          Width = 24
          Height = 15
          Caption = 'Rent'
        end
        object SpinEdit1: TSpinEdit
          Left = 104
          Top = 68
          Width = 69
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
        object btnCalculateRent: TButton
          Left = 96
          Top = 123
          Width = 90
          Height = 25
          Caption = 'Calculate Rent'
          TabOrder = 1
          OnClick = btnCalculateRentClick
        end
        object btnAdd: TButton
          Left = 96
          Top = 194
          Width = 90
          Height = 25
          Caption = 'Add'
          TabOrder = 2
          OnClick = btnAddClick
        end
        object edtFloorSize: TEdit
          Left = 104
          Top = 96
          Width = 69
          Height = 23
          TabOrder = 3
        end
        object edtAddRent: TEdit
          Left = 80
          Top = 154
          Width = 121
          Height = 23
          TabOrder = 4
        end
      end
      object btnEdit: TButton
        Left = 560
        Top = 274
        Width = 102
        Height = 25
        Caption = 'Edit Studio'
        TabOrder = 5
      end
      object gpbEdit: TGroupBox
        Left = 281
        Top = 243
        Width = 273
        Height = 230
        TabOrder = 6
        object lblEdit: TLabel
          Left = 111
          Top = 12
          Width = 89
          Height = 22
          Caption = 'Edit Studio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Cambria'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 1
          Top = 45
          Width = 80
          Height = 15
          Caption = 'Window Count'
        end
        object Label3: TLabel
          Left = 1
          Top = 66
          Width = 50
          Height = 15
          Caption = 'Floor Size'
        end
        object lblRent: TLabel
          Left = 51
          Top = 138
          Width = 24
          Height = 15
          Caption = 'Rent'
        end
        object SpinEdit2: TSpinEdit
          Left = 120
          Top = 40
          Width = 57
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
        object edtFloor: TEdit
          Left = 120
          Top = 70
          Width = 57
          Height = 23
          TabOrder = 1
        end
        object btnCalculate: TButton
          Left = 112
          Top = 99
          Width = 89
          Height = 25
          Caption = 'Calculate Rent'
          TabOrder = 2
        end
        object btnSaveChanges: TButton
          Left = 112
          Top = 194
          Width = 89
          Height = 25
          Caption = 'Save Changes'
          TabOrder = 3
        end
        object edtRentChange: TEdit
          Left = 96
          Top = 130
          Width = 121
          Height = 23
          TabOrder = 4
        end
      end
    end
    object tbsTenants: TTabSheet
      Caption = 'Tenants'
      ImageIndex = 3
      object lblTenants: TLabel
        Left = 3
        Top = 3
        Width = 87
        Height = 28
        Caption = 'Tenants'
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -24
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSort: TLabel
        Left = 3
        Top = 84
        Width = 40
        Height = 15
        Caption = 'Sort by:'
      end
      object Label4: TLabel
        Left = 576
        Top = 89
        Width = 34
        Height = 15
        Caption = 'Label4'
      end
      object Label5: TLabel
        Left = 629
        Top = 89
        Width = 34
        Height = 15
        Caption = 'Label5'
      end
      object dbgTenants: TDBGrid
        Left = 3
        Top = 108
        Width = 659
        Height = 172
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object sbxTenants: TSearchBox
        Left = 3
        Top = 54
        Width = 366
        Height = 23
        TabOrder = 1
        Text = 'Search Name, Surname or ID Number'
        OnEnter = sbxTenantsEnter
        OnInvokeSearch = sbxTenantsInvokeSearch
      end
      object btnNewTenant: TButton
        Left = 555
        Top = 286
        Width = 107
        Height = 25
        Caption = 'Add New Tenant'
        TabOrder = 2
        OnClick = btnNewTenantClick
      end
      object cmbSort: TComboBox
        Left = 48
        Top = 81
        Width = 129
        Height = 23
        TabOrder = 3
        Text = 'Sort By'
        OnChange = cmbSortChange
        Items.Strings = (
          'Name'
          'Surname'
          'ID Number'
          'Z-A (Names)')
      end
      object btnRemove: TButton
        Left = 555
        Top = 317
        Width = 107
        Height = 25
        Caption = 'Remove Tenant'
        TabOrder = 4
        OnClick = btnRemoveClick
      end
    end
    object tbsNewTenant: TTabSheet
      Caption = 'New Tenant'
      ImageIndex = 4
      OnShow = tbsNewTenantShow
      object lblNew: TLabel
        Left = 3
        Top = 3
        Width = 178
        Height = 28
        Caption = 'Add New Tenant'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtID: TEdit
        Left = 3
        Top = 54
        Width = 161
        Height = 23
        TabOrder = 0
        Text = 'Enter Tenant'#39's SA ID Number'
      end
      object btnVerify: TButton
        Left = 191
        Top = 52
        Width = 75
        Height = 25
        Caption = 'Verify'
        TabOrder = 1
        OnClick = btnVerifyClick
      end
      object edtName: TEdit
        Left = 3
        Top = 96
        Width = 161
        Height = 23
        TabOrder = 2
        Text = 'Name'
        Visible = False
      end
      object edtSurname: TEdit
        Left = 3
        Top = 136
        Width = 161
        Height = 23
        TabOrder = 3
        Text = 'Surname'
        Visible = False
      end
      object btnDone: TButton
        Left = 3
        Top = 176
        Width = 75
        Height = 25
        Caption = 'Done'
        TabOrder = 4
        Visible = False
        OnClick = btnDoneClick
      end
      object gpbLease: TGroupBox
        Left = 3
        Top = 231
        Width = 625
        Height = 210
        TabOrder = 5
        object lblLease: TLabel
          Left = 3
          Top = 3
          Width = 146
          Height = 28
          Caption = 'Lease Details'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Cambria'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPayment: TLabel
          Left = 3
          Top = 120
          Width = 70
          Height = 15
          Caption = 'Payment Day'
        end
        object lblStartDate: TLabel
          Left = 164
          Top = 53
          Width = 51
          Height = 15
          Caption = 'Start Date'
        end
        object lblEndDate: TLabel
          Left = 168
          Top = 96
          Width = 47
          Height = 15
          Caption = 'End Date'
        end
        object cmbStudioID: TComboBox
          Left = 3
          Top = 51
          Width = 145
          Height = 23
          TabOrder = 0
          Text = 'StudioID'
          OnChange = cmbStudioIDChange
        end
        object edtMonthlyRent: TEdit
          Left = 3
          Top = 86
          Width = 145
          Height = 23
          TabOrder = 1
          Text = 'Monthly Rent'
          OnEnter = edtMonthlyRentEnter
        end
        object btnLease: TButton
          Left = 534
          Top = 173
          Width = 75
          Height = 25
          Caption = 'Done'
          TabOrder = 2
          OnClick = btnLeaseClick
        end
        object memLease: TMemo
          Left = 344
          Top = 16
          Width = 233
          Height = 151
          Lines.Strings = (
            ''
            'Studio: 0'
            'Monthly Rent: R0'
            'Payment Day: 30th'
            'Start: 2024'
            'End:  2026'
            ''
            ''
            '')
          ReadOnly = True
          TabOrder = 3
        end
        object dtpLeaseStart: TDateTimePicker
          Left = 221
          Top = 48
          Width = 98
          Height = 23
          Date = 45566.000000000000000000
          Time = 0.484093900464358700
          TabOrder = 4
          OnChange = dtpLeaseStartChange
        end
        object dtpLeaseEnd: TDateTimePicker
          Left = 221
          Top = 88
          Width = 98
          Height = 23
          Date = 45566.000000000000000000
          Time = 0.484532627313456000
          TabOrder = 5
          OnChange = dtpLeaseEndChange
        end
        object sedDay: TSpinEdit
          Left = 88
          Top = 113
          Width = 61
          Height = 24
          MaxValue = 30
          MinValue = 1
          TabOrder = 6
          Value = 1
          OnChange = sedDayChange
        end
      end
    end
    object tbsSettings: TTabSheet
      Caption = 'Settings'
      ImageIndex = 5
      object lblSettings: TLabel
        Left = 3
        Top = 3
        Width = 88
        Height = 28
        Caption = 'Settings'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Cambria'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtUsername: TEdit
        Left = 3
        Top = 64
        Width = 121
        Height = 23
        TabOrder = 0
        Text = 'New Username'
      end
      object edtPassword: TEdit
        Left = 3
        Top = 93
        Width = 121
        Height = 23
        TabOrder = 1
        Text = 'New Password'
      end
      object edtAdmName: TEdit
        Left = 3
        Top = 122
        Width = 121
        Height = 23
        TabOrder = 2
        Text = 'First Name'
      end
      object btnSettings: TButton
        Left = 16
        Top = 151
        Width = 97
        Height = 25
        Caption = 'Save Changes'
        TabOrder = 3
        OnClick = btnSettingsClick
      end
    end
    object tbsMessages: TTabSheet
      Caption = 'Messages'
      ImageIndex = 6
    end
  end
  object SaveTextFileDialog: TSaveTextFileDialog
    Left = 728
    Top = 136
  end
end
