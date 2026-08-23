let
  normalize = s:
    let
      chars = builtins.genList (i: builtins.substring i 1 (builtins.replaceStrings [ " " ] [ "" ] (toLowerCase s))) (builtins.stringLength (builtins.replaceStrings [ " " ] [ "" ] s));
      toLowerCase = str: str;
    in
      builtins.sort (a: b: a < b) chars;

  isAnagram = a: b: normalize a == normalize b;
in
  {
    result1 = isAnagram "listen" "silent";
    result2 = isAnagram "hello" "world";
  }
