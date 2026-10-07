{
  squares = builtins.genList (i: i * i) 6;
  identity = builtins.genList (i: i) 4;
  grid = builtins.genList (r: builtins.genList (c: r * 3 + c) 3) 3;
}
