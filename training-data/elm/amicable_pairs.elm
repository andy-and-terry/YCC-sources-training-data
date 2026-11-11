module AmicablePairs exposing (amicablePairs)

{-| Amicable pairs: d(a) == b and d(b) == a with a /= b. -}


d : Int -> Int
d n =
    List.range 1 (n - 1)
        |> List.filter (\i -> modBy i n == 0)
        |> List.sum


amicablePairs : Int -> List ( Int, Int )
amicablePairs limit =
    List.range 2 limit
        |> List.filterMap
            (\a ->
                let
                    b =
                        d a
                in
                if b > a && d b == a then
                    Just ( a, b )

                else
                    Nothing
            )
