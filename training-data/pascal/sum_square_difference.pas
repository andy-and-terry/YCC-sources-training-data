{ Square of the sum minus sum of squares for 1..10 (expect 2640) }
program SumSquareDifference;

var
  i, sum, squares: Integer;
begin
  sum := 0; squares := 0;
  for i := 1 to 10 do
  begin
    sum := sum + i;
    squares := squares + i * i;
  end;
  WriteLn(sum * sum - squares);
end.
