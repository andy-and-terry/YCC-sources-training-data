program ArmstrongNumberDemo;

function IsArmstrong(n: Integer): Boolean;
var
  digitsStr: string;
  power, total, i, d: Integer;
begin
  Str(n, digitsStr);
  power := Length(digitsStr);
  total := 0;
  for i := 1 to Length(digitsStr) do
  begin
    d := Ord(digitsStr[i]) - Ord('0');
    total := total + Round(Exp(power * Ln(d + 0.0)));
  end;
  IsArmstrong := total = n;
end;

begin
  WriteLn(IsArmstrong(153));
  WriteLn(IsArmstrong(154));
end.
