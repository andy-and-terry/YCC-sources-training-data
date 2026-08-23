program LeapYearDemo;

function IsLeapYear(year: Integer): Boolean;
begin
  IsLeapYear := ((year mod 4 = 0) and (year mod 100 <> 0)) or (year mod 400 = 0);
end;

begin
  WriteLn(IsLeapYear(2000));
  WriteLn(IsLeapYear(1900));
  WriteLn(IsLeapYear(2024));
end.
