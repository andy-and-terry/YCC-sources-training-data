module ListMode exposing (modes)

import Dict exposing (Dict)


modes : List Int -> List Int
modes items =
    let
        counts : Dict Int Int
        counts =
            List.foldl (\x -> Dict.update x (\m -> Just (Maybe.withDefault 0 m + 1))) Dict.empty items

        top =
            Dict.values counts |> List.maximum |> Maybe.withDefault 0
    in
    Dict.toList counts
        |> List.filter (\( _, c ) -> c == top)
        |> List.map Tuple.first
