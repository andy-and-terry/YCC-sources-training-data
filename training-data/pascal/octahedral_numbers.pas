program OctahedralNumbers;
{ n(2n^2+1)/3 }

function Term(n: Int64): Int64;
begin
  Term := (n * (((2 * n) * n) + 1)) div 3;
end;

var
  n: Int64;
begin
  for n := 1 to 15 do
    WriteLn(n:2, ' -> ', Term(n));
end.
