unit Admin_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,conData_u,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.WinXPickers, Vcl.WinXCtrls,
  Vcl.ExtCtrls, Vcl.ExtDlgs, TenantAcc_u,Calculations_u ;

type

  TfrmAdmin = class(TForm)
    pgcAdmin: TPageControl;
    tbsHome: TTabSheet;
    tbsTransactions: TTabSheet;
    dbgTransactions: TDBGrid;
    lblPrev: TLabel;
    lblNext: TLabel;
    redReceipt: TRichEdit;
    lblAmount: TLabel;
    spnMin: TSpinEdit;
    spnMax: TSpinEdit;
    lblTo: TLabel;
    lblOr: TLabel;
    llFrom: TLabel;
    lblShow: TLabel;
    cbxType: TComboBox;
    tbsStudio: TTabSheet;
    btnAmount: TButton;
    tbsTenants: TTabSheet;
    dbgTenants: TDBGrid;
    sbxTenants: TSearchBox;
    lblTransactions: TLabel;
    lblMin: TLabel;
    lblMax: TLabel;
    lblStudios: TLabel;
    dbgStudios: TDBGrid;
    btnAddStudio: TButton;
    lblTenants: TLabel;
    btnNewTenant: TButton;
    cmbSort: TComboBox;
    lblSort: TLabel;
    btnRemove: TButton;
    dtpSearch: TDateTimePicker;
    lblDate: TLabel;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    SaveTextFileDialog: TSaveTextFileDialog;
    btnExport: TButton;
    tbsNewTenant: TTabSheet;
    lblNew: TLabel;
    edtID: TEdit;
    btnVerify: TButton;
    edtName: TEdit;
    edtSurname: TEdit;
    btnDone: TButton;
    gpbLease: TGroupBox;
    lblLease: TLabel;
    cmbStudioID: TComboBox;
    edtMonthlyRent: TEdit;
    btnLease: TButton;
    memLease: TMemo;
    lblPayment: TLabel;
    lblStartDate: TLabel;
    lblEndDate: TLabel;
    btnRemoveStudio: TButton;
    dtpLeaseStart: TDateTimePicker;
    dtpLeaseEnd: TDateTimePicker;
    cmbStatus: TComboBox;
    gpbAddStudio: TGroupBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    btnCalculateRent: TButton;
    btnAdd: TButton;
    lblWindow: TLabel;
    lblFloor: TLabel;
    edtFloorSize: TEdit;
    btnEdit: TButton;
    gpbEdit: TGroupBox;
    lblEdit: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblPrevStudio: TLabel;
    lblNextStudio: TLabel;
    SpinEdit2: TSpinEdit;
    edtFloor: TEdit;
    btnCalculate: TButton;
    lblRent: TLabel;
    lblRent1: TLabel;
    btnSaveChanges: TButton;
    tbsSettings: TTabSheet;
    sedDay: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    lblSettings: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    edtAdmName: TEdit;
    btnSettings: TButton;
    edtRentChange: TEdit;
    edtAddRent: TEdit;
    tbsMessages: TTabSheet;
    procedure FormShow(Sender: TObject);
    procedure lblPrevClick(Sender: TObject);
    procedure lblNextClick(Sender: TObject);
    procedure btnAmountClick(Sender: TObject);
    procedure dtpSearchChange(Sender: TObject);
    procedure lblExportClick(Sender: TObject);
    procedure cbxTypeChange(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure dtpToChange(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure dtpFromChange(Sender: TObject);
    procedure btnNewTenantClick(Sender: TObject);
    procedure btnVerifyClick(Sender: TObject);
    procedure btnDoneClick(Sender: TObject);
    procedure btnAddStudioClick(Sender: TObject);
    procedure tbsNewTenantShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure dtpLeaseStartChange(Sender: TObject);
    procedure dtpLeaseEndChange(Sender: TObject);
    procedure sedDayChange(Sender: TObject);
    procedure cmbStudioIDChange(Sender: TObject);
    procedure edtMonthlyRentEnter(Sender: TObject);
    procedure lblPrevStudioClick(Sender: TObject);
    procedure cmbStatusChange(Sender: TObject);
    procedure lblNextStudioClick(Sender: TObject);
    procedure btnLeaseClick(Sender: TObject);
    procedure cmbSortChange(Sender: TObject);
    procedure sbxTenantsEnter(Sender: TObject);
    procedure sbxTenantsInvokeSearch(Sender: TObject);
    procedure btnRemoveStudioClick(Sender: TObject);
    procedure btnCalculateRentClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);

  private
    { Private declarations }
    objTenantAcc : TTenantAcc; //declare objects
    objCalculations :TCalculations;
  public
    { Public declarations }
    rRent: real;
  end;

var
  frmAdmin: TfrmAdmin;
  const Units = 32; //number of total units(studios) in the building
//dynamic array (arrLease) field types
  type
  TLeaseInfo = record
    StudioID: string;
    TenantID: string;
    StartDate: TDate;
    EndDate: TDate;
    PaymentDate : integer;
  end;
var
  arrLease: TLeaseInfo; //array variable to store lease info
implementation

{$R *.dfm}

procedure TfrmAdmin.btnAddClick(Sender: TObject);
begin
rRent:= strtofloat(edtAddRent.Text);
end;

procedure TfrmAdmin.btnAddStudioClick(Sender: TObject);
begin
//check if number of studios in db exceeds units
end;

procedure TfrmAdmin.btnAmountClick(Sender: TObject);
var
iMin, iMax : integer;
begin
dbmData.dscTransactions.DataSet := dbmData.qryTransactions; //change data set so that query statements can display
//filter records

//amount
iMin := spnMin.value;
iMax := spnMax.Value;
if iMin<iMax then
   begin
   dbmData.qryTransactions.Close;
   dbmData.qryTransactions.sql.text := 'SELECT * FROM tblTransactions WHERE amount BETWEEN ' + IntToStr(iMin) + ' AND ' + IntToStr(iMax);
   dbmData.qryTransactions.open;
   end
   else begin
   showmessage('Invalid amount range');
   end;

end;

procedure TfrmAdmin.btnCalculateRentClick(Sender: TObject);
var
 rFloor : real;
iWindow : integer;
begin
objCalculations.create; //instantiate object
rRent := objCalculations.calculateRent(rFloor,iWindow);
edtAddRent.Text := FloatToStr(rRent); //display rent
end;

procedure TfrmAdmin.btnDoneClick(Sender: TObject);
var
sName, sSurname, sID, sUsername : string;
iTenantID : integer;
begin
//extract values
sID := edtID.Text;
sName := edtName.Text;
sSurname := edtSurname.Text;



//add to tblTenants
if (edtName.Text <> '') AND (edtSurname.Text <> '') then
   begin
    dbmData.qryTenants.sql.text := 'INSERT INTO tblTenants (FirstName, Surname, IDNumber) VALUES ("' + sName + '" ' +','+ ' "' +sSurname+ '", ' + '"' +sID+ '")';
    showmessage( dbmData.qryTenants.sql.text );
    dbmData.qryTenants.execSql;
    showmessage('New Tenant Added Successfully!');
    //show lease details
    gpbLease.Visible := true;
   end;
end;

procedure TfrmAdmin.btnExportClick(Sender: TObject); //export
begin
 //partial code credit: docwiki.embarcadero.com
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

procedure TfrmAdmin.btnLeaseClick(Sender: TObject);
begin
//get TenantID
dbmData.tblTenants.First;
while not dbmData.tblTenants.eof do
      begin
      if edtID.Text = dbmData.tblTenants['IDNumber'] then
         begin
         arrLease.TenantID := dbmData.tblTenants['TenantID'];
          break; //stop loop
         end;
       dbmData.tblTenants.next; //go to next record
      end;//end while

//save lease details from arrLease into tblLease
dbmData.tblLease.last;
dbmData.tblLease.insert;
dbmData.tblLease['StudioID'] := arrLease.StudioID ;
dbmData.tblLease['TenantID'] := arrLease.TenantID;
dbmData.tblLease['StartDate'] := arrLease.StartDate;
dbmData.tblLease['EndDate'] := arrLease.EndDate;
dbmData.tblLease['PaymentDate'] := arrLease.PaymentDate;
dbmData.tblLease.post;

showmessage('Lease saved successfully!');
showmessage('New Tenant Account Created.');
end;

procedure TfrmAdmin.btnNewTenantClick(Sender: TObject);
var
bAvailable : boolean; //flag to see if there are any available studios
begin

bAvailable := false;
dbmData.tblStudios.First;
while not dbmData.tblStudios.eof do
     begin
      if  dbmData.tblStudios['Status'] = 'Available' then
          begin
           bAvailable := true;
           tbsNewTenant.TabVisible := true;
           pgcAdmin.ActivePageIndex := 4; //go to new tanant tab
           break; //stop loop
          end; //end if
     dbmData.tblStudios.next; //go to next record
     end;//end while

//no available units
if not bAvailable then
   begin
   showmessage('No available units. Cannot add new tenant.');
   end;


end;

procedure TfrmAdmin.btnRemoveClick(Sender: TObject);
begin
 if MessageDlg('Are you sure you want to delete this record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then //make sure user wants to delete the record
    begin
      dbmData.tblTenants.Delete; //delete current record
      dbmData.tblTenants.Refresh; //refresh table so changes can show
      ShowMessage('Record deleted successfully.');
    end;
end;

procedure TfrmAdmin.btnRemoveStudioClick(Sender: TObject);
begin
if MessageDlg('Are you sure you want to delete this record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then //make sure user wants to delete the record
    begin
      dbmData.tblStudios.Delete; //delete current record
      dbmData.tblStudios.Refresh; //refresh table so changes can show
      ShowMessage('Record deleted successfully.');
    end;
end;

procedure TfrmAdmin.btnSettingsClick(Sender: TObject);
var
 sUsername,sPassword, sName, sLine: string;
tAdmin: TextFile;

begin
assignfile(tAdmin, 'Admin.txt');
rewrite(tAdmin);
sUsername := edtUsername.text;
sPassword := edtPassword.text;
sName     := edtName.text;

if (sUsername<>'') or(sPassword<>'') or (sName<>'') then
  begin
    //error message
    showmessage('Enter all details');
  end
  else begin
  //rewrite textfile
  sLine := sPassword+'#' +sPassword+'#'+sName;
  writeln(tAdmin,sLine);
  closefile(tAdmin);
  showmessage('Changes saved.');
  end;




end;

procedure TfrmAdmin.btnVerifyClick(Sender: TObject); //btnVerify
var
sID, sName, sSurname : string;
dtDate : TDateTime ;
iAge : integer ;
begin
//extract values
sID := edtID.Text;
sName := edtName.Text;
sSurname := edtSurname.Text;
dtDate := Date ; //get today's date
objTenantAcc := TTenantAcc.create(sID, sName, sSurname);  //instantiate object

//validate ID length
if length(sID)<>13 then
   begin
   messagedlg('ID should have 13 digits', mtError, [mbOK], 0);
   end
   else //ID number is 13 digits
   begin
    iAge := objTenantAcc.calculateAge(dtDate, sID);  //calculate age
    if iAge <18 then
    begin
     messagedlg('You must be 18 to create an account', mtError, [mbOK], 0);
    end
    else
     begin //user is 18+
     showmessage('ID is Valid!') ;
     //show other components to continue adding tenant
     edtName.Visible := true ;
     edtSurname.Visible := true ;
     btnDone.Visible := true;
    end;

   end; //end if
end;

procedure TfrmAdmin.cmbSortChange(Sender: TObject);
begin
dbmData.dscTenants.DataSet := dbmData.qryTenants;
 case cmbSort.ItemIndex of
  0:  begin

     dbmData.qryTenants.Close;
     dbmData.qryTenants.sql.Text := 'SELECT * FROM tblTenants ORDER BY FirstName'; //sort by names
     dbmData.qryTenants.open;
     end;
 1:  begin
     dbmData.qryTenants.Close;
     dbmData.qryTenants.sql.Text := 'SELECT * FROM tblTenants ORDER BY Surname';
     dbmData.qryTenants.open;
     end;
 2:  begin
     dbmData.qryTenants.Close;
     dbmData.qryTenants.sql.Text := 'SELECT * FROM tblTenants ORDER BY IDNumber';
     dbmData.qryTenants.open;
     end;
 3:  begin
     dbmData.qryTenants.Close;
     dbmData.qryTenants.sql.Text := 'SELECT * FROM tblTenants ORDER BY Firstname, Surname Desc';  //a-z
     dbmData.qryTenants.open;
     end;
  end;


end;

procedure TfrmAdmin.cbxTypeChange(Sender: TObject); //cbx transaction type
var
i : integer;
sSelected: string;
begin
dbmData.dscTransactions.DataSet := dbmData.qryTransactions; //change data set so that query statements can display
i:= cbxType.ItemIndex;
sSelected := cbxType.Items[i]; //selected transacton type from combobox

//filter records with sql
dbmData.qryTransactions.Close;
dbmData.qryTransactions.SQL.Text := 'SELECT * FROM tblTransactions WHERE Type = ' + '"' + sSelected + '"';
dbmData.qryTransactions.open;

end;

procedure TfrmAdmin.cmbStatusChange(Sender: TObject);
var
sSelected : string;
i: integer;
begin
dbmData.dscStudios.DataSet := dbmData.qryStudios; //change data set
i:= cmbStatus.ItemIndex;
sSelected := cmbStatus.Items[i]; //selected status

//filter records with sql
dbmData.qryStudios.Close;
dbmData.qryStudios.SQL.Text := 'SELECT * FROM tblStudios WHERE Status = ' + '"' + sSelected + '"';
dbmData.qryStudios.open;
end;

procedure TfrmAdmin.cmbStudioIDChange(Sender: TObject);
var
sSelectedStudio, sRent, sLine: string;
i : integer;
begin
//find montly rent
  sselectedStudio := cmbStudioID.Text;
  // loop through tblStudios to find selected studio
  dbmData.tblStudios.First;
  while not dbmData.tblStudios.Eof do
  begin
    if dbmData.tblStudios['StudioID'] = sselectedStudio then
    begin
      sRent := FloatToStrf(dbmData.tblStudios['MonthlyRent'], ffCurrency,2,8);
      edtMonthlyRent.text := sRent;// display the rent in the edit box
      arrLease.StudioID := sSelectedStudio; //update array with selected studioID
      Break; //stop loop
    end;
    dbmData.tblStudios.Next; //go to net record if not found
  end;

  //display in memLease
for i := 0 to memLease.Lines.Count - 1 do
  begin
    sLine :=  memLease.Lines[i];
    if Pos('Monthly rent: ', sLine) = 1 then // check if line starts with Monthl rent
    begin
       memLease.Lines[i] := sRent;//replace with new rent
      Break; //stop loop
    end;
  end;//end for



end;

procedure TfrmAdmin.DateTimePicker1Change(Sender: TObject);
begin
dbmData.dscTransactions.DataSet := dbmData.qryTransactions; //change data set so that query statements can display
if dtpFrom.Date< dtpTo.Date then //check if dtFrom is before dtTo
   begin
    //show all records between the two dates
    dbmData.qryTransactions.Close;
    dbmData.qryTransactions.SQL.Text := 'SELECT * FROM tblTransactions WHERE [TransactionDate] BETWEEN #' + formatdatetime('yyyy/mm/dd',dtpFrom.Date) +'# AND #'+ formatdatetime('yyyy/mm/dd',dtpTo.Date) + '#';
    dbmData.qryTransactions.open;
   end
   else begin
    showmessage('Invalid timeline');
   end;

end;


procedure TfrmAdmin.dtpFromChange(Sender: TObject);
begin
dbmData.dscTransactions.DataSet := dbmData.qryTransactions; //change data set so that query statements can display

if dtpFrom.Date< dtpTo.Date then //check if dtFrom is before dtTo
   begin
      //show all records between the two dates
    dbmData.qryTransactions.Close;
    dbmData.qryTransactions.SQL.Text := 'SELECT * FROM tblTransactions WHERE TransactionDate BETWEEN #' + formatdatetime('yyyy/mm/dd',dtpFrom.Date) +'# AND #'+ formatdatetime('yyyy/mm/dd',dtpTo.Date) + '#';
    dbmData.qryTransactions.open;
   end
   else begin
    showmessage('Invalid timeline');
   end;

//no records found message
if  dbmData.qryTransactions.RecordCount = 0 then
    begin
    showmessage('No records found.');
    end;

end;

procedure TfrmAdmin.dtpLeaseEndChange(Sender: TObject);
var
sEnd, sLine : string;
i: integer;
begin
sEnd := 'End: ' +FormatDateTime('dd/mmm/yyyy',dtpLeaseEnd.Date); //the new date
//loop through memLease
  for i := 0 to memLease.Lines.Count - 1 do
  begin
    sLine :=  memLease.Lines[i];
    if Pos('End:', sLine) = 1 then // check if line starts with "End:"
    begin
       memLease.Lines[i] := sEnd;//replace with new date
        arrLease.EndDate := dtpLeaseEnd.Date; // update array
      Break; //stop loop
    end;
  end;//end for
end;

procedure TfrmAdmin.dtpLeaseStartChange(Sender: TObject);
var
sStart, sLine : string;
i: integer;
begin
sStart := 'Start: ' +FormatDateTime('dd/mmm/yyyy',dtpLeaseStart.Date); //the new date
//loop through memLease
  for i := 0 to memLease.Lines.Count - 1 do
  begin
    sLine :=  memLease.Lines[i];
    if Pos('Start:', sLine) = 1 then // check if line starts with "start:"
    begin
       memLease.Lines[i] := sStart;//replace with new date
       arrLease.StartDate := dtpLeaseStart.Date; // update array
      Break; //stop loop
    end;
  end;//end for
end;

procedure TfrmAdmin.dtpSearchChange(Sender: TObject); //search by date
begin
dbmData.dscTransactions.DataSet := dbmData.qryTransactions; //change data set so that query statements can display
//show records that match the date
    dbmData.qryTransactions.Close;
    dbmData.qryTransactions.SQL.Text := 'SELECT * FROM tblTransactions WHERE TransactionDate = #' + formatdatetime('yyyy/mm/dd',dtpSearch.Date) + '#';
    dbmData.qryTransactions.open;


end;

procedure TfrmAdmin.dtpToChange(Sender: TObject);
begin
if dtpFrom.Date< dtpTo.Date then //check if dtFrom is before dtTo
   begin
      //show all records between the two dates
    dbmData.qryTransactions.Close;
    dbmData.qryTransactions.SQL.Text := 'SELECT * FROM tblTransactions WHERE TransactionDate BETWEEN #' + formatdatetime('yyyy/mm/dd',dtpFrom.Date) +'# AND #'+ formatdatetime('yyyy/mm/dd',dtpTo.Date) + '#';
    dbmData.qryTransactions.open;
   end
   else begin
    showmessage('Invalid timeline');
   end;

 //no records found message
if  dbmData.qryTransactions.RecordCount = 0 then
    begin
    showmessage('No records found.');
    end;
end;

procedure TfrmAdmin.edtMonthlyRentEnter(Sender: TObject);
var
sRent : string;
begin
//edit tblStudios
dbmData.qryStudios.SQL.Text := 'EDIT';
end;

procedure TfrmAdmin.FormShow(Sender: TObject);  //display tables
begin

//tblTransactions
dbmData.dscTransactions.DataSet := dbmData.tblTransactions; //change data set from qryTransactions to display data without a query
dbgTransactions.DataSource := dbmData.dscTransactions;
 //tblStudios
 dbmData.dscStudios.DataSet := dbmData.tblStudios;
dbgStudios.DataSource := dbmData.dscStudios;
//tblTenants
dbmData.dscTenants.DataSet := dbmData.tblTenants;
 dbgTenants.datasource := dbmData.dscTenants;

end;



procedure TfrmAdmin.lblExportClick(Sender: TObject);
begin
//export receipt
end;

procedure TfrmAdmin.lblNextClick(Sender: TObject);
var
sType, sName, sSurname : string;
rAmount : real;
iTransactionID, iTenantID : integer;
dDate : tDate;
begin
 dbmData.tblTransactions.next; //btn next



  //extract data
 iTenantID := dbmData.tblTransactions['TenantID'] ;
 iTransactionID := dbmData.tblTransactions['TransactionID'] ;
 sType := dbmData.tblTransactions['Type'] ;
 rAmount := dbmData.tblTransactions['Amount'] ;
 dDate := dbmData.tblTransactions['TransactionDate'] ;

 //display record information
  dbmData.tblTenants.First;
while not dbmData.tblTenants.eof do //loop through tblTenants
 begin

 if iTenantID = dbmData.tblTenants['TenantID'] then
   begin
   //extract name and surname from tblTenants
   sName := dbmData.tblTenants['FirstName'];
   sSurname := dbmData.tblTenants['Surname'];

    // Display in RichEdit
    with redReceipt do
    begin
    Clear;
    Lines.Add(uppercase(sType) + ' RECEIPT');
    Lines.Add('Date of payment: '+ dateToStr(dDate));
    Lines.Add('Billed to: ' + sName + ' ' + sSurname);
    Lines.Add('TenantID: '+ IntToStr(iTenantID));
    Lines.Add('Amount: '+ FloatToStrf(rAmount, ffCurrency,8,2));


    end;

    break; //end loop if record is found
   end; //end if
   dbmData.tblTenants.Next; //move to next record if not found

   end; //end while
end;

procedure TfrmAdmin.lblNextStudioClick(Sender: TObject);
begin
dbmData.dscStudios.DataSet := dbmData.tblStudios;
dbmData.tblStudios.Next;
end;

procedure TfrmAdmin.lblPrevClick(Sender: TObject);
var
sType, sName, sSurname : string;
rAmount : real;
iTransactionID, iTenantID : integer;
dDate : tDate;

begin
dbmData.tblTransactions.Prior; //btn prev


 //extract data
 iTenantID := dbmData.tblTransactions['TenantID'] ;
 iTransactionID := dbmData.tblTransactions['TransactionID'] ;
 sType := dbmData.tblTransactions['Type'] ;
 rAmount := dbmData.tblTransactions['Amount'] ;
 dDate := dbmData.tblTransactions['TransactionDate'] ;

 //display record information
  dbmData.tblTenants.First;
while not dbmData.tblTenants.eof do //loop through tblTenants
 begin

 if iTenantID = dbmData.tblTenants['TenantID'] then
   begin
   //extract name and surname from tblTenants
   sName := dbmData.tblTenants['FirstName'];
   sSurname := dbmData.tblTenants['Surname'];

    // Display in RichEdit
    with redReceipt do
    begin
    Clear;
    Lines.Add(uppercase(sType) + ' RECEIPT');
    Lines.Add('Date of payment: '+ dateToStr(dDate));
    Lines.Add('Billed to: ' + sName + ' ' + sSurname);
    Lines.Add('TenantID: '+ IntToStr(iTenantID));
    Lines.Add('Amount: '+ FloatToStrf(rAmount, ffCurrency,8,2));
    end;

    break; //end loop if record is found
   end; //end if
   dbmData.tblTenants.Next; //move to next record if not found

   end; //end while


 end;




procedure TfrmAdmin.lblPrevStudioClick(Sender: TObject);
begin
dbmData.dscStudios.DataSet := dbmData.tblStudios;
dbmData.tblStudios.prior;
end;

procedure TfrmAdmin.sbxTenantsEnter(Sender: TObject);
begin
dbmData.dscTenants.DataSet := dbmData.qryTenants;
dbmData.qryTenants.Close;
dbmData.qryTenants.sql.Text := 'SELECT * FROM tblTenants WHERE FirstName LIKE %' + sbxTenants.text+
                                                              '% OR Surname LIKE %' + sbxTenants.text +
                                                              '% OR IDNumber LIKE %' +sbxTenants.text+ '%';
dbmData.qryTenants.open;
end;

procedure TfrmAdmin.sbxTenantsInvokeSearch(Sender: TObject);
begin
dbmData.dscTenants.DataSet := dbmData.qryTenants;
dbmData.qryTenants.Close;
dbmData.qryTenants.sql.Text := 'SELECT * FROM tblTenants WHERE FirstName LIKE %' + sbxTenants.text+
                                                              '% OR Surname LIKE %' + sbxTenants.text +
                                                              '% OR IDNumber LIKE %' +sbxTenants.text+ '%';
dbmData.qryTenants.open;
end;

procedure TfrmAdmin.sedDayChange(Sender: TObject);
var
sDay, sLine : string;
i : integer;
begin
sDay := IntToStr(sedDay.value);
//loop through memLease
  for i := 0 to memLease.Lines.Count - 1 do
  begin
    sLine :=  memLease.Lines[i];
    if Pos('Payment Day:', sLine) = 1 then // check if line starts with "Payment Day:"
    begin
       memLease.Lines[i] := sDay;//replace
        arrLease.PaymentDate := StrToInt(sDay); // Update EndDate
      Break; //stop loop
    end;
  end;//end for
end;

procedure TfrmAdmin.tbsNewTenantShow(Sender: TObject);
begin

cmbStudioID.Clear;

dbmData.tblStudios.First;

//loop through tblStudios to add only studios that are availale
while not dbmData.tblStudios.Eof do
begin
  if dbmData.tblStudios['Status'] = 'Available' then
  begin
    // Add the studio (e.g., StudioName or any relevant field) to the combobox
    cmbStudioID.Items.Add(dbmData.tblStudios['StudioID']);
  end;

  // Move to the next record
  dbmData.tblStudios.Next;
end;//end while

end;

end.
