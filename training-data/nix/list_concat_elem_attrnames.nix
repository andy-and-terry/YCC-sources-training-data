let s = { b = 1; a = 2; }; in {
  names = builtins.attrNames s;
  has = builtins.elem 2 [ 1 2 3 ];
  joined = [ 1 2 ] ++ [ 3 ];
  hasA = s ? a;
}
