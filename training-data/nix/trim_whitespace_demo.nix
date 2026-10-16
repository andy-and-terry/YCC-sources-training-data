let
  trim = s:
    let m = builtins.match "[ \t\n]*(.*[^ \t\n])[ \t\n]*" s;
    in if m == null then "" else builtins.head m;
in
{
  a = trim "   padded   ";
  b = trim "\n\ttabs and newline\n";
  c = trim "    ";
}
