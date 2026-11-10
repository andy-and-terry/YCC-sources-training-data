program LazyCaterer;

function Pieces(cuts: Integer): Integer;
begin
  Pieces := (cuts * cuts + cuts + 2) div 2;
end;

var n: Integer;
begin
  for n := 0 to 9 do Write(Pieces(n), ' ');
  WriteLn; { 1 2 4 7 11 16 22 29 37 46 }
end.
