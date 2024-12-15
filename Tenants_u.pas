unit Tenants_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtDlgs,conData_u,TenantAcc_u;

type
  TfrmTenants = class(TForm)
    pgcTenants: TPageControl;
    tbsHome: TTabSheet;
    tbsTransactions: TTabSheet;
    Label1: TLabel;
    pgcTransactions: TPageControl;
    tbsPayments: TTabSheet;
    lblPayments: TLabel;
    lblAmount: TLabel;
    btnPay: TButton;
    edtAmount: TEdit;
    rgpType: TRadioGroup;
    tbsHistory: TTabSheet;
    tbsLease: TTabSheet;
    dbgTransactions: TDBGrid;
    lblPaymentHistory: TLabel;
    redReceipt: TRichEdit;
    lblSearch: TLabel;
    dtpSearch: TDateTimePicker;
    lblShow: TLabel;
    cbxType: TComboBox;
    lblFrom: TLabel;
    lblTo: TLabel;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    lblOr: TLabel;
    btnExport: TButton;
    SaveTextFileDialog: TSaveTextFileDialog;
    lblPrev: TLabel;
    lblNext: TLabel;
    tbsSettings: TTabSheet;
    lblPersonal: TLabel;
    edtName: TEdit;
    btnSave: TButton;
    edtSurname: TEdit;
    edtPhone: TEdit;
    edtEmail: TEdit;
    lblName: TLabel;
    lblSurname: TLabel;
    lblEmail: TLabel;
    lblPhone: TLabel;
    lblSettings: TLabel;
    lblUsername: TLabel;
    lblPassword: TLabel;
    edtPassword: TEdit;
    btnDone: TButton;
    RichEdit1: TRichEdit;
    edtUsername: TEdit;
    procedure btnExportClick(Sender: TObject);
    procedure btnPayClick(Sender: TObject);
    procedure tbsPaymentsShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbsSettingsShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    objTenantAcc: TTenantAcc;
  public
    { Public declarations }
  end;

var
  frmTenants: TfrmTenants;
  sUsername : string;
  iTenantID : integer;
implementation
uses  StudioHive_u;

{$R *.dfm}

procedure TfrmTenants.btnExportClick(Sender: TObject); //export button
begin
 // code credit: docwiki.embarcadero.com
 if SaveTextFileDialog.execute then //opens the dialogue
    begin

    if FileExists(SaveTextFileDialog.FileName) then //check if file already exists
     begin
      raise Exception.Create('File already exists. Cannot overwrite.')
      end
     else begin
     //save redReceipt lines to file
      redReceipt.Lines.SaveToFile(SaveTextFileDialog.FileName);
      showmessage('File Saved Succesfully.');
     end
    end;
    end;

procedure TfrmTenants.btnPayClick(Sender: TObject);
var
rAmount : real;
i : integer;
sType : string;
begin
rAmount := StrToFloat(edtAmount.Text);
//determine type of payment
i := rgpType.ItemIndex;

if i <> -1 then //check if transaction type has been selected
begin
 sType := rgpType.Items[i];
 //add payment to tblTranactions
dbmData.tblTransactions.append;
dbmData.tblTransactions['Amount'] := rAmount;
dbmData.tblTransactions['Type'] := sType;
dbmData.tblTransactions['TenantID'] := iTenantID;
dbmData.tblTransactions['TransactionDate'] := now;
dbmData.tblTransactions.Post;
end
else begin
showmessage('Select transaction type');
end;

end;



procedure TfrmTenants.btnSaveClick(Sender: TObject);
var
sID, sName, sSurname : string;
begin
sID :=frmLogin.sID;
sName := edtName.Text;
sSurname := edtSurname.Text;

//edit already existing record
if NOT (sName='') OR (sSurname='') OR (edtEmail.Text='') OR (edtPhone.Text='')then //check if any edits are empty
   begin
   dbmData.qryTenants.SQL.Text := 'UPDATE tblTenants SET ' +
                               'FirstName = "' + sName + '", ' +
                               'Surname = "' + sSurname + '", ' +
                               'Email = "' + edtEmail.Text + '", ' +
                               'Phone = "' + edtPhone.Text + '" ' +
                               'WHERE IDNumber = "' + sID + '"';
   dbmdata.qryTenants.ExecSQL;
   showmessage('Changes saved!');

   //show username and password components
   edtUsername.Visible := true;
   edtPassword.Visible := true;
   btnDone.Visible := true;
   //generate and display username
   objTenantAcc := TTenantAcc.create(sID, sName, sSurname);  //instantiate object
   sUsername := objTenantAcc.generateUsername(sName,sSurname,sID);
   edtUsername.Text := sUsername;
   end
   else begin
    showmessage('Enter all details.');
   end;

end;

procedure TfrmTenants.FormShow(Sender: TObject);
var

sUsername : string;
begin
 //display tblTransactions

dbgTransactions.DataSource := dbmData.dscTransactions;
sUsername := frmLogin.edtUsername.Text;

 dbmData.tblPasswords.First;
 while NOT dbmData.tblPasswords.eof do
       begin
       if sUsername = dbmData.tblPasswords['Username'] then
          begin
           iTenantID := dbmData.tblPasswords['TenantID'] ; //get the logged in user's tenantID
           break;  //end loop if matching username is found

          end;
        dbmData.tblPasswords.next; //move to next if not yet found
       end;//end while

 //only show the logged in tenant's details
 //dbgTransactions.Refresh; //refresh dbGrid
 dbmData.qryTransactions.Close;
 dbmData.qryTransactions.sql.Text := 'SELECT * FROM tblTransactions WHERE TenantID = ' + intToStr(iTenantID);
 showmessage( dbmData.qryTransactions.sql.Text);
 dbmData.qryTransactions.Open;

end;

procedure TfrmTenants.tbsPaymentsShow(Sender: TObject);
begin
//display balance

end;

procedure TfrmTenants.tbsSettingsShow(Sender: TObject);
begin
 dbmData.tblTenants.First;
while NOT dbmData.tblTenants.eof do
      begin
       if dbmData.tblTenants['IDNumber'] = frmLogin.sID then
          begin
           edtName.text := dbmData.tblTenants['FirstName'];
           edtSurname.text := dbmData.tblTenants['Surname'];
           edtEmail.text := dbmData.tblTenants['Email'];
           edtPhone.text := dbmData.tblTenants['Phone'];
           break; //end loop when match is found
          end;
       dbmData.tblTenants.next;//go to next record
      end;




end;

end.
