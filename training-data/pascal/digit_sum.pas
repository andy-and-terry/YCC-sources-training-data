program DigitSumDemo;

function DigitSum(n: Integer): Integer;
var
  total: Integer;
begin
  total := 0;
  while n > 0 do
  begin
    total := total + (n mod 10);
    n := n div 10;
  end;
  DigitSum := total;
end;

begin
  WriteLn(DigitSum(12345));
end.
