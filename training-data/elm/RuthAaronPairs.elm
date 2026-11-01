module RuthAaronPairs exposing (pairs, sopfr)

{-| Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
-}


sopfr : Int -> Int
sopfr n =
    sopfrHelp n 2 0


sopfrHelp : Int -> Int -> Int -> Int
sopfrHelp n p acc =
    if n == 1 then
        acc

    else if p * p > n then
        acc + n

    else if modBy p n == 0 then
        sopfrHelp (n // p) p (acc + p)

    else
        sopfrHelp n (p + 1) acc


pairs : List Int
pairs =
    List.filter (\n -> sopfr n == sopfr (n + 1)) (List.range 2 109)



-- pairs == [ 5, 8, 15, 77 ]
