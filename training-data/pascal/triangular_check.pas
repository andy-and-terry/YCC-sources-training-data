program TriangularCheck;
{ n is triangular iff 8n + 1 is a perfect square. }

function IsTriangular(n: Integer): Boolean;
var
  s, r: Integer;
begin
  s := 8 * n + 1;
  r := Round(Sqrt(s));
  IsTriangular := r * r = s;
end;

var
  n: Integer;
begin
  for n := 0 to 20 do
    if IsTriangular(n) then Write(n, ' ');
  WriteLn;
end.
