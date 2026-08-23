let
  coins = [ 1 2 5 ];
  amount = 11;

  minCoins = coins: amount:
    if amount == 0 then 0
    else if amount < 0 then -1
    else
      let
        options = builtins.filter (x: x != -1) (map (c: let sub = minCoins coins (amount - c); in if sub == -1 then -1 else sub + 1) coins);
      in
        if options == [ ] then -1 else builtins.foldl' (a: b: if a < b then a else b) (builtins.head options) options;
in
  minCoins coins amount
