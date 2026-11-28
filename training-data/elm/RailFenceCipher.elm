module RailFenceCipher exposing (encode)


encode : Int -> String -> String
encode rails text =
    let
        period =
            2 * (rails - 1)

        railOf i =
            let
                m =
                    modBy period i
            in
            if m < rails then
                m

            else
                period - m
    in
    String.toList text
        |> List.indexedMap (\i c -> ( ( railOf i, i ), c ))
        |> List.sortBy Tuple.first
        |> List.map Tuple.second
        |> String.fromList
