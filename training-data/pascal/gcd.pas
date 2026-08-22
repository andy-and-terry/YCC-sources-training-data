program GcdDemo;

function Gcd(a, b: Integer): Integer;
var
  temp: Integer;
begin
  while b <> 0 do
  begin
    temp := b;
    b := a mod b;
    a := temp;
  end;
  Gcd := a;
end;

begin
  WriteLn(Gcd(48, 18));
  WriteLn(Gcd(100, 75));
end.
