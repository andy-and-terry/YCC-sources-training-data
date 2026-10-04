program ConstArrayLookup;

type
  TMonth = 1..12;

const
  MonthNames: array[TMonth] of string = (
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
  DaysIn: array[TMonth] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

var
  m: TMonth;
  total: Integer;
begin
  total := 0;
  for m := Low(TMonth) to High(TMonth) do
  begin
    WriteLn(MonthNames[m], ': ', DaysIn[m]);
    total := total + DaysIn[m];
  end;
  WriteLn('days in a common year: ', total);
end.
