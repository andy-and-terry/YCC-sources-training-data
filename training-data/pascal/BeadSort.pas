program BeadSort;
{ Bead (gravity) sort. }
var
  nums: array[1..5] of Integer = (5, 3, 1, 4, 2);
  cols, rows: array[1..5] of Integer;
  i, j, r: Integer;
begin
  for i := 1 to 5 do begin
    cols[i] := 0;
    for j := 1 to 5 do if nums[j] >= i then Inc(cols[i]);
  end;
  for r := 1 to 5 do begin
    rows[6 - r] := 0;
    for i := 1 to 5 do if cols[i] >= r then Inc(rows[6 - r]);
  end;
  for i := 1 to 5 do Write(rows[i], ' ');
  WriteLn;
end.
