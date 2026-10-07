program LinkedListReversePointerDemo;

type
  PNode = ^TNode;
  TNode = record
    value: Integer;
    next: PNode;
  end;

function BuildList(const values: array of Integer): PNode;
var
  head, tail, newNode: PNode;
  i: Integer;
begin
  head := nil;
  tail := nil;
  for i := Low(values) to High(values) do
  begin
    New(newNode);
    newNode^.value := values[i];
    newNode^.next := nil;
    if tail = nil then
      head := newNode
    else
      tail^.next := newNode;
    tail := newNode;
  end;
  BuildList := head;
end;

// reverses the list in place using three pointers, so no extra list
// is allocated: each node is re-linked to point back at the one that
// used to precede it.
function ReverseList(head: PNode): PNode;
var
  prev, current, nextNode: PNode;
begin
  prev := nil;
  current := head;
  while current <> nil do
  begin
    nextNode := current^.next;
    current^.next := prev;
    prev := current;
    current := nextNode;
  end;
  ReverseList := prev;
end;

procedure PrintList(head: PNode);
var
  current: PNode;
begin
  current := head;
  while current <> nil do
  begin
    Write(current^.value, ' ');
    current := current^.next;
  end;
  WriteLn;
end;

var
  list: PNode;
begin
  list := BuildList([1, 2, 3, 4, 5]);
  PrintList(list);
  list := ReverseList(list);
  PrintList(list);
end.
