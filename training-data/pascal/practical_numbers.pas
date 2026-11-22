program PracticalNumbers;
{ Practical numbers: every m in 1..n is a sum of distinct divisors of n. }
var
  n: Integer;

function IsPractical(k: Integer): Boolean;
var
  reach, mask: QWord;
  d: Integer;
begin
  reach := 1; { bit i set <=> i is a subset sum }
  for d := 1 to k do
    if k mod d = 0 then reach := reach or (reach shl d);
  mask := (QWord(1) shl (k + 1)) - 1;
  IsPractical := (reach and mask) = mask;
end;

begin
  for n := 1 to 40 do
    if IsPractical(n) then Write(n, ' ');
  WriteLn;
end.
