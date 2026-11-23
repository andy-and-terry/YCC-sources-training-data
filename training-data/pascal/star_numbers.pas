program StarNumbers;
{ 6n(n-1)+1 }

function Term(n: Int64): Int64;
begin
  Term := ((6 * n) * (n - 1)) + 1;
end;

var
  n: Int64;
begin
  for n := 1 to 15 do
    WriteLn(n:2, ' -> ', Term(n));
end.
