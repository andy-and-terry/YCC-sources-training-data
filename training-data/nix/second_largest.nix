let
  unique = xs: builtins.foldl' (acc: x: if builtins.elem x acc then acc else acc ++ [ x ]) [ ] xs;
  secondLargest = xs:
    let sorted = builtins.sort (a: b: a > b) (unique xs);
    in if builtins.length sorted < 2 then null else builtins.elemAt sorted 1;
in
{
  with_dupes = secondLargest [ 4 9 2 9 7 ];
  all_same = secondLargest [ 3 3 ];
}
