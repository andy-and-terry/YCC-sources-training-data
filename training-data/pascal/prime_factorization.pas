program PrimeFactorization;

procedure Factorize(n: LongInt);
var
  p: LongInt;
  first: Boolean;
begin
  Write(n, ' = ');
  p := 2;
  first := True;
  while p * p <= n do
  begin
    while n mod p = 0 do
    begin
      if not first then Write(' * ');
      Write(p);
      first := False;
      n := n div p;
    end;
    Inc(p);
  end;
  if n > 1 then
  begin
    if not first then Write(' * ');
    Write(n);
  end;
  WriteLn;
end;

begin
  Factorize(360);
  Factorize(97);
  Factorize(1001);
end.
