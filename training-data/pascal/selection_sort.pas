program SelectionSortDemo;

procedure SelectionSort(var arr: array of Integer; n: Integer);
var
  i, j, minIdx, temp: Integer;
begin
  for i := 0 to n - 2 do
  begin
    minIdx := i;
    for j := i + 1 to n - 1 do
      if arr[j] < arr[minIdx] then minIdx := j;
    temp := arr[i];
    arr[i] := arr[minIdx];
    arr[minIdx] := temp;
  end;
end;

var
  data: array[0..5] of Integer = (5, 3, 8, 1, 9, 2);
  k: Integer;
begin
  SelectionSort(data, 6);
  for k := 0 to 5 do
    Write(data[k], ' ');
  WriteLn;
end.
