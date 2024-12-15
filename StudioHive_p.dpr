program StudioHive_p;

uses
  Vcl.Forms,
  StudioHive_u in 'StudioHive_u.pas' {frmLogin},
  Admin_u in 'Admin_u.pas' {frmAdmin},
  conData_u in 'conData_u.pas' {dbmData: TDataModule},
  Tenants_u in 'Tenants_u.pas' {frmTenants},
  TenantAcc_u in 'TenantAcc_u.pas',
  Calculations_u in 'Calculations_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.CreateForm(TdbmData, dbmData);
  Application.CreateForm(TfrmTenants, frmTenants);
  Application.Run;
end.
