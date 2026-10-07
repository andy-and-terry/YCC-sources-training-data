program SieveOfSundaramDemo;

const
  Limit = 50;

var
  n, i, j: Integer;
  marked: array[1..25] of Boolean;

begin
  n := Limit div 2;
  for i := 1 to n do marked[i] := False;
  for i := 1 to n do
  begin
    j := i;
    while i + j + 2 * i * j <= n do
    begin
      marked[i + j + 2 * i * j] := True;
      j := j + 1;
    end;
  end;
  Write(2, ' ');
  for i := 1 to n do
    if not marked[i] then Write(2 * i + 1, ' ');
  WriteLn;
end.
