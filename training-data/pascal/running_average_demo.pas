program RunningAverageDemo;

const
  Data: array[1..8] of Double = (2, 4, 6, 8, 10, 7, 5, 3);
  Window = 3;

var
  i, k: Integer;
  sum, total: Double;
begin
  total := 0;
  for i := 1 to High(Data) do
  begin
    total := total + Data[i];
    Write('avg so far ', (total / i):0:2);

    if i >= Window then
    begin
      sum := 0;
      for k := i - Window + 1 to i do
        sum := sum + Data[k];
      Write('  window avg ', (sum / Window):0:2);
    end;
    WriteLn;
  end;
end.
