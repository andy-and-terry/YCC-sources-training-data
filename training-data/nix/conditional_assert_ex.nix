let
  check = n: assert n >= 0; n * 2;
  pick = n: if n > 10 then "big" else if n > 3 then "mid" else "small";
in {
  a = check 4;
  b = map pick [ 1 5 20 ];
}
