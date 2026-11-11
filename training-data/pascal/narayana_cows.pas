{ Narayana's cows N(n)=N(n-1)+N(n-3) }
program NarayanaCows;

var
  v: array[0..9] of Integer;
  i: Integer;
begin
  v[0] := 1; v[1] := 1; v[2] := 1;
  for i := 3 to 9 do
    v[i] := v[i - 1] + v[i - 3];
  for i := 0 to 9 do
    Write(v[i], ' ');
  WriteLn;
end.
