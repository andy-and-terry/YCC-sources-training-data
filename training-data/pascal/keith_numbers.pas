program KeithNumbers;
{ Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits. }
var
  n: Integer;

function IsKeith(n: Integer): Boolean;
var
  seq: array[1..64] of Integer;
  tmp: array[1..10] of Integer;
  k, len, m, i, total: Integer;
begin
  k := 0;
  m := n;
  while m > 0 do
  begin
    Inc(k);
    tmp[k] := m mod 10;
    m := m div 10;
  end;
  for i := 1 to k do seq[i] := tmp[k + 1 - i];
  len := k;
  while seq[len] < n do
  begin
    total := 0;
    for i := len - k + 1 to len do total := total + seq[i];
    Inc(len);
    seq[len] := total;
  end;
  IsKeith := seq[len] = n;
end;

begin
  for n := 10 to 1199 do
    if IsKeith(n) then Write(n, ' ');
  WriteLn;
end.
