{
  swapped = builtins.replaceStrings [ "a" "b" ] [ "b" "a" ] "aabbab";
  slug = builtins.replaceStrings [ " " "_" ] [ "-" "-" ] "hello big_world";
  stripped = builtins.replaceStrings [ "\n" ] [ "" ] "one\ntwo\n";
}
