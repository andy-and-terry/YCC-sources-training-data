program NarayanaCowsSequence;
{ Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3) }
var
  n: array[0..14] of Int64;
  i: Integer;
begin
  n[0] := 1;
  n[1] := 1;
  n[2] := 1;
  for i := 3 to 14 do
    n[i] := n[i - 1] + n[i - 3];
  for i := 0 to 14 do
    Write(n[i], ' ');
  WriteLn;
end.
