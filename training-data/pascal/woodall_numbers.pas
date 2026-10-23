program WoodallNumbersDemo;

var
  n: Integer;
  w: Int64;
begin
  for n := 1 to 10 do
  begin
    w := Int64(n) * (Int64(1) shl n) - 1;
    if n > 1 then
      Write(' ');
    Write(w);
  end;
  WriteLn;
end.
