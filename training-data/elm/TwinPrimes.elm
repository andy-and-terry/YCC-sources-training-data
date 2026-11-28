module TwinPrimes exposing (twinPrimes)


isPrime : Int -> Bool
isPrime n =
    n > 1 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


twinPrimes : Int -> List ( Int, Int )
twinPrimes limit =
    List.range 3 (limit - 2)
        |> List.filter (\p -> isPrime p && isPrime (p + 2))
        |> List.map (\p -> ( p, p + 2 ))
