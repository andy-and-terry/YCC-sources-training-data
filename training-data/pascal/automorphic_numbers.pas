program AutomorphicNumbers;

function IsAutomorphic(n: Int64): Boolean;
var
  modulus, m: Int64;
begin
  modulus := 10;
  m := n;
  while m >= 10 do
  begin
    modulus := modulus * 10;
    m := m div 10;
  end;
  Result := (n * n) mod modulus = n;
end;

var
  n: Integer;
begin
  for n := 0 to 999 do
    if IsAutomorphic(n) then Write(n, ' ');
  WriteLn; { 0 1 5 6 25 76 376 625 }
end.
