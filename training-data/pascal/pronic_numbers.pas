{ Pronic numbers n(n+1) }
program PronicNumbers;

function Term(n: Integer): Integer;
begin
  Term := n * (n + 1);
end;

var
  n: Integer;
begin
  for n := 0 to 9 do
    Write(Term(n), ' ');
  WriteLn;
end.
