program PentatopeNumbers;
{ n(n+1)(n+2)(n+3)/24 }

function Term(n: Int64): Int64;
begin
  Term := (((n * (n + 1)) * (n + 2)) * (n + 3)) div 24;
end;

var
  n: Int64;
begin
  for n := 1 to 15 do
    WriteLn(n:2, ' -> ', Term(n));
end.
