program WhileDoDigitsDemo;

var
  n, count, rev: Integer;
begin
  n := 90210;
  count := 0;
  rev := 0;
  while n > 0 do
  begin
    rev := rev * 10 + n mod 10;
    n := n div 10;
    Inc(count);
  end;
  WriteLn('digits: ', count);
  WriteLn('reversed: ', rev);
end.
