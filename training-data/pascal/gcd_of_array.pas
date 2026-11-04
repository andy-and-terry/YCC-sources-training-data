program GcdOfArray;
type TIntArray = array of Integer;

function Gcd(a, b: Integer): Integer;
var t: Integer;
begin
  a := Abs(a); b := Abs(b);
  while b <> 0 do begin t := a mod b; a := b; b := t; end;
  Result := a;
end;

function GcdAll(const v: array of Integer): Integer;
var i: Integer;
begin
  Result := 0;
  for i := Low(v) to High(v) do Result := Gcd(Result, v[i]);
end;

begin
  WriteLn(GcdAll([12, 18, 24]));
  WriteLn(GcdAll([7, 13]));
end.
