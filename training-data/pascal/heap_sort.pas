program HeapSortDemo;

var
  data: array[0..7] of Integer = (5, 3, 8, 1, 9, 2, 7, 4);
  n: Integer;

procedure Heapify(var arr: array of Integer; size, root: Integer);
var
  largest, left, right, temp: Integer;
begin
  largest := root;
  left := 2 * root + 1;
  right := 2 * root + 2;
  if (left < size) and (arr[left] > arr[largest]) then largest := left;
  if (right < size) and (arr[right] > arr[largest]) then largest := right;
  if largest <> root then
  begin
    temp := arr[root];
    arr[root] := arr[largest];
    arr[largest] := temp;
    Heapify(arr, size, largest);
  end;
end;

procedure HeapSort(var arr: array of Integer; size: Integer);
var
  i, temp: Integer;
begin
  for i := (size div 2) - 1 downto 0 do
    Heapify(arr, size, i);
  for i := size - 1 downto 1 do
  begin
    temp := arr[0];
    arr[0] := arr[i];
    arr[i] := temp;
    Heapify(arr, i, 0);
  end;
end;

var
  i: Integer;
begin
  n := 8;
  HeapSort(data, n);
  for i := 0 to n - 1 do
    Write(data[i], ' ');
  WriteLn;
end.
