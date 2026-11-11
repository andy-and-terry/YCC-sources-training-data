{ Amicable pairs: d(a) = b and d(b) = a with a <> b. }
program AmicablePairs;
var
  a, b: Integer;

function D(n: Integer): Integer;
var
  i, s: Integer;
begin
  s := 0;
  for i := 1 to n - 1 do
    if n mod i = 0 then s := s + i;
  D := s;
end;

begin
  for a := 2 to 1499 do
  begin
    b := D(a);
    if (b > a) and (D(b) = a) then WriteLn(a, ' ', b);
  end;
end.
