program SubrangeTypeDemo;

type
  Percentage = 0..100;
  Month = 1..12;

var
  score: Percentage;
  m: Month;
begin
  score := 87;
  WriteLn('Score: ', score);
  for m := 1 to 12 do Write(m, ' ');
  WriteLn;
end.
