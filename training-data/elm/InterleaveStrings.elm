module InterleaveStrings exposing (interleave)


interleave : List String -> String
interleave parts =
    let
        longest =
            parts |> List.map String.length |> List.maximum |> Maybe.withDefault 0
    in
    List.range 0 (longest - 1)
        |> List.concatMap
            (\i ->
                parts
                    |> List.filterMap (\p -> String.slice i (i + 1) p |> nonEmpty)
            )
        |> String.concat


nonEmpty : String -> Maybe String
nonEmpty s =
    if String.isEmpty s then
        Nothing

    else
        Just s
