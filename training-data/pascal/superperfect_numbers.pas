program SuperperfectNumbers;

function Sigma(n: Integer): Integer;
var d: Integer;
begin
  Sigma := 0;
  for d := 1 to n do
    if n mod d = 0 then Sigma := Sigma + d;
end;

var n: Integer;
begin
  for n := 1 to 99 do
    if Sigma(Sigma(n)) = 2 * n then Write(n, ' ');
  WriteLn; { 2 4 16 64 }
end.
