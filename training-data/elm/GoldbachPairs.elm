module GoldbachPairs exposing (goldbach)


isPrime : Int -> Bool
isPrime n =
    n > 1 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


goldbach : Int -> List ( Int, Int )
goldbach n =
    List.range 2 (n // 2)
        |> List.filter (\p -> isPrime p && isPrime (n - p))
        |> List.map (\p -> ( p, n - p ))
