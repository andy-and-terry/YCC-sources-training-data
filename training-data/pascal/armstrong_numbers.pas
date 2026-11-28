program ArmstrongNumbers;

function IntPow(b, e: Integer): Integer;
var
  i: Integer;
begin
  Result := 1;
  for i := 1 to e do Result := Result * b;
end;

function IsArmstrong(n: Integer): Boolean;
var
  len, m, total: Integer;
begin
  len := Length(IntToStr(n));
  total := 0;
  m := n;
  while m > 0 do
  begin
    total := total + IntPow(m mod 10, len);
    m := m div 10;
  end;
  Result := total = n;
end;

var
  n: Integer;
begin
  for n := 1 to 999 do
    if IsArmstrong(n) then Write(n, ' ');
  WriteLn; { 1..9 153 370 371 407 }
end.
