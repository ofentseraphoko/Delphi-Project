unit Calculations_u;

interface
uses SysUtils, Math;

type
TCalculations = Class

private
fNow,fThen : TDate;
fAmount, fPercentage, fFloor : real;
fWindow, fNumber : integer;
public
constructor create;
function calculateDuration(fNow:TDate;fThen:TDate):TDate;
function calculateRent(fFloor:real; fWindow : integer) : real;
function addPercentage(fAmount:real; fPercentage: real) : real;

End;
implementation

{ TCaculations }

function TCalculations.addPercentage(fAmount, fPercentage: real): real;
begin
result := fAmount + fPercentage ;
end;

function TCalculations.calculateDuration(fNow, fThen: TDate): TDate;
begin
result := fThen-fNow;
end;

function TCalculations.calculateRent(fFloor: real; fWindow: integer): real;
begin
result := (fFloor*fWindow)*180;
end;

constructor TCalculations.create;
begin

end;



end.
