let
  insertWord = trie: word:
    if word == "" then trie // { isEnd = true; }
    else
      let
        c = builtins.substring 0 1 word;
        rest = builtins.substring 1 (builtins.stringLength word - 1) word;
        child = trie.${c} or { };
      in
        trie // { ${c} = insertWord child rest; };

  containsWord = trie: word:
    if word == "" then trie.isEnd or false
    else
      let
        c = builtins.substring 0 1 word;
        rest = builtins.substring 1 (builtins.stringLength word - 1) word;
      in
        if builtins.hasAttr c trie then containsWord trie.${c} rest else false;

  trie = insertWord (insertWord { } "cat") "car";
in
  {
    hasCat = containsWord trie "cat";
    hasCa = containsWord trie "ca";
  }
