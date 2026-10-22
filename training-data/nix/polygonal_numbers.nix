# s-gonal number: P(s, n) = ((s - 2) * n^2 - (s - 4) * n) / 2
let
  polygonal = s: n: ((s - 2) * n * n - (s - 4) * n) / 2;
  firstTen = s: builtins.genList (i: polygonal s (i + 1)) 10;
in
  {
    triangular = firstTen 3;
    pentagonal = firstTen 5;
    hexagonal = firstTen 6;
  }
