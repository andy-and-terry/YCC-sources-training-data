module CarmichaelNumbers exposing (carmichaelNumbers, isCarmichael)

-- Carmichael numbers via Korselt's criterion: n is squarefree, composite,
-- and p - 1 divides n - 1 for every prime factor p.
-- carmichaelNumbers == [ 561, 1105, 1729, 2465, 2821 ]


primeFactors : Int -> Int -> List Int
primeFactors p m =
    if m == 1 then
        []

    else if p * p > m then
        [ m ]

    else if modBy p m == 0 then
        p :: primeFactors p (m // p)

    else
        primeFactors (p + 1) m


isCarmichael : Int -> Bool
isCarmichael n =
    let
        fs =
            primeFactors 2 n

        squarefree =
            List.map2 (/=) fs (List.drop 1 fs) |> List.all identity
    in
    List.length fs >= 2 && squarefree && List.all (\p -> modBy (p - 1) (n - 1) == 0) fs


carmichaelNumbers : List Int
carmichaelNumbers =
    List.range 3 2999 |> List.filter (\n -> modBy 2 n == 1 && isCarmichael n)
