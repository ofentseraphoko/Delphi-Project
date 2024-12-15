unit StudioHive_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, conData_u, Admin_u, Tenants_u, TenantAcc_u,
  Vcl.Imaging.jpeg;

type
  TfrmLogin = class(TForm)
    lblWelcome: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    btnLogin: TButton;
    lblAdmin: TLabel;
    Button1: TButton;
    Button2: TButton;
    lblNew: TLabel;
    Button3: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure lblAdminClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure lblNewClick(Sender: TObject);
  private
    { Private declarations }
    objTenantAcc : TTenantAcc;
  public
    { Public declarations }
    var
     sID: string;
  end;

var
  frmLogin: TfrmLogin;


implementation

{$R *.dfm}

procedure TfrmLogin.btnLoginClick(Sender: TObject);//tenant login
var
sPassword, sUsername : string;
bSuccess : boolean;
begin

//extract user input
sUsername := edtUsername.Text;
sPassword :=  edtPassword.Text;
//initialize login flag
bSuccess := false;

//loop through tblPasswords to verify login details
dbmData.tblPasswords.First;
 while NOT dbmData.tblPasswords.eof do
      begin

       if (sUsername =dbmData.tblPasswords['Username']) AND (sPassword =dbmData.tblPasswords['Password']) then
          begin
          bSuccess := true;
           frmTenants.show;//take to tenant dashboard
           //frmLogin.close;
           break;
          end;

           dbmData.tblPasswords.Next;
       end; //end while

//incorrect login details
if NOT bSuccess then
   begin
   //error message
   messagedlg('Incorrect username or password. Try Again', mtError, [mbOk],0);
   end;
 end;



procedure TfrmLogin.Button1Click(Sender: TObject);
begin
frmAdmin.Show;
end;

procedure TfrmLogin.Button2Click(Sender: TObject);
begin
frmTenants.show;
end;

procedure TfrmLogin.lblAdminClick(Sender: TObject);
var
tAdmin : textfile;
sLine, sAdminUsername, sAdminPassword, sUsername, sPassword : string;
begin
//admin login
//extract user input
sUsername := inputbox('Admin Login', 'Enter username','');
sPassword := inputbox('Admin Login', 'Enter Password','');

//read from textfile
 assignfile(tAdmin, 'Admin.txt');
 reset(tAdmin);
 while NOT eof(tAdmin) do
   begin
   readln(tAdmin,sLine);
   //extract saved username
   sAdminUsername := copy(sLine,1,pos('#',sLine)-1);
   delete(sLine, 1, pos('#', sLine));
   //extract saved password
   sAdminPassword := copy(sLine, 1, pos('#', sLine) - 1);
   delete(sLine, 1, pos('#', sLine));

   //validate entered details
    if (sUsername=sAdminUsername) AND (sPassword=sAdminPassword)then
       begin
        frmAdmin.Show; //take to admin dashboard
       //frmLogin.close;
       end
       else begin
       messagedlg('Incorrect username or password', mtError, [mbOk],0); //error message
       end;

   end;
end;

procedure TfrmLogin.lblNewClick(Sender: TObject);
var

bFound : boolean;
begin
bFound := false;
sID := inputbox('Login with ID Number', 'Enter SA ID Number', ''); //get user ID

if sID.Length =13 then
   begin
   dbmData.tblTenants.last; //start from the bottom
   while not dbmData.tblTenants.bof do
      begin
      if sID =  dbmData.tblTenants['IDNumber'] then
         begin
         bFound := true;
         with frmTenants do //redirect user to frmTenants
              begin
              show;
               pgcTenants.Show;
               pgcTenants.ActivePageIndex := 3; //go to tbsSettings
               //make other tabs unaccesible until user enters all their info in tbsSettings
               tbsHome.TabVisible := False;
               tbsTransactions.TabVisible := False;
               tbsLease.TabVisible := False;
               break; //stop loop
              end;
         end;//end if
       dbmData.tblTenants.prior; //go to previous record
      end; //end while

    if NOT bFound then
       showmessage('No match found.'); //error message if no match is found

   end
   else begin //ID number not 13 digits
   showmessage('ID number must be 13 digits.');
   end;

end;

end.
