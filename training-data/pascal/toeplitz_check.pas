program ToeplitzCheck;
type
  TMatrix = array[1..3, 1..3] of Integer;

function IsToeplitz(const m: TMatrix): Boolean;
var i, j: Integer;
begin
  for i := 2 to 3 do
    for j := 2 to 3 do
      if m[i, j] <> m[i - 1, j - 1] then Exit(False);
  Result := True;
end;

const
  A: TMatrix = ((1, 2, 3), (4, 1, 2), (5, 4, 1));
  B: TMatrix = ((1, 2, 3), (4, 5, 2), (5, 4, 1));
begin
  WriteLn(IsToeplitz(A));
  WriteLn(IsToeplitz(B));
end.
