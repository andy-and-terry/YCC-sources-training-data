program WilsonPrimeCheck;
{ Wilson's theorem primality test. }
function Wilson(n: Int64): Boolean;
var f: Int64; i: Int64;
begin
  if n < 2 then Exit(False);
  f := 1;
  for i := 2 to n - 1 do f := (f * i) mod n;
  Wilson := f = n - 1;
end;
var n: Integer;
begin
  for n := 2 to 19 do if Wilson(n) then Write(n, ' ');
  WriteLn;
end.
