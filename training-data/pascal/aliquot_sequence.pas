program AliquotSequence;
{ Aliquot sequence: replace n by the sum of its proper divisors. }

function AliquotSum(n: Integer): Integer;
var
  d, s: Integer;
begin
  s := 0;
  for d := 1 to n div 2 do
    if n mod d = 0 then s := s + d;
  AliquotSum := s;
end;

var
  n, count: Integer;
begin
  n := 12;
  Write(n);
  count := 0;
  while (n > 1) and (count < 19) do
  begin
    n := AliquotSum(n);
    Write(' ', n);
    Inc(count);
  end;
  WriteLn;
end.
