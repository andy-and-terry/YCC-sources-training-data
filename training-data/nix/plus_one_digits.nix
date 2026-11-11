let
  reverseList = xs: builtins.genList (i: builtins.elemAt xs (builtins.length xs - 1 - i)) (builtins.length xs);
  plusOne = digits:
    let
      step = acc: d:
        let s = d + acc.carry; q = s / 10;
        in { carry = q; out = [ (s - q * 10) ] ++ acc.out; };
      r = builtins.foldl' step { carry = 1; out = [ ]; } (reverseList digits);
    in if r.carry > 0 then [ r.carry ] ++ r.out else r.out;
in [ (plusOne [ 1 2 9 ]) (plusOne [ 9 9 ]) ] # [ [ 1 3 0 ] [ 1 0 0 ] ]
