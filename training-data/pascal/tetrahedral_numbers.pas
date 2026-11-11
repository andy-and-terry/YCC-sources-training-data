{ Tetrahedral numbers n(n+1)(n+2)/6 }
program TetrahedralNumbers;

function Term(n: Integer): Integer;
begin
  Term := ((n * (n + 1)) * (n + 2)) div 6;
end;

var
  n: Integer;
begin
  for n := 0 to 9 do
    Write(Term(n), ' ');
  WriteLn;
end.
