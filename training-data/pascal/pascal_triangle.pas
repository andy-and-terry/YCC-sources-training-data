program PascalTriangle;

const
  Rows = 6;

var
  tri: array[0..Rows - 1, 0..Rows - 1] of LongInt;
  r, c: Integer;
begin
  for r := 0 to Rows - 1 do
  begin
    tri[r, 0] := 1;
    tri[r, r] := 1;
    for c := 1 to r - 1 do
      tri[r, c] := tri[r - 1, c - 1] + tri[r - 1, c];
    for c := 0 to r do
      Write(tri[r, c], ' ');
    WriteLn;
  end;
end.
