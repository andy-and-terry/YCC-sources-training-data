module SophieGermainPrimes exposing (isPrime, sophieGermain)

-- Sophie Germain primes: p prime and 2p + 1 prime.
-- sophieGermain == [ 2, 3, 5, 11, 23, 29, 41, 53, 83, 89 ]


isPrime : Int -> Bool
isPrime n =
    let
        go d =
            if d * d > n then
                True

            else if modBy d n == 0 then
                False

            else
                go (d + 1)
    in
    n >= 2 && go 2


sophieGermain : List Int
sophieGermain =
    List.range 2 99 |> List.filter (\p -> isPrime p && isPrime (2 * p + 1))
