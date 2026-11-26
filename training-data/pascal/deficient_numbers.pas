{ Deficient numbers below 100; expect 76. }
program DeficientNumbers;

var c, p, n: Integer;

function ProperSum(n: Integer): Integer;
var d: Integer;
begin
  ProperSum := 0;
  for d := 1 to n - 1 do
    if n mod d = 0 then ProperSum := ProperSum + d;
end;

begin
  c := 0;
  for n := 1 to 99 do
    if ProperSum(n) < n then Inc(c);
  WriteLn(c);
end.
