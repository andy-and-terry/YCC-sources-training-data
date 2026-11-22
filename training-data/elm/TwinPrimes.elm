module TwinPrimes exposing (isPrime, twinPrimes)

-- Twin primes: pairs (p, p+2) both prime; list the lesser of each pair.
-- twinPrimes == [ 3, 5, 11, 17, 29, 41, 59, 71 ]


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


twinPrimes : List Int
twinPrimes =
    List.range 2 99 |> List.filter (\p -> isPrime p && isPrime (p + 2))
