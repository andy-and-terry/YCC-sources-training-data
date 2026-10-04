let
  unique = xs:
    builtins.foldl' (acc: x: if builtins.elem x acc then acc else acc ++ [ x ]) [ ] xs;
  count = x: xs: builtins.length (builtins.filter (y: y == x) xs);
  data = [ 3 1 3 2 1 4 ];
in
{
  uniq = unique data;
  threes = count 3 data;
  sortedUniq = builtins.sort builtins.lessThan (unique data);
  sameSet = builtins.sort builtins.lessThan (unique data) == [ 1 2 3 4 ];
}
