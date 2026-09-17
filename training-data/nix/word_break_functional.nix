let
  dictionary = [ "cat" "cats" "and" "sand" "dog" ];

  wordBreak = s:
    let
      len = builtins.stringLength s;
    in
      if len == 0 then true
      else
        builtins.any
          (word:
            let wlen = builtins.stringLength word;
            in
              wlen <= len
              && builtins.substring 0 wlen s == word
              && wordBreak (builtins.substring wlen (len - wlen) s))
          dictionary;
in
  {
    catsandog = wordBreak "catsandog";
    catsand = wordBreak "catsand";
  }
