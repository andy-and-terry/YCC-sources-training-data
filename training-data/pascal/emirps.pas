{ Emirps below 200; expect 15. }
program Emirps;

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

function Rev(n: Integer): Integer;
begin
  Rev := 0;
  while n > 0 do
  begin
    Rev := Rev * 10 + n mod 10;
    n := n div 10;
  end;
end;

begin
  c := 0;
  for n := 2 to 199 do
    if (Rev(n) <> n) and IsPrime(n) and IsPrime(Rev(n)) then Inc(c);
  WriteLn(c);
end.
