program QuickSelectDemo;

function Partition(var arr: array of Integer; low, high: Integer): Integer;
var
  pivot, i, j, temp: Integer;
begin
  pivot := arr[high];
  i := low - 1;
  for j := low to high - 1 do
    if arr[j] <= pivot then
    begin
      i := i + 1;
      temp := arr[i];
      arr[i] := arr[j];
      arr[j] := temp;
    end;
  temp := arr[i + 1];
  arr[i + 1] := arr[high];
  arr[high] := temp;
  Partition := i + 1;
end;

function QuickSelect(var arr: array of Integer; low, high, k: Integer): Integer;
var
  pivotIndex: Integer;
begin
  if low = high then
  begin
    QuickSelect := arr[low];
    Exit;
  end;
  pivotIndex := Partition(arr, low, high);
  if k = pivotIndex then
    QuickSelect := arr[k]
  else if k < pivotIndex then
    QuickSelect := QuickSelect(arr, low, pivotIndex - 1, k)
  else
    QuickSelect := QuickSelect(arr, pivotIndex + 1, high, k);
end;

var
  data: array[0..7] of Integer = (7, 2, 9, 4, 1, 8, 3, 6);
  n, k: Integer;
begin
  n := 8;
  k := 2;
  WriteLn(QuickSelect(data, 0, n - 1, n - 1 - k));
end.
