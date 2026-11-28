program InsertInterval;
type
  TInterval = record lo, hi: Integer; end;
const
  Ivs: array[0..1] of TInterval = ((lo: 1; hi: 3), (lo: 6; hi: 9));
var
  nlo, nhi, i: Integer;
  placed: Boolean;
begin
  nlo := 2; nhi := 5; placed := False;
  for i := 0 to High(Ivs) do
    if Ivs[i].hi < nlo then
      Write('[', Ivs[i].lo, ',', Ivs[i].hi, '] ')
    else if Ivs[i].lo > nhi then
    begin
      if not placed then begin Write('[', nlo, ',', nhi, '] '); placed := True; end;
      Write('[', Ivs[i].lo, ',', Ivs[i].hi, '] ');
    end
    else
    begin
      if Ivs[i].lo < nlo then nlo := Ivs[i].lo;
      if Ivs[i].hi > nhi then nhi := Ivs[i].hi;
    end;
  if not placed then Write('[', nlo, ',', nhi, '] ');
  WriteLn; { [1,5] [6,9] }
end.
