module KeithNumbers exposing (isKeith, keithNumbers)

-- Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
-- keithNumbers == [ 14, 19, 28, 47, 61, 75, 197, 742, 1104 ]


digits : Int -> List Int
digits n =
    String.fromInt n |> String.toList |> List.map (\c -> Char.toCode c - 48)


isKeith : Int -> Bool
isKeith n =
    let
        k =
            List.length (digits n)

        -- seq is kept newest-first
        go seq =
            case seq of
                [] ->
                    False

                latest :: _ ->
                    if latest >= n then
                        latest == n

                    else
                        go (List.sum (List.take k seq) :: seq)
    in
    go (List.reverse (digits n))


keithNumbers : List Int
keithNumbers =
    List.range 10 1199 |> List.filter isKeith
