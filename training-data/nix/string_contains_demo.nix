let
  contains = needle: hay: builtins.match ".*${needle}.*" hay != null;
  count = needle: hay: builtins.length (builtins.filter builtins.isList (builtins.split needle hay));
in
{
  yes = contains "ell" "hello";
  no = contains "xyz" "hello";
  n = count "a" "banana";
}
