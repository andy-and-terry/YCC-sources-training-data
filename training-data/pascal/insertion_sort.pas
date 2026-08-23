program InsertionSortDemo;

procedure InsertionSort(var arr: array of Integer; n: Integer);
var
  i, j, key: Integer;
begin
  for i := 1 to n - 1 do
  begin
    key := arr[i];
    j := i - 1;
    while (j >= 0) and (arr[j] > key) do
    begin
      arr[j + 1] := arr[j];
      j := j - 1;
    end;
    arr[j + 1] := key;
  end;
end;

var
  data: array[0..4] of Integer = (12, 11, 13, 5, 6);
  k: Integer;
begin
  InsertionSort(data, 5);
  for k := 0 to 4 do
    Write(data[k], ' ');
  WriteLn;
end.
