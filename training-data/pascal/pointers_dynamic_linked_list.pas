program PointersDynamicLinkedList;

type
  PNode = ^TNode;
  TNode = record
    Value: Integer;
    Next: PNode;
  end;

procedure Push(var Head: PNode; V: Integer);
var N: PNode;
begin New(N); N^.Value := V; N^.Next := Head; Head := N; end;

procedure Reverse(var Head: PNode);
var Prev, Cur, Nxt: PNode;
begin
  Prev := nil; Cur := Head;
  while Cur <> nil do begin Nxt := Cur^.Next; Cur^.Next := Prev; Prev := Cur; Cur := Nxt; end;
  Head := Prev;
end;

procedure FreeList(var Head: PNode);
var T: PNode;
begin while Head <> nil do begin T := Head; Head := Head^.Next; Dispose(T); end; end;

var
  H, P: PNode;
  I: Integer;
begin
  H := nil;
  for I := 1 to 5 do Push(H, I);
  Reverse(H);
  P := H;
  while P <> nil do begin Write(P^.Value, ' '); P := P^.Next; end;
  WriteLn;
  FreeList(H);
  WriteLn(H = nil);
end.
