let
  xs = builtins.genList (i: i + 1) 12;
  isEven = n: n - (n / 2) * 2 == 0;
in
{
  evens = builtins.filter isEven xs;
  odds = builtins.filter (n: !(isEven n)) xs;
  big = builtins.filter (n: n > 9) xs;
  anyBig = builtins.any (n: n > 11) xs;
  allPos = builtins.all (n: n > 0) xs;
}
