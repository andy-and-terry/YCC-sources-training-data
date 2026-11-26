{ Squarefree numbers up to 100; expect 61. }
program SquarefreeNumbers;

var c, p, n: Integer;

function Squarefree(n: Integer): Boolean;
var d: Integer;
begin
  Squarefree := True;
  d := 2;
  while d * d <= n do
  begin
    if n mod (d * d) = 0 then Squarefree := False;
    Inc(d);
  end;
end;

begin
  c := 0;
  for n := 1 to 100 do
    if Squarefree(n) then Inc(c);
  WriteLn(c);
end.
