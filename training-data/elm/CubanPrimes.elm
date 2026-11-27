module CubanPrimes exposing (cuban)


isPrime : Int -> Bool
isPrime n =
    n >= 2 && List.all (\i -> modBy i n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


cuban : Int -> List Int
cuban count =
    List.range 1 (count * 4)
        |> List.map (\y -> 3 * y * y + 3 * y + 1)
        |> List.filter isPrime
        |> List.take count
