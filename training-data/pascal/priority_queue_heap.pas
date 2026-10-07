program PriorityQueueHeapDemo;

const
  MaxSize = 100;

var
  heap: array[0..MaxSize-1] of Integer;
  size: Integer;

procedure Insert(value: Integer);
var
  i, parent, temp: Integer;
begin
  heap[size] := value;
  i := size;
  size := size + 1;
  while (i > 0) do
  begin
    parent := (i - 1) div 2;
    if heap[parent] <= heap[i] then Break;
    temp := heap[parent];
    heap[parent] := heap[i];
    heap[i] := temp;
    i := parent;
  end;
end;

function ExtractMin: Integer;
var
  i, left, right, smallest, temp: Integer;
begin
  ExtractMin := heap[0];
  size := size - 1;
  heap[0] := heap[size];
  i := 0;
  while True do
  begin
    left := 2 * i + 1;
    right := 2 * i + 2;
    smallest := i;
    if (left < size) and (heap[left] < heap[smallest]) then smallest := left;
    if (right < size) and (heap[right] < heap[smallest]) then smallest := right;
    if smallest = i then Break;
    temp := heap[i];
    heap[i] := heap[smallest];
    heap[smallest] := temp;
    i := smallest;
  end;
end;

var
  values: array[0..4] of Integer = (5, 1, 9, 3, 7);
  i: Integer;
begin
  size := 0;
  for i := 0 to 4 do Insert(values[i]);
  for i := 0 to 4 do Write(ExtractMin, ' ');
  WriteLn;
end.
