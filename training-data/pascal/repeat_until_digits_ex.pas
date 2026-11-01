program RepeatUntilDigitsEx;
var N, S: Integer;
begin
  N := 98765; S := 0;
  repeat
    S := S + N mod 10;
    N := N div 10;
  until N = 0;
  WriteLn('digit sum = ', S);
end.
