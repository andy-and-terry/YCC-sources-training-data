program ExtendedEuclideanDemo;

var
  gcdResult, bezoutX, bezoutY: Integer;

procedure ExtGcd(a, b: Integer; var g, x, y: Integer);
var
  x1, y1: Integer;
begin
  if b = 0 then
  begin
    g := a;
    x := 1;
    y := 0;
    Exit;
  end;
  ExtGcd(b, a mod b, g, x1, y1);
  x := y1;
  y := x1 - (a div b) * y1;
end;

begin
  ExtGcd(30, 20, gcdResult, bezoutX, bezoutY);
  WriteLn('gcd: ', gcdResult);
  WriteLn('bezout: ', bezoutX, ' ', bezoutY);
  WriteLn('check: ', 30 * bezoutX + 20 * bezoutY);

  ExtGcd(240, 46, gcdResult, bezoutX, bezoutY);
  WriteLn('gcd: ', gcdResult);
  WriteLn('bezout: ', bezoutX, ' ', bezoutY);
  WriteLn('check: ', 240 * bezoutX + 46 * bezoutY);
end.
