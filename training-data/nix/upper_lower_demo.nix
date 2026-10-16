let
  lowers = "abcdefghijklmnopqrstuvwxyz";
  uppers = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  toList = s: builtins.genList (i: builtins.substring i 1 s) (builtins.stringLength s);
  l = toList lowers;
  u = toList uppers;
in
{
  up = builtins.replaceStrings l u "hello nix";
  down = builtins.replaceStrings u l "HELLO NIX";
  title = let s = "word"; in (builtins.replaceStrings [ "w" ] [ "W" ] s);
}
