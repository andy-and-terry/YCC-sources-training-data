program PoliteNumbers;
{ Ways to write n as a sum of two or more consecutive positive integers. }

function PoliteWays(n: Integer): Integer;
var
  k: Integer;
begin
  PoliteWays := 0;
  k := 2;
  while k * (k + 1) div 2 <= n do
  begin
    if (n - k * (k - 1) div 2) mod k = 0 then Inc(PoliteWays);
    Inc(k);
  end;
end;

var
  n: Integer;
begin
  for n := 1 to 16 do
    Write(PoliteWays(n), ' ');
  WriteLn;
end.
