{$mode objfpc}{$H+}
{$inline on}
program InlineFunctionsDemo;

// `inline` asks the compiler to expand the body at each call site,
// avoiding call overhead for tiny helpers.
function Square(x: Integer): Integer; inline;
begin
  Result := x * x;
end;

function Clamp(v, lo, hi: Integer): Integer; inline;
begin
  if v < lo then Result := lo
  else if v > hi then Result := hi
  else Result := v;
end;

procedure Swap(var a, b: Integer); inline;
var
  t: Integer;
begin
  t := a;
  a := b;
  b := t;
end;

var
  i, total, x, y: Integer;
begin
  total := 0;
  for i := 1 to 10 do
    Inc(total, Square(i));
  WriteLn('sum of squares: ', total);

  for i := -5 to 15 do
    if i mod 10 = 0 then
      WriteLn('clamp(', i, ') = ', Clamp(i, 0, 10));

  x := 3;
  y := 9;
  Swap(x, y);
  WriteLn('x=', x, ' y=', y);
end.
