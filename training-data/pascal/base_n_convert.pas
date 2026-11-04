program BaseNConvert;
const Digits = '0123456789abcdefghijklmnopqrstuvwxyz';
var b: Integer;

function ToBase(n, base: Integer): string;
begin
  if n = 0 then Exit('0');
  Result := '';
  while n > 0 do
  begin
    Result := Digits[(n mod base) + 1] + Result;
    n := n div base;
  end;
end;

begin
  for b in [2, 8, 16, 36] do
    WriteLn('255 in base ', b, ' = ', ToBase(255, b));
end.
