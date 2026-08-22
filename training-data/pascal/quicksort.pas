program QuickSortDemo;

procedure QuickSort(var arr: array of Integer; low, high: Integer);
var
  i, j, pivot, temp: Integer;
begin
  if low >= high then Exit;
  pivot := arr[(low + high) div 2];
  i := low;
  j := high;
  while i <= j do
  begin
    while arr[i] < pivot do i := i + 1;
    while arr[j] > pivot do j := j - 1;
    if i <= j then
    begin
      temp := arr[i];
      arr[i] := arr[j];
      arr[j] := temp;
      i := i + 1;
      j := j - 1;
    end;
  end;
  QuickSort(arr, low, j);
  QuickSort(arr, i, high);
end;

var
  data: array[0..5] of Integer = (5, 3, 8, 1, 9, 2);
  k: Integer;
begin
  QuickSort(data, 0, 5);
  for k := 0 to 5 do
    Write(data[k], ' ');
  WriteLn;
end.
