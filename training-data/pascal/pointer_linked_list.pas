program PointerLinkedList;
type
  PNode = ^TNode;
  TNode = record
    Val: Integer;
    Next: PNode;
  end;
var head, n: PNode; i: Integer;
begin
  head := nil;
  for i := 1 to 3 do begin
    New(n); n^.Val := i; n^.Next := head; head := n;
  end;
  while head <> nil do begin
    Write(head^.Val, ' ');
    n := head; head := head^.Next; Dispose(n);
  end;
  WriteLn;
end.
