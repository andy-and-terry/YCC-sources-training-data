module SetUniqueSorted exposing (uniqueSorted, duplicates)

import Dict
import Set


uniqueSorted : List comparable -> List comparable
uniqueSorted items =
    items
        |> Set.fromList
        |> Set.toList


duplicates : List comparable -> List comparable
duplicates items =
    items
        |> List.foldl
            (\x counts ->
                Dict.update x (\m -> Just (Maybe.withDefault 0 m + 1)) counts
            )
            Dict.empty
        |> Dict.filter (\_ n -> n > 1)
        |> Dict.keys
