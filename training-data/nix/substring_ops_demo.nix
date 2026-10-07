let s = "hello world"; in
{
  head = builtins.substring 0 5 s;
  tail = builtins.substring 6 (-1) s;
  len = builtins.stringLength s;
  hasPrefix = builtins.substring 0 5 s == "hello";
  chars = builtins.genList (i: builtins.substring i 1 "abc") 3;
}
