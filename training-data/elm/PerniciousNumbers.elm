module PerniciousNumbers exposing (pernicious)

{-| Pernicious numbers: the popcount is prime.
-}


isPrime : Int -> Bool
isPrime n =
    n >= 2 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


popcount : Int -> Int
popcount n =
    if n == 0 then
        0

    else
        modBy 2 n + popcount (n // 2)


pernicious : List Int
pernicious =
    List.filter (\n -> isPrime (popcount n)) (List.range 1 20)



-- pernicious == [ 3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 17, 18, 19, 20 ]
