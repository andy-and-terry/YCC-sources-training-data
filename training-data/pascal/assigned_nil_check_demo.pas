program AssignedNilCheckDemo;

type
  PNode = ^TNode;
  TNode = record
    Value: Integer;
    Next: PNode;
  end;

procedure Describe(p: PNode);
begin
  // Assigned(p) is the idiomatic test for a non-nil pointer.
  if Assigned(p) then
    WriteLn('node holds ', p^.Value)
  else
    WriteLn('pointer is nil');
end;

var
  head, cur: PNode;
  i: Integer;
begin
  head := nil;
  Describe(head);

  // Build a three element list by prepending.
  for i := 1 to 3 do
  begin
    New(cur);
    cur^.Value := i * 10;
    cur^.Next := head;
    head := cur;
  end;
  Describe(head);

  // Walk until the nil terminator and free each node.
  while Assigned(head) do
  begin
    cur := head;
    head := head^.Next;
    Write(cur^.Value, ' ');
    Dispose(cur);
  end;
  WriteLn;
  Describe(head);
end.
