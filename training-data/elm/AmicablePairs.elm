module AmicablePairs exposing (amicablePairs, sumProperDivisors)

-- Amicable pairs below 1500 via sums of proper divisors.
-- amicablePairs == [ ( 220, 284 ), ( 1184, 1210 ) ]


sumProperDivisors : Int -> Int
sumProperDivisors n =
    List.range 1 (n - 1)
        |> List.filter (\d -> modBy d n == 0)
        |> List.sum


amicablePairs : List ( Int, Int )
amicablePairs =
    List.range 2 1499
        |> List.filterMap
            (\a ->
                let
                    b =
                        sumProperDivisors a
                in
                if b > a && sumProperDivisors b == a then
                    Just ( a, b )

                else
                    Nothing
            )
