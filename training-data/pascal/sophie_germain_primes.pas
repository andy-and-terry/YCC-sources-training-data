program SophieGermainPrimes;

function IsPrime(n: LongInt): Boolean;
var i: LongInt;
begin
  IsPrime := n >= 2;
  i := 2;
  while IsPrime and (i * i <= n) do
  begin
    if n mod i = 0 then IsPrime := False;
    Inc(i);
  end;
end;

var p, count: LongInt;
begin
  count := 0;
  p := 2;
  while count < 10 do
  begin
    if IsPrime(p) and IsPrime(2 * p + 1) then
    begin
      Write(p, ' ');
      Inc(count);
    end;
    Inc(p);
  end;
  WriteLn; { 2 3 5 11 23 29 41 53 83 89 }
end.
