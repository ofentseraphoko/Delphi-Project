unit TenantAcc_u;
interface
uses SysUtils, Math;
type
TTenantAcc = class
private
 fName, fID, fPassword, fSurname : string;
public
constructor create(fID, fName, fSurname : string) ;
function calculateAge(dtDate: TDateTime; fID : string) : integer;
function encryptPassword(fPassword: string) : string;
function generateUsername(fName: string;fSurname,fID:string):string;
function toString(sUsername:string):string;
end;


implementation

{ TAccount }



{ TTenantAcc }

function TTenantAcc.calculateAge(dtDate: TDateTime; fID: string): integer;
var
iYear, iYOB, iAge: integer ;
sDate, sDOB: string ;
begin
sDate := FormatDateTime('yyyy mmm dd', dtDate);  //format current date
iYear := StrToInt(copy(sDate,1,4)) ; //extract YYYY
iYoB := StrToInt(Copy(fID,1,2)); //extract YY part of ID number


//determine DoB in YYYY format
if iYOB >30 then  //pre millenial
 begin
 iAge :=  (iYear-iYOB) -1900 ;
 end
 else
if (iYOB>=00)AND (iYOB<30)then //post millenial
 begin
  iAge :=  (iYear-iYOB) -2000 ;
 end;

 result := iAge ;
end;



constructor TTenantAcc.create(fID, fName, fSurname: string);
begin

end;

function TTenantAcc.encryptPassword(fPassword: string): string;
begin

end;

function TTenantAcc.generateUsername(fName, fSurname,fID: string): string;
begin
result := fName + copy(fSurname,1,1) + copy(fID,1,8) ;
end;

function TTenantAcc.toString(sUsername: string): string;
begin

end;

end.
