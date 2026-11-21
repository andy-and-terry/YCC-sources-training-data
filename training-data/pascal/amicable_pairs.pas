program AmicablePairs;
{ Amicable pairs below 1500 via sums of proper divisors. }
var
  a, b: Integer;

function S(n: Integer): Integer;
var
  d, t: Integer;
begin
  t := 0;
  for d := 1 to n - 1 do
    if n mod d = 0 then t := t + d;
  S := t;
end;

begin
  for a := 2 to 1499 do
  begin
    b := S(a);
    if (b > a) and (S(b) = a) then
      WriteLn(a, ' ', b);
  end;
end.
