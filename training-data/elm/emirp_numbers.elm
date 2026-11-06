module EmirpNumbers exposing (emirps)

{-| Emirps: primes whose digit reversal is a different prime. -}


isPrime : Int -> Bool
isPrime n =
    n >= 2 && List.all (\i -> modBy i n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


reverseDigits : Int -> Int
reverseDigits n =
    String.fromInt n |> String.reverse |> String.toInt |> Maybe.withDefault 0


emirps : Int -> List Int
emirps limit =
    List.range 2 (limit - 1)
        |> List.filter (\n -> reverseDigits n /= n && isPrime n && isPrime (reverseDigits n))
