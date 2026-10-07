program ConstLookupTableDemo;

type
  TDay = (Mon, Tue, Wed, Thu, Fri, Sat, Sun);

const
  DayNames: array[TDay] of string =
    ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
  DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
  Primes: array[0..4] of Integer = (2, 3, 5, 7, 11);
  Epsilon = 1e-6;
  Greeting = 'Hello';

function IsWeekend(d: TDay): Boolean;
begin
  IsWeekend := d in [Sat, Sun];
end;

var
  d: TDay;
  total, i: Integer;
begin
  for d := Low(TDay) to High(TDay) do
    WriteLn(DayNames[d]:10, ' weekend: ', IsWeekend(d));
  total := 0;
  for i := 1 to 12 do total := total + DaysInMonth[i];
  WriteLn('days per year: ', total);
  WriteLn(Greeting, ' ', Primes[High(Primes)], ' ', Epsilon:0:6);
end.
