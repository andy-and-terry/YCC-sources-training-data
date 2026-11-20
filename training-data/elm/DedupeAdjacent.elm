module DedupeAdjacent exposing (dedupe)

{-| Remove consecutive duplicates. -}


dedupe : List a -> List a
dedupe list =
    case list of
        a :: b :: rest ->
            if a == b then
                dedupe (b :: rest)

            else
                a :: dedupe (b :: rest)

        _ ->
            list
