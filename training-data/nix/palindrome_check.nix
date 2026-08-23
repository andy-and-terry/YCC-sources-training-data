let
  reverseString = s:
    let
      chars = builtins.genList (i: builtins.substring i 1 s) (builtins.stringLength s);
      reversed = builtins.foldl' (acc: c: [ c ] ++ acc) [ ] chars;
    in
      builtins.concatStringsSep "" reversed;

  isPalindrome = s: s == reverseString s;
in
  {
    racecar = isPalindrome "racecar";
    hello = isPalindrome "hello";
  }
