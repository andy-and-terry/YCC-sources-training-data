program SetsEnumerationsRanges;

type
  TDay = (Mon, Tue, Wed, Thu, Fri, Sat, Sun);
  TDays = set of TDay;
  TDigit = 0..9;

var
  Work, Weekend, All: TDays;
  D: TDay;
  Dg: TDigit;
begin
  Work := [Mon .. Fri];
  Weekend := [Sat, Sun];
  All := Work + Weekend;
  WriteLn(Tue in Work, ' ', Sat in Work, ' ', Work * [Fri .. Sun] = [Fri]);
  Include(Weekend, Fri);
  Exclude(Weekend, Sun);
  for D := Low(TDay) to High(TDay) do
    if D in Weekend then Write(Ord(D), ' ');
  WriteLn;
  Dg := 7;
  WriteLn(Succ(Dg), ' ', Pred(Dg), ' ', Ord(High(TDay)), ' ', All - Work = [Sat, Sun]);
end.
