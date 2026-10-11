let
  inherit (builtins) floor ceil;
  round = x: floor (x + 0.5);
  roundTo = places: x: let m = builtins.foldl' (a: _: a * 10) 1 (builtins.genList (i: i) places);
    in (round (x * m)) / (m * 1.0);
in
{
  f = floor 3.7;
  c = ceil 3.2;
  r = round 2.5;
  r2 = roundTo 2 3.14159;
  neg = floor (-1.5);
}
