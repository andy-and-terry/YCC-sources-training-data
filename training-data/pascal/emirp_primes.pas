program EmirpPrimes;

function IsPrime(n: Integer): Boolean;
var i: Integer;
begin
  IsPrime := n >= 2;
  i := 2;
  while IsPrime and (i * i <= n) do
  begin
    if n mod i = 0 then IsPrime := False;
    Inc(i);
  end;
end;

function Rev(n: Integer): Integer;
begin
  Rev := 0;
  while n > 0 do
  begin
    Rev := Rev * 10 + n mod 10;
    n := n div 10;
  end;
end;

var p: Integer;
begin
  for p := 2 to 99 do
    if IsPrime(p) and (Rev(p) <> p) and IsPrime(Rev(p)) then Write(p, ' ');
  WriteLn;
end.
