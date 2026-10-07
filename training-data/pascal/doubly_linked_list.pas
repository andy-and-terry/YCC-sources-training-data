program DoublyLinkedListDemo;

type
  PNode = ^TNode;
  TNode = record
    value: Integer;
    prev, next: PNode;
  end;

var
  head, tail, current, newNode: PNode;

procedure Append(var head, tail: PNode; value: Integer);
var
  n: PNode;
begin
  New(n);
  n^.value := value;
  n^.next := nil;
  n^.prev := tail;
  if tail <> nil then
    tail^.next := n
  else
    head := n;
  tail := n;
end;

var
  i: Integer;
  values: array[0..4] of Integer = (1, 2, 3, 4, 5);
begin
  head := nil;
  tail := nil;
  for i := 0 to 4 do
    Append(head, tail, values[i]);

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
