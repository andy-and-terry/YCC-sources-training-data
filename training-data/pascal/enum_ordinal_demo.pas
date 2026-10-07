program EnumOrdinalDemo;

type
  Weekday = (Mon, Tue, Wed, Thu, Fri, Sat, Sun);

var
  day: Weekday;
begin
  day := Wed;
  WriteLn('Ord: ', Ord(day));
  WriteLn('Succ: ', Ord(Succ(day)));
  WriteLn('Pred: ', Ord(Pred(day)));
  WriteLn('Low: ', Ord(Low(Weekday)));
  WriteLn('High: ', Ord(High(Weekday)));
  for day := Mon to Sun do Write(Ord(day), ' ');
  WriteLn;
end.
