unit StudioHive_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, conData_u, Admin_u, Tenants_u, TenantAcc_u,
  Vcl.Imaging.jpeg, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP;

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
    lblForgot: TLabel;
    lblReset: TLabel;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    procedure btnLoginClick(Sender: TObject);
    procedure lblAdminClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure lblNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblResetClick(Sender: TObject);
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

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
//configure SMTP
IdSMTP1.Host := 'smtp.mail.yahoo.com'; // yahoo SMTP server
IdSMTP1.Port := 587;  // Port for STARTTLS
IdSMTP1.Username := 'studiohive@yahoo.com';
IdSMTP1.Password := 'stud10H1V3';
IdSMTP1.UseTLS := utUseExplicitTLS; // Use secure connection
IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1; // Assign SSL handler
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

procedure TfrmLogin.lblResetClick(Sender: TObject);   //password reset
var
sCode, sEmail : string;
bExists : boolean;
iTenantID : integer;
begin
//generate reset code
 sCode := inttostr(random(900000));
//initialize bExists
bExists := false;


 //get username
  sUsername := edtUsername.Text; //extract user email

  if sUsername = '' then //check if a username is entered
    begin
      showmessage('Enter a username');
    end
    else //check if username exists in database
    begin
     while NOT dbmData.tblPasswords.eof do
       begin
        if (sUsername =dbmData.tblPasswords['Username']) then
           begin
            bExists := true;
            iTenantID := dbmData.tblPasswords['TenantID']; //extract tenant ID
            //frmLogin.close;
            break;
           end;
        dbmData.tblPasswords.Next;//go to next record
       end; //end while
    end; //end if

if bExists = false then //error message if username does not exist
   showmessage('Username does not exist');

 //get user email from tblTenants
 while NOT dbmData.tblTenants.eof do
       begin
       if iTenantID = dbmData.tblTenants['TenantID'] then
          begin
          sEmail := dbmData.tblTenants['Email'];
          showmessage('Sending email to ' + sEmail);
          end;
       dbmData.tblTenants.Next;
       end; //end while



//configure email message
  IdMessage1.Clear;
  IdMessage1.From.Address := 'studiohive@yahoo.com';
  IdMessage1.Recipients.EmailAddresses := sEmail;
  IdMessage1.Subject := 'Password Reset Code';
  IdMessage1.Body.Text := 'Your reset code is: ' + sCode;

//send the email
   try

    IdSMTP1.Connect;
    IdSMTP1.Send(IdMessage1);
    IdSMTP1.Disconnect;
    ShowMessage('An email with the reset code has been sent.');
  except
    on E: Exception do
      ShowMessage('Error sending email: ' + E.Message);
  end;
end;

end.
