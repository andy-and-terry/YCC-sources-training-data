program PascalTriangle;

const
  Rows = 7;

var
  t: array[0..Rows - 1, 0..Rows - 1] of LongInt;
  r, c: Integer;
begin
  for r := 0 to Rows - 1 do
  begin
    t[r, 0] := 1;
    t[r, r] := 1;
    for c := 1 to r - 1 do
      t[r, c] := t[r - 1, c - 1] + t[r - 1, c];
    for c := 0 to r do
      Write(t[r, c], ' ');
    WriteLn;
  end;
end.
