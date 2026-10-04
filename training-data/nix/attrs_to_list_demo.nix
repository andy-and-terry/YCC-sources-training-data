let
  prices = { apple = 3; banana = 1; cherry = 7; };
  asPairs = map (name: { inherit name; value = prices.${name}; }) (builtins.attrNames prices);
  total = builtins.foldl' (a: p: a + p.value) 0 asPairs;
  back = builtins.listToAttrs (map (p: { inherit (p) name; value = p.value * 2; }) asPairs);
in
{
  names = builtins.attrNames prices;
  values = builtins.attrValues prices;
  inherit total back;
  hasApple = prices ? apple;
  hasKiwi = prices ? kiwi;
}
