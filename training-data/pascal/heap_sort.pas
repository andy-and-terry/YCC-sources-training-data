program HeapSortDemo;

type
  IntArray = array[0..99] of Integer;

var
  arr: IntArray;

procedure Heapify(var a: IntArray; n, i: Integer);
var
  largest, left, right, temp: Integer;
begin
  largest := i;
  left := 2 * i + 1;
  right := 2 * i + 2;
  if (left < n) and (a[left] > a[largest]) then largest := left;
  if (right < n) and (a[right] > a[largest]) then largest := right;
  if largest <> i then
  begin
    temp := a[i];
    a[i] := a[largest];
    a[largest] := temp;
    Heapify(a, n, largest);
  end;
end;

procedure HeapSort(var a: IntArray; n: Integer);
var
  i, temp: Integer;
begin
  for i := (n div 2) - 1 downto 0 do
    Heapify(a, n, i);
  for i := n - 1 downto 1 do
  begin
    temp := a[0];
    a[0] := a[i];
    a[i] := temp;
    Heapify(a, i, 0);
  end;
end;

var
  i: Integer;
begin
  arr[0] := 5; arr[1] := 2; arr[2] := 9; arr[3] := 1; arr[4] := 5; arr[5] := 6; arr[6] := 3;
  HeapSort(arr, 7);
  for i := 0 to 6 do
    Write(arr[i], ' ');
  WriteLn;
end.
