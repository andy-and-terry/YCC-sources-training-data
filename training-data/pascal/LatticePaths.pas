program LatticePaths;
{ Lattice paths with a DP row. }
const N = 3;
var row: array[0..N] of Int64; j, k: Integer;
begin
  for j := 0 to N do row[j] := 1;
  for k := 1 to N do
    for j := 1 to N do row[j] := row[j] + row[j - 1];
  WriteLn(row[N]);
end.
