# Recaman sequence: a(n) = a(n-1) - n if positive and unseen, else a(n-1) + n
let
  count = 20;

  go = acc: i:
    if i >= count then acc
    else
      let
        cur = builtins.elemAt acc (i - 1);
        candidate = cur - i;
        next = if candidate < 0 || builtins.elem candidate acc then cur + i else candidate;
      in
        go (acc ++ [ next ]) (i + 1);
in
  go [ 0 ] 1
