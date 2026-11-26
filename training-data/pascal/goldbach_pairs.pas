{ Goldbach partitions of 100; expect 6. }
program GoldbachPairs;

var c, p, n: Integer;

function IsPrime(n: Integer): Boolean;
var d: Integer;
begin
  IsPrime := n >= 2;
  d := 2;
  while IsPrime and (d * d <= n) do
  begin
    if n mod d = 0 then IsPrime := False;
    Inc(d);
  end;
end;

begin
  c := 0;
  for p := 2 to 50 do
    if IsPrime(p) and IsPrime(100 - p) then
    begin
      WriteLn(p, '+', 100 - p);
      Inc(c);
    end;
  WriteLn(c);
end.
