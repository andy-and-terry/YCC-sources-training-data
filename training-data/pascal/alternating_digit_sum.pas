program AlternatingDigitSum;

function Ads(n: Integer): Integer;
var
  total, sign: Integer;
begin
  total := 0;
  sign := 1;
  while n > 0 do
  begin
    total := total + sign * (n mod 10);
    sign := -sign;
    n := n div 10;
  end;
  Ads := total;
end;

begin
  WriteLn(1234, ' ', Ads(1234));
  WriteLn(99999, ' ', Ads(99999));
  WriteLn(1000, ' ', Ads(1000));
end.
