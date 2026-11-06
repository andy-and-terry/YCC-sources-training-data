{ Repunits: numbers made only of the digit 1. }
program RepunitNumbers;
var
  r: Int64;
  i: Integer;
begin
  r := 0;
  for i := 1 to 5 do
  begin
    r := r * 10 + 1;
    Write(r, ' ');
  end;
  WriteLn;
end.
