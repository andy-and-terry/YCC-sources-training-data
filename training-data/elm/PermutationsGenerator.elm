module PermutationsGenerator exposing (permutations)


permutations : List a -> List (List a)
permutations items =
    case items of
        [] ->
            [ [] ]

        _ ->
            items
                |> List.concatMap
                    (\item ->
                        removeFirst item items
                            |> permutations
                            |> List.map ((::) item)
                    )


removeFirst : a -> List a -> List a
removeFirst target items =
    case items of
        [] ->
            []

        x :: rest ->
            if x == target then
                rest

            else
                x :: removeFirst target rest
