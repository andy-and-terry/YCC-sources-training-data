program ConstArrayLookupDemo;

const
  DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
  MonthNames: array[1..12] of string = ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

function IsLeap(y: Integer): Boolean;
begin
  IsLeap := ((y mod 4 = 0) and (y mod 100 <> 0)) or (y mod 400 = 0);
end;

function DaysIn(m, y: Integer): Integer;
begin
  if (m = 2) and IsLeap(y) then DaysIn := 29 else DaysIn := DaysInMonth[m];
end;

var
  m: Integer;
begin
  for m := 1 to 12 do
    WriteLn(MonthNames[m], ': ', DaysIn(m, 2024));
end.
