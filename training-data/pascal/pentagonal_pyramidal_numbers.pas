program PentagonalPyramidalNumbers;
{ n^2(n+1)/2 }

function Term(n: Int64): Int64;
begin
  Term := ((n * n) * (n + 1)) div 2;
end;

var
  n: Int64;
begin
  for n := 1 to 15 do
    WriteLn(n:2, ' -> ', Term(n));
end.
