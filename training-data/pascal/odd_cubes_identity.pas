program OddCubesIdentity;

function CubeFromOdds(n: Integer): Integer;
var
  start, i, sum: Integer;
begin
  start := n * n - n + 1;
  sum := 0;
  for i := 0 to n - 1 do
    sum := sum + start + 2 * i;
  CubeFromOdds := sum;
end;

var
  n: Integer;
begin
  for n := 1 to 5 do
    WriteLn(n, ' ', CubeFromOdds(n), ' ', CubeFromOdds(n) = n * n * n);
end.
