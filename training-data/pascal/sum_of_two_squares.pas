program SumOfTwoSquares;
{ Positive n expressible as a*a + b*b with a, b >= 0. }

function Representable(n: Integer): Boolean;
var
  a, b: Integer;
begin
  Representable := False;
  a := 0;
  while a * a <= n do
  begin
    b := a;
    while a * a + b * b <= n do
    begin
      if a * a + b * b = n then Representable := True;
      Inc(b);
    end;
    Inc(a);
  end;
end;

var
  n: Integer;
begin
  for n := 1 to 30 do
    if Representable(n) then Write(n, ' ');
  WriteLn;
end.
