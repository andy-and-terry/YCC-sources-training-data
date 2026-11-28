program LahNumbers;

function Lah(n, k: Integer): Int64;
var c, f: Int64; i: Integer;
begin
  c := 1; f := 1;
  for i := 0 to k - 2 do c := c * (n - 1 - i) div (i + 1);
  for i := k + 1 to n do f := f * i;
  Lah := c * f;
end;

var n, k: Integer;
begin
  for n := 1 to 5 do
  begin
    for k := 1 to n do Write(Lah(n, k), ' ');
    WriteLn;
  end;
end.
