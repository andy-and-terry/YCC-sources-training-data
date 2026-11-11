{ Centered square numbers 2n(n+1)+1 }
program CenteredSquareNumbers;

function Term(n: Integer): Integer;
begin
  Term := ((2 * n) * (n + 1)) + 1;
end;

var
  n: Integer;
begin
  for n := 0 to 9 do
    Write(Term(n), ' ');
  WriteLn;
end.
