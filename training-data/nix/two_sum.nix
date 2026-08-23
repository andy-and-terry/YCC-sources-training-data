let
  nums = [ 2 7 11 15 ];
  target = 9;

  findIndex = list: pred:
    let
      indexed = builtins.genList (i: { idx = i; val = builtins.elemAt list i; }) (builtins.length list);
      matches = builtins.filter (e: pred e.val) indexed;
    in
      if matches == [ ] then -1 else (builtins.head matches).idx;

  twoSum = list: t:
    let
      indexed = builtins.genList (i: { idx = i; val = builtins.elemAt list i; }) (builtins.length list);
      pairs = builtins.filter
        (pair: pair != null)
        (map
          (a:
            let
              b = builtins.filter (e: e.val == t - a.val && e.idx != a.idx) indexed;
            in
              if b == [ ] then null else { i = a.idx; j = (builtins.head b).idx; })
          indexed);
    in
      if pairs == [ ] then null else builtins.head pairs;
in
  twoSum nums target
