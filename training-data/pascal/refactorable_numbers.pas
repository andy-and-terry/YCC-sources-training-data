program RefactorableNumbers;

function Tau(n: Integer): Integer;
var d: Integer;
begin
  Tau := 0;
  for d := 1 to n do
    if n mod d = 0 then Inc(Tau);
end;

var n: Integer;
begin
  for n := 1 to 59 do
    if n mod Tau(n) = 0 then Write(n, ' ');
  WriteLn; { 1 2 8 9 12 18 24 36 40 56 }
end.
