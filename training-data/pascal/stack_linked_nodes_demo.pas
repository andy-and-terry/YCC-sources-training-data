program StackLinkedNodesDemo;

type
  PNode = ^TNode;
  TNode = record
    Value: Integer;
    Next: PNode;
  end;

procedure Push(var top: PNode; v: Integer);
var
  n: PNode;
begin
  New(n);
  n^.Value := v;
  n^.Next := top;
  top := n;
end;

function Pop(var top: PNode): Integer;
var
  n: PNode;
begin
  n := top;
  Result := n^.Value;
  top := n^.Next;
  Dispose(n);
end;

var
  stack: PNode;
begin
  stack := nil;
  Push(stack, 1);
  Push(stack, 2);
  Push(stack, 3);
  while stack <> nil do
    Write(Pop(stack), ' ');
  WriteLn;
end.
