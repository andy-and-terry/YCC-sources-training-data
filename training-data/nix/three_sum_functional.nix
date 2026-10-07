let
  nums = [ -1 0 1 2 -1 -4 ];
  n = builtins.length nums;

  triples = builtins.concatLists
    (builtins.genList
      (i:
        builtins.concatLists
          (builtins.genList
            (jOffset:
              let j = i + 1 + jOffset; in
              builtins.concatLists
                (builtins.genList
                  (kOffset:
                    let k = j + 1 + kOffset; in
                    if builtins.elemAt nums i + builtins.elemAt nums j + builtins.elemAt nums k == 0 then
                      [ [ (builtins.elemAt nums i) (builtins.elemAt nums j) (builtins.elemAt nums k) ] ]
                    else
                      [ ])
                  (n - j - 1)))
            (n - i - 1)))
      n);

  key = t: builtins.concatStringsSep "," (map toString t);
  unique = builtins.foldl'
    (acc: t: if builtins.elem (key t) (map key acc) then acc else acc ++ [ t ])
    [ ]
    triples;
in
  unique
