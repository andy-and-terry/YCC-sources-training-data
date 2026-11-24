program RepunitNumbers;
{ Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1. }
var
  r: Int64;
  n: Integer;
begin
  r := 0;
  for n := 1 to 8 do
  begin
    r := r * 10 + 1;
    Write(r);
    if r mod 3 = 0 then Write('  (divisible by 3)');
    WriteLn;
  end;
end.
