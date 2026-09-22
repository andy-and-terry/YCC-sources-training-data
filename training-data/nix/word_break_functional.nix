let
  dict = [ "leet" "code" "apple" "pen" ];

  wordBreak = s:
    let
      len = builtins.stringLength s;

      # dp element i means "s[0..i) can be segmented using dict words".
      dp = builtins.genList
        (i:
          if i == 0 then true
          else
            builtins.any
              (j:
                let
                  prevOk = builtins.elemAt dp j;
                  word = builtins.substring j (i - j) s;
                in
                  prevOk && builtins.elem word dict)
              (builtins.genList (j: j) i))
        (len + 1);
    in
      builtins.elemAt dp len;
in
  {
    leetcode = wordBreak "leetcode";
    applepenapple = wordBreak "applepenapple";
    catsandog = wordBreak "catsandog";
  }
