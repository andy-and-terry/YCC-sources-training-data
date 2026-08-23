program CircularBufferDemo;

type
  CircularBuffer = record
    data: array[0..2] of Integer;
    capacity, size, start: Integer;
  end;

procedure Push(var buf: CircularBuffer; value: Integer);
var
  index: Integer;
begin
  index := (buf.start + buf.size) mod buf.capacity;
  buf.data[index] := value;
  if buf.size < buf.capacity then buf.size := buf.size + 1
  else buf.start := (buf.start + 1) mod buf.capacity;
end;

var
  buf: CircularBuffer;
  values: array[0..4] of Integer = (1, 2, 3, 4, 5);
  i: Integer;
begin
  buf.capacity := 3;
  buf.size := 0;
  buf.start := 0;
  for i := 0 to 4 do Push(buf, values[i]);
  for i := 0 to 2 do Write(buf.data[i], ' ');
  WriteLn;
end.
