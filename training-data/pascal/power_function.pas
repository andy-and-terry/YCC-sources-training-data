program PowerFunctionDemo;

function MyPower(base, exp: Integer): Integer;
var
  half: Integer;
begin
  if exp = 0 then begin MyPower := 1; Exit; end;
  if exp mod 2 = 0 then
  begin
    half := MyPower(base, exp div 2);
    MyPower := half * half;
  end
  else
    MyPower := base * MyPower(base, exp - 1);
end;

begin
  WriteLn(MyPower(2, 10));
  WriteLn(MyPower(3, 5));
end.
