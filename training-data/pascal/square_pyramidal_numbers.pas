program SquarePyramidalNumbers;
{ n(n+1)(2n+1)/6 }

function Term(n: Int64): Int64;
begin
  Term := ((n * (n + 1)) * ((2 * n) + 1)) div 6;
end;

var
  n: Int64;
begin
  for n := 1 to 15 do
    WriteLn(n:2, ' -> ', Term(n));
end.
