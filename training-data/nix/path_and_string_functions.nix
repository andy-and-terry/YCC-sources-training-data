{
  base = baseNameOf "/a/b/file.txt";
  dir = dirOf "/a/b/file.txt";
  up = builtins.substring 0 3 "hello";
  split = builtins.split "," "a,b";
  len = builtins.stringLength "four";
}
