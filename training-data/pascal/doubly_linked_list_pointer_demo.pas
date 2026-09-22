program DoublyLinkedListPointerDemo;

type
  PNode = ^TNode;
  TNode = record
    value: Integer;
    prev, next: PNode;
  end;

var
  head, tail, current, newNode: PNode;
  values: array[0..4] of Integer = (10, 20, 30, 40, 50);
  i: Integer;
begin
  head := nil;
  tail := nil;
  for i := 0 to 4 do
  begin
    New(newNode);
    newNode^.value := values[i];
    newNode^.next := nil;
    newNode^.prev := tail;
    if tail = nil then
      head := newNode
    else
      tail^.next := newNode;
    tail := newNode;
  end;

  Write('forward: ');
  current := head;
  while current <> nil do
  begin
    Write(current^.value, ' ');
    current := current^.next;
  end;
  WriteLn;

  Write('backward: ');
  current := tail;
  while current <> nil do
  begin
    Write(current^.value, ' ');
    current := current^.prev;
  end;
  WriteLn;
end.
