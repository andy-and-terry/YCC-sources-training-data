program AvlTreeDemo;

type
  PNode = ^TNode;
  TNode = record
    value: Integer;
    height: Integer;
    left, right: PNode;
  end;

function NodeHeight(node: PNode): Integer;
begin
  if node = nil then NodeHeight := 0
  else NodeHeight := node^.height;
end;

function MaxInt(a, b: Integer): Integer;
begin
  if a > b then MaxInt := a else MaxInt := b;
end;

procedure UpdateHeight(node: PNode);
begin
  node^.height := 1 + MaxInt(NodeHeight(node^.left), NodeHeight(node^.right));
end;

function BalanceFactor(node: PNode): Integer;
begin
  if node = nil then BalanceFactor := 0
  else BalanceFactor := NodeHeight(node^.left) - NodeHeight(node^.right);
end;

function RotateRight(y: PNode): PNode;
var
  x, t2: PNode;
begin
  x := y^.left;
  t2 := x^.right;
  x^.right := y;
  y^.left := t2;
  UpdateHeight(y);
  UpdateHeight(x);
  RotateRight := x;
end;

function RotateLeft(x: PNode): PNode;
var
  y, t2: PNode;
begin
  y := x^.right;
  t2 := y^.left;
  y^.left := x;
  x^.right := t2;
  UpdateHeight(x);
  UpdateHeight(y);
  RotateLeft := y;
end;

function Insert(node: PNode; value: Integer): PNode;
var
  bf: Integer;
begin
  if node = nil then
  begin
    New(node);
    node^.value := value;
    node^.height := 1;
    node^.left := nil;
    node^.right := nil;
    Insert := node;
    Exit;
  end;

  if value < node^.value then
    node^.left := Insert(node^.left, value)
  else if value > node^.value then
    node^.right := Insert(node^.right, value)
  else
  begin
    Insert := node;
    Exit;
  end;

  UpdateHeight(node);
  bf := BalanceFactor(node);

  if (bf > 1) and (value < node^.left^.value) then
  begin
    Insert := RotateRight(node);
    Exit;
  end;
  if (bf < -1) and (value > node^.right^.value) then
  begin
    Insert := RotateLeft(node);
    Exit;
  end;
  if (bf > 1) and (value > node^.left^.value) then
  begin
    node^.left := RotateLeft(node^.left);
    Insert := RotateRight(node);
    Exit;
  end;
  if (bf < -1) and (value < node^.right^.value) then
  begin
    node^.right := RotateRight(node^.right);
    Insert := RotateLeft(node);
    Exit;
  end;

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
  values: array[0..5] of Integer = (10, 20, 30, 40, 50, 25);
  i: Integer;
begin
  root := nil;
  for i := 0 to 5 do root := Insert(root, values[i]);
  Inorder(root);
  WriteLn;
  WriteLn(NodeHeight(root));
end.
