let
  hanoi = n: from: to: via:
    if n == 0 then [ ]
    else hanoi (n - 1) from via to ++ [ "${from}->${to}" ] ++ hanoi (n - 1) via to from;
in
  {
    moves3 = hanoi 3 "A" "C" "B";
    count10 = builtins.length (hanoi 10 "A" "C" "B");
  }
