let
  pairs = { ")" = "("; "]" = "["; "}" = "{"; };

  isValid = s:
    let
      chars = builtins.genList (i: builtins.substring i 1 s) (builtins.stringLength s);
      result = builtins.foldl'
        (stack: c:
          if stack == null then null
          else if c == "(" || c == "[" || c == "{" then [ c ] ++ stack
          else if c == ")" || c == "]" || c == "}"
            then (if stack == [ ] || builtins.head stack != pairs.${c} then null else builtins.tail stack)
            else stack)
        [ ]
        chars;
    in
      result == [ ];
in
  {
    valid1 = isValid "{[()]}";
    valid2 = isValid "{[(])}";
  }
