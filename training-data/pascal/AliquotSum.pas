program AliquotSum;
{ Aliquot sum classification. }
const V: array[1..4] of Integer = (6, 12, 15, 28);
var i, d, a: Integer;
begin
  for i := 1 to 4 do begin
    a := 0;
    for d := 1 to V[i] - 1 do if V[i] mod d = 0 then a := a + d;
    Write(V[i], ' ', a, ' ');
    if a = V[i] then WriteLn('perfect')
    else if a > V[i] then WriteLn('abundant')
    else WriteLn('deficient');
  end;
end.
