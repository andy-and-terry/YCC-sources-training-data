program PatienceLis;
const A: array[1..8] of integer = (10, 9, 2, 5, 3, 7, 101, 18);
var tails: array[1..8] of integer; len, i, lo, hi, mid: integer;
begin
  len := 0;
  for i := 1 to 8 do
  begin
    lo := 1; hi := len + 1;
    while lo < hi do
    begin
      mid := (lo + hi) div 2;
      if tails[mid] < A[i] then lo := mid + 1 else hi := mid;
    end;
    tails[lo] := A[i];
    if lo > len then len := lo;
  end;
  WriteLn(len);
end.
