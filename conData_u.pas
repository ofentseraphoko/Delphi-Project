unit conData_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdbmData = class(TDataModule)
    conData: TADOConnection;
    tblTenants: TADOTable;
    tblPasswords: TADOTable;
    dscTransactions: TDataSource;
    tblTransactions: TADOTable;
    dscTenants: TDataSource;
    tblStudios: TADOTable;
    dscStudios: TDataSource;
    tblLease: TADOTable;
    qryTransactions: TADOQuery;
    qryTenants: TADOQuery;
    qryStudios: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dbmData: TdbmData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
