program MultidimArrayDemo;

const
  N = 3;

var
  m: array[1..N, 1..N] of Integer;
  i, j: Integer;
begin
  for i := 1 to N do
    for j := 1 to N do
      m[i, j] := i * j;
  for i := 1 to N do
  begin
    for j := 1 to N do
      Write(m[i, j]:4);
    WriteLn;
  end;
end.
