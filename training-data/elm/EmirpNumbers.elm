module EmirpNumbers exposing (emirps)


isPrime : Int -> Bool
isPrime n =
    n >= 2 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


reverseNumber : Int -> Int
reverseNumber n =
    String.fromInt n
        |> String.reverse
        |> String.toInt
        |> Maybe.withDefault 0


emirps : Int -> List Int
emirps limit =
    List.range 2 limit
        |> List.filter (\p -> reverseNumber p /= p && isPrime p && isPrime (reverseNumber p))



-- emirps 199 == [13,17,31,37,71,73,79,97,107,113,149,157,167,179,199]
