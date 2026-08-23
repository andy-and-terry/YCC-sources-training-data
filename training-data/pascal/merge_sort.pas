program MergeSortDemo;

type
  IntArray = array[0..99] of Integer;

procedure Merge(var arr: IntArray; low, mid, high: Integer);
var
  temp: IntArray;
  i, j, k: Integer;
begin
  i := low; j := mid + 1; k := low;
  while (i <= mid) and (j <= high) do
  begin
    if arr[i] <= arr[j] then
    begin
      temp[k] := arr[i]; i := i + 1;
    end
    else
    begin
      temp[k] := arr[j]; j := j + 1;
    end;
    k := k + 1;
  end;
  while i <= mid do begin temp[k] := arr[i]; i := i + 1; k := k + 1; end;
  while j <= high do begin temp[k] := arr[j]; j := j + 1; k := k + 1; end;
  for i := low to high do arr[i] := temp[i];
end;

procedure MergeSort(var arr: IntArray; low, high: Integer);
var
  mid: Integer;
begin
  if low >= high then Exit;
  mid := (low + high) div 2;
  MergeSort(arr, low, mid);
  MergeSort(arr, mid + 1, high);
  Merge(arr, low, mid, high);
end;

var
  data: IntArray;
  k: Integer;
begin
  data[0] := 5; data[1] := 2; data[2] := 9; data[3] := 1; data[4] := 5; data[5] := 6;
  MergeSort(data, 0, 5);
  for k := 0 to 5 do
    Write(data[k], ' ');
  WriteLn;
end.
