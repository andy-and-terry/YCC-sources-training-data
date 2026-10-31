program FactorionCheck;

const
  Fact: array[0..9] of LongInt = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880);

function IsFactorion(n: LongInt): Boolean;
var
  m, sum: LongInt;
begin
  m := n;
  sum := 0;
  while m > 0 do
  begin
    sum := sum + Fact[m mod 10];
    m := m div 10;
  end;
  IsFactorion := sum = n;
end;

var
  n: LongInt;
begin
  for n := 1 to 49999 do
    if IsFactorion(n) then Write(n, ' ');
  WriteLn;
end.
