program BstDeleteDemo;

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

function MinValue(node: PNode): Integer;
begin
  while node^.left <> nil do node := node^.left;
  MinValue := node^.value;
end;

function Delete(node: PNode; value: Integer): PNode;
var
  temp: PNode;
begin
  if node = nil then
  begin
    Delete := nil;
    Exit;
  end;
  if value < node^.value then node^.left := Delete(node^.left, value)
  else if value > node^.value then node^.right := Delete(node^.right, value)
  else
  begin
    if node^.left = nil then
    begin
      temp := node^.right;
      Dispose(node);
      Delete := temp;
      Exit;
    end
    else if node^.right = nil then
    begin
      temp := node^.left;
      Dispose(node);
      Delete := temp;
      Exit;
    end;
    node^.value := MinValue(node^.right);
    node^.right := Delete(node^.right, node^.value);
  end;
  Delete := node;
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
  values: array[0..5] of Integer = (5, 3, 8, 1, 4, 7);
  i: Integer;
begin
  root := nil;
  for i := 0 to 5 do root := Insert(root, values[i]);
  root := Delete(root, 3);
  Inorder(root);
  WriteLn;
end.
