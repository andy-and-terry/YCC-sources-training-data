program FibbinaryNumbers;
{ Fibbinary numbers: no two adjacent 1 bits. }
var
  n: Integer;
begin
  for n := 0 to 49 do
    if (n and (n shr 1)) = 0 then Write(n, ' ');
  WriteLn;
end.
