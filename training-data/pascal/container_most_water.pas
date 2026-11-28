program ContainerMostWater;
const
  H: array[0..8] of Integer = (1, 8, 6, 2, 5, 4, 8, 3, 7);
var
  lo, hi, best, m, area: Integer;
begin
  lo := 0; hi := High(H); best := 0;
  while lo < hi do
  begin
    if H[lo] < H[hi] then m := H[lo] else m := H[hi];
    area := m * (hi - lo);
    if area > best then best := area;
    if H[lo] < H[hi] then Inc(lo) else Dec(hi);
  end;
  WriteLn(best); { 49 }
end.
