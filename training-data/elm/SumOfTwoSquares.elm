module SumOfTwoSquares exposing (representable, sums)

{-| Positive n expressible as a*a + b*b with a, b >= 0.
-}


representable : Int -> Bool
representable n =
    List.range 0 (floor (sqrt (toFloat n)))
        |> List.any
            (\a ->
                let
                    b =
                        round (sqrt (toFloat (n - a * a)))
                in
                a * a + b * b == n
            )


sums : List Int
sums =
    List.filter representable (List.range 1 30)



-- sums == [ 1, 2, 4, 5, 8, 9, 10, 13, 16, 17, 18, 20, 25, 26, 29 ]
