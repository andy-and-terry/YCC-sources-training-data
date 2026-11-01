program PerniciousNumbers;
{ Pernicious numbers: the popcount is prime. }

function IsPrime(n: Integer): Boolean;
var
  d: Integer;
begin
  IsPrime := n >= 2;
  d := 2;
  while IsPrime and (d * d <= n) do
  begin
    if n mod d = 0 then IsPrime := False;
    Inc(d);
  end;
end;

function PopCount(n: Integer): Integer;
begin
  PopCount := 0;
  while n > 0 do
  begin
    PopCount := PopCount + (n and 1);
    n := n shr 1;
  end;
end;

var
  n: Integer;
begin
  for n := 1 to 20 do
    if IsPrime(PopCount(n)) then Write(n, ' ');
  WriteLn;
end.
