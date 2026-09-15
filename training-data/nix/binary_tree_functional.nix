let
  insert = tree: value:
    if !(tree ? value) then { inherit value; left = { }; right = { }; }
    else if value < tree.value then tree // { left = insert tree.left value; }
    else tree // { right = insert tree.right value; };

  inorder = tree:
    if !(tree ? value) then [ ]
    else inorder tree.left ++ [ tree.value ] ++ inorder tree.right;

  contains = tree: value:
    if !(tree ? value) then false
    else if value == tree.value then true
    else if value < tree.value then contains tree.left value
    else contains tree.right value;

  tree = builtins.foldl' insert { } [ 5 3 8 1 4 7 9 ];
in
{
  sorted = inorder tree;
  hasFour = contains tree 4;
  hasTen = contains tree 10;
}
