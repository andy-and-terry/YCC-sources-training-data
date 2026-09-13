let
  insert = tree: value:
    if tree == null then { inherit value; left = null; right = null; }
    else if value < tree.value then tree // { left = insert tree.left value; }
    else if value > tree.value then tree // { right = insert tree.right value; }
    else tree;

  contains = tree: value:
    if tree == null then false
    else if value == tree.value then true
    else if value < tree.value then contains tree.left value
    else contains tree.right value;

  inorder = tree:
    if tree == null then [ ]
    else inorder tree.left ++ [ tree.value ] ++ inorder tree.right;

  tree = builtins.foldl' insert null [ 5 3 8 1 4 7 9 ];
in
  {
    sorted = inorder tree;
    hasFour = contains tree 4;
    hasSix = contains tree 6;
  }
