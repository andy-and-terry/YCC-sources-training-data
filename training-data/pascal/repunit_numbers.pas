program RepunitNumbers;
{ Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1. }
var
  r: Int64;
  i: Integer;
begin
  r := 0;
  for i := 1 to 8 do
  begin
    r := r * 10 + 1;
    Write(r, ' ');
  end;
  WriteLn;
end.
