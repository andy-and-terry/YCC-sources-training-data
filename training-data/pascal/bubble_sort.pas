program BubbleSortDemo;

var
  data: array[0..5] of Integer = (5, 2, 9, 1, 5, 6);
  i, j, temp: Integer;
begin
  for i := 0 to 4 do
    for j := 0 to 4 - i do
      if data[j] > data[j + 1] then
      begin
        temp := data[j];
        data[j] := data[j + 1];
        data[j + 1] := temp;
      end;
  for i := 0 to 5 do
    Write(data[i], ' ');
  WriteLn;
end.
