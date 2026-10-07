let
  csv = "a,b;c,d";
  parts = builtins.split "[,;]" csv;
  tokens = builtins.filter builtins.isString parts;
  m = builtins.match "([a-z]+)-([0-9]+)" "item-42";
  noMatch = builtins.match "([a-z]+)-([0-9]+)" "item42";
in
{
  inherit tokens m noMatch;
  version = builtins.match "v([0-9]+)\\.([0-9]+)" "v3.14";
  trimmed = builtins.head (builtins.match "[[:space:]]*(.*[^[:space:]])[[:space:]]*" "  hello  ");
}
