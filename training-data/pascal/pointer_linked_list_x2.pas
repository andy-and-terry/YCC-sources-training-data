program PointerLinkedListX2;
type
  PNode = ^TNode;
  TNode = record v: integer; next: PNode; end;
var head, n: PNode; i: integer;
begin
  head := nil;
  for i := 1 to 3 do begin new(n); n^.v := i; n^.next := head; head := n; end;
  n := head;
  while n <> nil do begin write(n^.v, ' '); n := n^.next; end;
  writeln;
end.
