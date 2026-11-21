program CantorPairing;
{ Cantor pairing function and its inverse. }
var
  x, y: LongInt;

function Pair(a, b: LongInt): LongInt;
begin
  Pair := (a + b) * (a + b + 1) div 2 + b;
end;

procedure Unpair(z: LongInt; var a, b: LongInt);
var
  w: LongInt;
begin
  w := (Trunc(Sqrt(8 * z + 1)) - 1) div 2;
  b := z - w * (w + 1) div 2;
  a := w - b;
end;

begin
  WriteLn(Pair(3, 4));
  Unpair(32, x, y);
  WriteLn(x, ' ', y);
end.
