program PointerLinkedListDemo;

type
  PNode = ^TNode;
  TNode = record
    value: Integer;
    next: PNode;
  end;

var
  head, current, newNode: PNode;
  values: array[0..4] of Integer = (1, 2, 3, 4, 5);
  i: Integer;
begin
  head := nil;
  for i := 4 downto 0 do
  begin
    New(newNode);
    newNode^.value := values[i];
    newNode^.next := head;
    head := newNode;
  end;
  current := head;
  while current <> nil do
  begin
    Write(current^.value, ' ');
    current := current^.next;
  end;
  WriteLn;
end.
