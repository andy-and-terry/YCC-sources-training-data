module PerfectTotientNumbers exposing (perfectTotientNumbers, phi)

-- Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
-- perfectTotientNumbers == [ 3, 9, 15, 27, 39, 81, 111, 183 ]


gcd : Int -> Int -> Int
gcd a b =
    if b == 0 then
        a

    else
        gcd b (modBy b a)


phi : Int -> Int
phi n =
    List.range 1 n |> List.filter (\k -> gcd k n == 1) |> List.length


chainSum : Int -> Int
chainSum m =
    if m <= 1 then
        0

    else
        phi m + chainSum (phi m)


perfectTotientNumbers : List Int
perfectTotientNumbers =
    List.range 2 199 |> List.filter (\n -> chainSum n == n)
