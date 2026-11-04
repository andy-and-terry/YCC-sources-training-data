let
  interleave = xs: ys:
    if xs == [ ] then ys
    else if ys == [ ] then xs
    else [ (builtins.head xs) (builtins.head ys) ] ++ interleave (builtins.tail xs) (builtins.tail ys);
in
interleave [ "a" "b" "c" ] [ 1 2 3 4 5 ]
