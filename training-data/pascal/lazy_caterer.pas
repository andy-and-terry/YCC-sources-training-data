{ Lazy caterer sequence: max pieces from n cuts }
program LazyCaterer;

function Term(n: Integer): Integer;
begin
  Term := ((n * (n + 1)) div 2) + 1;
end;

var
  n: Integer;
begin
  for n := 0 to 9 do
    Write(Term(n), ' ');
  WriteLn;
end.
