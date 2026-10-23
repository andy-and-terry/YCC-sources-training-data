program SmithNumbersDemo;

function DigitSum(n: Integer): Integer;
var
  total: Integer;
begin
  total := 0;
  while n > 0 do
  begin
    total := total + n mod 10;
    n := n div 10;
  end;
  DigitSum := total;
end;

function IsSmith(n: Integer): Boolean;
var
  m, p, factorSum, factorCount: Integer;
begin
  m := n;
  p := 2;
  factorSum := 0;
  factorCount := 0;
  while p * p <= m do
  begin
    while m mod p = 0 do
    begin
      factorSum := factorSum + DigitSum(p);
      Inc(factorCount);
      m := m div p;
    end;
    Inc(p);
  end;
  if m > 1 then
  begin
    factorSum := factorSum + DigitSum(m);
    Inc(factorCount);
  end;
  IsSmith := (factorCount > 1) and (factorSum = DigitSum(n));
end;

var
  n: Integer;
  first: Boolean;
begin
  first := True;
  for n := 4 to 99 do
    if IsSmith(n) then
    begin
      if not first then
        Write(' ');
      Write(n);
      first := False;
    end;
  WriteLn;
end.
