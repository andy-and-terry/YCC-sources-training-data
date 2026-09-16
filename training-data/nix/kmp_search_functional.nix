let
  toChars = builtins.stringToCharacters;

  buildLps = pattern:
    let
      n = builtins.length pattern;
      go = i: len: lps:
        if i >= n then lps
        else
          let pc = builtins.elemAt pattern i; in
          if pc == builtins.elemAt pattern len then
            go (i + 1) (len + 1) (lps ++ [ (len + 1) ])
          else if len != 0 then
            go i (builtins.elemAt lps (len - 1)) lps
          else
            go (i + 1) 0 (lps ++ [ 0 ]);
    in
      if n == 0 then [ ] else go 1 0 [ 0 ];

  kmpSearch = text: pattern:
    let
      textChars = toChars text;
      patternChars = toChars pattern;
      n = builtins.length textChars;
      m = builtins.length patternChars;
      lps = buildLps patternChars;

      go = i: j: matches:
        if i >= n then matches
        else if builtins.elemAt textChars i == builtins.elemAt patternChars j then
          if j == m - 1 then
            go (i + 1) (builtins.elemAt lps j) (matches ++ [ (i - j) ])
          else
            go (i + 1) (j + 1) matches
        else if j != 0 then
          go i (builtins.elemAt lps (j - 1)) matches
        else
          go (i + 1) 0 matches;
    in
      if m == 0 then [ ] else go 0 0 [ ];
in
{
  matches = kmpSearch "ababcabcabababd" "abab";
  none = kmpSearch "hello world" "xyz";
}
