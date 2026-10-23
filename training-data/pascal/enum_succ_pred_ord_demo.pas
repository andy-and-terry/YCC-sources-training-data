program EnumSuccPredOrdDemo;

type
  TColor = (Red, Green, Blue, Yellow);

var
  c: TColor;
begin
  c := Green;
  WriteLn(Ord(c));
  WriteLn(Ord(Succ(c)));
  WriteLn(Ord(Pred(c)));
  c := TColor(3);
  WriteLn(Ord(c), ' ', Ord(High(TColor)), ' ', Ord(Low(TColor)));
  for c := Low(TColor) to High(TColor) do
    Write(Ord(c), ' ');
  WriteLn;
end.
