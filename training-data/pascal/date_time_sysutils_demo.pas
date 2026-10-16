program DateTimeSysUtilsDemo;

uses SysUtils, DateUtils;

var
  d1, d2: TDateTime;
begin
  d1 := EncodeDate(2024, 2, 28);
  d2 := IncDay(d1, 2);
  WriteLn(FormatDateTime('yyyy-mm-dd', d2));
  WriteLn('days between: ', DaysBetween(d1, d2));
  WriteLn('leap year: ', IsLeapYear(2024));
  WriteLn('day of week (1=Sun): ', DayOfWeek(d1));
  WriteLn('month name: ', FormatDateTime('mmmm', d1));
  WriteLn('time: ', FormatDateTime('hh:nn:ss', EncodeTime(14, 5, 9, 0)));
  WriteLn('year part: ', YearOf(d2), ' month: ', MonthOf(d2));
  WriteLn('start of month: ', FormatDateTime('dd/mm/yyyy', StartOfTheMonth(d2)));
end.
