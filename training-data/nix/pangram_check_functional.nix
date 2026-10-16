let
  alphabet = builtins.genList (i: builtins.substring i 1 "abcdefghijklmnopqrstuvwxyz") 26;
  isPangram = s: builtins.all (c: builtins.match ".*${c}.*" s != null) alphabet;
in
{
  yes = isPangram "the quick brown fox jumps over the lazy dog";
  no = isPangram "hello world";
}
