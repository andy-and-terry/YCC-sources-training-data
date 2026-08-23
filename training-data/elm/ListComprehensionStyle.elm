module ListComprehensionStyle exposing (pythagoreanTriples)


pythagoreanTriples : Int -> List ( Int, Int, Int )
pythagoreanTriples limit =
    List.range 1 limit
        |> List.concatMap
            (\a ->
                List.range a limit
                    |> List.concatMap
                        (\b ->
                            List.range b limit
                                |> List.filter (\c -> a * a + b * b == c * c)
                                |> List.map (\c -> ( a, b, c ))
                        )
            )
