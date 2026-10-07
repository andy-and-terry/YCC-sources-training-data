let
  xs = [ 10 20 30 40 50 60 ];
  take = n: l: builtins.genList (i: builtins.elemAt l i) (if n > builtins.length l then builtins.length l else n);
  drop = n: l: builtins.genList (i: builtins.elemAt l (i + n)) (if n > builtins.length l then 0 else builtins.length l - n);
  slice = from: len: l: take len (drop from l);
  chunks = n: l:
    if l == [ ] then [ ] else [ (take n l) ] ++ chunks n (drop n l);
in
{
  first3 = take 3 xs;
  rest = drop 4 xs;
  middle = slice 2 2 xs;
  chunked = chunks 4 xs;
  last = builtins.elemAt xs (builtins.length xs - 1);
  tail = builtins.tail xs;
}
