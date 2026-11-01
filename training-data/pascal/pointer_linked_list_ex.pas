program PointerLinkedListEx;
type
  PNode = ^TNode;
  TNode = record Value: Integer; Next: PNode; end;
var Head, N: PNode; I: Integer;
begin
  Head := nil;
  for I := 1 to 4 do begin
    New(N); N^.Value := I * I; N^.Next := Head; Head := N;
  end;
  N := Head;
  while N <> nil do begin Write(N^.Value, ' '); N := N^.Next; end;
  WriteLn;
end.
