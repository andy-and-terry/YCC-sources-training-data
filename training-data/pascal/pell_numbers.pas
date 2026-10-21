program PellNumbers;
{ P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1 }
var
  a, b, t: Int64;
  i: Integer;
begin
  a := 0;
  b := 1;
  for i := 0 to 14 do
  begin
    WriteLn('P(', i, ') = ', a);
    t := 2 * b + a;
    a := b;
    b := t;
  end;
end.
