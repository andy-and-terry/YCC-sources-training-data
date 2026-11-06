{ Highest value reached by the Collatz (hailstone) sequence from n. }
program HailstonePeak;

function Peak(n: Int64): Int64;
var
  best: Int64;
begin
  best := n;
  while n <> 1 do
  begin
    if Odd(n) then n := 3 * n + 1 else n := n div 2;
    if n > best then best := n;
  end;
  Peak := best;
end;

begin
  WriteLn(Peak(27));
end.
