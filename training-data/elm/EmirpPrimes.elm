module EmirpPrimes exposing (emirps)


isPrime : Int -> Bool
isPrime n =
    n >= 2 && List.all (\i -> modBy i n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


rev : Int -> Int
rev n =
    String.fromInt n |> String.reverse |> String.toInt |> Maybe.withDefault 0


emirps : Int -> List Int
emirps limit =
    List.range 2 (limit - 1)
        |> List.filter (\p -> isPrime p && rev p /= p && isPrime (rev p))
