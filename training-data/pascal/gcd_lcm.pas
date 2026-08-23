program GcdLcmDemo;

function MyGcd(a, b: Integer): Integer;
var
  t: Integer;
begin
  while b <> 0 do
  begin
    t := b;
    b := a mod b;
    a := t;
  end;
  MyGcd := Abs(a);
end;

function MyLcm(a, b: Integer): Integer;
begin
  MyLcm := Abs(a * b) div MyGcd(a, b);
end;

begin
  WriteLn(MyGcd(48, 18));
  WriteLn(MyLcm(4, 6));
end.
