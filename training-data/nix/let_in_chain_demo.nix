let
  raw = [ 3 1 4 1 5 9 2 6 ];
in
  let
    unique = builtins.attrNames (builtins.listToAttrs
      (map (n: { name = toString n; value = true; }) raw));
  in
    let
      sorted = builtins.sort (a: b: builtins.lessThan (builtins.fromJSON a) (builtins.fromJSON b)) unique;
    in
      let
        asNumbers = map builtins.fromJSON sorted;
      in
        {
          inherit raw unique sorted asNumbers;
        }
