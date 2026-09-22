let
  height = node: if node == null then 0 else node.height;

  mkNode = value: left: right:
    {
      inherit value left right;
      height = 1 + (if height left > height right then height left else height right);
    };

  balanceFactor = node: if node == null then 0 else height node.left - height node.right;

  rotateRight = y:
    let
      x = y.left;
      t2 = x.right;
    in
      mkNode x.value x.left (mkNode y.value t2 y.right);

  rotateLeft = x:
    let
      y = x.right;
      t2 = y.left;
    in
      mkNode y.value (mkNode x.value x.left t2) y.right;

  rebalance = node:
    let
      balance = balanceFactor node;
    in
      if balance > 1 && balanceFactor node.left >= 0 then
        rotateRight node
      else if balance > 1 then
        rotateRight (mkNode node.value (rotateLeft node.left) node.right)
      else if balance < -1 && balanceFactor node.right <= 0 then
        rotateLeft node
      else if balance < -1 then
        rotateLeft (mkNode node.value node.left (rotateRight node.right))
      else node;

  insert = node: value:
    if node == null then mkNode value null null
    else if value < node.value then
      rebalance (mkNode node.value (insert node.left value) node.right)
    else if value > node.value then
      rebalance (mkNode node.value node.left (insert node.right value))
    else node;

  inorder = node:
    if node == null then [ ]
    else inorder node.left ++ [ node.value ] ++ inorder node.right;

  tree = builtins.foldl' insert null [ 10 20 30 40 50 25 ];
in
  {
    order = inorder tree;
    rootValue = tree.value;
    rootHeight = tree.height;
  }
