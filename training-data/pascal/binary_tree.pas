program BinaryTreeDemo;

type
  PNode = ^TNode;
  TNode = record
    value: Integer;
    left, right: PNode;
  end;

function Insert(node: PNode; value: Integer): PNode;
begin
  if node = nil then
  begin
    New(node);
    node^.value := value;
    node^.left := nil;
    node^.right := nil;
    Insert := node;
    Exit;
  end;
  if value < node^.value then node^.left := Insert(node^.left, value)
  else if value > node^.value then node^.right := Insert(node^.right, value);
  Insert := node;
end;

procedure Inorder(node: PNode);
begin
  if node = nil then Exit;
  Inorder(node^.left);
  Write(node^.value, ' ');
  Inorder(node^.right);
end;

var
  root: PNode;
  values: array[0..6] of Integer = (5, 3, 8, 1, 4, 7, 9);
  i: Integer;
begin
  root := nil;
  for i := 0 to 6 do root := Insert(root, values[i]);
  Inorder(root);
  WriteLn;
end.
