let
  lcs = a: b:
    let
      la = builtins.stringLength a;
      lb = builtins.stringLength b;
      charAt = s: i: builtins.substring i 1 s;

      go = i: j:
        if i == la || j == lb then 0
        else if charAt a i == charAt b j then 1 + go (i + 1) (j + 1)
        else
          let
            skipA = go (i + 1) j;
            skipB = go i (j + 1);
          in
            if skipA > skipB then skipA else skipB;
    in
      go 0 0;
in
  {
    length1 = lcs "abcde" "ace";
    length2 = lcs "abc" "abc";
    length3 = lcs "abc" "def";
  }
