program DoublyLinkedListDemo;

type
  PNode = ^TNode;
  TNode = record
    value: Integer;
    prev, next: PNode;
  end;

var
  head, tail, current, newNode: PNode;
  values: array[0..4] of Integer = (1, 2, 3, 4, 5);
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
    if tail <> nil then tail^.next := newNode
    else head := newNode;
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
