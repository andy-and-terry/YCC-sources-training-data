let
  name = "world";
  script = ''
    echo "hello, ${name}"
      indented line stays indented
    cost is ''$5 and a literal ''${not_interpolated}
  '';
  lines = builtins.filter (l: l != "") (builtins.split "\n" script);
in
  {
    inherit script;
    lineCount = builtins.length (builtins.filter builtins.isString lines);
    trimmedLeading = builtins.substring 0 4 script;
  }
