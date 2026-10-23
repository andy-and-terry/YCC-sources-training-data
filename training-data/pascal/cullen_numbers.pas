program CullenNumbersDemo;

var
  n: Integer;
  c: Int64;
begin
  for n := 0 to 9 do
  begin
    c := Int64(n) * (Int64(1) shl n) + 1;
    if n > 0 then
      Write(' ');
    Write(c);
  end;
  WriteLn;
end.
