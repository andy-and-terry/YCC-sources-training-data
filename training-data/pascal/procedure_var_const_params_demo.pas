program ParamModes;
procedure Demo(a: Integer; var b: Integer; const c: Integer; out d: Integer);
begin
  a := a + 1;
  b := b + 1;
  d := c * 2;
end;
var x, y, z: Integer;
begin
  x := 1; y := 1;
  Demo(x, y, 5, z);
  WriteLn(x, ' ', y, ' ', z);
end.
