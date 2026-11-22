module LahNumbers exposing (lah, lahRow)

-- Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!
-- lahRow 5 == [ 120, 240, 120, 20, 1 ]


fact : Int -> Int
fact n =
    if n <= 1 then
        1

    else
        n * fact (n - 1)


comb : Int -> Int -> Int
comb n k =
    fact n // (fact k * fact (n - k))


lah : Int -> Int -> Int
lah n k =
    comb (n - 1) (k - 1) * fact n // fact k


lahRow : Int -> List Int
lahRow n =
    List.range 1 n |> List.map (lah n)
