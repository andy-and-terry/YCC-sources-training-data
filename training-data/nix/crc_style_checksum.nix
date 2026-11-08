let
  bytes = [ 49 50 51 52 53 54 55 56 57 ];
  sum = builtins.foldl' (a: b: a + b) 0 bytes;
  xor = builtins.foldl' (a: b: builtins.bitXor a b) 0 bytes;
in
{ inherit sum xor; mod256 = sum - (sum / 256) * 256; }
